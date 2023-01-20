<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인 화면</title>
<%@ include file="../../include/boot_cdn.jspf" %>
<link href="../../include/boot_cdn.jspf" rel="stylesheet" type="text/css"> 
<link href="../../include/test.css?ver=2" rel="stylesheet" type="text/css"> 
</head>
<body>
	<!-- header, figure 테스트  -->
	<header>
		<div class="inner">
			<h1><a href="#">OUR.STUDY.STORY</a></h1>
			
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
			<a href="../user_views/main.jsp">둘러보기</a>
		</div>
	</figure>
	
	
	
	<!-- section -->
	<section>
		<div class="inner">
			<h1>OUR.STORY</h1>
			<div class="wrap">
				<article>
					<div class="pic">
						<img src="../../images/card1.jpg" alt="1번쨰 콘텐츠 이미지">
					</div>
					<h2><a href="#">매일 공부한 내용을 정리합니다.</a></h2>
					<p>자신이 배운 공부내용을 정리하여, 계속해서 기록하고, 성장합니다.</p>
				</article>
				<article>
					<div class="pic">
						<img src="../../images/card1.jpg" alt="2번쨰 콘텐츠 이미지">
					</div>
					<h2><a href="#">매일 공부한 내용을 정리합니다.</a></h2>
					<p>자신이 배운 공부내용을 정리하여, 계속해서 기록하고, 성장합니다.</p>
				</article>
				<article>
					<div class="pic">
						<img src="../../images/card1.jpg" alt="3번쨰 콘텐츠 이미지">
					</div>
					<h2><a href="#">매일 공부한 내용을 정리합니다.</a></h2>
					<p>자신이 배운 공부내용을 정리하여, 계속해서 기록하고, 성장합니다.</p>
				</article>
				<article>
					<div class="pic">
						<img src="../../images/card1.jpg" alt="4번쨰 콘텐츠 이미지">
					</div>
					<h2><a href="#">매일 공부한 내용을 정리합니다.</a></h2>
					<p>자신이 배운 공부내용을 정리하여, 계속해서 기록하고, 성장합니다.</p>
				</article>
			</div>
		</div>
	</section>  
	<!-- section end -->
	
	<%@ include file="../../include/footer.jspf" %>
</body>
</html>