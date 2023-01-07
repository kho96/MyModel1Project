<%@ page import="dao.UserDao" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% UserDao userDao = UserDao.getInstance(); %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 화면</title>
<%@ include file="../../include/boot_cdn.jspf" %>
<script>
$(function() {
	var login_result = "${sessionScope.login_result}";
	if (login_result == "fail") {
		alert("로그인 실패");
		<%session.removeAttribute("login_result");%>
	}
});
</script>
</head>
<body>
	<div class="container-fluid">
	<div class="row" style="background-color: gray; padding: 50px">
		<div class="col-md-12">
			<h3 class="text-center">
				로그인 화면 입니다.
			</h3>
		</div>
	</div>
	<div class="row" style="padding-top: 30px">
		<div class="col-md-12">
			<div class="row">
				<div class="col-md-3">
				</div>
				<div class="col-md-6">
					<form role="form" id="form_login" action="/mymodel1/views/user_views/main.jsp" method="post">
						<div class="form-group">
							 
							<label for="user_id">
								아이디
							</label>
							<input type="text" class="form-control" id="user_id" name="user_id"/>
						</div>
						<div class="form-group">
							 
							<label for="user_pw">
								비밀번호
							</label>
							<input type="password" class="form-control" id="user_pw" name="user_pw"/>
						</div>
						<div style="padding-top: 20px ">
						<button type="submit" class="btn btn-primary">
							로그인
						</button>
						<a href="register.jsp" class="btn btn-success">회원가입</a>
						</div>
						<div style="padding-top: 35px ">
							<a href="#">아이디를 잊으셨나요?</a><br>
							<a href="#">비밀번호를 잊으셨나요?</a>
						</div>
					</form>
				</div>
				<div class="col-md-3">
				</div>
			</div>
		</div>
	</div>
	
	<%@ include file="../../include/footer.jspf" %>
</div>
</body>
</html>