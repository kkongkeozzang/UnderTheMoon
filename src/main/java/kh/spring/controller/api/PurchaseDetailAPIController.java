package kh.spring.controller.api;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.module.SimpleModule;

import kh.spring.dto.DeliveryDTO;
import kh.spring.dto.PurchaseDetailDTO;

import kh.spring.service.PurchaseDetailService;


@RestController
@RequestMapping("/purchaseDetail/rest/")
@JsonIgnoreProperties(ignoreUnknown = true)
public class PurchaseDetailAPIController {

	private final PurchaseDetailService purchaseDetailService;
	
	public PurchaseDetailAPIController(PurchaseDetailService purchaseDetailService) {
		this.purchaseDetailService = purchaseDetailService;
	}
	
	@PostMapping(value="insertPurchaseDetail")
	public ResponseEntity<Integer> insertPurchaseDetail(@RequestBody List<PurchaseDetailDTO> objects) throws IOException{
			
		ObjectMapper mapper = new ObjectMapper();
		
		List<String> list = new ArrayList<>();		
		for(int i = 0; i < objects.size(); i++) {
			list.add(mapper.writerWithDefaultPrettyPrinter().writeValueAsString(objects.get(i)));
		}
		
		List<PurchaseDetailDTO> purchaseDetailList = new ArrayList<>();	
		for(int i = 0; i < objects.size(); i++) {
			purchaseDetailList.add(mapper.readValue(list.get(i), PurchaseDetailDTO.class));
		}
		
		int result = purchaseDetailService.insertPurchaseDetails(purchaseDetailList);
			
		return new ResponseEntity<Integer>(result,HttpStatus.OK);
		
	}
}
