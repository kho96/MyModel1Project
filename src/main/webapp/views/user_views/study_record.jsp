<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스터디 레코드</title>
</head>
<%@ include file="../../include/boot_cdn.jspf" %>
<script>
$(function() {
	
	// 테이블의 글을 선택했을 경우
	$(".study_tr").click(function() {
		var bno = $(this).attr("data-bno"); // 글 번호 얻기
		location.href="${contextPath}/views/user_views/study_record_detail.jsp";
	});	
});
</script>
<body>
<div class="container-fluid">
	<div class="row" style="padding: 50px">
		<div class="col-md-12">
			<h3 class="text-center">
				오늘의 공부
			</h3>
		</div>
	</div>
	<div class="row">
		<div class="col-md-1">
			 
			<a href="../start_views/start_page.jsp" class="btn btn-block btn-lg btn-secondary">
				로그아웃
			</a>
		</div>
		<div class="col-md-10"></div>
		<div class="col-md-1">
			<a href="main.jsp" class="btn btn-sm btn-block btn-outline-primary">
				Main
			</a> 
			<a href="myhome.jsp" class="btn btn-sm btn-block btn-outline-primary">
				MyHome
			</a>
		</div>
	</div>
	<div class="row">
		<div class="col-md-3"style="text-align: center; margin-top: 30px">
			<img alt="배너1" src="../../images/card1.jpg"  style="width: 270px; height: 150px"/><br>
			<img alt="배너2" src="../../images/card1.jpg"  style="width: 270px; height: 150px"/><br>
			<i>이곳은 배너 광고입니다.</i>
		</div>
		<div class="col-md-6">
			 
			<a href="study_record_form.jsp" class="btn btn-success">
				등록하기
			</a>
			<table class="table table-bordered">
				<thead>
					<tr>
						<th>#</th>
						<th>아이디</th>
						<th>총 공부 시간</th>
						<th>공부한 내용</th>
					</tr>
					</tr>
				</thead>
				<tbody>
					<tr class="study_tr" data-bno="1">
						<td>1</td>
						<td>javaLover</td>
						<td>02:47</td>
						<td>java 공부</td>
					</tr>
					<tr class="table-active study_tr" data-bno="2">
						<td>2</td>
						<td>helloworld</td>
						<td>07:19</td>
						<td>java spring & api</td>
					</tr>
					<tr class="table-success">
						<td>3</td>
						<td>mathgod</td>
						<td>11:09</td>
						<td>선형대수학</td>
					</tr>
					<tr class="table-warning">
						<td>4</td>
						<td>gonsisang</td>
						<td>17:46</td>
						<td>교육행정 및 일반행정</td>
					</tr>
					<tr class="table-danger">
						<td>5</td>
						<td>Tomboy</td>
						<td>01:46</td>
						<td>현대음악의 역사 및 이론</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="col-md-3"style="text-align: center; margin-top: 30px">
			<img alt="배너1" src="../../images/card1.jpg"  style="width: 270px; height: 150px"/><br>
			<img alt="배너2" src="../../images/card1.jpg"  style="width: 270px; height: 150px"/><br>
			<i>이곳은 배너 광고입니다.</i>
		</div>
	</div>
	<%@ include file="../../include/footer.jspf" %>
</div>		
</body>
</html>