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
<c:set var="boardList" value="<%=boardList %>" />
<body>
<%@ include file="/include/header.jspf" %>
<div class="container-fluid">
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
					<c:forEach items="${boardList}" var="boardVo">
						<tr>
							<td>${boardVo.regdate}</td>
							<td>${fn:substring(boardVo.title, 0, 12)}</td>
							<td>${boardVo.like_count}</td>
							<td><a href="#" class="btn btn-danger">삭제</a></td>
						</tr>
					</c:forEach>
					
				</tbody>
			</table>
			<!-- <div>
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
			</div> -->
		</div>
	</div>
</div>
	<%@ include file="/include/footer.jspf" %>
</body>
</html>