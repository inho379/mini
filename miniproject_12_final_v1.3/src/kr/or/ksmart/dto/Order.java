package kr.or.ksmart.dto;

public class Order {
	private String o_code;
	private String h_id;
	private String o_price;
	private String o_point;
	private String o_count;
	private String o_tprice;
	private String o_name;
	private String o_addr;
	private String o_phone;
	private String o_ask;
	private String o_oday;
	private String n_code;
	public String getO_oday() {
		return o_oday;
	}
	public void setO_oday(String o_oday) {
		this.o_oday = o_oday;
	}
	public String getN_code() {
		return n_code;
	}
	public void setN_code(String n_code) {
		this.n_code = n_code;
	}
	public String getO_code() {
		return o_code;
	}
	@Override
	public String toString() {
		return "Order [o_code=" + o_code + ", h_id=" + h_id + ", n_code=" + ", nk=" +  ", o_price="
				+ o_price + ", o_point=" + o_point + ", o_count=" + o_count + ", o_tprice=" + o_tprice + ", o_name="
				+ o_name + ", o_addr=" + o_addr + ", o_phone=" + o_phone + ", o_ask=" + o_ask + "]";
	}
	public void setO_code(String o_code) {
		this.o_code = o_code;
	}
	public String getH_id() {
		return h_id;
	}
	public void setH_id(String h_id) {
		this.h_id = h_id;
	}
	

	
	public String getO_price() {
		return o_price;
	}
	public void setO_price(String o_price) {
		this.o_price = o_price;
	}
	public String getO_point() {
		return o_point;
	}
	public void setO_point(String o_point) {
		this.o_point = o_point;
	}
	public String getO_count() {
		return o_count;
	}
	public void setO_count(String o_count) {
		this.o_count = o_count;
	}
	public String getO_tprice() {
		return o_tprice;
	}
	public void setO_tprice(String o_tprice) {
		this.o_tprice = o_tprice;
	}
	public String getO_name() {
		return o_name;
	}
	public void setO_name(String o_name) {
		this.o_name = o_name;
	}
	public String getO_addr() {
		return o_addr;
	}
	public void setO_addr(String o_addr) {
		this.o_addr = o_addr;
	}
	public String getO_phone() {
		return o_phone;
	}
	public void setO_phone(String o_phone) {
		this.o_phone = o_phone;
	}
	public String getO_ask() {
		return o_ask;
	}
	public void setO_ask(String o_ask) {
		this.o_ask = o_ask;
	}

}

	