<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
			url   : "${ctp}/magazine/magazineGood",
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
    /* height: 1550px; */
}
#title {
    font-size: 27px;
    margin: 30px;
}
#title2 {
    font-size: 20px;
    margin: 30px auto 10px auto;
    font-weight: bold;
}
#time {
    text-align: center;
    font-size: 14px;
    color: rgb(85, 83, 83);
}
#frame {
    width: 100%;
    height: 200px;
    border: 5px solid lightgray;
    text-align: center;
    margin-top: 10px;
}
#time {
    width: 15%;
    float: left;
    margin: 50px auto;
}
#photo {
    width: 30%;
    height: 170px;
    float: left;
    margin: 13px auto;
}
#photo:hover {
	cursor: pointer;
}
#content {
    width: 50%;
    float: left;
    margin: 13px 26px;
    height: 170px;
}
#content2 {
    height: 130px;
    text-align:left;
    margin-left:10px;
}
#content2-1 {
	font-size:23px;
	font-weight:bold;
	margin-bottom:5px;
}
#content3 {
    text-align: left;
    margin-left: 10px;
}
a {
	color:black;
}
#content  a:hover {
	color:black;
}
#footer {
	margin-top:100px;
}
</style>
<body>
<div id="container">
<jsp:include page="/WEB-INF/views/include/header.jsp"/>
  <div id="section">
    <div id="title">매거진</div>
    <hr/>
    <div id="title2">오늘의 매거진</div>
    	<c:forEach var="vo" items="${vos}">
       <div id="frame">
          <div id="time"><span style="font-size:35px">${fn:substring(vo.FDate,8,10)}</span><br>${fn:substring(vo.FDate,0,4)}.0${fn:substring(vo.FDate,6,7)}</div>
          <div id="photo"><img src="${ctp}/magazine/${vo.FSName}" style="width:100%; height:100% " onclick="location.href='${ctp}/magazine/magazineView?idx=${vo.idx}';"/></div>
          <div id="content">
              <div id="content2">
              	<div id="content2-1">
              		<a href="${ctp}/magazine/magazineView?idx=${vo.idx}">[${vo.title}]</a>
              	</div>
              	<div id="content2-2">
              	<c:if test="${fn:length(vo.content) > 140}">
              		<a href="${ctp}/magazine/magazineView?idx=${vo.idx}">${fn:substring(vo.content,0,141)}  ······</a>
              	</c:if>
              	<c:if test="${fn:length(vo.content) <= 140}">
              		<a href="${ctp}/magazine/magazineView?idx=${vo.idx}">${vo.content}</a>
              	</c:if>
              	</div>
              </div>
              <div id="content3"><a href="javascript:goodCheck(${vo.idx})" style="color:black;text-decoration: none"><i class="fa-solid fa-heart" style="color:red"></i>${vo.good}</a> l 댓글 ${vo.cnt} l 조회 ${vo.readNum}</div>
          </div>
    		</div>
    	</c:forEach>	
  	</div>
  	
<!-- 블록 페이징 처리 시작 -->
<div class="text-center">
  <ul class="pagination justify-content-center">
	  <c:if test="${pageVO.pag > 1}">
	    <li class="page-item"><a href="magazine?pag=1&pageSize=${pageVO.pageSize}" class="page-link text-secondary">◁◁</a></li>
	  </c:if>
	  <c:if test="${pageVO.curBlock > 0}">
	    <li class="page-item"><a href="magazine?pag=${(pageVO.curBlock-1)*pageVO.blockSize + 1}&pageSize=${pageVO.pageSize}" class="page-link text-secondary">◀</a></li>
	  </c:if>
	  <c:forEach var="i" begin="${(pageVO.curBlock*pageVO.blockSize)+1}" end="${(pageVO.curBlock*pageVO.blockSize)+pageVO.blockSize}">
	    <c:if test="${i <= pageVO.totPage && i == pageVO.pag}">
	      <li class="page-item active"><a href="magazine?pag=${i}&pageSize=${pageVO.pageSize}" class="page-link text-light bg-secondary border-secondary">${i}</a></li>
	    </c:if>
	    <c:if test="${i <= pageVO.totPage && i != pageVO.pag}">
	      <li class="page-item"><a href='magazine?pag=${i}&pageSize=${pageVO.pageSize}' class="page-link text-secondary">${i}</a></li>
	    </c:if>
	  </c:forEach>
	  <c:if test="${pageVO.curBlock < pageVO.lastBlock}">
	    <li class="page-item"><a href="magazine?pag=${(pageVO.curBlock+1)*pageVO.blockSize + 1}&pageSize=${pageVO.pageSize}" class="page-link text-secondary">▶</a></li>
	  </c:if>
	  <c:if test="${pageVO.pag != pageVO.totPage}">
	    <li class="page-item"><a href="magazine?pag=${pageVO.totPage}&pageSize=${pageVO.pageSize}" class="page-link text-secondary">▷▷</a></li>
	  </c:if>
  </ul>
</div>
<!-- 블록 페이징 처리 끝 -->   
  	
  <jsp:include page="/WEB-INF/views/include/footer.jsp"/>
</div>
	
</body>
</html>