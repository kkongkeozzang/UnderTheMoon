package kh.spring.controller;


import org.apache.commons.io.IOUtils;
import org.apache.http.HttpResponse;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fasterxml.jackson.databind.ObjectMapper;

import kh.spring.dto.BootPayOrderDTO;
import kh.spring.dto.BootpayApiDTO;
import kh.spring.dto.PurchaseDTO;
import kh.spring.dto.request.Cancel;
import kh.spring.service.PurchaseService;
import kh.spring.util.ApiKey;

@Controller
@RequestMapping("/pay/")
public class BootpayController {
	
	private final PurchaseService purchaseService;
	
	public BootpayController(PurchaseService purchaseService) {
		this.purchaseService = purchaseService;
	}
	
	@RequestMapping(value = "confirm", produces = "application/json; charset=utf8")
	public String bootpay_confirm(@RequestParam("receipt_id") String receipt_id) throws Exception {
		
		System.out.println(receipt_id);
		//첫번째 매개변수에 REST Application ID, 두번째 매개변수에 인증키 (Private Key)
		BootpayApiDTO api = new BootpayApiDTO(ApiKey.BOOT_PAY_APPLICATION_ID,ApiKey.BOOT_PAY_PRIVATE_KEY);   
		String bootpay_check = "";
		BootPayOrderDTO dto = null;
		
		// 부트페이 인증 토큰 발급
		api.getAccessToken();
    	
    	// 부트페이로부터 검증데이터 가져오기
    	try {
    	    HttpResponse res = api.verify(receipt_id);
    	    
    	    //부트페이에서 가져온 검증 JSON
    	    bootpay_check = IOUtils.toString(res.getEntity().getContent(), "UTF-8");
    	    System.out.println("bootpay_check : " + bootpay_check);
    	    
    	    ObjectMapper objectMapper = new ObjectMapper();
    	    dto = objectMapper.readValue(bootpay_check, BootPayOrderDTO.class);
    	
	    	// orderId = purchase_id
	    	long orderId = Long.parseLong(dto.getData().getOrder_id());
	    	PurchaseDTO purchase = purchaseService.findId(orderId);
	    	int price = purchase.getPurchase_payment();
		    	
	    	if(dto.getStatus() == 200 && (dto.getData().getPrice() == price && dto.getData().getStatus() == 1)) {
    		
			// 결제 완료
			purchaseService.completeOrder(orderId);
			return "redirect:/mypage/myPageList?cPage=1"; 
			
    	} else {
    		
    		// 서버 검증 오류시
    		Cancel cancel = new Cancel();
    		cancel.receipt_id = receipt_id;
    		cancel.name = "관리자";
    		cancel.reason = "서버 검증 오류";
    		
    		// 결제 오류 로그
    		purchaseService.failOrder(orderId);
    		String cancelDataJson = "";
			res = api.cancel(cancel);
			cancelDataJson = IOUtils.toString(res.getEntity().getContent(), "UTF-8");
			System.out.println("결제 오류 : " + cancelDataJson);
    		
    		return "redirect:/purchase/fail";
    	}
    	
    	} catch (Exception e) {
    		e.printStackTrace();
    		return "redirect:/purchase/fail";
    	}
	}
}
