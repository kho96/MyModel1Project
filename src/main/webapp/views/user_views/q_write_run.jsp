<%@ page import="dao.QADao" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	QADao dao = QADao.getInstance();
	int q_no = dao.getQ_no();
	request.setCharacterEncoding("utf-8");
	String q_title = request.getParameter("q_title");
	String q_content = request.getParameter("q_content");
	String user_id = "hong"; // user_id : hong 테스트
	boolean result = dao.insertQ(q_no, user_id, q_title, q_content);
	if (result) {
		session.setAttribute("q_write_result", "success");
	} else {
		session.setAttribute("q_write_result", "fail");
	}
	response.sendRedirect("user_service.jsp");
%>