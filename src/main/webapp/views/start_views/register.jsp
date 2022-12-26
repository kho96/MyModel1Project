<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 화면</title>
<%@ include file="../../include/boot_cdn.jspf" %>
<script>

</script>
</head>
<body>
		<div class="container-fluid">
	<div class="row" style="background-color: gray; padding: 50px">
		<div class="col-md-12">
			<h3 class="text-center">
				회원가입 화면 입니다.
			</h3>
		</div>
	</div>
	<div class="row" style="padding-top: 30px">
		<div class="col-md-12">
			<div class="row">
				<div class="col-md-3">
				</div>
				<div class="col-md-6">
					<form role="form">
						<div class="form-group">
							 
							<label for="userid">
								아이디
							</label>
							<div class="row">
								<div class="col-md-9">
									<input type="text" class="form-control" id="userid" name="userid">
								</div>
								<div class="col-md-3">
									<button type="button" class="btn btn-warning ml-5">중복확인</button>
								</div>	
							</div>
						</div>
						<div class="form-group">
							 
							<label for="userpw">
								비밀번호
							</label>
							<input type="password" class="form-control" id="userpw" />
						</div>
						<div class="form-group">
							<label for="username">
								이름
							</label>
							<input type="text" class="form-control" id="username" name="username">
						</div>
						<div style="padding-top: 20px ">
						<button type="submit" class="btn btn-primary">
							가입
						</button>
						<a href="start_page.jsp" class="btn btn-success">메인화면</a>
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