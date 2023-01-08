<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객센터</title>
<%@ include file="../../include/boot_cdn.jspf" %>
<script>
$(function() {
	var isAnswer = "false";
	$(".tr_QA").click(function() {
		if(isAnswer == "false") {
			var isDetail = $(this).attr("data-detail");
			if(isDetail == "false") {
				var newTr = "<tr>";
				newTr += 		"<td>";
				newTr += 			"작성자";
				newTr += 		"</td>";
				newTr += 		"<td colspan='3'>";
				newTr +=			"질문 제목";
				newTr += 		"</td>";
				newTr += "	</tr>";
				newTr += "	<tr>";
				newTr += 		"<td colspan='4'>";
				newTr += 			"<textarea rows='5' cols='30'>질문 내용</textarea>";
				newTr += 		"</td>";
				newTr += "	</tr>";
				$(this).after(newTr);
				$(this).attr("data-detail", "true");
			} else if ( $(this).attr("data-detail") == "true") {
				$(this).next().remove(); // 작성자 제목 지우기
				$(this).next().remove(); // 질문 내용 지우기
				$(this).attr("data-detail", "false");
			}
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
				${list}
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
			<div style="text-align: right;">
				<button type="button" class="btn-sm btn-black">작성</button>
			</div>
			<table class="table table-sm table-hover pl-3" style="width: 100%; margin-top: 10px; border: solid">
				<thead>
					<tr>
						<th>#</th>
						<th>제목</th>
						<th>작성일</th>
						<th>답변</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="i" begin="1" end="5">
						<tr class="tr_QA" data-detail="false">
							<td>${i}</td>
							<td>제목${i}</td>
							<td>시간${i}</td>
							<c:choose>
								<c:when test="${i eq 4}">
									<td>[완료]</td>
								</c:when>
								<c:otherwise>
									<td>[대기중]</td>
								</c:otherwise>
							</c:choose>
							
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