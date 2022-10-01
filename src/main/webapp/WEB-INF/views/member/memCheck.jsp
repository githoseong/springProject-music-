<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>title</title>
  <jsp:include page="/WEB-INF/views/include/bs4.jsp"/>
  <script>
  	function check() {
			let pwd = myForm.pwd.value;		
			if(pwd == "") {
				demo.innerHTML = "<font color='red'> *비밀번호를 입력해주세요</font>";
				document.getElementById("demo").focus();
			}
			else {
				myForm.submit();
			}
		}
  </script>
</head>
<jsp:include page="/WEB-INF/views/include/style.jsp"/>
<style>
#container {
    width: 1905px;
}
#section {
  width: 500px;
  color:rgb(75, 73, 73);
  margin: 150px auto;
  
}
.txt {
    font-weight: 1000;
}
.idpwd {
    width:500px;
    height: 40px;
    font-size: 15px;
    margin: 10px auto;
}
.peach a {
    font-size: 70px;
    font-weight: bold;
    color: rgb(216, 148, 148);
    text-decoration: none;
}
#conf {
		width:100%;
    height: 45px;
    background-color: white;
    border: 1px solid gainsboro;
    color:rgb(216, 148, 148);
    font-size:20px;
}
#conf:hover {
		font-weight:bold;
}
</style>
<body>
<div id="container">
  <div id="section">
	<form method="post" name="myForm">
	<div class="peach" style="text-align: center; margin:20px;"><a href="${ctp}/">peach<i class="fa-solid fa-seedling"></i></a></div> 
	<div class="txtinput">
      <label for="txtid"><span class="txt">비밀번호 확인</span></label><span id="demo"></span><br/>
      <input type="password" id="txtid" name="pwd" class="idpwd" value="${mid}" placeholder="비밀번호를 입력하세요"/><br/>
  </div>   
		<input type="button" value="확인" onclick="check()" id="conf">		
	</form>
	</div>
</div>	
</body>
</html>