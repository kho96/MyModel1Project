<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공부기록하기</title>
<%@ include file="/include/boot_cdn.jspf" %>
<link href="/include/test.css?ver=2" rel="stylesheet" type="text/css">
</head>
<body>
<div class="container-fluid">
	<div class="row" style="padding: 50px">
		<div class="col-md-12">
			<h3 class="text-center">
				기록하기
			</h3>
		</div>
	</div>
	<div class="row">
		<div class="col-md-2">
		</div>
		<div class="col-md-8">
		
			<form role="form" method="get" action="/views/user_views/study_record_run.jsp">
				<div class="form-group">
				
					<!-- 커맨드 입력 -->
					<input type="hidden" name="command" value="insert_record">
					<!-- 세션 -> 유저 아이디 -->
					<input type="hidden" name="user_id" value="${sessionScope.login_info}">
					
					<label for="title">
						제목
					</label>
					<input type="text" class="form-control" id="title" name="title"/>
				</div>
				<div class="form-group">
					 
					<label for="content">
						내용
					</label>
					<textarea rows="7" cols="30" class="form-control"
						 id="content" name="content"></textarea>
				</div>
				<button type="submit" class="btn btn-primary">
					등록
				</button>
				<a href="/views/user_views/study_record.jsp" class="btn btn-danger"> 취소 </a>
			</form>
			
		</div>
		<div class="col-md-2">
		</div>
	</div>
</div>		
	<%@ include file="/include/footer.jspf" %>
</body>
</html>