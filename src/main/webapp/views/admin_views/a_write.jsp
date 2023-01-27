<%@ page import="dao.QADao" %>
<%@ page import="vo.QAVo" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int q_no = Integer.parseInt(request.getParameter("q_no"));
	QADao dao = QADao.getInstance();
	QAVo vo = dao.getQ(q_no);
	request.setAttribute("vo", vo);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지 QA답변</title>
<%@ include file="/include/boot_cdn.jspf" %>
<script>
$(function() {
	/* 돌아가기 버튼 -> 진짜 돌아갈건지 확인창 띄우기 */
	$("#btnBack").click(function() {
		var result = confirm("작성을 취소하고 이전 화면으로 이동하시겠습니까?");
		if (result) {
			location.href = "/views/admin_views/admin_service.jsp";
		}
	});
	
});
</script>
</head>
<body>
<div class="container-fluid">
	<div class="row" style="padding: 50px">
		<div class="col-md-12">
			<h3 class="text-center">
				우리들의 공부 이야기
			</h3>
		</div>
	</div>
	<div class="row">
		<div class="col-md-12">
			<nav class="navbar navbar-expand-lg navbar-light bg-light navbar-dark bg-dark static-top">
				<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
					<ul class="navbar-nav ml-md-auto">
						<li class="nav-item active">
							 <a class="nav-link" href="/views/user_views/user_service.jsp">고객센터 <span class="sr-only">(current)</span></a>
						</li>						
						<li class="nav-item">
							 <a class="nav-link" href="/views/user_views/myhome.jsp">MyHome <span class="sr-only">(current)</span></a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="/views/user_views/main.jsp">로그아웃</a>
						</li>
					</ul>
				</div>
			</nav>
		</div>
	</div>
	<div class="row" style="margin-top: 15px">
		<div class="col-md-3"></div>
		<div class="col-md-6">
			<p>작성자 : ${vo.user_id}</p>
			<p>제목 : ${vo.q_title}</p>
			
			내용<br>
			<textarea rows="10" cols="100%" readonly>${vo.q_content}</textarea><br>
			<hr>
			<form action="a_write_run.jsp" method="post">
				<input type="hidden" name="q_no" value="${vo.q_no}">
				답변<br>
				<textarea rows="10" cols="100%" name="a_answer"></textarea><br>
				<div style="margin-top: 15px">
					<button id="btnBack" type="button" style="margin-right: 10px">돌아가기</button>
					<button type="submit">답변완료</button>
				</div>
			</form>
		</div>
		<div class="col-md-3"></div>
	</div>
</div>
	<%@ include file="/include/footer.jspf" %>
</body>
</html>