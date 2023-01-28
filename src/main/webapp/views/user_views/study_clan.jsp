<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스터디 모집</title>
<%@ include file="/include/boot_cdn.jspf" %>
<script>
$(function() {
	
	// 테이블의 글을 선택했을 경우
	$(".clan_tr").click(function() {
		var bno = $(this).attr("data-clan_no"); // 클랜 번호 얻기
		location.href="/views/user_views/study_clan_detail.jsp";
	});	
	
});
</script>
</head>
<body>
<%@ include file="/include/header.jspf" %>
<div class="container-fluid">
	<!-- <div class="row" style="padding: 50px">
		<div class="col-md-12">
			<h3 class="text-center">
				스터디 클랜
			</h3>
		</div>
	</div>
	<div class="row">
		<div class="col-md-1">
			 
			<a href="/start_page.jsp" class="btn btn-block btn-lg btn-secondary">
				로그아웃
			</a>
		</div>
		<div class="col-md-10"></div>
		<div class="col-md-1">
			 
			<a href="/views/user_views/main.jsp" class="btn btn-sm btn-block btn-outline-primary">
				Main
			</a> 
			<a href="/views/user_views/myhome.jsp" class="btn btn-sm btn-block btn-outline-primary">
				MyHome
			</a>
		</div>
	</div> -->
	<div class="row">
		<div class="col-md-3"style="text-align: center; margin-top: 30px">
			<img alt="배너1" src="/images/card1.jpg"  style="width: 270px; height: 150px"/><br>
			<img alt="배너2" src="/images/card1.jpg"  style="width: 270px; height: 150px"/><br>
			<i>이곳은 배너 광고입니다.</i>
		</div>
		<div class="col-md-6">
			 
			<a href="study_clan_form.jsp" class="btn btn-success">
				등록하기
			</a>
			<table class="table table-bordered">
				<thead>
					<tr>
						<th>#</th>
						<th>아이디</th>
						<th>공부주제</th>
						<th>온/오프라인</th>
						<th>모집현황</th>
					</tr>
				</thead>
				<tbody>
					<tr class="clan_tr" data-clan_no="1">
						<td>1</td>
						<td>javaLover</td>
						<td>java 공부 인원 모집해요</td>
						<td>온라인</td>
						<td style="font-size: 14px">모집 중</td>
					</tr>
					<tr class="table-active clan_tr" data-clan_no="2">
						<td>2</td>
						<td>hellgod</td>
						<td>정시준비 딱간다</td>
						<td>오프라인</td>
						<td style="font-size: 14px">모집 완료</td>
					</tr>
					<tr class="table-success">
						<td>3</td>
						<td>mathgod</td>
						<td>기초 수학 부터 대수학 까지 공부하실 분 모집~(디코, 단톡 필참)</td>
						<td>온라인</td>
						<td style="font-size: 14px">모집 중</td>
					</tr>
					<tr class="table-warning">
						<td>4</td>
						<td>ddiyong</td>
						<td>카공하실 분 있나요~?(매주 수욜)</td>
						<td>오프라인</td>
						<td style="font-size: 14px">모집 완료</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="col-md-3"style="text-align: center; margin-top: 30px">
			<img alt="배너1" src="/images/card1.jpg"  style="width: 270px; height: 150px"/><br>
			<img alt="배너2" src="/images/card1.jpg"  style="width: 270px; height: 150px"/><br>
			<i>이곳은 배너 광고입니다.</i>
		</div>
	</div>
</div>			
	<%@ include file="/include/footer.jspf" %>
</body>
</html>