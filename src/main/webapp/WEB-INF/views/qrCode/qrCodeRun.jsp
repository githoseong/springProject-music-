<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>title</title>
  <%@ include file="/WEB-INF/views/include/bs4.jsp" %>
  <script>
	  
  $(function(){$('#btn2').click(function(){
		  var myTimer = setTimeout(function() {
			  $.ajax({
					type  : "post",
					url   : "${ctp}/member/qrPoint",
					success:function(data) {
						if(data != null) {
							part1.innerHTML =	data+"원이 충전되었습니다."
							document.getElementById("circle").style.animationDuration = "0s";
					  	document.getElementById("circle").style.animationIterationCount = "infinite";
						}	
					},
					error : function() {
						alert("전송오류~~");
					}
				});
			  
			}, 4000);
		  
		  var myTimer2 = setTimeout(function() {
			  
			  document.getElementById("circle").style.animationDuration = ".50s";
				document.getElementById("circle").style.animationIterationCount = "9";
		  }, 500);
  	});
  });
  	function start() {
  	/* 	let start = Date.now(), now = start;
	    while (now - start < 3 * 1000) {
	        now = Date.now();
	    } */
	    myTimer2;
  		/* document.getElementById("circle").style.animationDuration = ".8s";
  		document.getElementById("circle").style.animationIterationCount = "5"; */
  		myTimer;
  		
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
    height: 600px;
}
#title0 {
	text-align: center;
	font-size:30px;
	margin-right:40px;
}
#frame {
	width:50%;
	height:100%;
	margin:20px auto;
}
.frame1 {
	width:100%;
	height:100%;
	float:left;
}
.loadingBox .circle {transform:translate(-50%, -50%); width:160px; height:160px;  border-radius:20px; transition:all .5s; 
		border:3px solid;
    animation-name:spinCircle;
    animation-duration:0s;
    animation-iteration-count:infinite;
    animation-timing-function:linear;
    font-size:90px;
    text-align: center;
    padding:10px;
}
.loadingBox {
	margin:100px auto auto 270px;
	height:40%;
}
@keyframes spinCircle {
  from {
      transform:translate(-50%, -50%) rotate(0);
  }
  to {
      transform:translate(-50%, -50%) rotate(360deg);
  }
}
#part1 {
	text-align: center;
	height:15%;
	font-size:22px;
}
#part2 {
	text-align: center;
	height:25%;
}
#btn2 {
	width:250px;
  height: 70px;
  background-color: white;
  border: 1px solid gainsboro;
  font-size:25px;
  border-radius:20px;
}
#btn2:hover {
    cursor: pointer;
    color:rgb(216, 148, 148);
    opacity: 0.8;
}
</style>
<body>
<div id="container">
<jsp:include page="/WEB-INF/views/include/header.jsp"/>
<hr/>
  <div id="section">
	<div id="title0">요금 충전</div>
		<div id="frame">
			<div class="frame1">
				<div class="loadingBox">
			    <div class="circle" id="circle" >?</div>
				</div>
				<div id="part1">
					
				</div>
				<div id="part2">
					<input type="button" id="btn2" value="주사위 굴리기" onclick="start()"/>
				</div>
			</div>
		</div>
	</div>
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>  	
</div>	
</body>
</html>