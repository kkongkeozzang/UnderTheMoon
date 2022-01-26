package kh.spring.dto;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@JsonIgnoreProperties(ignoreUnknown = true)
public class BootPayOrderDTO {

	private int status;
    private int code;
    private String message;
    private Data data;
     
    public BootPayOrderDTO() {}
    
    
    
    public BootPayOrderDTO(int status, int code, String message, Data data) {
		super();
		this.status = status;
		this.code = code;
		this.message = message;
		this.data = data;
	}

    

	public int getStatus() {
		return status;
	}



	public void setStatus(int status) {
		this.status = status;
	}



	public int getCode() {
		return code;
	}



	public void setCode(int code) {
		this.code = code;
	}



	public String getMessage() {
		return message;
	}



	public void setMessage(String message) {
		this.message = message;
	}



	public Data getData() {
		return data;
	}



	public void setData(Data data) {
		this.data = data;
	}


	@JsonIgnoreProperties(ignoreUnknown = true)
	public class Data{
        private int status;
        private String receipt_id;
        private String order_id;
        private String name;
        private int price;
        
        public Data() {};
		public Data(int status, String receipt_id, String order_id, String name, int price) {
			super();
			this.status = status;
			this.receipt_id = receipt_id;
			this.order_id = order_id;
			this.name = name;
			this.price = price;
		}
		public int getStatus() {
			return status;
		}
		public void setStatus(int status) {
			this.status = status;
		}
		public String getReceipt_id() {
			return receipt_id;
		}
		public void setReceipt_id(String receipt_id) {
			this.receipt_id = receipt_id;
		}
		public String getOrder_id() {
			return order_id;
		}
		public void setOrder_id(String order_id) {
			this.order_id = order_id;
		}
		public String getName() {
			return name;
		}
		public void setName(String name) {
			this.name = name;
		}
		public int getPrice() {
			return price;
		}
		public void setPrice(int price) {
			this.price = price;
		}
        
        
    }
}
