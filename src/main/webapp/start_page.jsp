<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>메인 화면</title>
<%@ include file="/include/boot_cdn.jspf" %>
</head>
<body>
	<%@ include file="/include/header.jspf" %>
	
	<div class="wrapper"><!-- wrapper  -->
	<figure class="desktop">
		<video src="/video/Pexels Videos 1448735.mp4" autoplay muted loop></video>
		<div class=inner>
			<h1>OUR.STUDY.STORY</h1>
			<p>당신의 자기개발을 저희가 함께하겠습니다. 당신의 기록을 이곳에 남기세요! <br>
			어떤 곳인지 잘 모르시겠다고요? 그럼 저희 홈페이지를 둘러보세요!!<br>
			</p>
			<a href="/views/user_views/main.jsp">둘러보기</a>
		</div>
	</figure>
	
	<!-- mobile -->
	<figure class="mobile">
		<video src="/video/Pexels Videos 1448735.mp4" autoplay muted loop></video>
		<div class=inner>
			<h1>OUR.STUDY.STORY</h1>
			<p>당신의 자기개발을 저희가 함께하겠습니다.<br>당신의 기록을 이곳에 남기세요! <br></p>
			<p>
			어떤 곳인지 잘 모르시겠다고요?<br> 그럼 저희 홈페이지를 둘러보세요!!<br>
			</p>
			<a href="/views/user_views/main.jsp">둘러보기</a>
		</div>
	</figure>
	
	<!-- section -->
	<section>
		<div class="inner desktop">
			<h1>How To Use..</h1>
			<div class="wrap">
				<article>
					<div class="pic">
						<img src="/images/card1.jpg" alt="1번쨰 콘텐츠 이미지">
					</div>
					<h2><a href="#">오늘의 배움을 기록하세요.</a></h2>
					<p>자신이 공부한 내용을 정리하고<br>기록하며 성장합니다.</p>
				</article>
				<article>
					<div class="pic">
						<img src="/images/card2.jpg" alt="2번쨰 콘텐츠 이미지">
					</div>
					<h2><a href="#">함께 성장해요.</a></h2>
					<p>다른 사람의 공부내용을 보면서<br>같이 배우고, 성장하며 응원해주세요.</p>
				</article>
				<article>
					<div class="pic">
						<img src="/images/card3.jpg" alt="3번쨰 콘텐츠 이미지">
					</div>
					<h2><a href="#">자신을 돌아봅니다.</a></h2>
					<p>기록된 학습일기를 통해 꾸준히<br>성장하는 자신을 돌아보세요.</p>
				</article>
				<article style="background-color: gray; opacity: 0.5">
					<div class="pic">
						<img src="/images/card4.jpg" alt="4번쨰 콘텐츠 이미지">
					</div>
					<h2><a id="none_a" href="#">모임을 만들어요.(준비중..)</a></h2>
					<p>공통된 학습모델을 가지고 사람들과<br>온/오프라인으로 같이 학습합니다.</p>
				</article>
			</div>
			<div class="inner mobile">
				
			</div>
		</div>
	</section>  
	<!-- section end -->
	</div> <!-- wrapper -->
	
	<%@ include file="/include/footer.jspf" %>
</body>
</html>