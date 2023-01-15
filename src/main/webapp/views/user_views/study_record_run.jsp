<%@ page import="dao.BoardDao" %>
<%@ page import="vo.BoardVo" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:useBean id="boardVo" class="vo.BoardVo" />
<jsp:setProperty property="*" name="boardVo"/>
<%
	String command = request.getParameter("command");
	System.out.println("command : " + command);
	BoardDao dao = BoardDao.getInstance();
	// 등록 처리
	if (command.equals("insert_record")) {
		System.out.println("게시글 등록");
		System.out.println("vo : " + boardVo);
		Boolean result = dao.insert(boardVo);
		if (result) response.sendRedirect("study_record.jsp");
	} 
	// 좋아요 처리
	else if(command.equals("like")) {
		System.out.println("따봉");
		
		// 리퀘스트값 얻어오기
		int bno = Integer.parseInt(request.getParameter("bno"));
		int like_count = Integer.parseInt(request.getParameter("like_count"));
		String user_id = (String)session.getAttribute("login_info");
		
		System.out.println("좋아요 누른 게시글 번호 : " + bno);
		System.out.println("좋아요 누른 사람 : " + user_id);
		
		// 새 likeVo 설정
		BoardVo like = new BoardVo();
		like.setBno(bno);
		like.setUser_id(user_id);
		like.setLike_count(like_count);
		System.out.println("좋아요 변경전 : " + like);
		
		int result = dao.update_like(like);
		System.out.println("업데이트 결과 : " + result);
		// true : 증가 / false : 감소
		if (result == 1) {
			dao.insert_like(like);
		} else if (result == 2) {
			dao.delete_like(like);
		}
		System.out.println("변경후 : " + dao.getDetail(bno));
	}
%>