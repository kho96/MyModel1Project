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
<%@ include file="/include/boot_cdn.jspf" %>
<script>
$(function() {
	$(".btn-danger").click(function(e) {
		e.preventDefault();
		var bno = $(this).attr("data-bno");
		location.href = "/views/user_views/mypage_delete.jsp?bno="+bno;
		
	});
});
</script>
</head>
<c:set var="boardList" value="<%=boardList %>" />
<body>
<%@ include file="/include/header.jspf" %>
<div class="container-fluid">
	<div class="row" style="margin-top: 50px">
		<div class="col-md-12">
			<h3 class="text-muted">나의 공부 기록</h3>
			<c:choose>
				<c:when test="${fn:length(boardList) != 0}">
					<table class="table desktop myhome-table" style="text-align: center">
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
									<td><a href="#" data-bno="${boardVo.bno }" class="btn btn-danger">삭제</a></td>
								</tr>
							</c:forEach>
							
						</tbody>
					</table>
					<table class="table mobile myhome-table" style="text-align: center">
						<thead>
							<tr>
								<th>📆</th>
								<th>공부<br/>주제</th>
								<th>👍</th>
								<th>삭제</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${boardList}" var="boardVo">
								<tr>
									<td>
										<fmt:formatDate value="${boardVo.regdate }" dateStyle="short"/>
									</td>
									<td>
									<a href="/views/user_views/study_record_detail.jsp?bno=${boardVo.bno}">
									<c:choose>
										<c:when test="${fn:length(boardVo.title)>=14}">
											${fn:substring(boardVo.title, 0, 12)}...
										</c:when>
										<c:otherwise>
											${boardVo.title }
										</c:otherwise>
									</c:choose>
									</a>
									</td>
									<td>${boardVo.like_count}</td>
									<td><a href="#" data-bno="${boardVo.bno }" 
										class="btn btn-danger" 
										style="background-color: coral">❌</a>
									</td>
								</tr>
							</c:forEach>
							
						</tbody>
					</table>
				</c:when>
				<c:otherwise>
					<h4>작성한 게시물이 존재하지 않습니다.</h4>
					<a href="/views/user_views/study_record_form.jsp">첫 게시글 작성하러 가기</a>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
</div>
	<%@ include file="/include/footer.jspf" %>
</body>
</html>