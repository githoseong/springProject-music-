<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>title</title>
  <jsp:include page="/WEB-INF/views/include/bs4.jsp"/>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
   <script>
  	 function upload(idx1,flag1) {
  		let idx = idx1;
  		let flag = flag1;
  		let query = {
  				idx : idx,
  				flag : flag
  		}
			
  		$.ajax({
    		type  : "post",
    		url   : "${ctp}/admin/bannerChoice",
    		data  : query,
    		success:function(data) {
    			if(data == "1") { 
    				alert("배너가 변경 되었습니다.");
    			}
    			else {
    				alert("배너 변경 실패");
    			}
    		},
    		error : function() {
    			alert("전송오류~~");
    		}
    	});
    } 
  	 
  	function bannerDelete(idx) {
  		let ans = confirm("정말 삭제 하시겠습니까?");
  		if(ans) {
  			location.href="bannerDelete?idx="+idx;
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
    /* height: 1550px; */
}
 #frame {
 	width: 1100px;
 	height: 300px;
 	margin:10px auto;
 }
 .part {
 	width:300px;
 	height: 230px;
 	margin-right:10px;
 	float:left;
 }
.btn22 {
	width:100px;
	height:40px;
	background-color: white;
  border:1px solid rgb(216, 148, 148);
  border-radius: 20px;
} 
.btn22:hover {
	color:rgb(216, 148, 148);
}
.btn2 {
	margin:70px 0px 0px 10px;
}
#upload {
	text-align: right;
	margin:100px 200px 40px auto;
}
#uplo {
    width:13%;
    height: 35px;
    background-color: rgb(248, 248, 248);
    border: 1px solid gainsboro;
} 
#uplo:hover {
		opacity:0.8;
    color: rgb(216, 148, 148);
} 
#footer {
	margin-top : 50px;
}
#bUpload {
	font-size:30px;
	text-align: center;
	margin:50px auto 0px auto;
}
</style>
<body>
<div id="container">
<jsp:include page="/WEB-INF/views/admin/admin2.jsp"/>
	<div id="section">
	<div id="bUpload">배너 업로드</div>
		<div id="upload"><input type="button" value="업로드" onclick="location.href='${ctp}/admin/bannerUpload'" id="uplo"/></div>
		<c:forEach var="vo" items="${vos}">
		<form method="post" name="myForm">
			<div id="frame">
				<div class="part"><img src="${ctp}/banner/${vo.FSName}" style="width:100%; height:100%;"/></div>
				<div class="part"><img src="${ctp}/banner/${vo.FSName2}" style="width:100%; height:100%;"/></div>
				<div class="part"><img src="${ctp}/banner/${vo.FSName3}" style="width:100%; height:100%;"/></div>
				<div style="float:left" class="btn2"><input type="button" value="배너선택" onclick="upload('${vo.idx}','${vo.flag}')" class="btn22"/></div>
				<div style="float:left; margin-top:20px; " class="btn2"><input type="button" value="배너삭제" onclick="bannerDelete(${vo.idx})" class="btn22"/></div>
			</div>
		</form>
		</c:forEach>
	</div>
	
<!-- 블록 페이징 처리 시작 -->
<div class="text-center">
  <ul class="pagination justify-content-center">
	  <c:if test="${pageVO.pag > 1}">
	    <li class="page-item"><a href="banner?pag=1&pageSize=${pageVO.pageSize}" class="page-link text-secondary">◁◁</a></li>
	  </c:if>
	  <c:if test="${pageVO.curBlock > 0}">
	    <li class="page-item"><a href="banner?pag=${(pageVO.curBlock-1)*pageVO.blockSize + 1}&pageSize=${pageVO.pageSize}" class="page-link text-secondary">◀</a></li>
	  </c:if>
	  <c:forEach var="i" begin="${(pageVO.curBlock*pageVO.blockSize)+1}" end="${(pageVO.curBlock*pageVO.blockSize)+pageVO.blockSize}">
	    <c:if test="${i <= pageVO.totPage && i == pageVO.pag}">
	      <li class="page-item active"><a href="banner?pag=${i}&pageSize=${pageVO.pageSize}" class="page-link text-light bg-secondary border-secondary">${i}</a></li>
	    </c:if>
	    <c:if test="${i <= pageVO.totPage && i != pageVO.pag}">
	      <li class="page-item"><a href='banner?pag=${i}&pageSize=${pageVO.pageSize}' class="page-link text-secondary">${i}</a></li>
	    </c:if>
	  </c:forEach>
	  <c:if test="${pageVO.curBlock < pageVO.lastBlock}">
	    <li class="page-item"><a href="banner?pag=${(pageVO.curBlock+1)*pageVO.blockSize + 1}&pageSize=${pageVO.pageSize}" class="page-link text-secondary">▶</a></li>
	  </c:if>
	  <c:if test="${pageVO.pag != pageVO.totPage}">
	    <li class="page-item"><a href="banner?pag=${pageVO.totPage}&pageSize=${pageVO.pageSize}" class="page-link text-secondary">▷▷</a></li>
	  </c:if>
  </ul>
</div>
<!-- 블록 페이징 처리 끝 -->    	
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>	
</div>
</body>
</html>