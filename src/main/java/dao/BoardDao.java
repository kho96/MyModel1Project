package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import vo.BoardVo;

public class BoardDao {
	
	private final static String URL = "jdbc:mysql://project.cprxrgwyfosf.ap-northeast-2.rds.amazonaws.com:3306/project?serverTimezone=UTC";
	private final static String USERID = "admin";
	private final static String USERPW = "kh3021234";
	
	private static BoardDao instance;
	private BoardDao() { };
	public static BoardDao getInstance() {
		if (instance == null) {
			instance = new BoardDao();
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
			return conn;
		} catch (Exception e) {
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
	public List<BoardVo> getList() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = getConnection();
			String sql = "select * from tbl_board"
					+ "	  order by bno desc";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			List<BoardVo> list = new ArrayList<>();
			while (rs.next()) {
				int bno = rs.getInt("bno");
				String title = rs.getString("title");
				String content = rs.getString("content");
				Timestamp regdate = rs.getTimestamp("regdate");
				String user_id = rs.getString("user_id");
				int like_count = rs.getInt("like_count");
				BoardVo vo = new BoardVo(bno, title, content, regdate, user_id, like_count);
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
	
	// 자세히 보기
	public BoardVo getDetail(int bno) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = getConnection();
			String sql = "select * from tbl_board"
					+ "   where bno = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bno);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				String title = rs.getString("title");
				String content = rs.getString("content");
				Timestamp regdate = rs.getTimestamp("regdate");
				String user_id = rs.getString("user_id");
				int like_count = rs.getInt("like_count");
				BoardVo boardVo = new BoardVo(bno, title, content, regdate, user_id, like_count);
				return boardVo;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll(conn, pstmt, rs);
		}
		return null;
	}
	
	// 삽입
	public boolean insert(BoardVo vo) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = getConnection();
			String sql = "insert into tbl_board(title, content, user_id)"
					+ "   values(?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getTitle());
			pstmt.setString(2, vo.getContent());
			pstmt.setString(3, vo.getUser_id());
			int count = pstmt.executeUpdate();
			if (count > 0) return true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll(conn, pstmt, null);
		}
		return false;
	}
	
	// 수정
	public boolean update(BoardVo vo) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = getConnection();
			String sql = "update tbl_board set"
					+ "		title = ?,"
					+ "		content = ?"
					+ "   where bno = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getTitle());
			pstmt.setString(2, vo.getContent());
			pstmt.setInt(3, vo.getBno());
			int count = pstmt.executeUpdate();
			if (count > 0) return true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll(conn, pstmt, null);
		}
		return false;
	}
	
	// 삭제
	public boolean delete(int bno) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = getConnection();
			String sql = "delete from tbl_board"
					+ "   where bno = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bno);
			int count = pstmt.executeUpdate();
			if (count > 0) return true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll(conn, pstmt, null);
		}
		return false;
	}
	
	// 좋아요 추가
	public boolean insert_like(BoardVo boardVo) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = getConnection();
			String sql = "insert into tbl_like(bno, user_id)"
					+ "   values(?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boardVo.getBno());
			pstmt.setString(2, boardVo.getUser_id());
			int count = pstmt.executeUpdate();
			if (count > 0) return true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll(conn, pstmt, null);
		}
		return false;
	}
	
	// 좋아요 체크
	public boolean checkLike(BoardVo boardVo) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = getConnection();
			String sql = "select * from tbl_like"
					+ "   where bno = ? and user_id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boardVo.getBno());
			pstmt.setString(2, boardVo.getUser_id());
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll(conn, pstmt, rs);
		}
		return false;
	}
	
	
	// 좋아요 업데이트
	public void update_like(BoardVo boardVo, boolean isLike) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = getConnection();
			String sql = "update tbl_board";
			if (isLike) {
				sql += "  set like_count = ?"; // true(중복) = 좋아요 감소
			} else {
				sql += "  set like_count = ?"; // false(중복x) = 좋아요 증가
			}
			sql += "	  where bno = ?";
			pstmt = conn.prepareStatement(sql);
			if (isLike) pstmt.setInt(1, boardVo.getLike_count()-1);
			else pstmt.setInt(1, boardVo.getLike_count()+1);
			pstmt.setInt(2, boardVo.getBno());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll(conn, pstmt, null);
		}
	}
	
	// 좋아요 삭제
	public boolean delete_like(BoardVo boardVo) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = getConnection();
			String sql = "delete from tbl_like"
					+ "   where bno = ?"
					+ "   and user_id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boardVo.getBno());
			pstmt.setString(2, boardVo.getUser_id());
			int count = pstmt.executeUpdate();
			if (count > 0) return true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll(conn, pstmt, null);
		}
		return false;
	}
	
	// 개인 공부내역
	public List<BoardVo> getListById(String user_id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = getConnection();
			String sql = "select * from tbl_board"
					+ "	  where user_id = ?"
					+ "	  order by bno desc";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user_id);
			rs = pstmt.executeQuery();
			List<BoardVo> list = new ArrayList<>();
			while (rs.next()) {
				int bno = rs.getInt("bno");
				String title = rs.getString("title");
				String content = rs.getString("content");
				Timestamp regdate = rs.getTimestamp("regdate");
				int like_count = rs.getInt("like_count");
				BoardVo vo = new BoardVo(bno, title, content, regdate, user_id, like_count);
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
