<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인 화면</title>
<%@ include file="../../include/boot_cdn.jspf" %>
<link href="../../include/boot_cdn.jspf" rel="stylesheet" type="text/css"> 
<link href="../../include/test.css" rel="stylesheet" type="text/css"> 
</head>
<body>
	<!-- header, figure 테스트  -->
	<header>
		<div class="inner">
			<h1><a href="#">OUR.STUDY</a></h1>
			
			<ul id="gnb">
				<li><a href="#">목록 1</a></li>
				<li><a href="#">목록 2</a></li>
				<li><a href="#">목록 3</a></li>
				<li><a href="#">목록 4</a></li>
				<li><a href="#">목록 5</a></li>
			</ul>
			
			<ul class="util">
				<li><a href="#">항목 1</a></li>
				<li><a href="#">항목 2</a></li>
				<li><a href="#">항목 3</a></li>
				<li><a href="#">항목 4</a></li>
				<li><a href="#">항목 5</a></li>
			</ul>
		</div>
	</header>
	<figure>
		<video src="../../video/Pexels Videos 1448735.mp4" autoplay muted loop></video>
		<div class=inner>
			<h1>OUR.STUDY.STORY</h1>
			<p>당신의 자기개발을 저희가 함께하겠습니다. 당신의 기록을 이곳에 남기세요! <br>
			어떤 곳인지 잘 모르시겠다고요? 그럼 저희 홈페이지를 둘러보세요!!</p>
			<a href="#">둘러보기</a>
		</div>
	</figure>
	
	
	<div class="container-fluid">
	<!-- header -->
	<!-- <div class="row"  style="background-color: gray; padding: 80px">
		<div class="col-md-12">
			<h3 class="text-center">
				메인 입니다.
			</h3>
		</div>
	</div> --><!-- header end -->
	
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