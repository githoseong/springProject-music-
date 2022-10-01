<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>title</title>
  <jsp:include page="/WEB-INF/views/include/bs4.jsp"/>
</head>
<style>
#section {
  width: 700px;
  height: 600px;
  margin: 150px auto;
}
.peach {
	  text-align: center;
	  margin:30px; auto;
}
.peach a {
    font-size: 70px;
    font-weight: bold;
    color: rgb(216, 148, 148);
    text-decoration: none;
}
#err {
	font-size:30px;
	margin-left:100px;
	font-weight:bold;
}
#content {
	font-size:27px;
}
</style>
<body>
<div id="container">
	<div id="section">	
		<div class="peach" ><a href="${ctp}/">peach<i class="fa-solid fa-seedling"></i></a></div>
		<div>
			<div style="float:left; "><img src="${ctp}/commercial/어피치.jpg"></div>
			<div style="float:left; margin-top:30px;">
				<span id="err">서버 오류</span><br/><br/>
				<span id="content">불편을 끼쳐 드려 죄송합니다.<br/><br/>
				빠른 시일 내에 처리하겠습니다.</span><br/><br/>
				error-code : 404
			</div>
		</div>
	</div>
</div>	
</body>
</html>