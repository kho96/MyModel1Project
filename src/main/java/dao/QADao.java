package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import vo.QAVo;

public class QADao {
	private static QADao instance;
	private final static String URL = "jdbc:mysql://project.cprxrgwyfosf.ap-northeast-2.rds.amazonaws.com:3306/project?serverTimezone=UTC";
	private final static String USERID = "admin";
	private final static String USERPW = "kh3021234";
	
	public QADao() {  }
	
	public static QADao getInstance() {
		if(instance == null) {
			instance = new QADao();
		}
		return instance;
	}
	
	// 커넥션 얻기
	private Connection getConnection() {
		Connection conn;
		try {
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
	public List<QAVo> getList() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = getConnection();
			String sql = "select * from tbl_qa"
					+ "	  order by q_no desc";
			pstmt = conn.prepareStatement(sql);
			rs= pstmt.executeQuery();
			List<QAVo> list = new ArrayList<>();
			while(rs.next()) {
				int q_no = rs.getInt("q_no");
				String user_id = rs.getString("user_id");  
				String q_title = rs.getString("q_title");  
				String q_content = rs.getString("q_content");
				Date q_date = rs.getDate("q_date");     
				String a_answer = rs.getString("a_answer"); 
				Date a_date = rs.getDate("a_date");  
				QAVo vo = new QAVo(q_no, user_id, q_title, q_content, q_date, a_answer, a_date);
				list.add(vo);
			}
			return list;
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			closeAll(conn, pstmt, rs);
		}
			
		return null;
	}
	
	// 글번호 얻기
	public int getQ_no() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = getConnection();
			String sql = "select count(*) cnt from tbl_qa";
			pstmt = conn.prepareStatement(sql);
			rs= pstmt.executeQuery();
			if(rs.next()) {
				int q_no = rs.getInt("cnt");
				return q_no + 1 ;
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			closeAll(conn, pstmt, rs);
		}
		return 0;
	}
	
	// 문의사항 작성
	public boolean insertQ(int q_no, String user_id, String q_title, String q_content) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = getConnection();
			String sql = "insert into tbl_qa(q_no, user_id, q_title, q_content, q_date)"
					+ "	  values(?, ?, ?, ?, default)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, q_no);
			pstmt.setString(2, user_id);
			pstmt.setString(3, q_title);
			pstmt.setString(4, q_content);
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
