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
  function delete1(idx) {
		let ans = confirm("정말 삭제 하시겠습니까?");
		if(ans) {
			location.href="videoDelete?idx="+idx;
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
    height: 1200px; 
}
.frame {
    width: 570px;
    height: 150px;
    padding: 5px;
    float:left;
    margin-left:5px;
}
.video {
    width: 50%;
    height: 140px;
    float: left;
}
.content {
    width: 40%;
    height: 140px;
    float: left;
    margin-left: 10px;
}
#frame {
	width: 1160px;
	height: 160px;
}
#upload {
	text-align: right;
	margin:100px 50px 40px auto;
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
#vUpload {
	font-size:30px;
	text-align: center;
	margin:50px auto 0px auto;
}
</style>
<body>
<div id="container">
<jsp:include page="/WEB-INF/views/admin/admin2.jsp"/>
  <div id="section">
  <div id="vUpload">동영상 업로드</div>
		<div id="upload"><input type="button" value="업로드" onclick="location.href='${ctp}/video/videoUpload'" id="uplo"/></div>
			<div id="frame">
				<c:forEach var="vo" items="${vos}">
		      <div class="frame">
	          <div class="video"><img src="${ctp}/video/${vo.FSName}" style="width:100%; height:100%;"/></div>
	          <div class="content">
	          	<div style="font-size:20px; font-weight:bold;">${vo.artist}</div>
	          	<div style="height:75px; font-size:14px; margin-top:5px;">${vo.content}</div>
	          	<div style="font-size:14px;">
	          		<span>❤ ${vo.good} </span><span style="margin-left:5px;"> 조회수 ${vo.readNum} </span>
	          		<span>
		          		<input type="button" value="수정" onclick="location.href='videoUpdate?idx=${vo.idx}';"/>
		          		<input type="button" value="삭제" onclick="delete1(${vo.idx})"/>
	          		</span>
	          	</div>
	          </div>
		      </div> 
				</c:forEach> 
			</div> 
	</div>
	
<!-- 블록 페이징 처리 시작 -->
<div class="text-center">
  <ul class="pagination justify-content-center">
	  <c:if test="${pageVO.pag > 1}">
	    <li class="page-item"><a href="videoList?pag=1&pageSize=${pageVO.pageSize}" class="page-link text-secondary">◁◁</a></li>
	  </c:if>
	  <c:if test="${pageVO.curBlock > 0}">
	    <li class="page-item"><a href="videoList?pag=${(pageVO.curBlock-1)*pageVO.blockSize + 1}&pageSize=${pageVO.pageSize}" class="page-link text-secondary">◀</a></li>
	  </c:if>
	  <c:forEach var="i" begin="${(pageVO.curBlock*pageVO.blockSize)+1}" end="${(pageVO.curBlock*pageVO.blockSize)+pageVO.blockSize}">
	    <c:if test="${i <= pageVO.totPage && i == pageVO.pag}">
	      <li class="page-item active"><a href="videoList?pag=${i}&pageSize=${pageVO.pageSize}" class="page-link text-light bg-secondary border-secondary">${i}</a></li>
	    </c:if>
	    <c:if test="${i <= pageVO.totPage && i != pageVO.pag}">
	      <li class="page-item"><a href='videoList?pag=${i}&pageSize=${pageVO.pageSize}' class="page-link text-secondary">${i}</a></li>
	    </c:if>
	  </c:forEach>
	  <c:if test="${pageVO.curBlock < pageVO.lastBlock}">
	    <li class="page-item"><a href="videoList?pag=${(pageVO.curBlock+1)*pageVO.blockSize + 1}&pageSize=${pageVO.pageSize}" class="page-link text-secondary">▶</a></li>
	  </c:if>
	  <c:if test="${pageVO.pag != pageVO.totPage}">
	    <li class="page-item"><a href="videoList?pag=${pageVO.totPage}&pageSize=${pageVO.pageSize}" class="page-link text-secondary">▷▷</a></li>
	  </c:if>
  </ul>
</div>
<!-- 블록 페이징 처리 끝 -->  	
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
</div>
</body>
</html>