package kr.or.ksmart.driverdb;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DriverDB {
	public Connection driverDbcon() throws ClassNotFoundException, SQLException{
		System.out.println("----------------------------------");
		System.out.println("	db¿¬°á ");
		System.out.println("----------------------------------");
		Class.forName("com.mysql.jdbc.Driver");
		String jdbcDriver = "jdbc:mysql://localhost:3306/dev33db?useUnicode=true&characterEncoding=euckr";
		String dbUser = "dev33id";
		String dbPass = "dev33pw";
		
		Connection reconn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
		System.out.println(reconn + "<-- reconn");
		return reconn;
	}
}