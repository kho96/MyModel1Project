<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의하기</title>
<%@ include file="../../include/boot_cdn.jspf" %>
<script>
$(function() {
	/* 돌아가기 버튼 -> 진짜 돌아갈건지 확인창 띄우기 */
	$("#btnBack").click(function() {
		var result = confirm("작성을 취소하고 이전 화면으로 이동하시겠습니까?");
		if (result) {
			location.href = "user_service.jsp";
		}
	});
	/* form 전송전 안내 */
	$("form").submit(function() {
		alert("답변은 시스템 사정 상 최대 5일까지 소요될 수 있습니다. \n양해 부탁드립니다.");
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
			<form action="q_write_run.jsp" method="post">
				<label for="q_title">제목</label><br>
				<input id="q_title" name="q_title" type="text" placeholder="제목을 작성하세요." required><br>
				
				<label for="q_content" style="margin-top: 10px">내용</label><br>
				<textarea id="q_content" name="q_content" rows="10" cols="100%" placeholder="내용을 입력하세요." required></textarea><br>
				<div style="margin-top: 15px">
					<button id="btnBack" type="button" style="margin-right: 10px">돌아가기</button>
					<button type="submit">작성완료</button>
				</div>
			</form>
		</div>
		<div class="col-md-3"></div>
	</div>
	<%@ include file="../../include/footer.jspf" %>
</div>
</body>
</html>