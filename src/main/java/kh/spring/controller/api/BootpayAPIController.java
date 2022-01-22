package kh.spring.controller.api;


import org.apache.commons.io.IOUtils;
import org.apache.http.HttpResponse;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.databind.ObjectMapper;

import kh.spring.dto.BootPayOrderDto;
import kh.spring.dto.BootpayApiDTO;
import kh.spring.dto.PurchaseDTO;
import kh.spring.dto.request.Cancel;
import kh.spring.service.PurchaseService;
import kh.spring.util.ApiKey;

@RestController
@RequestMapping("/pay/")
public class BootpayAPIController {
	
	private final PurchaseService purchaseService;
	
	public BootpayAPIController(PurchaseService purchaseService) {
		this.purchaseService = purchaseService;
	}
	
	@GetMapping(value = "confirm", produces = "application/json; charset=utf8")
	public ResponseEntity bootpay_confirm(@RequestParam("receipt_id") String receipt_id) throws Exception {
		
		System.out.println(receipt_id);
		//첫번째 매개변수에 REST Application ID, 두번째 매개변수에 인증키 (Private Key)
		BootpayApiDTO api = new BootpayApiDTO(ApiKey.BOOT_PAY_APPLICATION_ID,ApiKey.BOOT_PAY_PRIVATE_KEY);   
		String bootpay_check = "";
		BootPayOrderDto dto = null;
		
		// 부트페이 인증 토큰 발급
		api.getAccessToken();
    	
    	// 부트페이로부터 검증데이터 가져오기
    	try {
    	    HttpResponse res = api.verify(receipt_id);
    	    
    	    //부트페이에서 가져온 검증 JSON
    	    bootpay_check = IOUtils.toString(res.getEntity().getContent(), "UTF-8");
    	    System.out.println("bootpay_check" + bootpay_check);
    	    
    	    
    	    ObjectMapper objectMapper = new ObjectMapper();
    	    dto = objectMapper.readValue(bootpay_check, BootPayOrderDto.class);
    	    System.out.println("dto" + dto);
    	    
    	} catch (Exception e) {
    		e.printStackTrace();
    	}
    	
    	// orderId = purchase_id
    	long orderId = Long.parseLong(dto.getData().getOrder_id());
    	PurchaseDTO purchase = purchaseService.findId(orderId);
    	int price = purchase.getPurchase_payment();
    	
    	if(dto.getStatus() == 200) {
    		
    		// status가 1이고
    		if (dto.getData().getPrice() == price && dto.getData().getStatus() == 1) {
    			// 결제 완료
    			purchaseService.completeOrder(orderId);
    			return ResponseEntity.ok("결제완료");
    		}
    	}
    	
    	// 서버 검증 오류시
    	Cancel cancel = new Cancel();
    	cancel.receipt_id = receipt_id;
    	cancel.name = "관리자";
    	cancel.reason = "서버 검증 오류";
    	
    	// 결제 오류 로그
    	purchaseService.failOrder(orderId);
    	String cancelDataJson = "";
    	try {
    		HttpResponse res = api.cancel(cancel);
    		cancelDataJson = IOUtils.toString(res.getEntity().getContent(), "UTF-8");
    		System.out.println(cancelDataJson);
    	} catch (Exception e) {
    		e.printStackTrace();
    	}
    	
    	return ResponseEntity.badRequest().body("결제실패");
	}
}
