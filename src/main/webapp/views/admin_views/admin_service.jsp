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
<title>관리자 페이지</title>
<%@ include file="/include/boot_cdn.jspf" %>


<script>
$(function() {
	var answer_result = "${sessionScope.answer_result}"; /* 문의작성 결과 */
	var isAnswer = "false"; /* 답변여부 */
	
	/* 문의하기 작성결과에 따라 알람창 */
	if(answer_result == "success") {
		alert("답변 성공");
	} else if (answer_result == "fail") {
		alert("답변 실패");
	}
	<%session.removeAttribute("answer_result");%>
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
	$(".btnAnswer").click(function() {
		var q_no = $(this).val();
		location.href = "/views/admin_views/a_write.jsp?q_no=" + q_no;
	});
	
	
});
</script>
</head>
<body>
<%@ include file="/include/header.jspf" %>
<div class="container-fluid">
	
	<div class="row" style="margin-top: 15px">
		<div class="col-md-3"></div>
		<div class="col-md-6">
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
									<td><button class="btnAnswer" type="button" value="${vo.q_no}">답변하기</button></td>
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
</div>
	<%@ include file="/include/footer.jspf" %>
</body>
</html>