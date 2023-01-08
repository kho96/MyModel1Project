package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import vo.UserVo;

public class UserDao {
	private static UserDao instance;
	private final static String URL = "jdbc:mysql://project.cprxrgwyfosf.ap-northeast-2.rds.amazonaws.com:3306/project?serverTimezone=UTC";
	private final static String USERID = "admin";
	private final static String USERPW = "kh3021234";
	
	public UserDao() {  }
	
	public static UserDao getInstance() {
		if(instance == null) {
			instance = new UserDao();
		}
		return instance;
	}
	
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
	
	// 로그인 확인
	public boolean checkLogin(String user_id, String user_pw) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = getConnection();
			String sql = "select count(*) cnt from tbl_user"
					+ "	  where user_id = ? and user_pw = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user_id);
			pstmt.setString(2, user_pw);
			rs= pstmt.executeQuery();
			if(rs.next()) {
				int count = rs.getInt("cnt");
				if (count > 0) {
					return true;
				}
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			closeAll(conn, pstmt, rs);
		}
			
		return false;
	}
	
	// 아이디 중복 확인
	public boolean checkId(String user_id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = getConnection();
			String sql = "select count(*) cnt from tbl_user"
					+ "	  where user_id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user_id);
			rs= pstmt.executeQuery();
			if(rs.next()) {
				int count = rs.getInt("cnt");
				if (count == 0) {
					return true;
				} 
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			closeAll(conn, pstmt, rs);
		}
		return false;
	}
	
	// 회원 가입
	public boolean register(UserVo userVo) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = getConnection();
			String sql = "insert into tbl_user set"
					+ "			user_id = ? , user_pw = ?, user_name = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userVo.getUser_id());
			pstmt.setString(2, userVo.getUser_pw());
			pstmt.setString(3, userVo.getUser_name());
			int count = pstmt.executeUpdate();
			if (count > 0) {
				return true;
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			closeAll(conn, pstmt, null);
		}
		
		return false;
	}
	
}
