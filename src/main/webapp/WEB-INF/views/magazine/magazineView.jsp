<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<% pageContext.setAttribute("newLine", "\n"); %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>title</title>
<jsp:include page="/WEB-INF/views/include/bs4.jsp"/>
<script>
function replyCheck() {
	let content = $("#content2").val();
	let mid = $("#mid").val();
	let idx = $("#idx").val();
	if(content.trim() == "") {
		alert("댓글을 입력하세요!");
		$("#content").focus();
		return false;
	}
	let query = {
		magazineIdx : idx,
		mid      : mid,
		content  : content
	}
	
	$.ajax({
		type  : "post",
		url   : "${ctp}/magazine/magazineComment",
		data  : query,
		success:function(data) {
			if(data == "1") {
				alert("댓글이 입력되었습니다.");
				location.reload();
			}
			else {
				alert("에러");
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
			url   : "${ctp}/magazine/magazineCoDel",
			data  : {idx : cIdx},
			success:function(data) {
				if(data == "1") {
					alert("댓글 삭제 완료.");
					location.reload();
				}
				else {
					alert("댓글 삭제 에러");
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
    width: 60%;
    z-index: 1;
    margin: 40px auto;
}
#photo {
	width:80%;
	height:50%;
	margin:10px auto 50px auto;
}
#content {
	width:80%;
	margin:0px auto;
	font-size:27px;
	letter-spacing: 2px;
	word-spacing: 8px;
	line-height: 40px;
}
#date {
	text-align:left;
	margin:50px 120px 20px auto;
	font-size:20px;
	width:79%;
	height:40px;
}
#footer {
	margin-top:150px;
}
#comment2 {
	margin-left:450px;
	width:60%;
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
</style>
<body>
<div id="container">
<jsp:include page="/WEB-INF/views/include/header.jsp"/>
  <div id="section">
  <hr/>
  <div id="date"><div style="font-size:30px; width:87%; float:left">[${vo.title}] </div><div style="float:left; margin-top:20px;"> ${fn:substring(vo.FDate,0,10)}</div></div>
  	<div id="photo">
  		<img src="${ctp}/magazine/${vo.FSName}" style="width:100%; height:100%;"/>
  	</div>
  	<div id=content>
  		${fn:replace(vo.content,newLine,"<br/>")}
  	</div>
  </div>
  
 <hr/> 
<!-- 댓글 처리(출력/입력) -->
<!-- 댓글 출력 처리 -->
<div id="comment2">
<div id="comment" >
<table class="table table-hover text-center" style="margin-top:50px; width:1000px; ">
<c:if test="${Cvos != null}">
  <c:forEach var="cVo" items="${Cvos}">
    <tr>
      <td style="width:10%;">
        ${cVo.mid}
      </td>
      <td class="text-left" style="width:50%;">
      	${fn:replace(cVo.content,newLine,"<br/>")};
      </td>
      <td style="width:15%;">
        ${fn:substring(cVo.WDate,0,16)}
      </td>
	      <td style="width:25%;">
      <c:if test="${cVo.mid == sMid}">
	      	<input type="button" class="btn2" onclick="javascript:replyDelCheck(${cVo.idx})" value="삭제"/>
      </c:if>
	      </td>
    </tr>
  </c:forEach>
</c:if>  
</table>
</div>
	
<!-- 댓글 입력 -->
<c:if test="${sMid != null}">
<div>
<form name="replyForm" method="post" style="width:100%;" >
	<table class="table text-center" >
	  <tr>
	    <td style="width:85%" class="text-left">
	      <span style="font-size:16px; font-weight:bold;">댓글</span> 
	      <textarea rows="4" name="content" id="content2" class="form-control"></textarea>
	    </td>
	    <td style="width:15%">
	    	<br/>
	    	<p>
	    	${sMid}<br/>
	    	 <input type="button" class="comment btn2" value="댓글쓰기" onclick="replyCheck()"/>
	    	</p>
	    </td>
	  </tr>
	</table>
	<input type="hidden" name="idx" id="idx" value="${vo.idx}"/>
	<input type="hidden" name="mid" id="mid" value="${sMid}"/>
</form>  
</div>
</c:if>      
</div>  
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>  
</div>  
</body>
</html>