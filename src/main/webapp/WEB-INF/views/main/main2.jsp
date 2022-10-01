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
	        <div class="carousel-item active">
	            <a href="#"><img src="${ctp}/banner/${vo.FSName}" width="100%" height="500px"></a>
	        </div>
	        <div class="carousel-item">
	            <a href="#"><img src="${ctp}/banner/${vo.FSName2}"  width="100%" height="500px" ></a>
	        </div>
	        <div class="carousel-item">
	            <a href="#"><img src="${ctp}/banner/${vo.FSName3}"  width="100%" height="500px" ></a>
	        </div>
        </div>
        <!-- Left and right controls -->
        <a class="carousel-control-prev" href="#myCarousel" data-slide="prev">
        <span class="carousel-control-prev-icon"></span>
        </a>
        <a class="carousel-control-next" href="#myCarousel" data-slide="next">
        <span class="carousel-control-next-icon"></span>
        </a>
    </div>
    
	</section>
</div>
</div>
</body>
</html>