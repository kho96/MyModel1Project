<%@ page import="dao.BoardDao" %>
<%@ page import="vo.BoardVo" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	BoardDao dao = BoardDao.getInstance();
	request.setCharacterEncoding("UTF-8");
	int bno = Integer.parseInt(request.getParameter("bno"));
	
	// 삭제
	dao.delete(bno);
	response.sendRedirect("myhome.jsp");
	
%>