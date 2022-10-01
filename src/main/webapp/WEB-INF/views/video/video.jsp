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
  function goodCheck(idx) {
		$.ajax({
			type  : "post",
			url   : "${ctp}/video/videoGood",
			data  : {idx : idx},
			success:function(data) {
				if(data == "1") alert("이미 추천을 누르셨습니다.");
				else location.reload();
			},
			error : function() {
				alert("전송오류~~");
			}
		});
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
#title {
    font-size: 27px;
    margin: 30px;
}
#time {
    text-align: center;
    font-size: 30px;
    color: rgb(85, 83, 83);
}
#part {
    text-align: right;
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
#video:hover {
	cursor: pointer;
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
a {
color:black;
}
#frame a:hover {
color:black;
}
</style>
<body>
<div id="container">
<jsp:include page="/WEB-INF/views/include/header.jsp"/>
  <div id="section">
    <div id="title">뮤직 비디오</div>
    <div id="part">
        <a href="${ctp}/video/video?order=인기순">인기순</a> l 
        <a href="${ctp}/video/video?order=최신순">최신순</a> l 
        <a href="${ctp}/video/video?order=가나다순">가나다순</a>
    </div>
    <hr/>
	    <div id="frame">
    		<c:forEach var="vo" items="${vos}">
		      <div class="frame">
		          <div class="video"><img src="${ctp}/video/${vo.FSName}" id="video" style="width:100%; height:100%;" onclick="location.href='${ctp}/video/videoView?idx=${vo.idx}'"/></div>
		          <div class="content">
		          	<div style="font-size:20px; font-weight:bold;"><a href="${ctp}/video/videoView?idx=${vo.idx}">${vo.artist}</a></div>
		          	<div style="height:75px; font-size:14px; margin-top:5px;"><a href="${ctp}/video/videoView?idx=${vo.idx}">${vo.content}</a></div>
		          	<div style="font-size:14px;"><a href="javascript:goodCheck(${vo.idx})">❤ ${vo.good}</a><span style="margin-left:5px;"> 조회수 ${vo.readNum}</span></div>
		          </div>
		      </div> 
    		</c:forEach> 
	    </div>   
  </div>
  
  <!-- 블록 페이징 처리 시작 -->
<div class="text-center">
  <ul class="pagination justify-content-center">
	  <c:if test="${pageVO.pag > 1}">
	    <li class="page-item"><a href="video?pag=1&pageSize=${pageVO.pageSize}" class="page-link text-secondary">◁◁</a></li>
	  </c:if>
	  <c:if test="${pageVO.curBlock > 0}">
	    <li class="page-item"><a href="video?pag=${(pageVO.curBlock-1)*pageVO.blockSize + 1}&pageSize=${pageVO.pageSize}" class="page-link text-secondary">◀</a></li>
	  </c:if>
	  <c:forEach var="i" begin="${(pageVO.curBlock*pageVO.blockSize)+1}" end="${(pageVO.curBlock*pageVO.blockSize)+pageVO.blockSize}">
	    <c:if test="${i <= pageVO.totPage && i == pageVO.pag}">
	      <li class="page-item active"><a href="video?pag=${i}&pageSize=${pageVO.pageSize}" class="page-link text-light bg-secondary border-secondary">${i}</a></li>
	    </c:if>
	    <c:if test="${i <= pageVO.totPage && i != pageVO.pag}">
	      <li class="page-item"><a href='video?pag=${i}&pageSize=${pageVO.pageSize}' class="page-link text-secondary">${i}</a></li>
	    </c:if>
	  </c:forEach>
	  <c:if test="${pageVO.curBlock < pageVO.lastBlock}">
	    <li class="page-item"><a href="video?pag=${(pageVO.curBlock+1)*pageVO.blockSize + 1}&pageSize=${pageVO.pageSize}" class="page-link text-secondary">▶</a></li>
	  </c:if>
	  <c:if test="${pageVO.pag != pageVO.totPage}">
	    <li class="page-item"><a href="video?pag=${pageVO.totPage}&pageSize=${pageVO.pageSize}" class="page-link text-secondary">▷▷</a></li>
	  </c:if>
  </ul>
</div>
<!-- 블록 페이징 처리 끝 -->  
  
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
</div>
</body>
</html>