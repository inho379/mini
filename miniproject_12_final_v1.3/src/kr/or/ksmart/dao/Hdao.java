package kr.or.ksmart.dao;

import java.sql.*;
import java.util.ArrayList;

import kr.or.ksmart.driverdb.DriverDB;
import kr.or.ksmart.dto.Human;

public class Hdao {
	PreparedStatement pstmt = null;
	Connection conn = null;
	ResultSet rs = null;
	Human h = null;
	ArrayList<Human> l = null;
	DriverDB db=new DriverDB();
	
//	로그인
	public String[] hLogin(String hid,String hpw) throws ClassNotFoundException, SQLException {
		System.out.println("로그인");
		
		conn = db.driverDbcon();
		pstmt = conn.prepareStatement("select h_id, h_pw, h_level, h_name, h_permit from a_human where h_id='"+hid+"'");
		rs=pstmt.executeQuery();
		String dbid = null;
		String dbpw = null;
		String dblevel = null;
		String dbname = null;
		String dbpermit = null;
		if(rs.next()){
			dbid=rs.getString("h_id");
			dbpw =rs.getString("h_pw");
			dblevel =rs.getString("h_level");
			dbname =rs.getString("h_name");
			dbpermit =rs.getString("h_permit");
		}
		rs.close();
		pstmt.close();
		conn.close();
		String[] h=new String[4];
		h[0]=null;
		h[1]=null;
		h[2]=null;
		h[3]=null;
		if("O".equals(dbpermit)) {
			if(dbid!=null) {
				if(hpw.equals(dbpw)) {
					h[0]=dbid;
					h[1]=dblevel;
					h[2]=dbname;
					h[3]="로그인 성공";
				}else {
					h[3]="비밀번호 불일치";
				}
			}else {
				h[3]="아이디 불일치";
			}
		}else{
			h[3]="비승인 회원";
		}
		return h;
	}
	
//	수정 검색
	public Human hSearchForUpdate(String h_id) throws ClassNotFoundException, SQLException {
		System.out.println("수정 검색");
		
		conn = db.driverDbcon();
		pstmt = conn.prepareStatement("select * from a_human where h_id='"+h_id+"'");
		rs=pstmt.executeQuery();
		if(rs.next()){
			h = new Human();
			h.setH_id(rs.getString("h_id"));
			h.setH_pw(rs.getString("h_pw"));
			h.setH_name(rs.getString("h_name"));
			h.setH_phone(rs.getString("h_phone"));
			h.setH_addr(rs.getString("h_addr"));
			h.setH_email(rs.getString("h_email"));
			h.setH_nick(rs.getString("h_nick"));
			h.setH_jday(rs.getString("h_jday"));
			h.setH_birth(rs.getString("h_birth"));
			h.setH_gender(rs.getString("h_gender"));
		}
		rs.close();
		pstmt.close();
		conn.close();
		return h;
	}
	
//	회원 검색
	public ArrayList<Human> hList(String id, String name, String nick, String gender, String level, String permit, String j1, String j2, String b1, String b2) throws ClassNotFoundException, SQLException {
		System.out.println("회원 검색");
		l = new ArrayList<Human>();
		
		String query = "select * from a_human";
		
		if(!"".equals(id)||!"".equals(name)||!"".equals(nick)||!"".equals(gender)||!"".equals(level)||!"".equals(permit)||!"".equals(j1)||!"".equals(j2)||!"".equals(b1)||!"".equals(b2)) {
			query+=" where ";
		}
		if(!"".equals(j1)){
			if(!"".equals(j2)) {
				query+="DATE_FORMAT(h_jday,'%Y-%m-%d') BETWEEN '"+j1+"' AND '"+j2+"'";
			}else {
				query+="DATE_FORMAT(h_jday,'%Y-%m-%d') >='"+j1+"'";
			}
			if(!"".equals(id)||!"".equals(name)||!"".equals(nick)||!"".equals(gender)||!"".equals(level)||!"".equals(permit)||!"".equals(b1)||!"".equals(b2)) {
				query+=" && ";
			}
		}else if(!"".equals(j2)) {
			query+="DATE_FORMAT(h_jday,'%Y-%m-%d') <='"+j2+"'";
			if(!"".equals(id)||!"".equals(name)||!"".equals(nick)||!"".equals(gender)||!"".equals(level)||!"".equals(permit)||!"".equals(b1)||!"".equals(b2)) {
				query+=" && ";
			}
		}
		if(!"".equals(b1)){
			if(!"".equals(b2)) {
				query+="DATE_FORMAT(h_birth,'%Y-%m-%d') BETWEEN '"+b1+"' AND '"+b2+"'";
			}else {
				query+="DATE_FORMAT(h_birth,'%Y-%m-%d') >='"+b1+"'";
			}
			if(!"".equals(id)||!"".equals(name)||!"".equals(nick)||!"".equals(gender)||!"".equals(level)||!"".equals(permit)) {
				query+=" && ";
			}
		}else if(!"".equals(b2)) {
			query+="DATE_FORMAT(h_birth,'%Y-%m-%d') <='"+b2+"'";
			if(!"".equals(id)||!"".equals(name)||!"".equals(nick)||!"".equals(gender)||!"".equals(level)||!"".equals(permit)) {
				query+=" && ";
			}
		}
		if(!"".equals(id)){
			query+=" h_id='"+id+"' ";
			if(!"".equals(name)||!"".equals(nick)||!"".equals(gender)||!"".equals(level)||!"".equals(permit)) {
				query+="&&";
			}
		}
		if(!"".equals(name)){
			query+=" h_name='"+name+"' ";
			if(!"".equals(nick)||!"".equals(gender)||!"".equals(level)||!"".equals(permit)) {
				query+="&&";
			}
		}
		if(!"".equals(nick)){
			query+=" h_nick='"+nick+"' ";
			if(!"".equals(gender)||!"".equals(level)||!"".equals(permit)) {
				query+="&&";
			}
		}
		if(!"".equals(gender)){
			query+=" h_gender='"+gender+"' ";
			if(!"".equals(level)||!"".equals(permit)) {
				query+="&&";
			}
		}
		if(!"".equals(level)){
			query+=" h_level='"+level+"' ";
			if(!"".equals(permit)) {
				query+="&&";
			}
		}
		if(!"".equals(permit)){
			query+=" h_permit='"+permit+"' ";
		}
		conn = db.driverDbcon();
		pstmt = conn.prepareStatement(query);
		System.out.println(pstmt + "<-- 쿼리 문구 확인");
		rs=pstmt.executeQuery();
		while(rs.next()){
			h = new Human();
			h.setH_id(rs.getString("h_id"));
			h.setH_pw(rs.getString("h_pw"));
			h.setH_name(rs.getString("h_name"));
			h.setH_phone(rs.getString("h_phone"));
			h.setH_addr(rs.getString("h_addr"));
			h.setH_email(rs.getString("h_email"));
			h.setH_nick(rs.getString("h_nick"));
			h.setH_jday(rs.getString("h_jday"));
			h.setH_birth(rs.getString("h_birth"));
			h.setH_point(rs.getInt("h_point"));
			h.setH_level(rs.getString("h_level"));
			h.setH_gender(rs.getString("h_gender"));
			h.setH_permit(rs.getString("h_permit"));
			l.add(h);
		}
		rs.close();
		pstmt.close();
		conn.close();
		return l;
	}
	
//	가입
	public void hInsert(Human h) throws ClassNotFoundException, SQLException {
		System.out.println("가입");
		System.out.println(h.getH_birth());
		System.out.println(h.getH_year());
		System.out.println(h.getH_month());
		System.out.println(h.getH_day());
		h.setH_birth(h.getH_year(), h.getH_month(), h.getH_day());
		System.out.println(h.getH_birth());
		DriverDB a=new DriverDB();
		
		conn = a.driverDbcon();
		pstmt = conn.prepareStatement("INSERT INTO a_human VALUES (?, ?, ?, ?, ?, ?, ?, now(), ?, ?, ?, ?, ?)");
		pstmt.setString(1, h.getH_id());
		pstmt.setString(2, h.getH_pw());
		pstmt.setString(3, h.getH_level());
		pstmt.setString(4, h.getH_name());
		pstmt.setString(5, h.getH_addr());
		pstmt.setString(6, h.getH_email());
		pstmt.setString(7, h.getH_nick());
		pstmt.setString(8, h.getH_birth());
		pstmt.setInt(9, 5000);
		pstmt.setString(10, h.getH_phone());
		if("구매자".equals(h.getH_level())) {
			pstmt.setString(11, "O");			
		}else {
			pstmt.setString(11, "X");			
		}
		pstmt.setString(12, h.getH_gender());
		System.out.println(pstmt + "<-- 쿼리 문구 확인");
		
		int result = pstmt.executeUpdate();
		System.out.println(result + "<-- result");

		pstmt.close();
		conn.close();
	}
	
//	수정
	public void hUpdate(Human h) throws SQLException, ClassNotFoundException {
		System.out.println("수정");
		DriverDB a=new DriverDB();
		
		conn = a.driverDbcon();
		pstmt = conn.prepareStatement("UPDATE a_human SET h_pw=?,h_name=?,h_phone=?,h_addr=?,h_email=?,h_nick=? WHERE h_id =?");
		pstmt.setString(1, h.getH_pw());
		pstmt.setString(2, h.getH_name());
		pstmt.setString(3, h.getH_phone());
		pstmt.setString(4, h.getH_addr());
		pstmt.setString(5, h.getH_email());
		pstmt.setString(6, h.getH_nick());
		pstmt.setString(7, h.getH_id());	
		System.out.println(pstmt + "<-- 쿼리 문구 확인");
		
		int result = pstmt.executeUpdate();
		System.out.println(result + "<-- result");

		pstmt.close();
		conn.close();
	}
	
//	가입 승인
	public void hCheck(String h_id) throws SQLException, ClassNotFoundException {
		System.out.println("가입 승인");
		DriverDB a=new DriverDB();
		
		conn = a.driverDbcon();
		pstmt = conn.prepareStatement("UPDATE a_human SET h_permit='O' WHERE h_id ='"+h_id+"'");
		System.out.println(pstmt + "<-- 쿼리 문구 확인");
		
		int result = pstmt.executeUpdate();
		System.out.println(result + "<-- result");

		pstmt.close();
		conn.close();
	}
	
//	삭제
	public void hDelete(String h_id) throws ClassNotFoundException, SQLException {
		System.out.println("삭제");
		DriverDB a=new DriverDB();
		
		conn = a.driverDbcon();
		pstmt = conn.prepareStatement("DELETE FROM a_human WHERE h_id='"+h_id+"'");
		System.out.println(pstmt + "<-- 쿼리 문구 확인");
		
		int result = pstmt.executeUpdate();
		System.out.println(result + "<-- result");

		pstmt.close();
		conn.close();
	}
}
