<%@ page import="dao.BoardDao" %>
<%@ page import="vo.BoardVo" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:useBean id="boardVo" class="vo.BoardVo" />
<jsp:setProperty property="*" name="boardVo"/>
<%
	String command = request.getParameter("command");
	BoardDao dao = BoardDao.getInstance();
	request.setCharacterEncoding("UTF-8");
	// 등록 처리
	if (command.equals("insert_record")) {
		System.out.println("게시글 등록");
		System.out.println("vo : " + boardVo);
		Boolean result = dao.insert(boardVo);
		if (result) response.sendRedirect("study_record.jsp");
	} 
	// 좋아요 처리
	else if(command.equals("like")) {
		// 리퀘스트값 얻어오기
		int bno = Integer.parseInt(request.getParameter("bno"));
		int like_count = Integer.parseInt(request.getParameter("like_count"));
		String user_id = (String)session.getAttribute("login_info");
		
		// 새 likeVo 설정
		BoardVo like = new BoardVo();
		like.setBno(bno);
		like.setUser_id(user_id);
		like.setLike_count(like_count);
		int result = dao.update_like(like);
		// 1 : 증가 / 2 : 감소
		if (result == 1) {
			dao.insert_like(like);
		} else if (result == 2) {
			dao.delete_like(like);
		}
		System.out.println("변경후 : " + dao.getDetail(bno));
	}
	// 게시글 수정
	else if(command.equals("update")) {
		System.out.println("업데이트");
		int bno = Integer.parseInt(request.getParameter("bno"));
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		BoardVo newVo = new BoardVo();
		newVo.setBno(bno);
		newVo.setTitle(title);
		newVo.setContent(content);
		System.out.println("newVo = " + newVo);
		dao.update(newVo);
		response.sendRedirect("study_record_detail.jsp?bno=" + bno);
	}
	// 게시글 삭제
	else if(command.equals("delete")) {
		System.out.println("삭제");
		int bno = Integer.parseInt(request.getParameter("bno"));
		dao.delete(bno);
		response.sendRedirect("study_record.jsp");
	}
%>