<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>

<script>
	//검색기 처리
  function searchCheck0() {
  	let search = $("#search").val();
  	
  	if(search.trim() == "") {
  		alert("검색어를 입력하세요!");
  		searchForm0.search.focus();
  	}
  	else {
  		searchForm0.submit();
  	}
  }
  function start3() {
	  
	  $.ajax({
			type  : "post",
			url   : "${ctp}/member/qrPoint",
			success:function(data) {
				if(data != null) {
					alert(data+"원이 충전되었습니다.");
				}	
			},
			error : function() {
				alert("전송오류~~");
			}
		});		
	}	  
		  
</script> 

<div id="header">
  <header id="head">
    <div class=" w3-bar-block" style="display:none; background-color:rgb(228, 227, 227)" id="mySidebar">
    </div>
    <div id="headmenu2">
	    <c:if test="${sLevel == 0}">
	      <div class="headmenu2" ><a href="${ctp}/admin/admin">admin</a></div>
	    </c:if>
	    <c:if test="${sMid == null}">
	    	<div class="headmenu2"><a href="${ctp}/member/login">MyPage</a></div>
	    </c:if>
	    <c:if test="${sMid != null}">
      	<div class="headmenu2"><a href="${ctp}/member/myPage">MyPage</a></div>
	    	<div class="headmenu2" style="margin-right:0px;" id="hImg" ><img src="${ctp}/member/${sPhoto}"  style="width:100%; height:100%; "/></div>
      </c:if>
      <c:if test="${sMid == null}"> 
      	<div class="headmenu2" ><a href="${ctp}/member/login">Login</a></div>
      </c:if>
      <c:if test="${sMid != null}"> 
      	<div class="headmenu2" ><a href="${ctp}/member/logOut">LogOut</a></div>
      </c:if>
    </div>
  </header>
  <div style="text-align: left; margin:0px auto; width:63%;"><a href="${ctp}/member/qrCode" style="color:gray;">모바일로 접속하기</a></div>
  <div id="header2">
	  <form name="searchForm0" method="post" action="${ctp}/allSearch">
	    <div id="title" >
	      <span class="peach"><a href="${ctp}/">peach<i class="fa-solid fa-seedling"></i></a></span>
	      
	        <!-- 검색기 처리 시작 -->
	   			    
			      <span style="margin-left: 20px; "><input type="text" placeholder="검색어를 입력하세요" id="search" name="searchString0"><span id="icon"><i class="fa-solid fa-magnifying-glass" type="button" onclick="searchCheck0()" ></i></span></span>
					<!-- 검색기 처리 끝 -->
					
	      
	    </div>
	    <div id="commercial"><a href="member/m"><img src="${ctp}/commercial/짱구.jpg" style="width:100%; height:100%;  "></a></div>
	  </form>  
    <div id="menu">
      <ul id="menu2">
        <li><a href="${ctp}/chart/chart">음악차트</a></li>
        <li><a href="${ctp}/new/new?country=국내">최신음악</a></li>
        <li><a href="${ctp}/genre/genre?genre=발라드">장르음악</a></li>
        <li><a href="${ctp}/video/video?order=최신순">뮤직비디오</a></li>
        <li><a href="${ctp}/magazine/magazine">매거진</a></li>
        <li><a href="${ctp}/board/board?genre=전체&style=전체">게시판</a></li>
        <c:if test="${sMid != null}">
        <li><span onclick="start3()" id="char">충전</span></li>
        </c:if>
        <c:if test="${sMid == null}">
        <li><a href="${ctp}/member/login">충전</a></li>
        </c:if>
        
      </ul>
    </div>
  </div>
</div>