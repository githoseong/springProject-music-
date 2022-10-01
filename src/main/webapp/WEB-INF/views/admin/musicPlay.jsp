<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<% pageContext.setAttribute("newLine", "\n"); %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Music Player</title>
  <jsp:include page="/WEB-INF/views/include/bs4.jsp"/>
  <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
  <script>
    'use strict';
  
	  /* let javaVos2 = new Array();
	  <c:if test="${cBoxLe > 1}">
			<c:forEach var="i" begin="0" end="${cBoxLe - 1}">
				javaVos2[${i}] = ${vos2[i].idx};
			</c:forEach>
	  </c:if> */
	 var idx = '${vos2.get(i).idx}';
   var cBox = '${cBox}';
   var cBox2 = '${cBox2}';
   var cnt = 	'${cnt + 1}' ;
	  
  		var audio1 = document.createElement('audio');
		  audio1.setAttribute('src', '${ctp}/pds/${vo.FSName}'); 
	    window.onload = function () {
		  audio1.load();
		  audio1.play(); 
		  audio1.volume=0;
 			}   
  	// if(!'${vo2.idx}') {
/*   	if(!'${vo2.idx}' && (('${vo.idx}' == '${param.idx}') || ('${vo.idx}' != '${param.idx}'))) { */
  	if(!'${vo2.idx}') {
	  	audio1.addEventListener('timeupdate', function(e){  
					if(document.getElementById("myAudio").currentTime > 60) {
						if(cBox == "") {
							audio1.pause();
							audio1.currentTime = 0; 
							document.getElementById("myAudio").pause();
							document.getElementById("myAudio").currentTime = 0; 
							alert("구매 하지 않은 곡은 1분 미리듣기만 가능합니다.");
							window.location.reload();
						}
						else {
							audio1.pause();
							audio1.currentTime = 0; 
							document.getElementById("myAudio").pause();
							document.getElementById("myAudio").currentTime = 0; 
							if(${cBox2Le != cBox2}) {
								var popX = 500;
								var popY = 550;
								var newX =  (window.screen.width/2) - (popX/2);
								var newY =  (window.screen.height/2) - (popY/2);
					  	  var url = "${ctp}/admin/musicPlay?idx="+cBox2+"&cBox="+cBox+"&cnt="+cnt+"&flag=0";
							  var windowPop = window.open(url,"newWindow","width="+popX+",height="+popY+",left="+newX+",top="+newY);
							}
							else {
								window.close();
							}
						}  
					}	  
		   });	
  	}
  
  		
  
  
  
	  	function prev() {
		  	document.getElementById("myAudio").currentTime -= 10;
		  }
	  	function next() {
		  	document.getElementById("myAudio").currentTime += 10;
		  }
	  	function stop1() {
	  		document.getElementById("myAudio").pause();
	  		document.getElementById("myAudio").currentTime = 0;
	  	}
	  	function prevMusic(idx,cBox,cBox2,cnt,flag,idx3) {
	  		if(cnt != 0) {
	  			var cnt2 = cnt - 2;
	  		}
	  		if(${cBox == null}) {
	  			if(flag == 3) {
	  				for(var i=0; i<100; i++) { 
			  			var popX = 500;
							var popY = 550;
							var newX =  (window.screen.width/2) - (popX/2);
							var newY =  (window.screen.height/2) - (popY/2);
				  	  var url = "${ctp}/admin/musicPlay?idx="+idx3+"&cBox=&cnt=0&flag=3";
						  var windowPop = window.open(url,"newWindow","width="+popX+",height="+popY+",left="+newX+",top="+newY); 
				 		} 
	  			}
	  		}
	  		else {  
					if(${cBox2Le != cBox2}) {
				  		for(var i=0; i<100; i++) { 
				  			var popX = 500;
								var popY = 550;
								var newX =  (window.screen.width/2) - (popX/2);
								var newY =  (window.screen.height/2) - (popY/2);
					  	  var url = "${ctp}/admin/musicPlay?idx="+cBox2+"&cBox="+cBox+"&cnt="+cnt2+"&flag=0";
							  var windowPop = window.open(url,"newWindow","width="+popX+",height="+popY+",left="+newX+",top="+newY); 
		  		 		} 
				  }  
					else {
						window.close();
					}
					if(flag == 3) {
			  		for(var i=0; i<100; i++) { 
			  			var popX = 500;
							var popY = 550;
							var newX =  (window.screen.width/2) - (popX/2);
							var newY =  (window.screen.height/2) - (popY/2);
				  	  var url = "${ctp}/admin/musicPlay?idx="+idx3+"&cBox="+cBox+"&cnt=0&flag=3";
						  var windowPop = window.open(url,"newWindow","width="+popX+",height="+popY+",left="+newX+",top="+newY); 
				 		} 
	  		  }	
				}
	  	}
	  	
	  	function nextMusic(idx,cBox,cBox2,cnt,flag,idx2) {
	  		if(${cBox == null}) {
	  			if(flag == 3) {
	  				for(var i=0; i<100; i++) { 
			  			var popX = 500;
							var popY = 550;
							var newX =  (window.screen.width/2) - (popX/2);
							var newY =  (window.screen.height/2) - (popY/2);
				  	  var url = "${ctp}/admin/musicPlay?idx="+idx2+"&cBox=&cnt=0&flag=3";
						  var windowPop = window.open(url,"newWindow","width="+popX+",height="+popY+",left="+newX+",top="+newY); 
				 		} 
	  			}
	  		}
	  		else {  
					if(${cBox2Le != cBox2}) {
				  		for(var i=0; i<100; i++) { 
				  			var popX = 500;
								var popY = 550;
								var newX =  (window.screen.width/2) - (popX/2);
								var newY =  (window.screen.height/2) - (popY/2);
					  	  var url = "${ctp}/admin/musicPlay?idx="+cBox2+"&cBox="+cBox+"&cnt="+cnt+"&flag=0";
							  var windowPop = window.open(url,"newWindow","width="+popX+",height="+popY+",left="+newX+",top="+newY); 
		  		 		} 
				  }  
					else {
						window.close();
					}
					if(flag == 3) {
			  		for(var i=0; i<100; i++) { 
			  			var popX = 500;
							var popY = 550;
							var newX =  (window.screen.width/2) - (popX/2);
							var newY =  (window.screen.height/2) - (popY/2);
				  	  var url = "${ctp}/admin/musicPlay?idx="+idx2+"&cBox="+cBox+"&cnt=0&flag=3";
						  var windowPop = window.open(url,"newWindow","width="+popX+",height="+popY+",left="+newX+",top="+newY); 
				 		} 
	  		  }	
				}
	  	}
		  	
	  	function openRightMenu() {
	  	  document.getElementById("rightMenu").style.display = "block";
	  	}

	  	function closeRightMenu() {
	  	  document.getElementById("rightMenu").style.display = "none";
	  	}
 
			
	  	function playList() {
	  		document.getElementById("playList").style.boxShadow = "0px 5px 5px white";
	  		document.getElementById("myMusic").style.boxShadow = "0px 1px white";
	  		document.getElementById("musicList").style.display = "none";
	  		document.getElementById("musicList3").style.display = "block";
	  	}
	  	function myMusic() {
	  		document.getElementById("myMusic").style.boxShadow = "0px 5px 5px white";	  	
	  		document.getElementById("playList").style.boxShadow = "0px 1px white";
	  		document.getElementById("musicList").style.display = "block";
	  		document.getElementById("musicList3").style.display = "none";
	  	}
	  	function pa1() {
	  		document.getElementById("circle").style.animationDuration = "0s";
	  		audio1.pause(); 
	  	}
	  	function play1() {
	  		document.getElementById("circle").style.animationDuration = ".8s";
	  		audio1.play();
	  	}
			function nextPlay(idx,cBox,cBox2,cnt,flag,idx2) {
	  	  if(${cBox != null}) {  
					if(${cBox2Le != cBox2}) {
				  		for(var i=0; i<100; i++) { 
				  			var popX = 500;
								var popY = 550;
								var newX =  (window.screen.width/2) - (popX/2);
								var newY =  (window.screen.height/2) - (popY/2);
					  	  var url = "${ctp}/admin/musicPlay?idx="+cBox2+"&cBox="+cBox+"&cnt="+cnt+"&flag=0";
							  var windowPop = window.open(url,"newWindow","width="+popX+",height="+popY+",left="+newX+",top="+newY); 
		  		 		} 
				  }  
					else {
						window.close();
					}
					if(flag == 3) {
			  		for(var i=0; i<100; i++) { 
			  			var popX = 500;
							var popY = 550;
							var newX =  (window.screen.width/2) - (popX/2);
							var newY =  (window.screen.height/2) - (popY/2);
				  	  var url = "${ctp}/admin/musicPlay?idx="+idx2+"&cBox="+cBox+"&cnt=0&flag=3";
						  var windowPop = window.open(url,"newWindow","width="+popX+",height="+popY+",left="+newX+",top="+newY); 
				 		} 
	  		  }	
				}
	  	  else {
	  		  if(flag == 3) {
			  		for(var i=0; i<100; i++) { 
			  			var popX = 500;
							var popY = 550;
							var newX =  (window.screen.width/2) - (popX/2);
							var newY =  (window.screen.height/2) - (popY/2);
				  	  var url = "${ctp}/admin/musicPlay?idx="+idx2+"&cBox=&cnt=0&flag=3";
						  var windowPop = window.open(url,"newWindow","width="+popX+",height="+popY+",left="+newX+",top="+newY); 
				 		} 
	  		  }	
	  	  }
			}  
			
			function showLyrics() {
				document.getElementById("lyrics").style.display="block";
			}
			function closeLyrics() {
				document.getElementById("lyrics").style.display="none";
			}
  </script>
	<style>
		#container {
			width:100%;
			height:100%;
			background: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.4)), url("${ctp}/pds/${vo.FSName2}");
			opacity: 0.5;
			background-size: cover;
		}
		#lyrics {
			width:100%;
			height:100%;
			background: black;
			opacity: 0.7;
			position: fixed;
			z-index: 2;
			display: none;
			cursor: default;
		}
		::-webkit-scrollbar {
		  display: none;
		}
		#lyrics2 {
			width:50%;
			height:80%;
			margin:50px auto;
			color:white;
			overflow:auto;
			text-align: center;
			line-height: 30px;
		}
	  .peach {
		  font-size: 50px;
		  font-weight: bold;
		  color: rgb(216, 148, 148);
		  text-decoration: none
	  }
	  #music {
			height:147px;
			padding:7px;
		}
		/* body {
			background-image: url('${ctp}/pds/${vo.FSName2}');
			background-size: cover;
			position: relative;
		} */
		#main1 {
			height:400px; 
			text-align: center;
			padding:1px 0px;
		}
		#myAudio {
			width:350px;
			margin:0px auto;
		}
		#main2 {
			opacity: 0.7;
		}
		#main2:hover {
			opacity: 1;
		}
		.time1 {
	    border: 1px solid gainsboro;
			border-radius: 30px;
			float:left;
			background-color: white;
			width:35px;
			height:30px;
			cursor:pointer;
			padding:3px;
			font-size:14px;
			margin-left:10px;
		}
		
	.loadingBox .circle1 {position:fixed; left:46.3%; top:27%;width:35px; height:35px; border-radius:50em; border:1px solid gray; background:rgba(0,0,0,1); z-index: 0} 
	.loadingBox .circle {position:fixed; left:50%; top:30%; transform:translate(-50%, -50%); width:140px; height:140px;  border-radius:50em; transition:all .2s; z-index: 0;
	    background-image: url('${ctp}/pds/${vo.FSName2}');
	    animation-name:spinCircle;
	    animation-duration:.8s;
	    animation-iteration-count:infinite;
	    animation-timing-function:linear;
	}
	
	@keyframes spinCircle {
	    from {
	        transform:translate(-50%, -50%) rotate(0);
	    }
	    to {
	        transform:translate(-50%, -50%) rotate(360deg);
	    }
	}

	#artist {
		font-size:15px;
		color:white;
		margin-top:250px;
	}
	#title {
		font-size:15px;
		color:white;
	}
	.icon {
		position:absolute;
		top:10px;
		right:20px;
		font-size:30px;
		color:rgb(221, 221, 221);
		cursor: pointer;
	}
	.icon:hover {
		color:white;
	}
	#rightMenu {
		background: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.4));
		width:300px;
	}
	#musicMenu {
		width:100%;
		height:50px;
		margin-top:50px;
		
	}
	#playList {
	 	float:left;
	 	color:white;
	 	width:50%;
	 	height:50px;
	 	font-size:25px;
	 	padding:10px 0px;
	 	box-shadow: 0px 5px 5px white;
	}
	#myMusic {
	 	float:left;
	 	color:white;
	 	width:50%;
	 	height:50px;
	 	font-size:25px;
	 	padding:10px 0px;
	 	box-shadow: 0px 1px white;
	}
	.musicMenu2:hover {
		cursor: pointer;
	}
	#musicList {
		width:100%;
		overflow: auto; 
		color:white;
		text-align: left;
		display: none;
	}
	#musicList2 {
		margin: 20px 0;
		font-size:16px;
	}
	#musicList2 > a:hover {
		text-decoration: none;
		color:white;
		font-weight:bold;
	} 
	#musicList3 {
		width:100%;
		overflow:auto;
		color:white;
		text-align: left;
	}
	#musicList4 {
		margin: 20px 0;
		font-size:16px;
	}
	#sub {
		width:50%;
		text-align:center;
		margin:0px auto;
	}
	</style>
</head>
<body>
<div id="container">
<div id="lyrics" onclick="closeLyrics()">
	<div id="lyrics2">
			${fn:replace(vo.content,newLine,"<br/>")}
	</div>
</div>
	<div id="main1" >
		<div class="icon" onclick="openRightMenu()"><i class="fa-solid fa-list-ul"></i></div>
		<div class="w3-sidebar w3-bar-block w3-card w3-animate-right" style="display:none;right:0;" id="rightMenu">
		  <div onclick="closeRightMenu()" class="icon"><i class="fa-solid fa-list-ul"></i></div>
		  <div id="musicMenu">
		  	<div class="musicMenu2" id="playList" onclick="playList()">Play List</div>
		  	<div class="musicMenu2" id="myMusic" onclick="myMusic()">My Music</div>
		  </div>
		  <div class="musicList" id="musicList">
		  	<c:forEach var="vo" items="${vos}" varStatus="st">
		  		<div id="musicList2"><a href="${ctp}/admin/musicPlay?idx=${vo.idx}&cBox=${cBox}&cnt=${cnt}&flag=3"> ${st.count}. ${vo.artist} - ${vo.title}</a></div>
		  	</c:forEach>	 
		  </div>
		  <div class="musicList" id="musicList3">
		  	<c:forEach var="vo2" items="${vos2}" varStatus="st2">
		<%--   		<div id="musicList4"><a href="${ctp}/admin/musicPlay?idx=${vo2.idx}&cBox=${cBox}&cnt=${cnt}&flag=1"> ${st2.count}. ${vo2.artist} - ${vo2.title}</a></div> --%>
		  		<div id="musicList4"><a href="${ctp}/admin/musicPlay?idx=${vo2.idx}&cBox=${cBox}&cnt=${st2.index}&flag=1"> ${st2.count}. ${vo2.artist} - ${vo2.title}</a></div>
		  	</c:forEach>		 
		  </div>
		</div>
		<div id="artist">${vo.artist}</div>
		<div id="title">${vo.title}</div>
	</div>
		<div class="loadingBox" onclick="showLyrics()">
	    <div class="circle" id="circle"></div>
			<div class="circle1" ></div>
		</div>
			
		<div id="main2">
			<div id="sub">
						<span onclick="prevMusic('${vos2.get(i).idx}','${cBox}','${cBox2}','${cnt + 1}','${flag}','${vo3.idx-1}')" class="time1"><i class="fa-solid fa-angles-left"></i></span>
						<span onclick="prev()" class="time1">-10</span>
						<span onclick="stop1()" class="time1">■</span>
						<span onclick="next()" class="time1">+10</span>
						<span onclick="nextMusic('${vos2.get(i).idx}','${cBox}','${cBox2}','${cnt + 1}','${flag}','${vo.idx+1}')" class="time1"><i class="fa-solid fa-angles-right"></i></span>
			</div>
			<div id="music" >
				<div style="margin:0 auto; width:360px;"><audio src="${ctp}/pds/${vo.FSName}" controlsList="nodownload" autoplay controls id="myAudio" onpause="pa1()" onplay="play1()" onended="nextPlay('${vos2.get(i).idx}','${cBox}','${cBox2}','${cnt + 1}','${flag}','${vo.idx+1}')" ></audio></div>
			</div>	
		</div>
</div>
</body>
</html>