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
	function memCheck() {
		var popX = 400;
		var popY = 230;
		var newX =  (window.screen.width/2) - (popX/2);
		var newY =  (window.screen.height/2) - (popY/2);
		
		let url = "${ctp}/member/memCheck";
	var windowPop = window.open(url,"newWindow","width="+popX+",height="+popY+",left="+newX+",top="+newY+",scroll=no");
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
#title0 {
	text-align:center;
	font-size:28px;		
	margin:50px;
} 
#main1 {
	border:1px solid lightgray;
	height:100px;
}
#main1-1 {
	width:8%;
	height:90%;
	margin:5px auto 5px 5px;
	float:left;
}
#main1-2 {
	height:90%;
	border-left:1px solid lightgray;
	float:left;
	margin:3px auto auto 20px;
	padding:30px;
	font-size:15px;
}
#main2 {
	height:200px;
	border:1px solid lightgray;
	margin:30px auto;
}
#main2-1 {
	width:60%;
	float:left;
	height:100%;
	padding:30px;
	font-size:40px;
	font-weight:bold;
}
#main2-2 {
	width:15%;
	float:left;
	height:100%;
	padding:20px;
	text-align:center;
	font-size:15px;
}
#main2-3 {
	width:25%;
	float:left;
	height:100%;
	padding:20px;
	text-align:right;
	font-size:15px;
}
#main3 {
	height:500px;
}
.main3 {
	border:1px solid lightgray;
	width: 18.2%;
	height: 220px;
	margin:10px;
	float:left;
	text-align:center;
}
.main3:hover {
	border:1px solid black;
}
.icon {
	font-size:38px;
	margin-top:20px;
	color:gray;
}
.icon2 {
	font-size:20px;
}
.icon3 {
	font-size:11px;
}
.icon4 {
	font-size:12px;
	color:gray;
	width:130px;
	margin:20px auto;
}
.main3 a {
	color: inherit;
	text-decoration: none;
}
#peach0 {
	font-size: 20px;
  font-weight: bold;
  }
</style>
<body>
<div id="container">
<jsp:include page="/WEB-INF/views/include/header.jsp"/>
<hr/>
  <div id="section">
  	<div id="title0">MY PAGE</div>
  	<div id="main1">
  		<div id="main1-1"><img src="${ctp}/member/${vo.photo}" style="width:100%;height:100%;"/> </div>
  		<div id="main1-2"><span id="peach0">peach<i class="fa-solid fa-seedling"></i></span>에 오신 것을 환영합니다. <span style="font-weight:bold;">${vo.name}</span>님은 <span style="font-weight:bold;">
  		<c:if test="${vo.level == 1}">
  		[준회원]
  		</c:if>
  		<c:if test="${vo.level == 2}">
  		[정회원]
  		</c:if>
  		<c:if test="${vo.level == 3}">
  		[우수회원]
  		</c:if>
  		<c:if test="${vo.level == 0}">
  		[운영자]
  		</c:if>
  		</span>입니다.</div>
  	</div>
  	<div id="main2">
  		<div id="main2-1"><span style="color:rgb(216, 148, 148);">MY</span> PAGE<div style="font-size:15px; font-weight:100px;">마이 페이지</div></div>
  		<div id="main2-2">
  			<div style="height:25%;">예치금</div>
  			<div style="height:25%;">구매횟수</div>
  			<div style="height:25%;">총사용금액</div>
  			<div style="height:25%;">다음등급까지</div>
  		</div>
  		<div id="main2-3">
  			<div style="height:25%; ">${vo.money}원</div>
  			<div style="height:25%;">${vo.downNum}회</div>
  			<div style="height:25%;">${vo.moneyTotal}원</div>
  			<div style="height:25%;">
  				<c:if test="${vo.level == 0}">[운영자]입니다.</c:if>
  				<c:if test="${vo.level == 1}">${vo.moneyTotal - 10000}원</c:if>
  				<c:if test="${vo.level == 2}">${vo.moneyTotal - 50000}원</c:if>
  				<c:if test="${vo.level == 3}">[최고 등급]입니다.</c:if>
  			</div>
  		</div>
  	</div>
  	<div id="main3">
  		<div class="main3">
  			<a href="">
	  			<div class="icon"><i class="fa-solid fa-clipboard-list"></i></div>
	  			<div class="icon2">Order</div>
	  			<div class="icon3">구매 내역 조회</div>
	  			<div class="icon4">회원이 구매한 내역을 보여 줍니다.</div>
  			</a>
  		</div>
  		<div class="main3">
  			<a href="${ctp}/member/memCheck"> 
	  			<div class="icon"><i class="fa-solid fa-id-card"></i></div>
	  			<div class="icon2">Profile</div>
	  			<div class="icon3">회원 정보</div>
	  			<div class="icon4">회원의 개인정보를 관리하는 공간입니다.</div>
	  		</a>	
  		</div>
  		<div class="main3">
  			<a href="${ctp}/member/myMusic">
	  			<div class="icon"><i class="fa-solid fa-gift"></i></div>
	  			<div class="icon2">My Music</div>
	  			<div class="icon3">나의 음악</div>
	  			<div class="icon4">회원이 담은 음악을 열람하는 공간입니다.</div>
  			</a>
  		</div>
  		<div class="main3">
  			<a href="">
	  			<div class="icon"><i class="fa-brands fa-github-alt"></i></div>
	  			<div class="icon2">Receipt</div>
	  			<div class="icon3">사용 내역</div>
	  			<div class="icon4">사용한 금액을 보여 줍니다.</div>
  			</a>
  		</div>
  		<div class="main3">
  			<a href="${ctp}/member/ask">
	  			<div class="icon"><i class="fa-solid fa-lightbulb"></i></div>
	  			<div class="icon2">FAQ</div>
	  			<div class="icon3">1:1문의</div>
	  			<div class="icon4">관리자에게 1:1 문의를 보낼 수 있습니다.</div>
  			</a>
  		</div>
  	</div>
  </div>
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>  
</div>  
</body>
</html>