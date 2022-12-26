<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스터디 클랜 상세보기</title>
<%@ include file="../../include/boot_cdn.jspf" %>
</head>
<body>
<div class="container-fluid">
	<div class="row" style="padding: 50px">
		<div class="col-md-12">
			<h3 class="text-center">
				스터디 클랜 생성
			</h3>
		</div>
	</div>
	<div class="row">
		<div class="col-md-2">
		</div>
		<div class="col-md-8">
			<form role="form">
				<div class="form-group">
					 
					<label for="clan_topic">
						공부 주제
					</label>
					<input type="text" class="form-control" id="clan_topic" name="clan_topic"/>
				</div>
				<div class="form-group">
					 
					 <input type="radio" name="study_place" id="study_place">온라인
					 <input type="radio" name="study_place" id="study_place">오프라인
				</div>
				<div class="form-group">
					<label for="clan_personnel">
						모집인원
					</label>
					<input class="form-control" type="number" name="clan_personnel" id="clan_personnel">
				</div>
				<div class="form-group">
					<label for="clan_personnel_now">
						현재인원
					</label>
					<input class="form-control" type="number" name="clan_personnel_now" id="clan_personnel_now">
				</div>
				<div class="form-group">
					 
					<label for="study_content">
						스터디 설명
					</label>
					<textarea rows="7" cols="30" class="form-control"
						 id="study_content" name="study_content"></textarea>
				</div>
				<button type="submit" class="btn btn-primary">
					등록
				</button>
					<a href="study_clan.jsp" class="btn btn-danger"> 취소 </a>
					<a href="#" class="btn btn-success"> 신청 </a>
					<a href="#" class="btn btn-success"> 신청 취소 </a>
			</form>
		</div>
		<div class="col-md-2">
		</div>
	</div>
	<%@ include file="../../include/footer.jspf" %>
</div>
</body>
</html>