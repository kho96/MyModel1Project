<%@ page import="dao.UserDao" %>
<%@ page import="vo.UserVo" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:useBean id="userVo" class="vo.UserVo" />
<jsp:setProperty property="*" name="userVo"/>
<%
	UserDao userDao = UserDao.getInstance();
	boolean result = userDao.register(userVo);
	if (result) {
		response.sendRedirect("login.jsp");
		session.setAttribute("regist_result", "success");
	} else {
		response.sendRedirect("register.jsp");
		session.setAttribute("regist_result", "fail");
	}
%>