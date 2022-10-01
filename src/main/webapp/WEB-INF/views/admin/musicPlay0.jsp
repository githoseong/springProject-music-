<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Music Player</title>
  <jsp:include page="/WEB-INF/views/include/bs4.jsp"/>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script>
  /*
  window.onload = function () {
   var audio1 =  document.getElementById("myAudio");
	  alert(Number(audio1.duration));
  }
   audio1.addEventListener('timeupdate', function(e){  
	   alert("1");
		// 현재 재생 시간 (초 단위 절삭)      
		var playtime = Math.floor(audio1.currentTime); 
		// 전체 재생 시간 (초 단위 절삭)      
		var total = Math.floor(audio1.duration);   
		if(playtime == 5) {
			 audio1.pause();
			 audio1.currentTime = 0; 
			 demo.innerHTML = "구매 하지 않은 곡은 1분 미리듣기만 가능합니다."
		  }
  }
 */
    $(document).ready(function(){
    	//alert("asdf");
    	
    	var audio1 =  document.getElementById("myAudio");
  	  alert(Number(audio1.duration));
    });
  </script>
	<style>
	  .peach {
		  font-size: 50px;
		  font-weight: bold;
		  color: rgb(216, 148, 148);
		  text-decoration: none
	  }
	  #music {
			padding:30px;
			height:150px;
			background-color:rgb(235, 236, 236);
		}
	</style>
</head>
<body>
<div class="peach">peach<i class="fa-solid fa-seedling"></i> </div>
<div id="music" >
	<div id="demo"></div>
	<audio src="${ctp}/pds/${vo.FSName}" autoplay controls id="myAudio">오디오</audio>
</div>	
</body>
</html>