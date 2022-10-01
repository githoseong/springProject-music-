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
	  AOS.init({
	      easing: 'ease-out-back',
	      duration: 800
	  });
	  
	  
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
    height: 1550px;
}
#new {
    width: 700px;
    height: 300px;
    float: left;
}
.new a {
	color:black;
}
.new a:hover {
	color:black;
}
.new {
    width: 33%;
    height: 49%;
    margin: 1px;
    float: left;
}
.font {
    font-size: 15px;
    font-weight: bolder;
    margin: 30px auto 10px auto;
}
.font2 {
    float: left; width: 30%;
}
#news {
    float: left;
    width: 400px;
    height: 300px;
    margin-left:25px;
    border-bottom: 2px solid lightgray;
}
#news a {
	color:black;
}
#news a:hover {
	color:black;
}
#news2 {
	width:100%;
	height:70%;
}
#news3 {
	width:100%;
	height:10%;
	margin-left:5px;
}
#news4 {
	width:100%;
	height:20%;
	margin-left:5px;
	font-size:15px;
}
#video {
    float: left;
    margin-top: 10px;
    width: 700px;
    height: 400px;
}
#ranking {
    float: left;
    width: 380px;
    margin-left:40px;
}
table {
	border:1px solid gainsboro;
}
</style>
<body>
<div id="container">
<jsp:include page="/WEB-INF/views/include/header.jsp"/>
<div id="sec">
	<section id="section">
    <div id="myCarousel" class="carousel slide" data-ride="carousel">
        <!-- Indicators -->
        <ul class="carousel-indicators" style="z-index: 1;">
        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
        <li data-target="#myCarousel" data-slide-to="1"></li>
        <li data-target="#myCarousel" data-slide-to="2"></li>
        </ul>
        <!-- The slideshow -->
        <div class="carousel-inner">
        <c:if test="${vo.flag == 'OK'}"> 
	        <div class="carousel-item active">
	            <a href="#"><img src="${ctp}/banner/${vo.FSName}" width="100%" height="500px"></a>
	        </div>
	        <div class="carousel-item">
	            <a href="#"><img src="${ctp}/banner/${vo.FSName2}"  width="100%" height="500px" ></a>
	        </div>
	        <div class="carousel-item">
	            <a href="#"><img src="${ctp}/banner/${vo.FSName3}"  width="100%" height="500px" ></a>
	        </div>
	     	</c:if>  
        <c:if test="${vo.flag == 'NO' || vo.flag == null}"> 
	        <div class="carousel-item active">
	            <a href="#">이미지를 업로드 해주세요</a>
	        </div>
	        <div class="carousel-item">
	            <a href="#">이미지를 업로드 해주세요</a>
	        </div>
	        <div class="carousel-item">
	            <a href="#">이미지를 업로드 해주세요</a>
	        </div>
	     	</c:if>  
        </div>
        <!-- Left and right controls -->
        <a class="carousel-control-prev" href="#myCarousel" data-slide="prev">
        <span class="carousel-control-prev-icon"></span>
        </a>
        <a class="carousel-control-next" href="#myCarousel" data-slide="next">
        <span class="carousel-control-next-icon"></span>
        </a>
    </div>
    <div class="font"><a href="${ctp}/new/new?country=국내" style="color:black; text-decoration : none;">최신 앨범 <i class="fa-solid fa-arrow-right"></i></a></div>
    <div id="new">
	    <c:forEach var="vo" items="${vos}">
	        <div class="new"><img src="${ctp}/pds/${vo.FSName2}" style="width:100%; height:100% "/></div>
	       <!--  <div class="new"></div>
	        <div class="new"></div>
	        <div class="new"></div>
	        <div class="new"></div>
	        <div class="new"></div> -->
	    </c:forEach>    
    </div>
	    <div id="news">
		    <c:forEach var="vo" items="${vos4}">
			    <a href="${ctp}/magazine/magazineView?idx=${vo.idx}"><div id="news2"><img src="${ctp}/magazine/${vo.FSName}" style="width:100%; height:100% "/></div></a>    
				  <a href="${ctp}/magazine/magazineView?idx=${vo.idx}"><div id="news3">
				  <c:set var="fdate" value="${fn:substring(vo.FDate,5,10)}"/>
				  	<span style="font-size:20px;">[${fn:replace(fdate,'-','.')}]</span><span style="font-size:18px; font-weight:bold">${fn:substring(vo.title,0,21)}···</span>
				  </div></a>  
				  <a href="${ctp}/magazine/magazineView?idx=${vo.idx}"><div id="news4">${fn:substring(vo.content,0,70)}···</div></a> 
		    </c:forEach>
	    </div>
    <div class="font font2"><a href="${ctp}/video/video" style="color:black; text-decoration : none;">최신 뮤직비디오 <i class="fa-solid fa-arrow-right"></i></a></div>
    <div class="font font2" style="margin-left: 405px;" ><a href="${ctp}/chart/chart" style="color:black; text-decoration : none;">음악 차트 <i class="fa-solid fa-arrow-right"></i></a></div>
    <div id="video">
    	<c:forEach var="vo" items="${vos3}">
        <div class="new">
        	<a href="${ctp}/video/videoView?idx=${vo.idx}"><div style="width:100%;height:70%;"><img src="${ctp}/video/${vo.FSName}" style="width:100%; height:100%;"/></div></a>
        	<a href="${ctp}/video/videoView?idx=${vo.idx}"><div style="height:10%; font-weight:bold">[${vo.title}]</div></a>
        	<a href="${ctp}/video/videoView?idx=${vo.idx}"><div style="height:10%;font-size:15px;">${vo.artist}</div></a>
        	<div style="height:10%; font-size:14px; color:gray;">조회수 ${vo.readNum}</div>
        </div>
       </c:forEach> 
    </div>  
    <div id="ranking">
        <table class="table table-striped">
            <tr style="font-size:14px; font-weight:bold; ">
                <td style="width:15%">순위</td>
                <td style="width:50%">제목</td>
                <td style="width:37%">가수</td>
            </tr>
            <c:forEach var="vo" items="${vos2}" varStatus="st">
	            <tr style="font-size:14px;">
	                <td style="font-size:16px;">${st.count}</td>
	                <c:set var="title" value="${fn:toUpperCase(vo.title)}"/>
	                <c:if test="${fn:length(vo.title) > 14}">
	                	<td>${fn:substring(title,0,14)}··· </td>
	                </c:if>
	                <c:if test="${fn:length(vo.title) <= 14}">
	                	<td>${title}</td>
	                </c:if>
	                <c:set var="artist" value="${fn:toUpperCase(vo.artist)}"/>
	                <c:if test="${fn:length(vo.artist) > 10}">
	                	<td>${fn:substring(artist,0,10)}···</td>
	                </c:if>
	                <c:if test="${fn:length(vo.artist) <= 10}">
	                	<td>${vo.artist}</td>
	                </c:if> 
	            </tr>
            </c:forEach>
        </table>
    </div>
	</section>
</div>
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
</div>
</body>
</html>