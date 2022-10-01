<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function idSearch() {
		let mail = form.txtmail.value;
		if(mail == "") {
			  document.getElementById("demoid").innerHTML = "<font color='red'> !이메일을 입력하세요.</font>";
			  form.txtid.focus();
			  return false;
		}
		else if(mail.indexOf("@") == -1) {
			document.getElementById("demoid").innerHTML = "<font color='red'> !형식에 맞게 입력해주세요</font>";
			form.txtid.focus();
			return false;
		}
		else {
			let url = "${ctp}/member/searchIdCheck?mail="+mail;
	    let winx = 465;
	    let winy = 300;
	    let x = (window.screen.width/2) - (winx/2);
	    let y = (window.screen.height/2) - (winy/2);
	    window.open(url,"newWindow","width="+winx+",height="+winy+",left="+x+",top="+y);
			//form.submit();
		}	
	}
	function pwdSearch() {
		let id = form2.txtpwd.value;
		let mail = form2.txtpwd2.value;
		
		if(id == "") {
			document.getElementById("demopwd").innerHTML = "<font color='red'> !아이디를 입력하세요.</font>";
			form2.txtpwd.focus();
			return false;
		}
		else if(mail == "") {
			document.getElementById("demopwd").innerHTML = "<font color='red'> !이메일을 입력하세요.</font>";
			form2.txtpwd2.focus();
			return false;
		}
		else if(mail.indexOf("@") == -1) {
			document.getElementById("demopwd").innerHTML = "<font color='red'> !형식에 맞게 입력해주세요</font>";
			form.txtid.focus();
			return false;
		}
		else {
			let url = "${ctp}/member/searchPwdCheck?mail="+mail+"&mid="+id;
	    let winx = 490;
	    let winy = 420;
	    let x = (window.screen.width/2) - (winx/2);
	    let y = (window.screen.height/2) - (winy/2);
	    window.open(url,"newWindow","width="+winx+",height="+winy+",left="+x+",top="+y);
			//form.submit();
		}	
		
	}
</script>
</head>
<style>
body {
	background-color:white;
}
#section {
    width: 800px;
    margin: 250px auto;
}
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
.btn {
    width: 500px;
    height: 48px;
    font-size: 17px;
    margin: 10px 3px 25px;
    background-color: rgb(216, 117, 117);
 		color: rgb(249, 249, 250);
 		border: 0ch;
}
.btn:hover {
    cursor: pointer;
    opacity: 0.8;
    color:white;
}
</style>
<body>
<div id="section">
    <form id="form" method="post" >    
    <div id="login">
        <h3 style="font-weight:bold">아이디ㆍ비밀번호 찾기</h3>
    </div>
    <div class="txtinput">
        <label for="txtid"><span class="txt">아이디 찾기</span></label><span id="demoid"></span><br/>
        <input type="text" id="txtmail" name="txtmail" class="idpwd" placeholder="Email을 입력해주세요"/><br/>
        <input type="button" id="btnlogin" name="btnlogin" class="btn" onclick="idSearch()" value="아이디 찾기">
    </div>   
    </form>
    <form id="form2" method="post" action="">
    <div class="txtinput">
        <label for="txtpwd"><span class="txt">비밀번호 찾기</span></label><span id="demopwd"></span><br/>
        <input type="text" id="txtid" name="txtpwd" class="idpwd" placeholder="ID를 입력해주세요"/>
        <input type="text" id="txtmail2" name="txtpwd2" class="idpwd" placeholder="Email을 입력해주세요"/>
        <input type="button" id="btnsignup" name="btnlogin" class="btn" onclick="pwdSearch()" value="비밀번호 찾기">
    </div> 
    </form>
</div>
</body>
</html>