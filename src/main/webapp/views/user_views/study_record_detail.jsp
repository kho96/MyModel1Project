<%@ page import="dao.UserDao" %>
<%@ page import="dao.BoardDao" %>
<%@ page import="vo.BoardVo" %>
<%@ page import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%  
	int bno = Integer.parseInt(request.getParameter("bno"));
	BoardDao boardDao = BoardDao.getInstance();
	
	BoardVo boardVo = boardDao.getDetail(bno);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 상세 정보</title>
<%@ include file="/include/boot_cdn.jspf" %>
<link href="/include/test.css?ver=2" rel="stylesheet" type="text/css">
<c:set var="boardVo" value="<%=boardVo %>"/>
<script>
$(document).ready(function() {
	var bno = "${boardVo.bno}";
	$("#btnLike").click(function(e) {
		e.preventDefault();
		sData = { 
				"command" : "like",
				"bno" : "${boardVo.bno}",
				"like_count" : "${boardVo.like_count}"
		}
		url = "study_record_run.jsp";
		$.post(url, sData, function(rData) {
			location.href = "/views/user_views/study_record_detail.jsp?bno=" + bno;
		});
	});
	
	$("#btnUpdate").click(function() {
		$(this).fadeOut(500);
		$("#btnUpdateRun").fadeIn(500);
		$("#title").attr("disabled", false);
		$("#content").attr("disabled", false);
		$("#btnUpdateRun").click(function() {
			$("#frmUpdate").submit();
		});
	});
});
</script>
</head>
<body>
<div class="container-fluid">
	<div class="row" style="padding: 50px">
		<div class="col-md-12">
			<h3 class="text-center">
				상세정보
			</h3>
		</div>
	</div>
	<div class="row">
		<div class="col-md-2">
		</div>
		<div class="col-md-8">
			<form role="form" id="frmUpdate" action="/views/user_views/study_record_run.jsp" method="POST">
				<input type="hidden" name="command" value="update">
				<input type="hidden" name="bno" value="${boardVo.bno}">
				<div class="form-group">
					<label for="study_topic">
						아이디
					</label>
					<input type="text" class="form-control" id="user_id" name="user_id" value="${boardVo.user_id}" disabled/>
				</div>
				<div class="form-group">
					<label for="study_topic">
						공부 주제
					</label>
					<input type="text" class="form-control" id="title" name="title" value="${boardVo.title}" disabled/>
				</div>
				<div class="form-group">
					<label for="study_content">
						공부 내용
					</label>
					<textarea rows="7" cols="30" class="form-control"
						 id="content" name="content" disabled>${boardVo.content}</textarea>
				</div>
				<button type="button" class="btn btn-primary" id="btnUpdate">
					수정
				</button>
				<button type="button" class="btn btn-success" id="btnUpdateRun" style="display: none;">
					수정완료
				</button>
				
				<a href="/views/user_views/study_record_run.jsp?bno=${boardVo.bno}&command=delete" class="btn btn-danger"> 삭제 </a>
				<a href="#" class="btn btn-success" id="btnLike">
					응원하기<span class="badge badge-danger">${boardVo.like_count}</span>
				</a>
				<a href="/views/user_views/study_record.jsp" class="btn btn-info"> 돌아가기 </a>
			</form>
		</div>
		<div class="col-md-2">
		</div>
	</div>
</div>		
	<%@ include file="/include/footer.jspf" %>
</body>
</html>