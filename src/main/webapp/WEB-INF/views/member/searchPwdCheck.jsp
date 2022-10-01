<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="/WEB-INF/views/include/bs4.jsp"/>
<script>
function update() {
	let txtpwd = document.getElementById("txtpwd").value;
  let pwdcheck = document.getElementById("pwdcheck").value;
	const regex5 = /(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$/


if(txtpwd == "") {
    pwddemo.innerHTML = " *비밀번호를 입력해주세요."
    document.getElementById("txtpwd").focus();
    return false;
}
else if(txtpwd.length < 8 ) {
    pwddemo.innerHTML = " *비밀번호는 8자리 이상 입력해주세요. "
    document.getElementById("txtpwd").focus();
    return false
}
else if(!regex5.test(txtpwd)) {
    pwddemo.innerHTML = " *비밀번호는 영문, 숫자, 특수문자를 포함해주세요."
    document.getElementById("txtpwd").focus();
    return false;
}
else {
    pwddemo.innerHTML = " "
}
if(pwdcheck == "") {
    pwdcheckdemo.innerHTML = " *비밀번호를 다시 한번 입력해주세요."
    document.getElementById("pwdcheck").focus();
    return false;
}
else if(txtpwd != pwdcheck ) {
    pwdcheckdemo.innerHTML = " *입력한 비밀번호와 다릅니다."
    document.getElementById("pwdcheck").focus();
    return false;
}
else {
    pwdcheckdemo.innerHTML = " "
    form.submit();
}

}
</script>
</head>
<style>
#container {
    width:430px;
    height:350px;
    margin:0px auto;
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
.txt {
    font-size: 18px;
    font-weight: bold;
    margin-left: 30px;
}
.input {
    height: 25px;
    width: 300px;
}
.txt2 {
    margin: 10px auto auto 30px;
}
#pwd {
    font-size: 18px;
    font-weight: bold;
    margin-bottom: 20px;
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
	margin:10px auto auto 100px;
}
</style>
<body>
<div id="container">
  <div id="logo">
      peach<i class="fa-solid fa-seedling"></i>
  </div>
  <div id="pwd">
      <c:if test="${vo.mid != null}">${vo.mid}님 비밀번호 변경</c:if>
  </div>
  <form name="form" method="post">
  <div class="txt">
	    <c:if test="${vo.pwd == null}">일치하는 정보가 없습니다.</c:if>
      <c:if test="${vo.pwd != null}">
	    <span>새로운 비밀번호 입력</span><span id="pwddemo" style="font-size:14px; color: red;"></span><br/>
  </div>
  <div class="txt2">
      <span><input type="password" placeholder="영문,숫자,특수문자 8~20자" id="txtpwd" name="pwd" class="input"/></span><br/>
  </div>
  <div class="txt">
      <span>비밀번호 확인</span><span id="pwdcheckdemo" style="font-size:14px; color: red;"></span><br/>
  </div>
  <div class="txt2">
      <span><input type="password" placeholder="비밀번호 확인" id="pwdcheck" class="input"></span><br/>
  </div>
  <div id="btn">
  		<input type="button" value="수정하기" onclick="update();" class="btnUpdate"/>
      </c:if>
      <input type="button" value="나가기" onclick="window.close();" class="btnUpdate"/>
  </div>    
  <%-- <input type="hidden" name="mid" value="${vo.mid}"> --%>
 	</form>
</div>
</body>
</html>