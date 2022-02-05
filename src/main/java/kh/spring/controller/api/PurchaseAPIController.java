package kh.spring.controller.api;

import java.io.IOException;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import org.apache.commons.io.IOUtils;
import org.apache.http.HttpResponse;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RestController;


import com.fasterxml.jackson.databind.ObjectMapper;

import kh.spring.dto.BootpayApiDTO;
import kh.spring.dto.DeliveryDTO;
import kh.spring.dto.PurchaseDTO;
import kh.spring.dto.request.Cancel;
import kh.spring.service.DeliveryService;
import kh.spring.service.PurchaseDetailService;
import kh.spring.service.PurchaseService;
import kh.spring.util.ApiKey;

@RestController
@RequestMapping("/purchase/rest/")
public class PurchaseAPIController {
	
	private final PurchaseService purchaseService;
	private final PurchaseDetailService purchaseDetailService;
	private final DeliveryService deliveryService;
	
	public PurchaseAPIController(PurchaseService purchaseService,DeliveryService deliveryService,PurchaseDetailService purchaseDetailService) {
		this.purchaseService = purchaseService;
		this.deliveryService = deliveryService;
		this.purchaseDetailService = purchaseDetailService;
	}
	
	@Transactional(rollbackFor = Exception.class) 
	@PostMapping(value="insertPurchase", produces = "application/json")
	public ResponseEntity<Integer> insertPurchase(@RequestBody List<Map<String,String>> objects) throws IOException{
			
			ObjectMapper mapper = new ObjectMapper();
			
			String delivery = mapper.writeValueAsString((objects.get(0)));
			String purchase = mapper.writeValueAsString((objects.get(1)));
			
			delivery = mapper.writerWithDefaultPrettyPrinter().writeValueAsString((objects.get(0)));
			purchase = mapper.writerWithDefaultPrettyPrinter().writeValueAsString((objects.get(1))); 
			
			DeliveryDTO deliveryDTO = mapper.readValue(delivery, DeliveryDTO.class);
			PurchaseDTO purchaseDTO = mapper.readValue(purchase, PurchaseDTO.class);
			
			Integer delivery_id = deliveryService.insertDelivery(deliveryDTO);
			purchaseService.insertPurchase(purchaseDTO);
			
		return new ResponseEntity<Integer>(delivery_id,HttpStatus.OK);
		
	}
	
	
	@GetMapping("selectId/{resp}")
	public ResponseEntity<Integer> selectId(@PathVariable("resp") Integer delivery_id) throws InterruptedException{
			Integer purchase_id = purchaseService.selectIdById(delivery_id);
			
			return new ResponseEntity<Integer>(purchase_id,HttpStatus.OK);
	}
	@Transactional(rollbackFor = Exception.class) 
	@DeleteMapping("deleteId/{delivery_id}/{order_id}")
	public ResponseEntity<Integer> deleteId(@PathVariable Integer delivery_id,@PathVariable Integer order_id){
		
		int result = deliveryService.deleteById(delivery_id);
		
		int result2 = purchaseService.deleteById(order_id);
		
		return new ResponseEntity<Integer>(HttpStatus.OK);
		
	}
	@Transactional(rollbackFor = Exception.class) 
	@PatchMapping("updatePurchase/{receipt_id}/{purchase_id}")
	public ResponseEntity<Integer> updatePurchase(@PathVariable("receipt_id") String receipt_id,@PathVariable("purchase_id") Integer purchase_id) throws InterruptedException{
			System.out.println(receipt_id+" "+purchase_id);
			Integer result = purchaseService.updatePurchase(receipt_id,purchase_id);
			
			return new ResponseEntity<Integer>(result,HttpStatus.OK);
	}
	
	@GetMapping("cancel/{purchase_id}/{receipt_id}")
	public ResponseEntity<String> cancelPurchase(@PathVariable Long purchase_id,@PathVariable String receipt_id) throws Exception{
		
		BootpayApiDTO api = new BootpayApiDTO(ApiKey.BOOT_PAY_APPLICATION_ID,ApiKey.BOOT_PAY_PRIVATE_KEY);   
		api.getAccessToken();
		
		String str = "";
		
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal(); 
		String username = ((UserDetails)principal).getUsername();
		
		Cancel cancel = new Cancel();
		cancel.receipt_id = receipt_id;
		cancel.name = username;
		cancel.reason = "사용자취소.";

		try {
		    HttpResponse res = api.cancel(cancel);
		    str = IOUtils.toString(res.getEntity().getContent(), "UTF-8");
		    System.out.println(str);
		} catch (Exception e) {
		    e.printStackTrace();
		}
		
		purchaseDetailService.cancelOrder(purchase_id);
		
		return new ResponseEntity<String>(str,HttpStatus.OK);
		
	}
}
