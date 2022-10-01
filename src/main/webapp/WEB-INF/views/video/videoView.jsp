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
    height: 1000px;
}
#title {
	font-size:30px;
	font-weight:bold;
	margin:20px auto;
}
</style>
<body>
<div id="container">
<jsp:include page="/WEB-INF/views/include/header.jsp"/>
<hr/>
  <div id="section">
  	<div id="title">영상 정보</div>
  	<div>${vo.link}</div>
  	<div style="font-size:25px; margin:10px auto;"><span style="font-weight:bold">[${vo.title}] </span><span style="font-size:23px;"> ${vo.artist}</span></div>
  	<div style="font-size:25px;"><a href="javascript:goodCheck(${vo.idx})" style="color:black;text-decoration: none">❤ ${vo.good}</a><span style="margin-left:900px;font-size:20px;">${fn:substring(vo.release1,0,4)}-${fn:substring(vo.release1,4,6)}-${fn:substring(vo.release1,6,8)}
  		<i class="fa-solid fa-eye" style="margin-left:10px"></i> ${vo.readNum}</span></div>
<hr/>
  </div>
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
</div>  
</body>
</html>