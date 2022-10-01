<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<% pageContext.setAttribute("newLine", "\n"); %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>qrcode.jsp</title>
  <%@ include file="/WEB-INF/views/include/bs4.jsp" %>
</head>
<style>
#section {
  width: 800px;
  color:rgb(75, 73, 73);
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
</style>
<body>
<p><br/></p>
<div class="container">
	<div id="section" name="section">
	  <div class="peach"><a href="${ctp}/">peach<i class="fa-solid fa-seedling"></i></a></div>
	  <div style="margin:0px auto; width:130px; font-size:30px; color:black; font-weight:bold">QR 코드</div>
	    <div style="width:200px; margin:0px auto;">
			  <span id="qrImage"><img src="${ctp}/data/qrCode/${qrCode}.png"/></span><br/>
			  <span style="margin-left:25px;">모바일로 접속 합니다.</span>
		  </div>
  </div>
</div>
</body>
</html>