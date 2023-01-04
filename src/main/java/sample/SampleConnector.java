package sample;

import java.sql.Connection;
import java.sql.DriverManager;

public class SampleConnector {
	
	private final static String URL = "jdbc:mysql://project.cprxrgwyfosf.ap-northeast-2.rds.amazonaws.com:3306/project?serverTimezone=UTC";
	private final static String USERID = "admin";
	private final static String USERPW = "kh3021234";
	
	public static void main(String[] args) {
		
		Connection conn;
		
		try {
			// jdbc:mysql://project.cprxrgwyfosf.ap-northeast-2.rds.amazonaws.com:3306/ + MySQL에서 설정한 DB이름 + ?serverTimezone=UTC
			conn = DriverManager.getConnection(URL, USERID, USERPW);
			System.out.println("연결 성공");
			conn.close();
		} catch (Exception e) {
			System.out.println("연결 실패");
			e.printStackTrace();
		}
		
	}
}
