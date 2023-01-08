<%@ page import="dao.UserDao" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	UserDao userDao = UserDao.getInstance(); 
	String user_id = request.getParameter("user_id");
	String user_pw = request.getParameter("user_pw");
	boolean result = userDao.checkLogin(user_id, user_pw);
	if (!result) {
		session.setAttribute("login_result", "fail");
		response.sendRedirect("/mymodel1/views/start_views/login.jsp");
	} else {
		session.setAttribute("login_result", "success");
	}
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>첫 화면</title>
<%@ include file="../../include/boot_cdn.jspf" %>
</head>
<body>
<div class="container-fluid">
	<div class="row" style="padding: 50px">
		<div class="col-md-12">
			<h3 class="text-center">
				우리들의 공부 이야기
				${list}
			</h3>
		</div>
	</div>
	<div class="row">
		<div class="col-md-12">
			<nav class="navbar navbar-expand-lg navbar-light bg-light navbar-dark bg-dark static-top">
				<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
					<ul class="navbar-nav ml-md-auto">
						<li class="nav-item ">
							 <a class="nav-link" href="user_service.jsp">고객센터 <span class="sr-only">(current)</span></a>
						</li>						
						<li class="nav-item active">
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
	<div class="row">
		<div class="col-md-3"style="text-align: center; margin-top: 30px">
			<img alt="배너1" src="${contextPath}/images/card1.jpg"  style="width: 270px; height: 150px"/><br>
			<img alt="배너2" src="${contextPath}/images/card1.jpg"  style="width: 270px; height: 150px"/><br>
			<i>이곳은 배너 광고입니다.</i>
		</div>
		<div class="col-md-6" style="margin-top: 30px">
			<div><h6>공부 기록<a class="btn btn-primary" href="study_record.jsp" style="margin-left: 50px">더보기</a></h6></div>
			<table class="table table-sm table-hover table-striped">
				<thead>
					<tr>
						<th>#</th>
						<th>아이디</th>
						<th>총 공부 시간</th>
						<th>공부한 내용</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>1</td>
						<td>javaLover</td>
						<td>02:47</td>
						<td>java 공부</td>
					</tr>
					<tr class="table-active">
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
			<hr style="margin-top: 20px">
			<div style="margin-top: 35px"><h6>같이 공부해요!!!
				<a class="btn btn-primary" href="study_clan.jsp" style="margin-left: 50px">더보기</a></h6></div>
			<table class="table table-sm table-hover table-striped">
				<thead>
					<tr>
						<th>#</th>
						<th>아이디</th>
						<th>제목</th>
						<th>온/오프라인</th>
						<th>모집 상황</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>1</td>
						<td>javaLover</td>
						<td>java 공부 인원 모집해요</td>
						<td>온라인</td>
						<td style="font-size: 14px">모집 중</td>
					</tr>
					<tr class="table-active">
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
		<div class="col-md-3" style="text-align: center;  margin-top: 30px">
			<div><strong>금주 랭킹</strong></div>
			<table class="table table-sm table-hover pl-3" style="width: 80%; margin-left: 30px; border: solid">
				<thead>
					<tr>
						<th>랭킹</th>
						<th>아이디</th>
						<th>총 응원 수</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>1</td>
						<td>studylover</td>
						<td>45</td>
					</tr>
					<tr class="table-active">
						<td>2</td>
						<td>oppa423</td>
						<td>23</td>
					</tr>
					<tr class="table-success">
						<td>3</td>
						<td>mathgod</td>
						<td>16</td>
					</tr>
				</tbody>
			</table>
			<img alt="배너3" src="${contextPath}/images/card1.jpg" style="width: 270px; height: 150px"/><br>
			<img alt="배너4" src="${contextPath}/images/card1.jpg" style="width: 270px; height: 150px"/><br>
			<i>이곳은 배너 광고입니다.</i>
		</div>
	</div>
	<%@ include file="../../include/footer.jspf" %>
</div>
</body>
</html>