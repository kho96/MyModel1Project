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
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>첫 화면</title>
<style>
.container-fluid {
	min-height: 100%;
	height: auto;
	padding-bottom: 300px;
}
</style>
<%@ include file="/include/boot_cdn.jspf" %>
<link href="/include/test.css?ver=2" rel="stylesheet" type="text/css">
<c:set var="boardList" value="<%=boardList %>"/>
<script>
</script>
</head>
<body>
<%@ include file="/include/header.jspf" %>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-2" style="margin-top: 30px"></div>
		<div class="col-md-8" style="margin-top: 30px">
			<!-- 게시판 시작 -->
			<div style="height: 50px;">
				<div style="float: left"><b>공부 기록</b></div>
				<div style="float: right;"><a class="btn btn-primary" href="study_record.jsp" style="margin-left: 50px">더보기</a></div>
			</div>
			<table class="table desktop main-table table-sm table-hover table-striped" style="text-align: center">
				<thead>
					<tr>
						<th>#</th>
						<th>제목</th>
						<!-- <th>공부한 내용</th> -->
						<th>등록일</th>
						<th>아이디</th>
						<th>좋아요</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${boardList}" var="boardList">
					<tr>
						<td>${boardList.bno}</td>
						<td>${boardList.title}</td>
						<%-- <td>${boardList.content}</td> --%>
						<td>${boardList.regdate}</td>
						<td>${boardList.user_id}</td>
						<td>${boardList.like_count}</td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
			
			<!-- mobile -->
			<table class="table mobile main-table table-sm table-hover table-striped" style="text-align: center">
				<thead>
					<tr>
						<th>제목</th>
						<th>등록일</th>
						<th>id</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="<%=boardList %>" var="boardList">
					<tr>
						<td>
							<c:choose>
								<c:when test="${fn:length(boardList.title)>=14}">
									${fn:substring(boardList.title, 0, 12)}...
								</c:when>
								<c:otherwise>
									${boardList.title }
								</c:otherwise>
							</c:choose>
						</td>
						<td>${boardList.regdate}</td>
						<td>${boardList.user_id}</td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
			<!-- 게시판 끝 -->
			
			<!-- 테이블 백업 -->
			<!--
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
			-->
		</div>
		<div class="col-md-2" style="margin-top: 30px"></div>
		<!-- <div class="col-md-3" style="text-align: center;  margin-top: 30px"> -->
			<!--
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
			-->
		<!-- </div> -->
		
	</div>
</div>
	<%@ include file="/include/footer.jspf" %>
</body>
</html>