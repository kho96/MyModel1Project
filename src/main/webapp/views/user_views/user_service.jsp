<%@page import="java.util.ArrayList"%>
<%@ page import="dao.QADao" %>
<%@ page import="vo.QAVo" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	QADao dao = QADao.getInstance();
	ArrayList<QAVo> list = (ArrayList) dao.getList();
	request.setAttribute("list", list);
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객센터</title>
<%@ include file="../../include/boot_cdn.jspf" %>
<script>
$(function() {
	var q_write_result = "${sessionScope.q_write_result}"; /* 문의작성 결과 */
	var isAnswer = "false"; /* 답변여부 */
	
	/* 문의하기 작성결과에 따라 알람창 */
	if(q_write_result == "success") {
		alert("작성 성공");
	} else if (q_write_result == "fail") {
		alert("작성 실패");
	}
	<%session.removeAttribute("q_write_result");%>
	/* <tr> 클릭, 질문 제목 클릭시  */
	$(".tr_QA").click(function() {
		console.log("..");
		var isDetail = $(this).attr("data-detail");
		if(isDetail == "false") {
			$(".tr_QA").css("background-color", "#fff");
			$(this).css("background-color", "#777");
			$(".tr_QA_detail").slideUp();
			$(".tr_QA").attr("data-detail", "false");
			$(this).next().slideDown();
			$(this).attr("data-detail", "true");
		} else if(isDetail == "true") {
			$(this).next().slideUp();
			$(this).css("background-color", "#fff");
			$(this).attr("data-detail", "false");
		}
		
	});
	
	/* 작성 버튼  */
	$("#btnWrite").click(function() {
		location.href = "q_write.jsp";
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
							 <a class="nav-link" href="user_service.jsp">고객센터 <span class="sr-only">(current)</span></a>
						</li>						
						<li class="nav-item">
							 <a class="nav-link" href="myhome.jsp">MyHome <span class="sr-only">(current)</span></a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="main.jsp">로그아웃</a>
						</li>
					</ul>
				</div>
			</nav>
		</div>
	</div>
	<div class="row" style="margin-top: 15px">
		<div class="col-md-3"></div>
		<div class="col-md-6">
			<div>
				<button id="btnWrite" type="button" class="btn-sm btn-black">작성</button>
			</div>
			<table class="table table-sm table-hover pl-3" style="width: 100%; margin-top: 10px; border: solid">
				<thead>
					<tr>
						<th>제목</th>
						<th>작성일</th>
						<th>답변</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list}" var="vo">
						<tr class="tr_QA" data-detail="false">
								<c:if test="${fn:length(vo.q_title) > 20}">
									<td>${fn:substring(vo.q_title,0,20)} ....</td>
								</c:if>
								<c:if test="${fn:length(vo.q_title) <= 20}">
									<td>${vo.q_title}</td>
								</c:if>
							<td>${vo.q_date}</td>
							<c:choose>
								<c:when test="${not empty vo.a_answer}">
									<td>[완료]</td>
								</c:when>
								<c:otherwise>
									<td>[대기중]</td>
								</c:otherwise>
							</c:choose>
						</tr>
						<tr class="tr_QA_detail" style="display: none">
							<td colspan="3" style="background-color: #ccc">[문의사항]<br>${vo.q_content}
							<c:choose>
								<c:when test="${not empty vo.a_answer}">
									<hr>
									[답변] ${vo.a_date}<br>
									${vo.a_answer }
								</c:when>
							</c:choose>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div class="col-md-3"></div>
	</div>
	<%@ include file="../../include/footer.jspf" %>
</div>
</body>
</html>