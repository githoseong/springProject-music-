<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="/WEB-INF/views/include/bs4.jsp"/>
</head>
<style>
#container {
    width:430px;
    height:240px;
}
#logo {
    text-align: center;
    margin: 10px 0px 50px 0px;
    width: 460px;
    text-align:left;
    font-size: 50px;
    font-weight: bold;
    color: rgb(216, 148, 148);
    text-decoration: none;

}
#txt {
    font-size: 18px;
    font-weight: bold;
    margin-left: 30px;
}
#input {
    height: 25px;
    width: 300px;
}
#txt2 {
    margin: 10px auto auto 30px;
}

.btnUpdate {
		width: 100px;
    height: 30px;
    color: rgb(249, 249, 250);
    background-color: rgb(216, 148, 148);
    border: 0ch;
    
    
}
.btnUpdate:hover {
    cursor: pointer;
    opacity: 0.8;
    color:white;
}
#btn {
	margin:10px auto auto 150px;
}
</style>
<body>
<div id="container">
  <div id="logo">
      peach<i class="fa-solid fa-seedling"></i>
  </div>
  <div id="txt">
  	<c:if test="${empty vos}">가입한 아이디가 없습니다.</c:if>
  	<c:if test="${!empty vos}">검색한 아이디</c:if> 
  </div>
  <div id="txt2">
		<c:if test="${!empty vos}">  
  <c:forEach var="vo" items="${vos}">
	  	<c:set var="mid2" value="${fn:length(vo.mid)-2}"/>
	    <input type="text" id="input" value="${fn:substring(vo.mid,0,mid2)}**" disabled style="background-color: white;"/> 
  </c:forEach>  
    </c:if>
  </div>
  <div id="btn">
    <input type="button" value="나가기" onclick="window.close();" class="btnUpdate"/>
  </div>  	
</div>
</body>
</html>