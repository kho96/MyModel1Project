<%@ page import="dao.UserDao" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	UserDao userDao = UserDao.getInstance();
	String user_id = request.getParameter("user_id");
	boolean result = userDao.checkId(user_id);
	
	if (result) {
		session.setAttribute("user_id", user_id);
		session.setAttribute("checkId", "able");
	} else {
		session.setAttribute("checkId", "unable");
	}
	response.sendRedirect("/views/start_views/register.jsp");
%>