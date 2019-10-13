package kr.or.ksmart.dto;

public class Human {
	private String h_id = null;
	private String h_pw = null;
	private String h_name = null;
	private String h_phone = null;
	private String h_addr = null;
	private String h_email = null;
	private String h_nick = null;
	private String h_jday = null;
	private String h_birth = null;
	private String h_year = null;
	private String h_month = null;
	private String h_day = null;
	private int h_point = 0;
	private String h_level = null;
	private String h_permit = null;
	private String h_gender = null;
	
	public String getH_gender() {
		return h_gender;
	}

	public void setH_gender(String h_gender) {
		this.h_gender = h_gender;
	}

	public String getH_permit() {
		return h_permit;
	}

	public void setH_permit(String h_permit) {
		this.h_permit = h_permit;
	}

	public String getH_birth() {
		return h_birth;
	}
	
	public void setH_birth(String h_birth) {
		this.h_birth = h_birth;
	}
	
	public void setH_birth(String h_year, String h_month, String h_day) {
		if(h_birth==null) {
			this.h_birth = h_year+"."+h_month+"."+h_day;
		}
	}
	
	public String getH_year() {
		return h_year;
	}

	public void setH_year(String h_year) {
		this.h_year = h_year;
	}

	public String getH_month() {
		return h_month;
	}

	public void setH_month(String h_month) {
		this.h_month = h_month;
	}

	public String getH_day() {
		return h_day;
	}

	public void setH_day(String h_day) {
		this.h_day = h_day;
	}

	public String getH_id() {
		return h_id;
	}
	
	public void setH_id(String h_id) {
		this.h_id = h_id;
	}
	
	public String getH_pw() {
		return h_pw;
	}
	
	public void setH_pw(String h_pw) {
		this.h_pw = h_pw;
	}
	
	public String getH_name() {
		return h_name;
	}
	
	public void setH_name(String h_name) {
		this.h_name = h_name;
	}
	
	public String getH_phone() {
		return h_phone;
	}
	
	public void setH_phone(String h_phone) {
		this.h_phone = h_phone;
	}
	
	public String getH_addr() {
		return h_addr;
	}
	
	public void setH_addr(String h_addr) {
		this.h_addr = h_addr;
	}
	
	public String getH_email() {
		return h_email;
	}
	
	public void setH_email(String h_email) {
		this.h_email = h_email;
	}
	
	public String getH_nick() {
		return h_nick;
	}
	
	public void setH_nick(String h_nick) {
		this.h_nick = h_nick;
	}
	
	public String getH_jday() {
		return h_jday;
	}
	
	public void setH_jday(String h_jday) {
		this.h_jday = h_jday;
	}
	
	public int getH_point() {
		return h_point;
	}
	
	public void setH_point(int h_point) {
		this.h_point = h_point;
	}
	
	public String getH_level() {
		return h_level;
	}
	
	public void setH_level(String h_level) {
		this.h_level = h_level;
	}
}
