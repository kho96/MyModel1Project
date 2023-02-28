<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>회원가입 화면</title>
<%@ include file="/include/boot_cdn.jspf" %>
<script>
$(function() {
	var ableId = ""; // 사용 가능 id
	// 세션값 체크
	var checkId = "${sessionScope.checkId}";
	
	if (checkId == "able") {
		alert("사용 가능한 아이디입니다.");
		$("#user_id").val("${sessionScope.user_id}");
		ableId = "${sessionScope.user_id}";
		$("#user_pw").removeAttr("readonly");
		$("#user_name").removeAttr("readonly");
	} else if (checkId == "unable") {
		alert("사용 불가한 아이디입니다.");
		<%session.removeAttribute("checkId");%>
	} 
	
	// 중복체크
	$("#btn_idCheck").click(function(e) {
		e.preventDefault();
		var user_id = $("#user_id").val();
		console.log(user_id);
		if (user_id != null && (user_id).trim() != "") {
			location.href = "id_check.jsp?user_id=" + user_id;
		}
	});
	
	// form 전송
	$("form").submit(function() {
		if (checkId == "") {
			alert("id 중복 확인을 해주세요.");
			return false;
		} else if (checkId == "able") {
			if (ableId != $("#user_id").val()) {
				alert("중복 확인을 해주세요.");
				return false;
			}
	}
	});
	
	// 가입 실패 
	var regist_result = "${sessionScope.regist_result}";
	if (regist_result == "fail") {
		alert("가입실패");
		<%session.removeAttribute("regist_result"); %>
	}
});
</script>
</head>
<body>
	<%@ include file="/include/header.jspf" %>
	
	<div class="row" style="background-color: gray; padding: 50px">
		<div class="col-md-12">
			<h3 class="text-center">
				회원가입 화면
			</h3>
		</div>
	</div>
	
	<div class="row" style="padding: 30px">
		<div class="col-md-12">
			<div class="row">
				<div class="col-md-3">
				</div>
				<div class="col-md-6">
					<form role="form" action="/views/start_views/regist_run.jsp" method="post">
						<div class="form-group">
							<label for="user_id">아이디</label>
							<div class="input-container">
							    <input type="text" class="form-control" id="user_id" name="user_id" required />
							    <button id="btn_idCheck" type="button" class="btn btn-warning">중복확인</button>
							</div>
						</div>
						<div class="form-group">
							 
							<label for="user_pw">
								비밀번호
							</label>
							<input type="password" class="form-control" id="user_pw" name="user_pw" required readonly/>
						</div>
						<div class="form-group">
							<label for="user_name">
								이름
							</label>
							<input type="text" class="form-control" id="user_name" name="user_name" required readonly>
						</div>
						<div style="padding-top: 20px ">
						<button type="submit" class="btn btn-primary">
							가입
						</button>
						<a href="/start_page.jsp" class="btn btn-success">뒤로가기</a>
						</div>
					</form>
				</div>
				<div class="col-md-3">
				</div>
			</div>
		</div>
	</div>
	
	<%@ include file="/include/footer.jspf" %>

</body>
</html>