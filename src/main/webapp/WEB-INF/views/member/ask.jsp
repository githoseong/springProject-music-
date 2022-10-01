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
	function ask() {
		let title = document.getElementById("title").value;
		let content = document.getElementById("content").value;
		if(title == "") {
			alert("제목을 입력하세요");
			return false;
		}
		else if(content == "") {
			alert("내용을 입력하세요");
			return false;
		}
		else {
			let ans = confirm("문의를 보내시겠습니까?");
			if(ans) {
				myForm.submit();
			}
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
    width: 60%;
    z-index: 1;
    margin: 40px auto;
    /* height: 2000px; */
}
#form {
    margin: 20px;
}
#login {
    text-align: center;
    margin-bottom: 50px;
}
.txtinput {
    text-align: left;
    margin: 20px auto 20px 130px;
    width: 800px;
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
    margin: 10px auto 10px 50px;
}
.btn {
	width:100px;
  height: 45px;
  background-color: white;
  border: 1px solid gainsboro;
}
.btn:hover {
    cursor: pointer;
    color:rgb(216, 148, 148);
    opacity: 0.8;
}
#frame {
	margin:0px auto;
	width:80%;
}
#topBtn {
	margin-left:200px;
}
</style>
<body>
<div id="container">
<jsp:include page="/WEB-INF/views/include/header.jsp"/>
  <hr/>
  <section id="section">
  <div id="topBtn">
  	<input type="button" value="문의 내역" onclick="location.href='${ctp}/member/askList'" class="btn" />
  </div>
  	<div id="frame">
	    <form name="myForm" method="post">    
	        <div id="login">
	            <h2 style="font-weight:bold">1:1 문의</h3>
	        </div>
	        <div class="txtinput">
	            <label for="txtid"><span class="txt">아이디</span></label>
	            <input type="text" id="txtid" name="mid" class="idpwd"  style="margin-left:35px;" value="${sMid}" readonly/><br/>
	        </div>          
	        <div class="txtinput">
	            <label for="title"><span class="txt">제목</span></label>
	            <input type="text" id="title" name="title" class="idpwd"  maxlength="20"/>
	        </div> 
	        <div class="txtinput">
	            <label for="txtpwd"><span class="txt" style="position: relative; bottom: 185px;">내용</span></label>
	            <textarea id="content" name="content" class="idpwd" style="height:200px; resize: none;" placeholder="문의내용을 입력해주세요" ></textarea>
	        </div> 
	        <div id="txtinput">
	            <input type="button" id="btnsignup" name="btnlogin" class="btn" value="문의하기" onclick="ask()">
	            <input type="button" id="btnforgot" name="btnlogin" class="btn" value="돌아가기" onclick="history.back()">
	        </div>
	    </form>
    </div>
  </section>
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
</div>
</body>
</html>