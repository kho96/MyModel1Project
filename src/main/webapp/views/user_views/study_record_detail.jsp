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
<%@ include file="../../include/boot_cdn.jspf" %>
<c:set var="boardVo" value="<%=boardVo %>"/>
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
			${boardVo}
			<form role="form">
				<div class="form-group">
					 
					<label for="study_topic">
						아이디
					</label>
					<input type="text" class="form-control" id="study_topic" name="study_topic"/>
				</div>
				<div class="form-group">
					 
					<label for="study_time">
						공부 시간
					</label>
					<input type="text" class="form-control" id="study_time" name="study_time"/>
				</div>
				<div class="form-group">
					 
					<label for="study_topic">
						공부 주제
					</label>
					<input type="text" class="form-control" id="study_topic" name="study_topic"/>
				</div>
				<div class="form-group">
					 
					<label for="study_content">
						공부 내용
					</label>
					<textarea rows="7" cols="30" class="form-control"
						 id="study_content" name="study_content"></textarea>
				</div>
				<button type="submit" class="btn btn-primary">
					수정
				</button>
				
				<a href="study_record.jsp" class="btn btn-danger"> 삭제 </a>
				<a href="#" class="btn btn-success"> 응원하기 </a>
				<a href="${contextPath}/views/user_views/study_record.jsp" class="btn btn-info"> 돌아가기 </a>
			</form>
		</div>
		<div class="col-md-2">
		</div>
	</div>
	<%@ include file="../../include/footer.jspf" %>
</div>		
</body>
</html>