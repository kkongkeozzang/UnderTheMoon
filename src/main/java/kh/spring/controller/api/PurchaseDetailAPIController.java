package kh.spring.controller.api;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.module.SimpleModule;

import kh.spring.dto.PurchaseDetailDTO;
import kh.spring.service.PurchaseDetailService;

@RestController
@RequestMapping("/purchaseDetail/rest/")
public class PurchaseDetailAPIController {

	private final PurchaseDetailService purchaseDetailService;
	
	public PurchaseDetailAPIController(PurchaseDetailService purchaseDetailService) {
		this.purchaseDetailService = purchaseDetailService;
	}
	
	@PostMapping(value="insertPurchaseDetail")
	public ResponseEntity<Integer> insertPurchaseDetail(@RequestBody List<Map<String,String>> objects) throws IOException{
			
			ObjectMapper mapper = new ObjectMapper();
			SimpleModule module = new SimpleModule();
			mapper.registerModule(module);
			mapper.enable(DeserializationFeature.ACCEPT_EMPTY_STRING_AS_NULL_OBJECT);
			mapper.disable(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES);
			
			List<String> mdList = new ArrayList<>();
			
			for(int i = 0; i < objects.size(); i++) {
				mdList.add(mapper.writeValueAsString((objects.get(i))));
			}
			System.out.println("ok");
			System.out.println(mdList.get(0)+" "+mdList.get(1));
			List<String> mdListTemp = new ArrayList<>();
			
			for(int i = 0; i < objects.size(); i++) {
				mdListTemp.add(mapper.writerWithDefaultPrettyPrinter().writeValueAsString((mdList.get(i))));
			}
			System.out.println("ok");
			System.out.println(mdListTemp.get(0)+" "+mdListTemp.get(1));
			
//			List<PurchaseDetailDTO> purchseDetailList = mapper.readValue(mdListTemp, new TypeReference<List<PurchaseDetailDTO>>(){});
			
			List<PurchaseDetailDTO> purchseDetailList = new ArrayList<>();
			
			for(int i = 0; i < objects.size(); i++) {
				purchseDetailList.add(mapper.readValue(mdListTemp.get(i), PurchaseDetailDTO.class));
			}
			
			
			
			System.out.println(purchseDetailList.get(0)+" "+purchseDetailList.get(1));
			int result = purchaseDetailService.insertPurchaseDetails(purchseDetailList);
			
		return new ResponseEntity<Integer>(1,HttpStatus.OK);
		
	}
}
