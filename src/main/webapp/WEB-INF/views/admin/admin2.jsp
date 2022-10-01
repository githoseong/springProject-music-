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
<jsp:include page="/WEB-INF/views/include/style.jsp"/>
<style>
	#top2 {
		background-color: rgb(252, 252, 252);
    border-bottom: 1px solid rgb(231, 231, 231);
    height:100px;
    padding:8px;
    width:100%;
	}
	#top2 > a {
		text-decoration: none;
	}
	#logo {
		margin:0px 10px;
	}	
	.menu9 {
    margin-left: 100px;
    list-style: none;
    font-size: 20px;
    color: black;
	}
	.menu9:hover {
	  color: rgb(216, 148, 148);
	}
</style>
<body>
<div id="top2">
	<c:if test="${adMain == 1}">
		<span class="peach" id="logo"><a href="${ctp}/">peach<i class="fa-solid fa-seedling"></i></a></span>
	</c:if>
	<c:if test="${adMain != 1}">
		<span class="peach" id="logo" ><a href="${ctp}/admin/admin" style="color:rgb(132, 182, 247)">peach<i class="fa-solid fa-seedling"></i></a></span>
	</c:if>
		<a href="${ctp}/admin/newList" class="menu9">최신음악 업로드</a>
		<a href="${ctp}/admin/banner" class="menu9">배너 업로드</a>
		<a href="${ctp}/video/videoList" class="menu9">동영상 업로드</a>
		<a href="${ctp}/magazine/admagazine" class="menu9">매거진 업로드</a>
		<a href="${ctp}/admin/memManage" class="menu9">회원 관리</a>
		<a href="${ctp}/admin/ask" class="menu9">문의 관리</a>
</div>	
</body>
</html>