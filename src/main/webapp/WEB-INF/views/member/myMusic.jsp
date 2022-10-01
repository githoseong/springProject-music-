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
  function start(idx) {
			var popX = 500;
			var popY = 550;
			var newX =  (window.screen.width/2) - (popX/2);
			var newY =  (window.screen.height/2) - (popY/2);
			
			let url = "${ctp}/admin/musicPlay?idx="+idx+"&cBox=&cnt=0&flag=3";
			var windowPop = window.open(url,"newWindow","width="+popX+",height="+popY+",left="+newX+",top="+newY+",scroll=no");
		
	}
  
  function del(idx) {
	  $.ajax({
			type : "post",
			url  : "${ctp}/member/myMusicDel",
			data :{idx : idx},
			
			success: function() {
				alert("My List에서 노래가 삭제 되었습니다.");
				location.reload();
			},
			error : function() {
				alert("오류");
				location.reload();
			}
		})
  }
  
  function plus(idx) {
	  $.ajax({
			type : "post",
			url  : "${ctp}/member/myMusicPlus",
			data :{idx : idx},
			
			success: function() {
				alert("My List에 노래가 등록 되었습니다.");
				location.reload();
			},
			error : function() {
				alert("오류");
				location.reload();
			}
		})
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
    /* height: 1000px; */
}
#footer {
	margin-top:50px;
}
#photo {
	width:70px;
	height:60px;
	float:left;
}
#singer {
	margin:10px 5px;
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
.btn3 {
	border:1px solid gainsboro;
	border-radius:10px;
	width:55px;
	height:35px;
	padding:5px;
	background-color: white;
}
#btn2 {
	color:blue;
}
#btn3 {
	color:red;
}
.btn3:hover {
	background-color: lightgray;
}
#mymusic {
	font-size:30px;
	text-align: center;
	margin:20px auto 50px auto;
}	
</style>
<body>
<div id="container">
<jsp:include page="/WEB-INF/views/include/header.jsp"/>
<hr/>
  <div id="section">
  <div id="mymusic">My Music</div>
		<div class="musicList" id="musicList">
			<form name="myForm" method="post">
	        <table class="table table-border" id="chart">
            <tr>
              <td style="width:10%">no</td>
              <td style="width:35%">제목</td>
              <td style="width:27%">가수</td>
              <td style="width:10%">듣기</td>
              <td style="width:13%">list에 담기</td>
            </tr>
				  	<c:forEach var="vo" items="${vos}" varStatus="st">
				  		<tr>
				  			<td>${st.count}</td>
				  			<td><div id="photo"><img src="${ctp}/pds/${vo.FSName2}" style="width:100%; height:100% "/></div><div id="singer">${vo.title}</div></td>
				  			<td>${vo.artist}</td>
				  			<td><button type="button" onclick="start(${vo.idx})" class="btn"><i class="fa-solid fa-play"></i></button></td>
				  			<c:if test="${vo.keep == 'NO'}">
				  				<td><input type="button" onclick="plus(${vo.idx})" value="추가" class="btn3" id="btn2"/></td>
				  			</c:if>	
				  			<c:if test="${vo.keep == 'OK'}">
				  				<td><input type="button" onclick="del(${vo.idx})" value="제거" class="btn3" id="btn3"/></td>
				  			</c:if> 
				  		</tr>
				  	</c:forEach>	
		  		</table>	 
		  </form>		
	  </div>
  </div>
  
<!-- 블록 페이징 처리 시작 -->
<div class="text-center">
  <ul class="pagination justify-content-center">
	  <c:if test="${pageVO.pag > 1}">
	    <li class="page-item"><a href="myMusic?pag=1&pageSize=${pageVO.pageSize}" class="page-link text-secondary">◁◁</a></li>
	  </c:if>
	  <c:if test="${pageVO.curBlock > 0}">
	    <li class="page-item"><a href="myMusic?pag=${(pageVO.curBlock-1)*pageVO.blockSize + 1}&pageSize=${pageVO.pageSize}" class="page-link text-secondary">◀</a></li>
	  </c:if>
	  <c:forEach var="i" begin="${(pageVO.curBlock*pageVO.blockSize)+1}" end="${(pageVO.curBlock*pageVO.blockSize)+pageVO.blockSize}">
	    <c:if test="${i <= pageVO.totPage && i == pageVO.pag}">
	      <li class="page-item active"><a href="myMusic?pag=${i}&pageSize=${pageVO.pageSize}" class="page-link text-light bg-secondary border-secondary">${i}</a></li>
	    </c:if>
	    <c:if test="${i <= pageVO.totPage && i != pageVO.pag}">
	      <li class="page-item"><a href='myMusic?pag=${i}&pageSize=${pageVO.pageSize}' class="page-link text-secondary">${i}</a></li>
	    </c:if>
	  </c:forEach>
	  <c:if test="${pageVO.curBlock < pageVO.lastBlock}">
	    <li class="page-item"><a href="myMusic?pag=${(pageVO.curBlock+1)*pageVO.blockSize + 1}&pageSize=${pageVO.pageSize}" class="page-link text-secondary">▶</a></li>
	  </c:if>
	  <c:if test="${pageVO.pag != pageVO.totPage}">
	    <li class="page-item"><a href="myMusic?pag=${pageVO.totPage}&pageSize=${pageVO.pageSize}" class="page-link text-secondary">▷▷</a></li>
	  </c:if>
  </ul>
</div>
<!-- 블록 페이징 처리 끝 -->  
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>  
</div>
</body>
</html>