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
  function start(idx,fsname) {
		//var audio1 = new Audio("${ctp}/pds/"+fsname);
		  //audio1.loop = false; // 반복재생하지 않음
		  //audio1.volume = 0.5; // 음량 설정
		var popX = 500;
		var popY = 550;
		var newX =  (window.screen.width/2) - (popX/2);
		var newY =  (window.screen.height/2) - (popY/2);
		
		let url = "${ctp}/admin/musicPlay?idx="+idx+"&cBox=&cnt=0&flag=0";
	/* window.open(url,"newWindow","width=350px,height=150px","left=500px"); */
	var windowPop = window.open(url,"newWindow","width="+popX+",height="+popY+",left="+newX+",top="+newY);
		  //audio1.play(); // 재생
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
    /* height: 1500px; */
}
.search1 {
	width:100%;
	height:19%;
	margin-top:0px;
}
.search11 {
	width:33.3%;
	height:70px;
	float:left;
}
.title1 {
	margin-top:50px;
	font-size:25px;
	float:left;
	width:100%;
	height:50px;
	font-weight: bold;
}
.search22 {
	border:1px solid lightgray;
	width:20%;
	float:left;
	height:210px;
}
.search33 {
	border:1px solid lightgray;
	width:50%;
	float:left;
	height:105px;
}
.search44 {
	border:1px solid lightgray;
	width:50%;
	height:95px;
	float:left;
}
.btn {
	border:1px solid gainsboro;
	border-radius:30px;
	width:35px;
	height:35px;
	padding:5px;
}
.btn:hover {
	color:rgb(216, 148, 148);
}
.search44  a {
	color:black;
} 
.point1:hover {
	cursor: pointer;
}

</style>
<body>
<div id="container">
<jsp:include page="/WEB-INF/views/include/header.jsp"/>
<hr/>
  <div id="section">
  <div class="title1">음악 검색</div>
  	<div id="music" class="search1">
  	<c:if test="${empty vos[0].idx}"><div style="font-weight:bold;">검색 결과가 없습니다.</div></c:if>
  			<c:forEach var="vo" items="${vos}" varStatus="st">
		  		<div class="search11">
		  			<table style="width:100%;height:100%; text-align: center;">
		  				<tr style="font-size:13px;">
		  					<td style="width:15%;" >번호</td>
		  					<td style="width:40%">제목</td>
		  					<td style="width:35%">가수</td>
		  					<td style="width:10%">듣기</td>
		  				</tr>
		  				<tr>
		  					<td style="text-align: center; ">${st.count}</td>
		  					<td>${vo.title}</td>
		  					<td>${vo.artist}</td>
		  					<td><button type="button" onclick="start(${vo.idx})" class="btn"><i class="fa-solid fa-play"></i></button></td>
		  				</tr>
		  			</table>
		  		</div>
  			</c:forEach>	
  		<div style="text-align:right; height:30px; float:left;width:100%; "></div>
  	</div>
  	<div class="title1">뮤직비디오 검색</div>
  	<div id="video" class="search1">
  	<c:if test="${empty vos2[0].idx}"><div style="font-weight:bold;">검색 결과가 없습니다.</div></c:if>
  		<c:forEach var="vo" items="${vos2}" varStatus="st">
	  		<div class="search22" onclick="location.href='${ctp}/video/videoView?idx=${vo.idx}';">
	  			<div style="width:100%; height:80%; "><img src="${ctp}/video/${vo.FSName}" id="video" style="width:100%; height:100%;"class="point1" onclick="location.href='${ctp}/video/videoView?idx=${vo.idx}'"/> </div>
	  			<div style="font-size:20px;" class="point1">${vo.title}</div>
	  		</div>
  		</c:forEach>
	  		<div style="text-align:right; height:30px; float:left;width:100%; "></div>
  	</div>
  	<div class="title1">매거진 검색</div>
  	<div id="megazine" class="search1">
  	<c:if test="${empty vos3[0].idx}"><div style="font-weight:bold;">검색 결과가 없습니다.</div></c:if>
	  	<c:forEach var="vo" items="${vos3}" varStatus="st">
	  		<div class="search33" onclick="location.href='${ctp}/magazine/magazineView?idx=${vo.idx}';">
	  			<div style="border:1px solid lightgray; width:10%; height:100%; float:left;">
	  				<div style="height:50%; font-size:28px; text-align: center; padding:10px 0px;">${fn:substring(vo.FDate,9,10)}</div>
	  				<div style="height:25%; text-align: center; font-size:13px;">${fn:substring(vo.FDate,0,4)}</div>
	  				<div style="height:25%; text-align: center; font-size:13px;">${fn:substring(vo.FDate,5,7)}</div>
	  			</div>
	  			<div style="border:1px solid lightgray; width:50%; height:100%; float:left;">
	  				<img src="${ctp}/magazine/${vo.FSName}" style="width:100%; height:100% "class="point1" onclick="location.href='${ctp}/magazine/magazineView?idx=${vo.idx}';"/>
	  			</div>
	  			<div style="border:1px solid lightgray; width:40%; height:100%; float:left; font-size:20px; font-weight:bold;" class="point1">
	  				${vo.title}
	  			</div>
	  		</div>
	  	</c:forEach>	
	  		<div style="text-align:right; height:30px; float:left;width:100%;"></div>
  	</div>
  	<div class="title1">게시판 검색</div>
  	<div id="board" class="search1">
	  		<c:if test="${empty vos4[0].idx}"><div style="font-weight:bold;">검색 결과가 없습니다.</div></c:if>
	  	<c:forEach var="vo" items="${vos4}" varStatus="st">
	  		<div class="search44">
	  			<div style="font-size:26px; "><a href="${ctp}/board/boardContent?idx=${vo.idx}&pag=5&pageSize=5&genre=${vo.genre}&style=${vo.style}&flag=1" style="text-decoration: none;">${vo.title}</a></div>
	  			<div style="text-align:right; font-size:15px;">
	  				<span>${fn:substring(vo.WDate,0,10)} </span><span>&nbsp;<span style="font-size:18px; color:orange;"> ID</span> ${vo.mid}</span>
	  			</div>
	  		</div>
	  	</c:forEach>	
	  		<div style="text-align:right; height:30px; float:left;width:100%;  margin-bottom: 50px;"></div>
  	</div>
  </div>
</div>  
</body>
</html>