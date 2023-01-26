<%@ page import="dao.QADao" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	QADao dao = QADao.getInstance();
	request.setCharacterEncoding("utf-8");
	int q_no = Integer.parseInt(request.getParameter("q_no"));
	String a_answer = request.getParameter("a_answer");
	
	boolean result = dao.answer(q_no, a_answer);
	if (result) {
		session.setAttribute("/views/admin_views/answer_result", "success");
	} else {
		session.setAttribute("/views/admin_views/answer_result", "fail");
	}
	response.sendRedirect("/views/admin_views/admin_service.jsp");
%>