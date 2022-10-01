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
	
	function replyCheck() {
		let content = $("#content2").val();
		if(content.trim() == "") {
			alert("댓글을 입력하세요!");
			$("#content").focus();
			return false;
		}
		let query = {
			askIdx : '${vo.idx}',
			mid      : '${sMid}',
			name     :'${vo.name}',
			content  : content
		}
		
		$.ajax({
			type  : "post",
			url   : "${ctp}/admin/adminAskComment",
			data  : query,
			success:function(data) {
				if(data == "1") {
					alert("문의 답변 완료.");
					location.reload();
				}
				else {
					alert("문의 답변 에러");
				}
			},
			error : function() {
				alert("전송오류!");
			}
		});
	}
	function replyDelCheck(cIdx) {
		let ans = confirm("답변을 삭제하시겠습니까?");
		if(ans) {
			$.ajax({
				type  : "post",
				url   : "${ctp}/admin/adminAskCommentDel",
				data  : {idx : cIdx},
				success:function(data) {
					if(data == "1") {
						alert("답변 삭제 완료.");
						location.reload();
					}
					else {
						alert("답변 삭제 에러");
					}
				},
				error : function() {
					alert("전송오류!");
				}
			});
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
    width: 55%;
    z-index: 1;
    margin: 40px auto;
    /* height: 1550px; */
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
.btn2 {
	width:100px;
  height: 45px;
  background-color: white;
  border: 1px solid gainsboro;
}
.btn2:hover {
    cursor: pointer;
    color:rgb(216, 148, 148);
    opacity: 0.8;
}
#footer {	
	margin-top : 100px;
}
</style>
<body>
<div id="container">
<jsp:include page="/WEB-INF/views/admin/admin2.jsp"/>
	<div id="section">
    <form name="myForm" method="post">    
      <div id="login">
          <h2 style="font-weight:bold">1:1 문의 내역</h2>
      </div>
      <div class="txtinput">
          <label for="txtid"><span class="txt">아이디</span></label>
          <input type="text" id="txtid" value="${vo.mid}" name="mid" class="idpwd"  style="margin-left:35px;" disabled/><br/>
      </div>          
      <div class="txtinput">
          <label for="txtpwd"><span class="txt">제목</span></label>
          <input type="text" value="${vo.title}" id="txtpwd" name="txtpwd" class="idpwd"  maxlength="20" disabled/>
      </div> 
      <div class="txtinput">
          <label for="txtpwd"><span class="txt" style="position: relative; bottom: 185px;">내용</span></label>
          <textarea id="txtpwd" name="txtpwd" class="idpwd" style="height:200px; "  disabled>${vo.content}</textarea>
      </div> 
      <div id="txtinput">
          <input type="button" id="btnsignup" name="btnlogin" class="btn2" value="삭제하기" onclick="check()">
          <input type="button" id="btnforgot" name="btnlogin" class="btn2" value="돌아가기" onclick="history.back()">
      </div>
      <input type="hidden" name="idx" value="${vo.idx}"/>
    </form>
  </div>
<br/><br/>
    
<!-- 댓글 처리(출력/입력) -->
<!-- 댓글 출력 처리 -->
<div style="width:60%; margin:0px auto;" >
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
        ${fn:substring(cVo.WDate,0,16)}
      </td>
      <td style="width:25%;">
      	<input type="button" class="btn2" onclick="javascript:replyDelCheck(${cVo.idx})" value="삭제"/>
      </td>
    </tr>
  </c:forEach>
</c:if>  
</table>
	
<!-- 댓글 입력 -->
<c:if test="${sMid != null}">

<form name="replyForm" method="post" style="width:100%;" >
	<table class="table text-center" >
	  <tr>
	    <td style="width:85%" class="text-left">
	      <span style="font-size:16px; font-weight:bold;">답변</span> 
	      <textarea rows="4" name="content" id="content2" class="form-control"></textarea>
	    </td>
	    <td style="width:15%">
	    	<br/>
	    	<p>
	    	 <input type="button" class="comment btn2" value="답변하기" onclick="replyCheck()"/>
	    	</p>
	    </td>
	  </tr>
	</table>
	<input type="hidden" name="idx" value="${vo.idx}"/>
	<input type="hidden" name="mid" value="${sMid}"/>
	<input type="hidden" name="name" value="${vo.name}"/>
</form>  
</c:if>      
</div>
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>	
</div>
</body>
</html>