<%@ page import="dao.BoardDao" %>
<%@ page import="vo.BoardVo" %>
<%@ page import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	BoardDao dao = BoardDao.getInstance();
	String user_id = (String)session.getAttribute("login_info");
	List<BoardVo> boardList = dao.getListById(user_id);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Home</title>
</head>
<%@ include file="/include/boot_cdn.jspf" %>
<body>
<%@ include file="/include/header.jspf" %>
<div class="container-fluid">
	<!-- <div class="row" style="padding: 50px">
		<div class="col-md-12">
			<h3 class="text-center">
				나의 정보
			</h3>
		</div>
	</div>
	<div class="row">
		<div class="col-md-2">
			 
			<a href="/start_page.jsp" class="btn btn-lg btn-secondary">
				로그아웃
			</a>
		</div>
		<div class="col-md-9">
		</div>
		<div class="col-md-1">
			 
			<a href="/views/user_views/main.jsp" class="btn btn-block btn-lg btn-outline-primary">
				Main
			</a>
		</div>
	</div> -->
	<!-- <div class="row" style="margin-top: 50px"> -->
		<!-- <div class="col-md-4">
			<h3 class="text-muted">
				가입된 스터디 클랜
			</h3>
			<table class="table">
				<thead>
					<tr>
						<th>#</th>
						<th>클랜명</th>
						<th>회원수</th>
						<th>공부 주제</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>1</td>
						<td>java 정복</td>
						<td>3</td>
						<td>java</td>
					</tr>
					<tr class="table-active">
						<td>2</td>
						<td>토이프로젝트(앱)</td>
						<td>6</td>
						<td>코틀린</td>
					</tr>
					<tr class="table-success">
						<td>3</td>
						<td>함께해요 AI</td>
						<td>16</td>
						<td>AI 기술</td>
					</tr>
				</tbody>
			</table>
		</div> -->
		<%-- <div class="col-md-4">
			<h3>
				주간 공부량 
			</h3>
			<table class="table">
				<thead>
					<tr>
						<th>요일</th>
						<th>시간</th>
						<th>내용</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>월</td>
						<td>02:09</td>
						<td>java복습</td>
					</tr>
					<tr>
						<td>화</td>
						<td>02:09</td>
						<td>java복습</td>
					</tr>
					<tr>
						<td>수</td>
						<td>02:09</td>
						<td>java복습</td>
					</tr>
					<tr>
						<td>목</td>
						<td>02:09</td>
						<td>java복습</td>
					</tr>
					<tr>
						<td>금</td>
						<td>02:09</td>
						<td>java복습</td>
					</tr>
					<tr>
						<td>토</td>
						<td>02:09</td>
						<td>java복습</td>
					</tr>
					<tr>
						<td>일</td>
						<td>02:09</td>
						<td>java복습</td>
					</tr>
					
				</tbody>
			</table>
		</div>
		<div class="col-md-4">
			<h3>
				월간 공부량
			</h3>
			<table class="table">
				<thead>
					<tr>
						<th>월</th>
						<th>공부 시간</th>
					</tr>
				</thead>
				<%
					for(int i = 1; i <= 12; i++) {
				%>		
				<tbody>
					<td><%=i %>월</td>
					<td>109:58</td>
				</tbody>	
				<% } %>
				
			</table>
		</div>
	</div> --%>
	<%-- <div class="col-md-6">
		<div  style="text-align: center">
		<h3>
			2023 월간 공부량
		</h3>
		</div>
		<table class="table" style="text-align: center">
			<thead>
				<tr>
					<th>월</th>
					<th>공부량</th>
					<th>월</th>
					<th>공부량</th>
				</tr>
			</thead>
			<%
				for(int i = 1; i <= 6; i++) {
			%>		
			<tbody>
				<td><%=i %>월</td>
				<td>0</td>
				<td><%=i+6 %>월</td>
				<td>0</td>
			</tbody>	
			<% } %>
			
		</table>
	</div>
	<div class="col-md-6">
		<div  style="text-align: center">
		<h3>
			1월 주간 공부량
		</h3>
		</div>
		<table class="table" style="text-align: center">
			<thead>
				<tr>
					<th>주</th>
					<th>공부량</th>
					<th>월</th>
					<th>공부량</th>
				</tr>
			</thead>
			<%
				for(int i = 1; i <= 6; i++) {
			%>		
			<tbody>
				<td><%=i %>월</td>
				<td>0</td>
				<td><%=i+6 %>월</td>
				<td>0</td>
			</tbody>	
			<% } %>
			
		</table>
	</div>
	<hr> --%>
	<div class="row" style="margin-top: 50px">
		<div class="col-md-12">
			<h3 class="text-muted">나의 공부 기록</h3>
			<table class="table" style="text-align: center">
				<thead>
					<tr>
						<th>작성일</th>
						<th>공부 주제</th>
						<th>응원수</th>
						<th>삭제</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="boardList">
					
					</c:forEach>
					<tr>
						<td>2022-12-26</td>
						<td>java 추상클래스</td>
						<td>2</td>
						<td><a href="#" class="btn btn-danger">삭제</a></td>
					</tr>
					<tr class="table-active">
						<td>2022-12-26</td>
						<td>java 인터페이스</td>
						<td>0</td>
						<td><a href="#" class="btn btn-danger">삭제</a></td>
					</tr>
					<tr class="table-success">
						<td>2022-12-23</td>
						<td>java 컬렉션</td>
						<td>6</td>
						<td><a href="#" class="btn btn-danger">삭제</a></td>
					</tr>
				</tbody>
			</table>
			<div>
				<nav>
					<ul class="pagination justify-content-center">
						<li class="page-item">
							<a class="page-link" href="#">Previous</a>
						</li>
						<li class="page-item">
							<a class="page-link" href="#">1</a>
						</li>
						<li class="page-item">
							<a class="page-link" href="#">2</a>
						</li>
						<li class="page-item">
							<a class="page-link" href="#">3</a>
						</li>
						<li class="page-item">
							<a class="page-link" href="#">4</a>
						</li>
						<li class="page-item">
							<a class="page-link" href="#">5</a>
						</li>
						<li class="page-item">
							<a class="page-link" href="#">Next</a>
						</li>
					</ul>
				</nav>
			</div>
		</div>
	</div>
</div>
	<%@ include file="/include/footer.jspf" %>
</body>
</html>