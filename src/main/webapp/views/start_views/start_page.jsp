<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인 화면</title>
<%@ include file="../../include/boot_cdn.jspf" %>
<link href="../../include/boot_cdn.jspf" rel="stylesheet" type="text/css"> 
</head>
<body>
	<div class="container-fluid">
	<!-- header -->
	<div class="row"  style="background-color: gray; padding: 80px">
		<div class="col-md-12">
			<h3 class="text-center">
				메인 입니다.
			</h3>
		</div>
	</div><!-- header end -->
	
	<!-- body -->
	<div class="row" style="padding-top: 50px">
		<div class="col-md-12">
			<div class="row">
				<div class="col-md-4" style="text-align: center">
					<a href="../user_views/main.jsp" class="btn btn-primary">둘러보기</a>
				</div>
				<div class="col-md-4" style="text-align: center">
					<a href="login.jsp" class="btn btn-primary">로그인</a>
				</div>
				<div class="col-md-4" style="text-align: center">
					<a href="register.jsp" class="btn btn-primary">회원가입</a>
				</div>
			</div>
		</div>
	</div>  <!-- body end -->
	
	<%@ include file="../../include/footer.jspf" %>
</div>
</body>
</html>