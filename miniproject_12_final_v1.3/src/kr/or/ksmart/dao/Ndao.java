package kr.or.ksmart.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import kr.or.ksmart.driverdb.DriverDB;
import kr.or.ksmart.dto.NoteBook;

public class Ndao {
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	ArrayList<NoteBook> list =  null;
	NoteBook n = null;
	
	public void nInsert(NoteBook n, float salePrice) throws ClassNotFoundException, SQLException {
		
		System.out.println("============================================================");
		System.out.println("상품 등록 처리 과정 <-nInsert ");
		
		System.out.println(salePrice + "<-할인된 가격");
		
		DriverDB db = new DriverDB();
		conn = db.driverDbcon();
		System.out.println(conn + " <- conn Ndao.java");
		
		pstmt = conn.prepareStatement("select max(CAST(SUBSTRING(n_code,7) AS DECIMAL)) as maxcol from a_notebook");
		System.out.println(pstmt + " <- pstmt Mdao.java");
		
		rs = pstmt.executeQuery();
		System.out.println(rs + " <- rs Ndao.java");
		//System.out.println(rs.next() + " <- rs.next() Mdao.java");
		
		int max;
		String codeText = "notes_";
		String codeAll = null;
		
		if(rs.next()) {
			max = rs.getInt("maxcol");
			System.out.println(max + " <-max");
			max = max+1;
			String a = String.format("%03d",max);
			System.out.println(a);
			codeAll = codeText + a;
			System.out.println(codeAll + " <-codeAll");
		}
		
		pstmt = conn.prepareStatement("INSERT INTO a_notebook VALUES (?, ?, "
				+ "?, ?, ?, ?,now(), "
				+ "?, ?, ?, ?,?)");
		System.out.println(pstmt + " <- pstmt2 Mdao.java");
		
		pstmt.setString(1, codeAll);
		pstmt.setString(2, n.gethId());
		pstmt.setString(3, n.getnName());
		pstmt.setString(4, n.getnColor());
		pstmt.setString(5, n.getnMade());
		pstmt.setInt(6, n.getnPrice());		
		pstmt.setString(7, n.getnSday());
		pstmt.setFloat(8, salePrice);
		pstmt.setInt(9, n.getnCount());
		pstmt.setString(10, n.getnNspec());
		pstmt.setString(11, n.getnImg());
		System.out.println(pstmt + " <- pstmt3 Mdao.java");
		
		int result = pstmt.executeUpdate();
		System.out.println(result + " <- result Mdao.java");
		
		rs.close(); 
		pstmt.close(); 
		conn.close();
		 
		System.out.println("============================================================");
	}
	
	public ArrayList<NoteBook> nlist() throws SQLException, ClassNotFoundException {
		
		System.out.println("============================================================");
		System.out.println("상품 리스트 처리 과정 <-nlist ");
		
		DriverDB db = new DriverDB();
		conn = db.driverDbcon();
		System.out.println(conn + " <- conn Mdao.java");
	
		pstmt = conn.prepareStatement("SELECT n_code , n_name, n_color, n_made, n_spec, n_count, n_sday, n_price, n_Sprice, n_img FROM a_notebook");
		System.out.println(pstmt + " <- pstmt Mdao.java");
		rs = pstmt.executeQuery();
		System.out.println(rs + " <- rs Ndao.java");
		
		list = new ArrayList<NoteBook>();
	
		while(rs.next()) {
			n = new NoteBook();
			//System.out.println(rs.getString("n_code") + "<- code");
			n.setnCode(rs.getString("n_code"));
			
			n.setnName(rs.getString("n_name"));
			n.setnColor(rs.getString("n_color"));
			n.setnMade(rs.getString("n_made"));
			
			n.setnNspec(rs.getString("n_spec"));
			
			n.setnCount(rs.getInt("n_count"));
		
			n.setnSday(rs.getString("n_sday"));
	//		n.setnRday(rs.getDate("n_rday"));
	//		System.out.println(n + "<-1셋팅 됬니?");		
			n.setnPrice(rs.getInt("n_price"));
			n.setnSprice(rs.getFloat("n_Sprice"));
	//		System.out.println(rs.getString("n_img"));
			n.setnImg(rs.getString("n_img"));
	//		System.out.println(n + "<-2셋팅 됬니?");
			list.add(n);
		}
		
		rs.close(); 
		pstmt.close(); 
		conn.close();
		
		System.out.println("============================================================");
		
		return list;
	}
	
	public ArrayList<NoteBook> nlist(String hId) throws SQLException, ClassNotFoundException {
		
		System.out.println("============================================================");
		System.out.println("상품 리스트 처리 과정 (판매자 전용) <-nlist(매개변수 아이디) ");
		System.out.println(hId + " <-판매자로 로그인 성공한 아이디 값");
		
		DriverDB db = new DriverDB();
		conn = db.driverDbcon();
		System.out.println(conn + " <- conn Mdao.java");
		
		pstmt = conn.prepareStatement("select a_human.*,a_notebook.* from a_human "
				+ "inner join a_notebook on a_human.h_id = a_notebook.h_id "
				+ "WHERE a_human.h_id=" + "'"+ hId + "'");
		System.out.println(pstmt + " <- pstmt Mdao.java");
		
		rs = pstmt.executeQuery();
		System.out.println(rs + " <- rs Ndao.java");
//		System.out.println(rs.next() + " <- rs.next() Mdao.java");
//		System.out.println(rs.next() + " <- rs.next() Mdao.java");
//		System.out.println(rs.next() + " <- rs.next() Mdao.java");
//		System.out.println(rs.next() + " <- rs.next() Mdao.java");
//		System.out.println(rs.next() + " <- rs.next() Mdao.java");
//		System.out.println(rs.next() + " <- rs.next() Mdao.java");
		
		list = new ArrayList<NoteBook>();
		
		while(rs.next()) {
			n = new NoteBook();
			System.out.println(rs.getString("n_code") + "<- code");
//			n.sethId(hId);
			n.setnCode(rs.getString("n_code"));
			n.setnName(rs.getString("n_name"));
			n.setnColor(rs.getString("n_color"));
			n.setnMade(rs.getString("n_made"));
			n.setnNspec(rs.getString("n_spec"));
			n.setnCount(rs.getInt("n_count"));
			n.setnSday(rs.getString("n_sday"));
//			n.setnRday(rs.getDate("n_rday"));
//			System.out.println(n + "<-3셋팅 됬니?");		
			n.setnPrice(rs.getInt("n_price"));
			n.setnSprice(rs.getFloat("n_Sprice"));
//			System.out.println(rs.getString("n_img"));
			n.setnImg(rs.getString("n_img"));
			System.out.println(n + " <-1셋팅 됬니?");
//			System.out.println(n + "<-2셋팅 됬니?");
			list.add(n);
		}
			
		rs.close(); 
		pstmt.close(); 
		conn.close();
		
		System.out.println("============================================================");
		
		return list;
		
	}
	
	public NoteBook ndetailList(String code) throws ClassNotFoundException, SQLException {
		
		System.out.println("============================================================");
		System.out.println("상품 상세 화면 처리 과정 <-ndetailList ");
		
		DriverDB db = new DriverDB();
		conn = db.driverDbcon();
		System.out.println(conn + " <- conn Mdao.java");
		
		pstmt = conn.prepareStatement("SELECT * FROM a_notebook WHERE n_code=?");
		System.out.println(pstmt + " <- pstmt Mdao.java");
		
		pstmt.setString(1, code);
		System.out.println(pstmt + " <- pstmt2 Mdao.java");
		
		rs = pstmt.executeQuery();
		System.out.println(rs + " <- rs Mdao.java");
		//System.out.println(rs.next() + " <- rs.next() Mdao.java");
		
		if(rs.next()) {
			n = new NoteBook();
			n.sethId(rs.getString("h_id"));
			n.setnImg(rs.getString("n_img"));
			n.setnName(rs.getString("n_name"));
			n.setnColor(rs.getString("n_color"));
			n.setnMade(rs.getString("n_made"));
			n.setnNspec(rs.getString("n_spec"));
			n.setnCount(rs.getInt("n_count"));
			n.setnSday(rs.getString("n_sday"));
//			n.setnRday(rs.getDate("n_rday"));
			n.setnPrice(rs.getInt("n_price"));
			n.setnSprice(rs.getFloat("n_Sprice"));
		}

		rs.close(); 
		pstmt.close(); 
		conn.close();		
		
		System.out.println("============================================================");
		
		return n;
		
	}
	
	public NoteBook nUpdateOne(String code) throws SQLException, ClassNotFoundException {
		
		System.out.println("============================================================");
		System.out.println("상품 수정 화면  nUpdateOne ");
		System.out.println(code + " <-code 수정 하고자 하는 상품의 코드값 ");
		
		DriverDB db = new DriverDB();
		conn = db.driverDbcon();
		System.out.println(conn + " <- conn Mdao.java");
		
		pstmt = conn.prepareStatement("SELECT * FROM a_notebook where n_code = ?");
		System.out.println(pstmt + " <- pstmt Mdao.java");
		
		pstmt.setString(1, code);
		System.out.println(pstmt + " <- pstmt2 Mdao.java");
		
		rs = pstmt.executeQuery();
		System.out.println(rs + " <- rs Ndao.java");
		//System.out.println(rs.next() + " <- rs.next() Ndao.java");
		
		if(rs.next()) {
			n = new NoteBook();
			n.setnCode(rs.getString("n_code"));
			n.setnName(rs.getString("n_name"));
			n.setnColor(rs.getString("n_color"));
			n.setnMade(rs.getString("n_made"));
			n.setnNspec(rs.getString("n_spec"));
			n.setnCount(rs.getInt("n_count"));
			n.setnSday(rs.getString("n_sday"));
			n.setnPrice(rs.getInt("n_price"));
			n.setnSprice(rs.getFloat("n_Sprice"));
			n.setnImg(rs.getString("n_img"));
		}

		rs.close(); 
		pstmt.close(); 
		conn.close();		
		
		System.out.println("============================================================");
	
		return n;
	}
	
	public String nUpdate(NoteBook n, float salePrice) throws ClassNotFoundException, SQLException {
		
		System.out.println("============================================================");
		System.out.println("상품 수정 처리 과정 <-nUpdate ");
		System.out.println(salePrice + "<-할인 적용 가격");
		//System.out.println(n.getnCode() + "<-이미지 삭제를 위한 선택 기준 코드");
		
		DriverDB db = new DriverDB();
		conn = db.driverDbcon();
		System.out.println(conn + " <- conn Ndao.java");
		
		pstmt = conn.prepareStatement("select n_img FROM a_notebook WHERE n_code=?");
		pstmt.setString(1, n.getnCode());
		System.out.println(pstmt + " <- pstmt Ndao.java");
		System.out.println(n.getnCode() + "<-n.getnCode() 수정 하기 전의 상품 코드");
		
		rs = pstmt.executeQuery();
		System.out.println(rs + " <- rs Ndao.java");
		
		String img = null;
		
		if(rs.next()) {
			img = rs.getString("n_img");
			System.out.println(img + " <-수정 하기 전의 이미지 파일");
		}
		
		pstmt = conn.prepareStatement("update a_notebook SET n_name=?, n_color=?, n_made=?,"
				+ " n_spec=?, n_count=?, n_sday=?, "
				+ " n_price=?, n_Sprice=?, n_img=? WHERE n_code=?");
		System.out.println(pstmt + " <- pstmt2 Mdao.java");
		
		System.out.println(n.getnCode() + " <- n.getnCode() 수정전 이미지 추출 후 상품 코드 Mdao.java");
		
		
		pstmt.setString(1, n.getnName());
		pstmt.setString(2, n.getnColor());
		pstmt.setString(3, n.getnMade());
		pstmt.setString(4, n.getnNspec());
		pstmt.setInt(5, n.getnCount());
		pstmt.setString(6, n.getnSday());
		pstmt.setInt(7, n.getnPrice());		
		pstmt.setFloat(8, salePrice);
		pstmt.setString(9, n.getnImg());
		pstmt.setString(10, n.getnCode());
		System.out.println(pstmt + " <- pstmt3 Mdao.java");
		
		int result = pstmt.executeUpdate();
		System.out.println(result + " <- result Mdao.java");
		
		System.out.println(n.getnImg() + " <- n.getnImg() 수정후 이미지 파일 Mdao.java");
		
		pstmt.close(); 
		conn.close();
		 
		System.out.println("============================================================");
		
		return img;
	}

	public String nDelete(String code) throws ClassNotFoundException, SQLException {
	
		System.out.println("============================================================");
		System.out.println("상품 삭제 처리 과정 <-nDelete ");
		System.out.println(code + "<-삭제 버튼 클릭시 삭제되는 상품의 코드값");
		
		DriverDB db = new DriverDB();
		conn = db.driverDbcon();
		System.out.println(conn + " <- conn Ndao.java");
		
		pstmt = conn.prepareStatement("select n_img FROM a_notebook WHERE n_code=?");
		pstmt.setString(1, code);
		System.out.println(pstmt + " <- pstmt Ndao.java");
		
		rs = pstmt.executeQuery();
		System.out.println(rs + " <- rs Ndao.java");
//		System.out.println(rs.next() + " <- rs.next() Ndao.java");
		
		String img = null;
		
		if(rs.next()) {
			img = rs.getString("n_img");
			System.out.println(img + " <-img file");
		}
		
		pstmt = conn.prepareStatement("DELETE From a_notebook WHERE n_code=?");
		System.out.println(pstmt + " <- pstmt2 Ndao.java");
		
		pstmt.setString(1, code);
		System.out.println(pstmt + " <- pstmt3 Ndao.java");
		
		int result = pstmt.executeUpdate();
		System.out.println(result + " <- result Ndao.java");
		
		rs.close();
		pstmt.close(); 
		conn.close();
		
		System.out.println("============================================================");
		
		return img;
	}
	
/*06.상품검색처리*/
	
	public ArrayList<NoteBook> nSearch(String date1,String date2,String n_name) throws ClassNotFoundException, SQLException{
		System.out.println("############################################");
		System.out.println("상품검색 처리 <- 노트북 Search");
		System.out.println("############################################");
		
		DriverDB db =new DriverDB();
		conn =db.driverDbcon();
		System.out.println(conn +"<--conn의 값");
		
		String query = "SELECT * from a_human h inner join a_notebook n on h.h_id = n.h_id";
		String date_query = " and DATE_FORMAT(n_rday,'%Y-%m-%d') between ? and ?";
		String query_n_name = " AND n_name = ? ";
		String order = "order by n_rday DESC";
		if(date1 == null) {
			System.out.println("01 date1 null 조건"); //리스트만 실행시(첫화면)
			pstmt = conn.prepareStatement(query);
		}else if((date1 == "" && date2 =="")){ 
			System.out.println("02 기간 공백조건"); //기간 미입력
			pstmt = conn.prepareStatement(query);
			if(n_name != "") {
				System.out.println("04 기간 미입력 & 상품명 입력 조건"); // 기간 미입력 & 상품명 입력조건
				query += query_n_name+order;
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, n_name);	
			}
		
//SELECT * from a_human h inner join a_notebook n on h.h_id = n.h_id  and DATE_FORMAT(n_rday,'%Y-%m-%d') BETWEEN '2019-01-19' AND '2019-01-08';			
		}else if(date1 != "" && date2 !="" && n_name == "") {
			System.out.println("03 기간 입력 & 상품명 공백 조건"); // 기간 입력 & 상품명 공백조건
			query += date_query + order;
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, date1);
			pstmt.setString(2, date2);
//SELECT * from a_human h inner join a_notebook n on h.h_id = n.h_id  and DATE_FORMAT(n_rday,'%Y-%m-%d') BETWEEN '2019-01-19' AND '2019-01-08';			
		}else if(date1 == "" && date2 =="" && n_name != "") {
			System.out.println("04 기간 미입력 & 상품명 입력 조건"); // 기간 미입력 & 상품명 입력조건
			query += query_n_name+order;
			pstmt.setString(1, n_name);
		}else if(date1 != "" && date2 !="" && n_name != "") {
			System.out.println("05 기간  & 상품명 입력 조건"); // 기간 & 상품명 입력 조건
			query += date_query;
			query += query_n_name+order;
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, date1);
			pstmt.setString(2, date2);
			pstmt.setString(3, n_name);
		}
		
		System.out.println(pstmt +"<--pstmt의 값");
		rs = pstmt.executeQuery();
		System.out.println(rs +"<--rs의 값");
		
		list = new ArrayList<NoteBook>();
		while(rs.next()) {
			n = new NoteBook();
			
			n.setnCode(rs.getString("n_code"));
			n.sethId(rs.getString("h_id"));
			n.setnName(rs.getString("n_name"));
			n.setnColor(rs.getString("n_color"));
			n.setnMade(rs.getString("n_made"));
			n.setnPrice(rs.getInt("n_price"));
			n.setnRday(rs.getString("n_rday"));
			n.setnSday(rs.getString("n_sday"));
			n.setnSprice(rs.getInt("n_sprice"));
			n.setnCount(rs.getInt("n_count"));
			n.setnNspec(rs.getString("n_spec"));
			n.setnImg(rs.getString("n_img"));
	
			list.add(n);
			
		}
		
	
		pstmt.close(); 
		conn.close();
		return list;
		
	}
	
}
