<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>title</title>
  <jsp:include page="/WEB-INF/views/include/bs4.jsp"/>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>

  $(document).ready(function() {
		if('${param.country}'=='해외') {
			  document.getElementById("fore").style.color="rgb(216, 148, 148)";
		    document.getElementById("fore").style.backgroundColor="white";
		    document.getElementById("dome").style.color="black";
		    document.getElementById("dome").style.backgroundColor="rgb(248, 248, 248)";
		}
		else {
				document.getElementById("dome").style.color="rgb(216, 148, 148)";
		    document.getElementById("dome").style.backgroundColor="white";
		    document.getElementById("fore").style.color="black";
		    document.getElementById("fore").style.backgroundColor="rgb(248, 248, 248)";
		}
  });



function dome(country) {
    location.href="${ctp}/new/new?country="+country;
}
 
function fore(country) {
    location.href="${ctp}/new/new?country="+country;
    
}
function start(idx,fsname) {
	var cBox = "";
	if($("#cBox"+idx).is(":checked")){
			$("input:checkbox[name=cBox]:checked").each(function(){
			
				if(cBox == "") {
					cBox = $(this).val();
				}
				else {
/* 					cBox =  cBox + "," + $(this).val(); */
					cBox =  $(this).val() + "," + cBox;
				}	
	
	
				var popX = 500;
				var popY = 550;
				var newX =  (window.screen.width/2) - (popX/2);
				var newY =  (window.screen.height/2) - (popY/2);
				
				let url = "${ctp}/admin/musicPlay?idx="+idx+"&cBox="+cBox+"&cnt=0&flag=0";
				var windowPop = window.open(url,"newWindow","width="+popX+",height="+popY+",left="+newX+",top="+newY);
			});
	}	
	else {
		var popX = 500;
		var popY = 550;
		var newX =  (window.screen.width/2) - (popX/2);
		var newY =  (window.screen.height/2) - (popY/2);
		
		let url = "${ctp}/admin/musicPlay?idx="+idx+"&cBox="+cBox+"&cnt=0&flag=0";
		var windowPop = window.open(url,"newWindow","width="+popX+",height="+popY+",left="+newX+",top="+newY+",scroll=no");
	}	
	
}
function downCheck(idx) {
	var num = $('input[name="cBox"]:checked').length;			

				
		var popX = 500;
		var popY = 650;
		var newX =  (window.screen.width/2) - (popX/2);
		var newY =  (window.screen.height/2) - (popY/2);
		
		let url = "${ctp}/new/musicDown?idx="+idx;
		var windowPop = window.open(url,"newWindow","width="+popX+",height="+popY+",left="+newX+",top="+newY+",scroll=no");
}
	
	
/* window.open(url,"newWindow","width=350px,height=150px","left=500px"); */
	
	/* $.ajax({
		type : "post",
		url  : "${ctp}/new/downNum",
		data : {idx : idx},
		success:function() {
			location.reload();
		},
		error : function() {
			alert("전송오류");
		}
	}); */


$(document).ready(function(){
	$("#cBoxAll").change(function(){
		if($("#cBoxAll").is(":checked")){
			$('input:checkbox[name="cBox"]').each(function() {
				$(this).prop('checked',true);
				});
		}
		else {
		$('input:checkbox[name="cBox"]').each(function() {
			$(this).prop('checked',false);
			});
		}
	});
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
    /* height: 2000px; */
}
#title {
    font-size: 27px;
    margin: 30px;
}
#dome {
    width:49%;
    height: 45px;
    background-color: white;
    color: rgb(216, 148, 148);
    border: 1px solid gainsboro;
}
#fore {
    width:49%;
    height: 45px;
    background-color: rgb(248, 248, 248);
    border: 1px solid gainsboro;
}
#country1 {
    text-align: center;
}
#chart {
    margin: 50px auto auto auto;
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
#down {
	color:black;
	font-size: 24px;
	cursor: pointer;
}
#down:hover {
	color:rgb(216, 148, 148);
}
#footer {
	margin-top:100px;
}
</style>
<body>
<div id="container">
<jsp:include page="/WEB-INF/views/include/header.jsp"/>
  <div id="section">
    <div id="title">최신곡</div>
    <div id="country1">
        <!-- <input type="button" value="국내"  id="dome" onclick="dome()" checked> --> 
        <input type="button" value="국내"  id="dome" onclick="dome('국내')"> 
        <input type="button" value="해외"  id="fore" onclick="fore('해외')"> 
    </div>
    <div>
    <form name="myForm" method="post">
        <table class="table table-border" id="chart">
            <tr>
              <td style="width:10%"><input type="checkbox" id="cBoxAll" > 최신순</td>
              <td style="width:35%">제목</td>
              <td style="width:20%">가수</td>
              <td style="width:8%">다운수</td>
              <td style="width:8%">듣기</td>
              <td style="width:10%">다운</td>
            </tr>
            <c:forEach var="vo" items="${vos}" varStatus="st">
	            <tr>
	              <td><input type="checkbox" id="cBox${vo.idx}" name="cBox"  value="${vo.idx}"> ${st.count}</td>
	              <td><div id="photo"><img src="${ctp}/pds/${vo.FSName2}" style="width:100%; height:100% "/></div><div id="singer">${vo.title}</div></td>
	              <td>${vo.artist}</td>
	              <td>${vo.downNum}</td>
	              <td>
	              	<button type="button" onclick="start('${vo.idx}','${vo.FSName}')" id="start${vo.idx}" class="btn"><i class="fa-solid fa-play"></i></button>
	              	<input type="button" onclick="pause('${vo.idx}','${vo.FSName}')" value="ll" id="pause${vo.idx}" class="btn" style="display:none"/>
	              </td>
	              <td><i class="fa-solid fa-download" onclick="downCheck(${vo.idx})" id="down"></i></td>
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
	    <li class="page-item"><a href="new?pag=1&pageSize=${pageVO.pageSize}&country=${country}" class="page-link text-secondary">◁◁</a></li>
	  </c:if>
	  <c:if test="${pageVO.curBlock > 0}">
	    <li class="page-item"><a href="new?pag=${(pageVO.curBlock-1)*pageVO.blockSize + 1}&pageSize=${pageVO.pageSize}&country=${country}" class="page-link text-secondary">◀</a></li>
	  </c:if>
	  <c:forEach var="i" begin="${(pageVO.curBlock*pageVO.blockSize)+1}" end="${(pageVO.curBlock*pageVO.blockSize)+pageVO.blockSize}">
	    <c:if test="${i <= pageVO.totPage && i == pageVO.pag}">
	      <li class="page-item active"><a href="new?pag=${i}&pageSize=${pageVO.pageSize}&country=${country}" class="page-link text-light bg-secondary border-secondary">${i}</a></li>
	    </c:if>
	    <c:if test="${i <= pageVO.totPage && i != pageVO.pag}">
	      <li class="page-item"><a href='new?pag=${i}&pageSize=${pageVO.pageSize}&country=${country}' class="page-link text-secondary">${i}</a></li>
	    </c:if>
	  </c:forEach>
	  <c:if test="${pageVO.curBlock < pageVO.lastBlock}">
	    <li class="page-item"><a href="new?pag=${(pageVO.curBlock+1)*pageVO.blockSize + 1}&pageSize=${pageVO.pageSize}&country=${country}" class="page-link text-secondary">▶</a></li>
	  </c:if>
	  <c:if test="${pageVO.pag != pageVO.totPage}">
	    <li class="page-item"><a href="new?pag=${pageVO.totPage}&pageSize=${pageVO.pageSize}&country=${country}" class="page-link text-secondary">▷▷</a></li>
	  </c:if>
  </ul>
</div>
<!-- 블록 페이징 처리 끝 -->  
  
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
</div>	
</body>
</html>