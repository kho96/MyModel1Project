<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공부기록하기</title>
<%@ include file="../../include/boot_cdn.jspf" %>
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
			<form role="form">
				<div class="form-group">
					 
					<label for="study_topic">
						공부 주제
					</label>
					<input type="text" class="form-control" id="study_topic" name="study_topic"/>
				</div>
				<div class="form-group">
					 
					<label for="study_start_time">
						공부 시작 시간
					</label>
					<input type="time" class="form-control" id="study_start_time" name="study_start_time"/>
				</div>
				<div class="form-group">
					 
					<label for="study_end_time">
						공부 종료 시간
					</label>
					<input type="time" class="form-control" id="study_end_time" name="study_end_time"/>
				</div>
				<div class="form-group">
					 
					<label for="study_content">
						내용
					</label>
					<textarea rows="7" cols="30" class="form-control"
						 id="study_content" name="study_content"></textarea>
				</div>
				<button type="submit" class="btn btn-primary">
					등록
				</button>
					<a href="study_record.jsp" class="btn btn-danger"> 취소 </a>
			</form>
		</div>
		<div class="col-md-2">
		</div>
	</div>
	<%@ include file="../../include/footer.jspf" %>
</div>		
</body>
</html>