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
  $(document).ready(function() {
		if('${param.genre}'=='전체') {
			document.getElementById("all").style.color="rgb(216, 148, 148)";
		  document.getElementById("all").style.backgroundColor="white";
		}
		else if('${param.genre}'=='가요') {
			document.getElementById("kor").style.color="rgb(216, 148, 148)";
		  document.getElementById("kor").style.backgroundColor="white";
		}
		else if('${param.genre}'=='팝') {
			document.getElementById("pop").style.color="rgb(216, 148, 148)";
		  document.getElementById("pop").style.backgroundColor="white";
		}
		else if('${param.genre}'=='알앤비') {
			document.getElementById("rnb").style.color="rgb(216, 148, 148)";
		  document.getElementById("rnb").style.backgroundColor="white";
		}
		else if('${param.genre}'=='힙합') {
			document.getElementById("hip").style.color="rgb(216, 148, 148)";
		  document.getElementById("hip").style.backgroundColor="white";
		}
		else if('${param.genre}'=='재즈') {
			document.getElementById("jazz").style.color="rgb(216, 148, 148)";
		  document.getElementById("jazz").style.backgroundColor="white";
		}
		else if('${param.genre}'=='ost') {
			document.getElementById("ost").style.color="rgb(216, 148, 148)";
		  document.getElementById("ost").style.backgroundColor="white";
		}
		else if('${param.genre}'=='기타') {
			document.getElementById("etc").style.color="rgb(216, 148, 148)";
		  document.getElementById("etc").style.backgroundColor="white";
		}
		if('${param.style}'=='전체') {
			document.getElementById("all2").style.color="rgb(216, 148, 148)";
			document.getElementById("all2").style.backgroundColor="white";
		}
		else if('${param.style}'=='정보') {
			document.getElementById("infor2").style.color="rgb(216, 148, 148)";
			document.getElementById("infor2").style.backgroundColor="white";
		}
		else if('${param.style}'=='리뷰') {
			document.getElementById("review2").style.color="rgb(216, 148, 148)";
			document.getElementById("review2").style.backgroundColor="white";
		}
		else if('${param.style}'=='기타') {
			document.getElementById("etc2").style.color="rgb(216, 148, 148)";
			document.getElementById("etc2").style.backgroundColor="white";
		}
	});	 
  function allCheck(genre,style) {
	    location.href="${ctp}/board/board?genre="+genre+"&style="+style;
	}  
  function kor(genre,style) {
	    location.href="${ctp}/board/board?genre="+genre+"&style="+style;
	}  
  function pop(genre,style) {
	    location.href="${ctp}/board/board?genre="+genre+"&style="+style;
	}  
  function rnb(genre,style) {
	    location.href="${ctp}/board/board?genre="+genre+"&style="+style;
	}  
  function hip(genre,style) {
	    location.href="${ctp}/board/board?genre="+genre+"&style="+style;
	}  
  function jazz(genre,style) {
	    location.href="${ctp}/board/board?genre="+genre+"&style="+style;
	}  
  function ost(genre,style) {
	    location.href="${ctp}/board/board?genre="+genre+"&style="+style;
	}  
  function etc(genre,style) {
	    location.href="${ctp}/board/board?genre="+genre+"&style="+style;
	}  
  function all2(style,genre) {
	    location.href="${ctp}/board/board?style="+style+"&genre="+genre;
	}  
  function infor2(style,genre) {
	    location.href="${ctp}/board/board?style="+style+"&genre="+genre;
	}  
  function review2(style,genre) {
	    location.href="${ctp}/board/board?style="+style+"&genre="+genre;
	}  
  function etc2(style,genre) {
	    location.href="${ctp}/board/board?style="+style+"&genre="+genre;
	}  
  
	//검색기 처리
  function searchCheck() {
  	let search2 = $("#search2").val();
  	
  	if(search2.trim() == "") {
  		alert("검색어를 입력하세요!");
  		searchForm.search2.focus();
  	}
  	else {
  		searchForm.submit();
  	}
  }
  
  function searchChange() {
  	document.getElementById("search2").focus();
  }
  
  function goodCheck(idx) {
		$.ajax({
			type  : "post",
			url   : "${ctp}/board/boardGood",
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
   	height: 2000px;  
}
#list {
    border: 1px solid;
    width: 100%;
    height: 300px;
    background-color: rgb(252, 252, 252);
    border: 1px solid rgb(231, 231, 231);
    text-align: center;
}
#title {
    font-size: 27px;
    margin: 30px auto;
}
#title2 {
    font-size: 18px;
    font-weight: bold;
    margin: 20px auto;
}
.btn {
    background-color: white;
    border:1px solid rgb(231, 231, 231);
    border-radius: 20px;
    width: 70px;
    height: 40px;
    margin-left: 10px;
}
#infor {
	text-align: center;
	font-size: 30px;
	margin:50px auto;
}
.frame {
	width:100%;
	height:420px;
}
.part {
	height:100%;
	width:23%;
	border:1px solid rgb(231, 231, 231);;
	float:left;
	margin-left:18px;
	margin-bottom:30px;
}
.part a {
	color:black;
	text-decoration: none;
}
#input {
	text-align:right;
	margin:10px auto;
}
#inputBtn {
	width:100px;
	height:40px;
	border:1px solid rgb(231, 231, 231);
	font-weight:bold;
	font-size:17px;
	background-color:rgb(252, 252, 252);
	border-radius: 10px;
}
#inputBtn:hover {
	color:rgb(216, 148, 148);
} 
#photo {
	width:100%;
	height:65%;
	
}
/* #myPhoto {
	position: relative;
	border:1px solid;
	width:50px;
	height:50px;
	border-radius: 30px;
	left:180px;
	top:-25px;
} */
#pTitle {
	margin:10px auto auto 10px;
	font-size:17px;
}
.genre {
	border:1px solid rgb(231, 231, 231);;
	border-radius: 30px;
	width:70px;
	height:30px;
	background-color:rgb(252, 252, 252);
	float:left;
	text-align: center;
	font-size:14px;
	padding:2px;
	margin-right:8px;
	
}
.mar {
	margin-left:10px;
}
#footer {
	margin-top:150px;
}
#icon2 {
    position: relative;
    right: 30px;
    top: 3px;
    font-size: 23px;
    color: rgb(99, 98, 98);
}
#search2 {
    width: 300px;
    height: 35px;
    border: 3px solid rgb(216, 148, 148);
    border-radius: 10px;
    font-size:15px;
    padding-left: 85px;
}
#search2:focus {
    outline: none;
}
#search5 {
	width:64%;
	text-align: right;
	margin:0px auto 50px;
}
.searchBtn {
	border: 1px solid lightgray;
	border-radius: 5px;
	position: relative;
	right:20px;
	background-color: rgb(252, 252, 252);
}
#searchBtn {
	position: relative;
	left:80px;
  border: none;
}
</style>
<body>
<div id="container">
<jsp:include page="/WEB-INF/views/include/header.jsp"/>
  <div id="section">
  <hr/>
      <div id="title">peach 전문가</div>
      <div id="list">
          <div id="title2">장르 선택</div>
          <div>
              <input type="button" value="전체" class="btn" id="all" onclick="allCheck('전체','${param.style}')">
              <input type="button" value="가요" class="btn" id="kor" onclick="kor('가요','${param.style}')">
              <input type="button" value="팝" class="btn" id="pop" onclick="pop('팝','${param.style}')">
              <input type="button" value="R&B" class="btn" id="rnb" onclick="rnb('알앤비','${param.style}')">
              <input type="button" value="힙합" class="btn" id="hip" onclick="hip('힙합','${param.style}')">
              <input type="button" value="재즈" class="btn" id="jazz" onclick="jazz('재즈','${param.style}')">
              <input type="button" value="OST" class="btn" id="ost" onclick="ost('ost','${param.style}')">
              <input type="button" value="기타" class="btn" id="etc" onclick="etc('기타','${param.style}')">
          </div>
          <div id="title2">게시판 스타일</div>
          <div>
              <input type="button" value="전체" class="btn" id="all2" onclick="all2('전체','${param.genre}')">
              <input type="button" value="정보" class="btn" id="infor2" onclick="infor2('정보','${param.genre}')">
              <input type="button" value="리뷰" class="btn" id="review2" onclick="review2('리뷰','${param.genre}')">
              <input type="button" value="기타" class="btn" id="etc2" onclick="etc2('기타','${param.genre}')">
          </div>
      </div>
      <div id="infor">${genre} / ${style}</div>
      <div id="input"><input type="button" value="글쓰기" onclick="location.href='${ctp}/board/boardUpload?pag=${pageVO.pag}&pageSize=${pageVO.pageSize}'" id="inputBtn"/></div>
	      <div class="frame">
      <c:forEach var="vo" items="${vos}">
	      	<div class="part">
	      		<div id="photo"><a href="${ctp}/board/boardContent?idx=${vo.idx}&pag=${pageVO.pag}&pageSize=${pageVO.pageSize}&genre=${genre}&style=${style}&flag=${flag}"><img src="${ctp}/data/ckeditor/board/${vo.FSName}" style="width:100%; height:100%; "/></a></div>
	      		<div id="pTitle" class="mar"><a href="${ctp}/board/boardContent?idx=${vo.idx}&pag=${pageVO.pag}&pageSize=${pageVO.pageSize}&genre=${genre}&style=${style}&flag=${flag}">
	      			<c:if test="${fn:length(vo.title) > 13}">
	      				${fn:substring(vo.title,0,14)}······
	      			</c:if>
	      			<c:if test="${fn:length(vo.title) <= 13}">
	      				${vo.title}
	      			</c:if>
	      		</a></div>
	      		<div id="mid" class="mar"><a href="${ctp}/board/boardContent?idx=${vo.idx}&pag=${pageVO.pag}&pageSize=${pageVO.pageSize}&genre=${genre}&style=${style}&flag=${flag}"><font color="orange" style=" font-size:18px;"> ID</font> : ${vo.mid}</a></div>
	      		<div id="good" class="mar"><a href="javascript:goodCheck(${vo.idx})" style="color:black;text-decoration: none"><span style="font-size:23px; color:rgb(216, 148, 148);"> ♡ </span>${vo.good}</a> <i class="fa-solid fa-eye" style="margin-left:10px; color:gray;"></i> ${vo.readNum}</div>
	      		<div class="mar">
		      		<div class="genre">#${vo.genre}</div>
		      		<div class="genre">#${vo.style}</div>
	      		</div>
	      	</div>
      </c:forEach>
	      </div>
  </div>
  
  <!-- 검색기 처리 시작 -->
<div id="search5">
	<form name="searchForm" method="post" action="boSearch">
	  <select name="search" onchange="searchChange()" id="searchBtn" class="searchBtn">
	    <option value="title">제목</option>
	    <option value="mid">아이디</option>
	    <option value="content">내용</option>
	  </select>
	  <input type="text" placeholder="검색어를 입력하세요" id="search2" name="searchString"><span id="icon2"><i class="fa-solid fa-magnifying-glass"></i></span>
	  <input type="button" class="searchBtn" value="검색" onclick="searchCheck()"/>
	  <input type="hidden" name="pag" value="${pageVO.pag}"/>
	  <input type="hidden" name="pageSize" value="${pageVO.pageSize}"/>
	  <input type="hidden" name="flag" value="1"/>
	  <input type="hidden" name="genre" value="전체"/>
	  <input type="hidden" name="style" value="전체"/>
	</form>
</div>
<!-- 검색기 처리 끝 -->
  
  
   <!-- 블록 페이징 처리 시작 -->
<div class="text-center">
  <ul class="pagination justify-content-center">
	  <c:if test="${pageVO.pag > 1}">
	    <li class="page-item"><a href="board?pag=1&pageSize=${pageVO.pageSize}&genre=${genre}&style=${style}" class="page-link text-secondary">◁◁</a></li>
	  </c:if>
	  <c:if test="${pageVO.curBlock > 0}">
	    <li class="page-item"><a href="board?pag=${(pageVO.curBlock-1)*pageVO.blockSize + 1}&pageSize=${pageVO.pageSize}&genre=${genre}&style=${style}" class="page-link text-secondary">◀</a></li>
	  </c:if>
	  <c:forEach var="i" begin="${(pageVO.curBlock*pageVO.blockSize)+1}" end="${(pageVO.curBlock*pageVO.blockSize)+pageVO.blockSize}">
	    <c:if test="${i <= pageVO.totPage && i == pageVO.pag}">
	      <li class="page-item active"><a href="board?pag=${i}&pageSize=${pageVO.pageSize}&genre=${genre}&style=${style}" class="page-link text-light bg-secondary border-secondary">${i}</a></li>
	    </c:if>
	    <c:if test="${i <= pageVO.totPage && i != pageVO.pag}">
	      <li class="page-item"><a href='board?pag=${i}&pageSize=${pageVO.pageSize}&genre=${genre}&style=${style}' class="page-link text-secondary">${i}</a></li>
	    </c:if>
	  </c:forEach>
	  <c:if test="${pageVO.curBlock < pageVO.lastBlock}">
	    <li class="page-item"><a href="board?pag=${(pageVO.curBlock+1)*pageVO.blockSize + 1}&pageSize=${pageVO.pageSize}&genre=${genre}&style=${style}" class="page-link text-secondary">▶</a></li>
	  </c:if>
	  <c:if test="${pageVO.pag != pageVO.totPage}">
	    <li class="page-item"><a href="board?pag=${pageVO.totPage}&pageSize=${pageVO.pageSize}&genre=${genre}&style=${style}" class="page-link text-secondary">▷▷</a></li>
	  </c:if>
  </ul>
</div>
<!-- 블록 페이징 처리 끝 -->   
  
  
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
</div>
</body>
</html>