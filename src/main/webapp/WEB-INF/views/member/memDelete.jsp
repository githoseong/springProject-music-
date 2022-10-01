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
	function delete1() {
		let mail = document.getElementById("mail").value;
	  let txtpwd = document.getElementById("txtpwd").value;
		
		if(mail == "") {
	        iddemo.innerHTML = " *이메일을 입력해주세요."
	        document.getElementById("mail").focus();
	        return false;
	  }
		else if(mail.indexOf("@") == -1) {
						iddemo.innerHTML = " *형식에 맞는 이메일을 입력해주세요."
		        document.getElementById("mail").focus();
		        return false;
		}
		else if(mail != '${vo.email}') {
					iddemo.innerHTML = " *본인의 이메일을 입력해주세요."
	        document.getElementById("mail").focus();
	        return false;
		} 
		else if(txtpwd == "") {
	        pwddemo.innerHTML = " *비밀번호를 입력해주세요."
	        document.getElementById("txtpwd").focus();
	        return false;
	  }
		else {
			form.submit();
		}
	}
  </script>
</head>
<jsp:include page="/WEB-INF/views/include/style.jsp"/>
<style>
#login {
    text-align: center;
    margin-bottom: 50px;
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
.txtage {
    width:233px;
    height: 40px;
    font-size: 15px;
    margin: 10px auto;
}    

.btn0 {
    width: 130px;
    height: 50px;
    font-size: 15px;
    color: rgb(249, 249, 250);
    margin: 10px 5px;
    background-color: rgb(216, 117, 117);
    border: 0ch;
    border-radius: 10px;
}
.btn0:hover {
    cursor: pointer;
    opacity: 0.8;
    color:white;
}
</style>
<body>
<div id="container">
<jsp:include page="/WEB-INF/views/include/header.jsp"/>
  <div id="section">
  <form name="form" method="post">
  <div id="login">
      <h2 style="font-weight: bold;">회 원 탈 퇴</h2>
  </div>
  <div class="txtinput">
      <label for="txtid"><span class="txt">이메일</span></label><span id="iddemo" style="font-size:14px; color: red;"></span><br/>
      <input type="text" id="mail" name="email" class="idpwd" placeholder="이메일을 입력하세요"/><br/>
      <input type="hidden" name="title" value="[peach]회원탈퇴"/>
      <input type="hidden" name="content" value="회원 탈퇴 하시겠습니까? (30일 간 재가입 불가능)"/>
  </div>   
  <div class="txtinput">
      <label for="txtpwd"><span class="txt">비밀번호</span></label><span id="pwddemo" style="font-size:14px; color: red;"></span><br/>
      <input type="password" id="txtpwd" name="pwd" class="idpwd" placeholder="Password" maxlength="20"/>
  </div> 
  <div id="txtinput">
      <input type="button" id="btnlogin" name="btnlogin" class="btn0" value="회원탈퇴" onclick="delete1()">
      <input type="button" id="btnforgot" name="btnlogin" class="btn0" value="취소하기" onclick="location.href='${ctp}/member/myPage'">
  </div>
  </form>
  </div>
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>  
</div>  
</body>
</html>