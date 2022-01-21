package kh.spring.bootpay;

import java.util.HashMap;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.databind.ObjectMapper;

import kh.spring.bootpay.model.response.ResDefault;
import kh.spring.dto.BootPayOrderDto;
import kh.spring.dto.PurchaseDTO;
import kh.spring.service.PurchaseService;

@RestController
public class BootpayAPI {
	
	private final PurchaseService purchaseService;
	
	public BootpayAPI(PurchaseService purchaseService) {
		this.purchaseService = purchaseService;
	}


    @SuppressWarnings({ "rawtypes", "unchecked" })
	@GetMapping("/purchase/pay/confirm/{receipt_id}")
    public ResponseEntity<String> confirmPay(@PathVariable("receipt_id") String receipt_id) throws Exception {
//        System.out.println(receipt_id);
    	String getDataJson = "";
        BootPayOrderDto dto = null;
        
        Bootpay bootpay = new Bootpay("61e73d6de38c3000217b8072", "EmKk4Bnv9Db2IDQ9R8gFeySdPLLrz6tu2rATwEXtA/M=");
       
        try {
            ResDefault<HashMap<String, Object>> res = bootpay.getAccessToken(); 
            System.out.println(res.toJson());
        } catch (Exception e) {
            e.printStackTrace();
        }
       
       
        	try {
        	    ResDefault<HashMap<String, Object>> res = bootpay.verify(receipt_id);
        	    System.out.println(res.toJson());
        	    
        	    ObjectMapper objectMapper = new ObjectMapper();
                dto = objectMapper.readValue(getDataJson, BootPayOrderDto.class);
                System.out.println(dto);
        	} catch (Exception e) {
        	    e.printStackTrace();
        	}


        Integer orderId = Integer.parseInt(dto.getData().getOrder_id());
        PurchaseDTO purchase = purchaseService.findId(orderId);
        int price = purchase.getPurchase_payment();

        if (dto.getStatus() == 200) {

            //status가 1이고
            if (dto.getData().getPrice() == price && dto.getData().getStatus() == 1) {
                //결제 완료
                purchaseService.completeOrder(orderId);
                return new ResponseEntity("결제완료", HttpStatus.OK);
            }
        }

        //서버 검증 오류시
        kh.spring.bootpay.request.Cancel cancel = new kh.spring.bootpay.request.Cancel();
        cancel.receiptId = receipt_id; 
        cancel.name = "관리자";
        cancel.reason = "서버 검증 오류";

        //결제 오류 로그
        purchaseService.deleteById(orderId);
        String cancelDataJson = "";
//        try {
//            res = api.receiptCancel(cancel);
//            cancelDataJson = IOUtils.toString(res.getEntity().getContent(), "UTF-8");
//            System.out.println(cancelDataJson);
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
        return ResponseEntity.badRequest().body("결제실패");
    }
	}

