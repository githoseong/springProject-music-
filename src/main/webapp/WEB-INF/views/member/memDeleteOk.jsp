<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>title</title>
</head>
<body>
	<form method="post" name="myForm">
		<input type="submit" value="회원 탈퇴 완료" >
		<input type="button" value="회원 탈퇴 취소" onclick="location.href='${ctp}/member/myPage'">
	</form>
</body>
</html>