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
<script>
	function check() {
		let ans = confirm("문의내역을 삭제하시겠습니까?");
		if(ans) {
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
  	<div id="frame">
	    <form name="myForm" method="post">    
	      <div id="login">
	          <h2 style="font-weight:bold">1:1 문의 내역</h2>
	      </div>
	      <div class="txtinput">
	          <label for="txtid"><span class="txt">아이디</span></label>
	          <input type="text" id="txtid"  name="mid" class="idpwd" value="${vo.mid}" style="margin-left:35px;" disabled/><br/>
	      </div>          
	      <div class="txtinput">
	          <label for="txtpwd"><span class="txt">제목</span></label>
	          <input type="text"  id="txtpwd" name="title" class="idpwd" value="${vo.title}" maxlength="20" disabled/>
	      </div> 
	      <div class="txtinput">
	          <label for="txtpwd"><span class="txt" style="position: relative; bottom: 185px;">내용</span></label>
	          <textarea id="txtpwd" name="content" class="idpwd" style="height:200px;" disabled>${vo.content}</textarea>
	      </div> 
	      <div id="txtinput">
	          <input type="button" id="btnsignup" name="btnlogin" class="btn" value="삭제하기" onclick="check()"></a>
	          <input type="button" id="btnforgot" name="btnlogin" class="btn" value="돌아가기" onclick="history.back()"></a>
	      </div>
	      <input type="hidden" name="idx" value="${vo.idx}"/>
	  	</form>
	  </div>
	
	
<!-- 댓글 출력 처리 -->
<table class="table table-hover text-center" style="margin-top:50px; width:1000px; ">
<c:if test="${Cvos != null}">
  <c:forEach var="cVo" items="${Cvos}">
    <tr>
      <td style="width:10%;">
        운영자
      </td>
      <td class="text-left" style="width:50%;">
      	${cVo.content}
      </td>
      <td style="width:15%;">
        ${cVo.WDate}
      </td>
    </tr>
  </c:forEach>
</c:if>  
</table>	
</section>
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
</div>
</body>
</html>