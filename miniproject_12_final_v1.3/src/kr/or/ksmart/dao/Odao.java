package kr.or.ksmart.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import kr.or.ksmart.dto.NoteBook;
import kr.or.ksmart.dto.Order;
import kr.or.ksmart.driverdb.DriverDB;


public class Odao {
			Connection conn =null;
			PreparedStatement pstmt =null;
			PreparedStatement pstmt_insert = null;
			ResultSet rs = null;
			ResultSet rs_insert = null;
			Order o =null;
			NoteBook n =null;
			ArrayList<Order> list =null;
		//�닔�젙
		public void oUpdate(Order o) throws ClassNotFoundException, SQLException {
			System.out.println("~~~~~~~~~~~~~~~~~~~~~");
			System.out.println("~~~~~~二쇰Ц�닔�젙�솕硫�~~~~~~");
			System.out.println("~~~~~~~~~~~~~~~~~~~~~");
			DriverDB db = new DriverDB();
			conn = db.driverDbcon();
			System.out.println(conn + "<- conn");
			
			pstmt = conn.prepareStatement("update a_order set o_count=?,o_point=?,o_tprice=?,o_name=?,o_addr=?,o_phone=?,o_ask=? where o_code=?");
			System.out.println(pstmt + "<-pstmt1");
			
			pstmt.setString(1, o.getO_count());
			System.out.println(o.getO_point());
			pstmt.setInt(2, Integer.parseInt(o.getO_point()));
			pstmt.setString(3, o.getO_tprice());
			pstmt.setString(4, o.getO_name());
			pstmt.setString(5, o.getO_addr());
			pstmt.setString(6, o.getO_phone());
			pstmt.setString(7, o.getO_ask());
			pstmt.setString(8, o.getO_code());
			System.out.println(pstmt + "<--pstmt2");
			
			
			pstmt.executeUpdate();
			pstmt.close();
			conn.close();
		}
			
		//�궘�젣	
		public void oDelete(String o_code) throws ClassNotFoundException, SQLException	{
		
			System.out.println("~~~~~~~~~~~~~~~~~~~~~");
			System.out.println("~~~~~~二쇰Ц�궘�젣�솕硫�~~~~~~");
			System.out.println(o_code + "<-- o_code");
			System.out.println("~~~~~~~~~~~~~~~~~~~~~");
			DriverDB db = new DriverDB();
			conn = db.driverDbcon();
			System.out.println(conn + "<- conn");
			

			pstmt = conn.prepareStatement("delete from a_order where o_code=?");
			System.out.println(pstmt + "<-pstmt");
			
			pstmt.setString(1, o_code);
			System.out.println(pstmt + "<----pstmt1");
			
			pstmt.executeUpdate();
			pstmt.close();
			conn.close();
			
		}
		//二쇰Ц�벑濡�
		public void oInsert(Order o) throws ClassNotFoundException, SQLException {
			System.out.println("~~~~~~~~~~~~~~~~~~~~~");
			System.out.println("~~~~~~二쇰Ц�벑濡앺솕硫�~~~~~~");
			System.out.println("~~~~~~~~~~~~~~~~~~~~~");
			
			DriverDB db = new DriverDB();
			conn = db.driverDbcon();
			System.out.println(conn + "<- conn");
			if(o.getO_point()==null) o.setO_point("0");
			
			pstmt = conn.prepareStatement("select max(CAST(substring(o_code,7) AS DECIMAL)) as maxcol from a_order");
			System.out.println(pstmt + "<-- pstmt 1");
			// preparedstatemet媛앹껜�뿉 �솕硫댁뿉�꽌 �엯�젰�븳 �뜲�씠�꽣 �뀑�똿
			rs = pstmt.executeQuery();
			
			int max = 0;
			String tempCode = "order_";
			String o_code = "order_1";
			if(rs.next()){
				max = rs.getInt(1);
				
				System.out.println(max + "<-- max 1");
				max = max + 1;
				System.out.println(max + "<-- max 2");
				String a= String.format("%03d",max);
				o_code = tempCode + a;
			}
			System.out.println(o_code + "<-- o_code");
		/*  1�떒怨� 理쒕�媛믪쓣 援ы빐�꽌 �긽�뭹肄붾뱶 �깮�꽦 End	*/	
			
			pstmt_insert = conn.prepareStatement(
			"INSERT INTO a_order VALUES (?,?,?,?,?,?,?,now(),?,?,?,?)");
			pstmt_insert.setString(1, o_code);
			pstmt_insert.setString(2, o.getH_id());
			pstmt_insert.setString(3, o.getN_code());
			pstmt_insert.setString(4, o.getO_price());
			pstmt_insert.setString(5, o.getO_point());
			pstmt_insert.setString(6, o.getO_count());
			pstmt_insert.setString(7, o.getO_tprice());
			pstmt_insert.setString(8, o.getO_name());
			pstmt_insert.setString(9, o.getO_addr());
			pstmt_insert.setString(10, o.getO_phone());
			pstmt_insert.setString(11, o.getO_ask());
			
			int insertResult = pstmt_insert.executeUpdate();
			System.out.println(insertResult + "<-- insertResult 二쇰Ц�벑濡앷껐怨�");
			
			pstmt.close();
			conn.close();
		}
		//二쇰Ц�떆 �룷�씤�듃 �쟻由쎈릺�뼱 蹂��룞
		public void oPoint(String id, String op, String otp) throws SQLException, ClassNotFoundException {
			System.out.println("�룷�씤�듃");
			DriverDB a=new DriverDB();
			int mp=1; //�쟻由쎌쑉
			int sm=Integer.parseInt(otp)/(100)*(mp);
			int opp=Integer.parseInt(op);
			int tm=Integer.parseInt(hPoint(id));
			conn = a.driverDbcon();
			pstmt = conn.prepareStatement("UPDATE a_human SET  h_point ='"+(sm-opp+tm)+"'WHERE h_id ='"+id+"'");

			System.out.println(pstmt + "<-- 荑쇰━ 臾멸뎄 �솗�씤");
			
			int result = pstmt.executeUpdate();
			System.out.println(result + "<-- result");
		
			pstmt.close();
			conn.close();
		}
		//�쉶�썝�뀒�씠釉� �룷�씤�듃 �쟻由�
		public String hPoint(String id) throws SQLException, ClassNotFoundException {
			System.out.println("�룷�씤�듃�쟻由�");
			DriverDB a=new DriverDB();
			String tm="";
			
			conn = a.driverDbcon();
			pstmt = conn.prepareStatement("select h_point from a_human where h_id='"+id+"'");
			rs=pstmt.executeQuery();
			if(rs.next()){
				tm=rs.getString("h_point");
			}
			System.out.println(pstmt + "<-- 荑쇰━ 臾멸뎄 �솗�씤");
			rs.close();
			pstmt.close();
			conn.close();
			
			return tm;
		}	
		//�옱怨좎닔�웾 �옄�룞移댁슫�듃
		public void oCount(String ocount,String ncode) throws SQLException, ClassNotFoundException {
			System.out.println("�옱怨좎닔�웾 移댁슫�듃");
			DriverDB a=new DriverDB();
			int nc=0;
			
			conn = a.driverDbcon();
			pstmt = conn.prepareStatement("select n_count from a_notebook where n_code='"+ncode+"'");
			rs=pstmt.executeQuery();
			if(rs.next()){
				nc=Integer.parseInt(rs.getString("n_count"));
				System.out.println(nc + "<-- nc �솗�씤1");
			}
			rs.close();
			System.out.println(pstmt + "<-- 荑쇰━ 臾멸뎄 �솗�씤");
			System.out.println(nc + "<-- nc �솗�씤2");
			nc=nc-Integer.parseInt(ocount);
			System.out.println(nc + "<-- nc �솗�씤3");
			pstmt = conn.prepareStatement("update a_notebook set n_count='"+nc+"' where n_code='"+ncode+"'");
			pstmt.executeUpdate();
			pstmt.close();
			conn.close();
		}
		//�옱怨좎닔�웾 �닔�젙
		public void oCountUpdate(int ocount,String ncode) throws SQLException, ClassNotFoundException {
			System.out.println("�옱怨좎닔�웾 �닔�젙");
			DriverDB a=new DriverDB();
			conn = a.driverDbcon();
			pstmt = conn.prepareStatement("update a_notebook set n_count='"+ocount+"' where n_code='"+ncode+"'");
			pstmt.executeUpdate();
			pstmt.close();
			conn.close();
		}	

		public Order oUpdateOne(String code) throws SQLException, ClassNotFoundException {
				
				System.out.println("============================================================");
				System.out.println("�닔�젙 �뤌  ");
				System.out.println(code + " <-code");
				System.out.println("============================================================");
				
				DriverDB db = new DriverDB();
				conn = db.driverDbcon();
				System.out.println(conn + " <- conn Mdao.java");
				
				pstmt = conn.prepareStatement("SELECT a_notebook.n_name ,a_order.*"
						+"FROM a_order INNER JOIN a_notebook ON a_order.n_code=a_notebook.n_code where o_code='"+code+"'");
				System.out.println(pstmt + " <- pstmt Mdao.java");
				
				
				System.out.println(pstmt + " <- pstmt2 Mdao.java");
				
				rs = pstmt.executeQuery();
				System.out.println(rs + " <- rs Ndao.java");
				//System.out.println(rs.next() + " <- rs.next() Ndao.java");
				
				if(rs.next()) {
					o= new Order();
					n= new NoteBook();
					o.setO_code(rs.getString("o_code"));
					o.setN_code(rs.getString("n_code"));
					o.setO_price(rs.getString("o_price"));
					o.setO_tprice(rs.getString("o_tprice"));
					o.setO_addr(rs.getString("o_addr"));
					o.setO_ask(rs.getString("o_ask"));
					o.setO_count(rs.getString("o_count"));
					o.setO_name(rs.getString("o_name"));
					o.setO_phone(rs.getString("o_phone"));
					o.setO_point(rs.getString("o_point"));
				}
				
				rs.close();
				pstmt.close();
				conn.close();
				return o;
				
		}	
	/*		public NoteBook nUpdateOne(String name,String color) throws SQLException, ClassNotFoundException {
				
				System.out.println("============================================================");
				System.out.println("-=---- nUpdateOne ");
				System.out.println(name + " <-code 占쏙옙占쏙옙 占싹곤옙占쏙옙 占싹댐옙 占쏙옙품占쏙옙 占쌘드값 ");
				System.out.println(color + " <-code 占쏙옙占쏙옙 占싹곤옙占쏙옙 占싹댐옙 占쏙옙품占쏙옙 占쌘드값 ");
				
				DriverDB db = new DriverDB();
				conn = db.driverDbcon();
				System.out.println(conn + " <- conn Mdao.java");
				
				pstmt = conn.prepareStatement("SELECT * FROM a_notebook where n_name = ? and n_color=?");
				System.out.println(pstmt + " <- pstmt Mdao.java");
				
				pstmt.setString(1, name);
				pstmt.setString(2, color);
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
					n.setnCount(rs.getInt("n_count"));
					n.setnNspec(rs.getString("n_spec"));					
					n.setnSday(rs.getString("n_sday"));
					n.setnPrice(rs.getInt("n_price"));
					n.setnSprice(rs.getFloat("n_Sprice"));
					n.setnImg(rs.getString("n_img"));
				}
				
				System.out.println("============================================================");
			
				return n;
			}*/
		//由ъ뒪�듃

		ArrayList<String[]> alm =null;
		
		//o_search_form.jsp,o_search_list.jsp
		public ArrayList<String[]> tSearch(String scvalue, String stvalue, String selday, String nsday2, String nsday3, String otprice2, String otprice3) throws SQLException, ClassNotFoundException{
			System.out.println("#	kr.or.ksmart.dao	#####################");
			System.out.println("    25 뭐별, 출시일, 가격 검색 정렬  메서드 선언 Odao.java ");
			System.out.println("#	kr.or.ksmart.dao	#####################");
			DriverDB db = new DriverDB();
			conn = db.driverDbcon();
			System.out.println(conn + "<-- conn Odao.java");
			
			if(!"".equals(scvalue) & !"".equals(stvalue) & !"".equals(selday) & !"".equals(nsday2) & !"".equals(nsday3) & !"".equals(otprice2) & !"".equals(otprice3)){
				System.out.println("모든 조건 사용");	
				pstmt = conn.prepareStatement("SELECT * FROM a_order left JOIN a_human ON a_order.h_id = a_human.h_id left JOIN a_notebook ON a_order.n_code = a_notebook.n_code where "+scvalue+" = ? and DATE_FORMAT("+selday+",'%Y-%m-%d') BETWEEN ? AND ? AND o_tprice BETWEEN ? AND ?");
				pstmt.setString(1, stvalue);
				pstmt.setString(2, nsday2);
				pstmt.setString(3, nsday3);
				pstmt.setString(4, otprice2);
				pstmt.setString(5, otprice3);
			}else if(!"".equals(scvalue) & !"".equals(stvalue)  & !"".equals(selday) & !"".equals(nsday2) & !"".equals(nsday3) & "".equals(otprice2) & "".equals(otprice3)){
				System.out.println("뭐별,기간 사용");
				pstmt = conn.prepareStatement("SELECT * FROM a_order left JOIN a_human ON a_order.h_id = a_human.h_id left JOIN a_notebook ON a_order.n_code = a_notebook.n_code where "+scvalue+" = ? and DATE_FORMAT("+selday+",'%Y-%m-%d') BETWEEN ? AND ?");
				pstmt.setString(1, stvalue);
				pstmt.setString(2, nsday2);
				pstmt.setString(3, nsday3);
			}else if(!"".equals(scvalue) & !"".equals(stvalue) & !"".equals(selday) & "".equals(nsday2) & "".equals(nsday3) & "".equals(otprice2) & "".equals(otprice2)){
				System.out.println("뭐별 사용");
				pstmt = conn.prepareStatement("SELECT * FROM a_order left JOIN a_human ON a_order.h_id = a_human.h_id left JOIN a_notebook ON a_order.n_code = a_notebook.n_code where "+scvalue+" = ?");
				pstmt.setString(1, stvalue);
			}else if(!"".equals(scvalue) & !"".equals(stvalue) & !"".equals(selday)  & "".equals(nsday2) & "".equals(nsday3) & !"".equals(otprice2) & !"".equals(otprice3)){
				System.out.println("뭐별,가격 사용");
				pstmt = conn.prepareStatement("SELECT * FROM a_order left JOIN a_human ON a_order.h_id = a_human.h_id left JOIN a_notebook ON a_order.n_code = a_notebook.n_code where "+scvalue+" = ? AND o_tprice BETWEEN ? AND ?");
				pstmt.setString(1, stvalue);
				pstmt.setString(2, otprice2);
				pstmt.setString(3, otprice3);
			}else if(!"".equals(scvalue) & "".equals(stvalue) & !"".equals(selday)  & !"".equals(nsday2) & !"".equals(nsday3) & !"".equals(otprice2) & !"".equals(otprice3)){
				System.out.println("기간,가격 사용");
				pstmt = conn.prepareStatement("SELECT * FROM a_order left JOIN a_human ON a_order.h_id = a_human.h_id left JOIN a_notebook ON a_order.n_code = a_notebook.n_code where DATE_FORMAT("+selday+",'%Y-%m-%d') BETWEEN ? AND ? AND o_tprice BETWEEN ? AND ?");
				pstmt.setString(1, nsday2);
				pstmt.setString(2, nsday3);
				pstmt.setString(3, otprice2);
				pstmt.setString(4, otprice3);
			}else if(!"".equals(scvalue) & "".equals(stvalue) & !"".equals(selday)  & !"".equals(nsday2) & !"".equals(nsday3) & "".equals(otprice2) & "".equals(otprice3)){
				System.out.println("기간 사용");
				pstmt = conn.prepareStatement("SELECT * FROM a_order left JOIN a_human ON a_order.h_id = a_human.h_id left JOIN a_notebook ON a_order.n_code = a_notebook.n_code where DATE_FORMAT("+selday+",'%Y-%m-%d') BETWEEN ? AND ?");
				pstmt.setString(1, nsday2);
				pstmt.setString(2, nsday3);
			}else if(!"".equals(scvalue) & "".equals(stvalue) & !"".equals(selday)  & "".equals(nsday2) & "".equals(nsday3) & !"".equals(otprice2) & !"".equals(otprice3)){
				System.out.println("가격 사용");
				pstmt = conn.prepareStatement("SELECT * FROM a_order left JOIN a_human ON a_order.h_id = a_human.h_id left JOIN a_notebook ON a_order.n_code = a_notebook.n_code where o_tprice BETWEEN ? AND ?");
				pstmt.setString(1, otprice2);
				pstmt.setString(2, otprice3);
			}else {
				pstmt = conn.prepareStatement("SELECT * FROM a_order left JOIN a_human ON a_order.h_id = a_human.h_id left JOIN a_notebook ON a_order.n_code = a_notebook.n_code");
			}
				
			rs = pstmt.executeQuery();
			alm = new ArrayList<String[]>();
			while(rs.next()) {
				String[] str = new String[20];
				str[0]=rs.getString("o_code");
				str[1]=rs.getString("n_code");
				str[2]=rs.getString("a_human.h_id");
				str[3]=rs.getString("n_name");
				str[4]=rs.getString("o_price");
				str[5]=rs.getString("o_point");
				str[6]=rs.getString("o_count");
				str[7]=rs.getString("o_tprice");
				str[8]=rs.getString("o_oday");
				str[9]=rs.getString("o_name");
				str[10]=rs.getString("o_addr");
				str[11]=rs.getString("o_phone");
				str[12]=rs.getString("o_ask");
				alm.add(str);
			}
			rs.close();
			pstmt.close();
			conn.close();
			
			return alm;
		}
		
		//o_list.jsp
		public ArrayList<String[]> list1() throws ClassNotFoundException, SQLException{
			System.out.println("#	kr.or.ksmart.dao	#####################");
			System.out.println(" list1 리스트1.회원 정보 Odao.java");
			System.out.println("#	kr.or.ksmart.dao	#####################");
			DriverDB db = new DriverDB();
			conn = db.driverDbcon();
			System.out.println(conn + "<- conn");
			pstmt = conn.prepareStatement(
					"SELECT * FROM a_human");
			System.out.println(pstmt + "<-- pstmt");
			rs = pstmt.executeQuery();
			alm = new ArrayList<String[]>();

			while(rs.next()) {
				String[] strlist1 = new String[20];
				strlist1[0]=rs.getString("h_id");
				strlist1[1]=rs.getString("h_level");
				strlist1[2]=rs.getString("h_nick");
				strlist1[3]=rs.getString("h_point");
				alm.add(strlist1);
			}
			pstmt.close();
			conn.close();
			return alm;
		}
		
		public ArrayList<String[]> list2() throws ClassNotFoundException, SQLException{
			System.out.println("#	kr.or.ksmart.dao	#####################");
			System.out.println(" list2 리스트2.상품 정보 Odao.java");
			System.out.println("#	kr.or.ksmart.dao	#####################");
			DriverDB db = new DriverDB();
			conn = db.driverDbcon();
			System.out.println(conn + "<- conn");
			pstmt = conn.prepareStatement(
					"SELECT * FROM a_notebook");
			System.out.println(pstmt + "<-- pstmt");
			rs = pstmt.executeQuery();
			alm = new ArrayList<String[]>();

			while(rs.next()) {
				String[] strlist2 = new String[20];
				strlist2[0]=rs.getString("n_code");
				strlist2[1]=rs.getString("n_name");
				strlist2[2]=rs.getString("n_made");
				strlist2[3]=rs.getString("n_price");
				strlist2[4]=rs.getString("n_sprice");
				strlist2[5]=rs.getString("n_img");
				alm.add(strlist2);
			}
			pstmt.close();
			conn.close();
			return alm;
		}
		
		public ArrayList<String[]> list3() throws ClassNotFoundException, SQLException{
			System.out.println("#	kr.or.ksmart.dao	#####################");
			System.out.println(" list3 리스트3.주문 정보 Odao.java");
			System.out.println("#	kr.or.ksmart.dao	#####################");
			DriverDB db = new DriverDB();
			conn = db.driverDbcon();
			System.out.println(conn + "<- conn");
			pstmt = conn.prepareStatement(
					"SELECT * FROM a_order");
			System.out.println(pstmt + "<-- pstmt");
			rs = pstmt.executeQuery();
			alm = new ArrayList<String[]>();

			while(rs.next()) {
				String[] strlist3 = new String[20];
				strlist3[0]=rs.getString("o_code");
				strlist3[1]=rs.getString("n_code");
				strlist3[2]=rs.getString("o_tprice");
				strlist3[3]=rs.getString("o_oday");
				strlist3[4]=rs.getString("o_name");
				strlist3[5]=rs.getString("o_phone");
				alm.add(strlist3);
			}
			pstmt.close();
			conn.close();
			return alm;
		}
		
		public ArrayList<String[]> list4() throws ClassNotFoundException, SQLException{
			System.out.println("#	kr.or.ksmart.dao	#####################");
			System.out.println(" list4 리스트4.판매자-상품정보  Odao.java");
			System.out.println("#	kr.or.ksmart.dao	#####################");
			DriverDB db = new DriverDB();
			conn = db.driverDbcon();
			System.out.println(conn + "<- conn");
			pstmt = conn.prepareStatement(
					"SELECT * FROM a_human INNER JOIN a_notebook ON a_human.h_id = a_notebook.h_id");
			System.out.println(pstmt + "<-- pstmt");
			rs = pstmt.executeQuery();
			alm = new ArrayList<String[]>();

			while(rs.next()) {
				String[] strlist4 = new String[20];
				strlist4[0]=rs.getString("h_id");
				strlist4[1]=rs.getString("h_name");
				strlist4[2]=rs.getString("h_phone");
				strlist4[3]=rs.getString("n_code");
				strlist4[4]=rs.getString("n_name");
				strlist4[5]=rs.getString("n_price");
				strlist4[6]=rs.getString("n_count");
				strlist4[7]=rs.getString("n_img");
				alm.add(strlist4);
			}
			pstmt.close();
			conn.close();
			return alm;
		}
		
		public ArrayList<String[]> list5() throws ClassNotFoundException, SQLException{
			System.out.println("#	kr.or.ksmart.dao	#####################");
			System.out.println(" list5 리스트5.구매자-주문정보  Odao.java");
			System.out.println("#	kr.or.ksmart.dao	#####################");
			DriverDB db = new DriverDB();
			conn = db.driverDbcon();
			System.out.println(conn + "<- conn");
			pstmt = conn.prepareStatement(
					"SELECT * FROM a_human INNER JOIN a_order ON a_human.h_id = a_order.h_id");
			System.out.println(pstmt + "<-- pstmt");
			rs = pstmt.executeQuery();
			alm = new ArrayList<String[]>();

			while(rs.next()) {
				String[] strlist5 = new String[20];
				strlist5[0]=rs.getString("h_id");
				strlist5[1]=rs.getString("h_name");
				strlist5[2]=rs.getString("h_phone");
				strlist5[3]=rs.getString("o_code");
				strlist5[4]=rs.getString("o_tprice");
				strlist5[5]=rs.getString("o_oday");
				strlist5[6]=rs.getString("o_name");
				strlist5[7]=rs.getString("o_phone");
				alm.add(strlist5);
			}
			pstmt.close();
			conn.close();
			return alm;
		}
		
		public ArrayList<String[]> list6() throws ClassNotFoundException, SQLException{
			System.out.println("#	kr.or.ksmart.dao	#####################");
			System.out.println(" list6 리스트6. 회원-상품-주문 조회  Odao.java");
			System.out.println("#	kr.or.ksmart.dao	#####################");
			DriverDB db = new DriverDB();
			conn = db.driverDbcon();
			System.out.println(conn + "<- conn");
			pstmt = conn.prepareStatement(
					"SELECT * FROM a_order left JOIN a_human ON a_order.h_id = a_human.h_id left JOIN a_notebook ON a_order.n_code = a_notebook.n_code");
			System.out.println(pstmt + "<-- pstmt");
			rs = pstmt.executeQuery();
			alm = new ArrayList<String[]>();

			while(rs.next()) {
				String[] strlist6 = new String[20];
				strlist6[0]=rs.getString("o_code");
				strlist6[1]=rs.getString("h_id");
				strlist6[2]=rs.getString("h_phone");
				strlist6[3]=rs.getString("n_code");
				strlist6[4]=rs.getString("n_name");
				strlist6[5]=rs.getString("o_price");
				strlist6[6]=rs.getString("o_count");
				strlist6[7]=rs.getString("o_tprice");
				strlist6[8]=rs.getString("o_name");
				strlist6[9]=rs.getString("o_phone");
				strlist6[10]=rs.getString("o_ask");
				alm.add(strlist6);
			}
			pstmt.close();
			conn.close();
			return alm;
		}
}
