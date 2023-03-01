<%@ page import="dao.UserDao" %>
<%@ page import="dao.BoardDao" %>
<%@ page import="vo.BoardVo" %>
<%@ page import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	BoardDao boardDao = BoardDao.getInstance();
	List<BoardVo> boardList = boardDao.getList();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스터디 레코드</title>
</head>
<%@ include file="/include/boot_cdn.jspf" %>
<c:set var="boardList" value="<%=boardList %>"/>
<script>
$(function() {
	
	// 테이블의 글을 선택했을 경우
	$(".study_tr").click(function() {
		var bno = $(this).attr("data-bno"); // 글 번호 얻기
		location.href="/views/user_views/study_record_detail.jsp";
	});
	
	$("#btn-write").click(function(e) {
		e.preventDefault();
		var user_id = "${login_info}";
		if (user_id == null || user_id == "") {
			location.href = "/views/start_views/login.jsp?page=board-write";
			return;
		}
		location.href = "/views/user_views/study_record_form.jsp";
	});
});
</script>
<body>
<%@ include file="/include/header.jspf" %>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8">
			 
			<a id="btn-write" href="#" class="btn btn-success" 
			style="margin: 15px 0px">
				등록하기
			</a>
			
			<table class="table table-bordered desktop" style="text-align: center">
				<thead>
					<tr>
						<th>#</th>
						<th style="width: 100px">제목</th>
						<th>공부한 내용</th>
						<th>등록일</th>
						<th>아이디</th>
						<th>좋아요</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${boardList}" var="boardList">
					<tr>
						<td>${boardList.bno}</td>
						<td>
							<a href="/views/user_views/study_record_detail.jsp?bno=${boardList.bno}">
							${boardList.title}</a>
						</td>
						<td>${boardList.content}</td>
						<td>${boardList.regdate}</td>
						<td>${boardList.user_id}</td>
						<td>${boardList.like_count}</td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
			
			<!-- mobile -->
			<table class="table main-table table-bordered mobile" style="text-align: center">
				<thead>
					<tr>
						<th style="width: 100px">제목</th>
						<th>등록일</th>
						<th>id</th>
						<th>👍</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="<%=boardList %>" var="boardList">
					<tr>
						<td>
							<a href="/views/user_views/study_record_detail.jsp?bno=${boardList.bno}">
								<c:choose>
									<c:when test="${fn:length(boardList.title)>=14}">
										${fn:substring(boardList.title, 0, 12)}...
									</c:when>
									<c:otherwise>
										${boardList.title }
									</c:otherwise>
								</c:choose>
							</a>
							
						</td>
						<td>${boardList.regdate}</td>
						<td>${boardList.user_id}</td>
						<td>${boardList.like_count}</td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div class="col-md-2"></div>
	</div>
</div>		
	<%@ include file="/include/footer.jspf" %>
</body>
</html>