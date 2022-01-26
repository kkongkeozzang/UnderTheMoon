package kh.spring.controller.api;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RestController;


import com.fasterxml.jackson.databind.ObjectMapper;


import kh.spring.dto.DeliveryDTO;
import kh.spring.dto.PurchaseDTO;
import kh.spring.service.DeliveryService;
import kh.spring.service.PurchaseService;

@RestController
@RequestMapping("/purchase/rest/")
public class PurchaseAPIController {
	
	private final PurchaseService purchaseService;
	private final DeliveryService deliveryService;
	
	public PurchaseAPIController(PurchaseService purchaseService,DeliveryService deliveryService) {
		this.purchaseService = purchaseService;
		this.deliveryService = deliveryService;
	}
	
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

	@DeleteMapping("deleteId/{delivery_id}/{order_id}")
	public ResponseEntity<Integer> deleteId(@PathVariable Integer delivery_id,@PathVariable Integer order_id){
		System.out.println("delete");
		int result = deliveryService.deleteById(delivery_id);
		
		int result2 = purchaseService.deleteById(order_id);
		
		return new ResponseEntity<Integer>(HttpStatus.OK);
		
	}
}
