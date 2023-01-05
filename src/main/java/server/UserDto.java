package server;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class UserDto {
	
	private final static String URL = "jdbc:mysql://project.cprxrgwyfosf.ap-northeast-2.rds.amazonaws.com:3306/project?serverTimezone=UTC";
	private final static String USERID = "admin";
	private final static String USERPW = "kh3021234";
	
	private static UserDto instance;
	private UserDto() { };
	public static UserDto getInstance() {
		if (instance == null) {
			instance = new UserDto();
		}
		return instance;
	};
	
	// 커넥션 얻기
	private Connection getConnection() {
		Connection conn;
		try {
			
			/*
			 * jdbc:mysql://project.cprxrgwyfosf.ap-northeast-2.rds.amazonaws.com:3306/ + MySQL에서 설정한 DB이름 + ?serverTimezone=UTC
			 * 
			 * java.sql.SQLException::No suitable driver
			 * https://kwaksh2319.tistory.com/507
			 * 
			 */

			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(URL, USERID, USERPW);
			System.out.println("연결 성공");
			return conn;
		} catch (Exception e) {
			System.out.println("연결 실패");
			e.printStackTrace();
		}
		return null;
	}
	
	// 커넥션 종료
	private void closeAll(Connection conn, PreparedStatement pstmt, ResultSet rs) {
		if (conn != null) try {conn.close(); } catch(Exception e) {e.printStackTrace(); }
		if (pstmt != null) try {pstmt.close(); } catch(Exception e) {e.printStackTrace(); }
		if (rs != null) try {rs.close(); } catch(Exception e) {e.printStackTrace(); }
	}
	
	// 리스트 얻기
	public List<UserVo> getList() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = getConnection();
			String sql = "select * from test";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			List<UserVo> list = new ArrayList<>();
			while (rs.next()) {
				String id = rs.getString("id");
				String name = rs.getString("name");
				int age = rs.getInt("age");
				UserVo vo = new UserVo(id, name, age);
				list.add(vo);
			}
			return list;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll(conn, pstmt, rs);
		}
		return null;
	}
}
