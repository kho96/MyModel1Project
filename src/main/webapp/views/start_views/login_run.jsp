<%@ page import="dao.UserDao" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	UserDao userDao = UserDao.getInstance(); 
	String user_id = request.getParameter("user_id");
	String user_pw = request.getParameter("user_pw");
	String board_page = request.getParameter("page");
	int bno = 0;
	if (board_page == null) board_page = "";
	if (request.getParameter("bno") != null) {
		bno = Integer.parseInt(request.getParameter("bno"));
	}
	if (user_id != null && user_pw != null) {
		boolean result = userDao.checkLogin(user_id, user_pw);
		if (!result) {
			session.setAttribute("login_result", "fail");
			response.sendRedirect("/views/start_views/login.jsp");
			return;
		} else if(result) {
			if (user_id.equals("admin") && user_pw.equals("1234")) {
				session.setAttribute("login_info", user_id);
				response.sendRedirect("/views/admin_views/admin_service.jsp");
				return;
			}
			session.setAttribute("login_result", "success");
			session.setAttribute("login_info", user_id); // 세션에 user_id만 담아놓음
			if (bno != 0) {
				response.sendRedirect("/views/user_views/study_record_detail.jsp?bno=" + bno);
				return;
			} 
			if (board_page.equals("board-write")) {
				response.sendRedirect("/views/user_views/study_record_form.jsp");
				return;
			}
			response.sendRedirect("/views/user_views/main.jsp");
		}
	}

%>