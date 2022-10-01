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
function login() {
  let mid = myform.txtid.value;
  let pwd =	myform.txtpwd.value;
  if(mid == "") {
	  document.getElementById("demoid").innerHTML = "<font color='red'> !아이디를 입력하세요.</font>" 
	  return false;
  }
  else if(pwd == "") {
      document.getElementById("demo").innerHTML = "<font color='red'> !비밀번호를 입력하세요.</font>"
    return false; 
  }
  else { 
	  document.getElementById("demoid").innerHTML = " ";
	  document.getElementById("demo").innerHTML = " ";
	  myform.submit();
  }
}
function ent(ent) {
	let pwd = document.getElementById("txtpwd");
	
	pwd.addEventListener("keyup", function (event) {
    if (event.keyCode == 13) {
      /* event.preventDefault(); */
      document.getElementById("btnlogin").click();
    }
  });
}
</script>
  
</head>
<style>
body {
	background-color:white;
}
#section {
  width: 800px;
  color:rgb(75, 73, 73);
  margin: 150px auto;
  
}
#login {
    text-align: center;
    margin-bottom: 30px;
}
.txtinput {
    text-align: left;
    margin: 20px auto;
    width: 500px;
}
#txtinput {
    text-align: center;
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
.btn {
    width: 150px;
    height: 50px;
    font-size: 17px;
    color: rgb(249, 249, 250);
    margin: 20px 5px;
    background-color: rgb(216, 117, 117);
    border: 0ch;
    
    
}
.btn:hover {
    cursor: pointer;
    opacity: 0.8;
    color:white;
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
<div id="section" name="section">
<section id="sec">
  <form name="myform" method="post" >   
  <div class="peach"><a href="${ctp}/">peach<i class="fa-solid fa-seedling"></i></a></div> 
  <div id="login">
      <h2 style="font-weight:bold">로 그 인</h3>
  </div>
  <div class="txtinput">
      <label for="txtid"><span class="txt">아이디</span></label><span id="demoid"></span><br/>
      <input type="text" id="txtid" name="mid" class="idpwd" value="${mid}" placeholder="ID"/><br/>
      <input type="checkbox" id="boxid" name="idCheck" checked/>아이디 기억하기
  </div>   
  <div class="txtinput">
      <label for="txtpwd"><span class="txt">비밀번호</span></label><span id="demo"></span><br/>
      <input type="password" id="txtpwd" name="pwd" class="idpwd" placeholder="Password" maxlength="20" onkeyup="ent(ent)"/>
  </div> 
  <div id="txtinput">
      <input type="button" id="btnlogin" name="btnlogin" class="btn" value="로그인"  onclick="login()" >
      <a href="${ctp}/member/signup"><input type="button" id="btnsignup" name="btnlogin" class="btn" value="회원가입"></a>
      <a href="${ctp}/member/searchId"><input type="button" id="btnforgot" name="btnlogin" class="btn" value="아이디찾기"></a>
  </div>
  </form>
</section>
</div>
</body>
</html>