<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<% pageContext.setAttribute("newLine", "\n"); %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>title</title>
  <jsp:include page="/WEB-INF/views/include/bs4.jsp"/>
  <script>
  //게시글 삭제
  function boardDelCheck() {
  	let ans = confirm("게시글을 삭제하시겠습니까?");
  	if(ans) {
  		location.href = "boardDelete?idx=${vo.idx}&pag=${pag}&pageSize=${pageSize}";
  	}
  }
  
  
//댓글 입력 저장처리(aJax처리)
  function replyCheck() {
  	let content = $("#content3").val();
  	if(content.trim() == "") {
  		alert("댓글을 입력하세요!");
  		$("#content3").focus();
  		return false;
  	}
  	let query = {
  		boardIdx : ${vo.idx},
  		mid      : '${sMid}',
  		content  : content,
  		hostIp   : '${pageContext.request.remoteAddr}'
  	}
  	
  	$.ajax({
  		type  : "post",
  		url   : "${ctp}/board/boardReplyInput",
  		data  : query,
  		success:function(data) {
  			if(data == "1") {
  				alert("댓글이 입력되었습니다.");
  				location.reload();
  			}
  			else {
  				alert("댓글 입력실패~~~");
  			}
  		},
  		error : function() {
  			alert("전송오류!");
  		}
  	});
  }
  
  //댓글삭제처리
  function replyDelCheck(idx) {
  	let ans = confirm("현재 댓글을 삭제하시겠습니까?");
  	if(!ans) return false;
  	
  	$.ajax({
  		type  : "post",
  		url   : "${ctp}/board/boardReplyDelete",
  		data  : {idx : idx},
  		success:function(data) {
  			location.reload();
  		},
  		error : function() {
  			alert("전송 실패!!!");
  		}
  	});
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
}
#title {
	font-size:27px;
	margin-top:20px;
}
#main1 {
	width:90%;
	height:300px;
	border:1px solid lightgray;
	margin:0px auto;
}
#main2 {
	width:100%;
	margin:20px; auto;
	border-top:1px solid lightgray;
}
.content {
	float:left;
	height:100%;
	margin-right:20px;
}
#photo {
	width:30%;
}
#content {
	width:65%;
	padding:20px;
}
#title2 {
	font-size:28px;
}
#mid2 {
	font-size:20px;	
	margin-bottom: 13px;
}
#date2 {
	margin-bottom: 10px;
	color:gray;
}
.genre {
	border:1px solid rgb(231, 231, 231);
	border-radius: 30px;
	width:70px;
	height:30px;
	background-color:rgb(252, 252, 252);
	float:left;
	text-align: center;
	font-size:14px;
	padding:2px;
	margin-right:8px;
	margin-top:10px;
	
}
#topic2 {
	height:50px;
}
#good2 {
	margin-top: 40px;
	font-size:20px;
}
#footer {
	margin-top:150px;
}
#btnBack {
	margin:30px 50px 10px auto ;
	text-align:right; 
}
.btnBack2 {
	width:100px;
	height:40px;
	background-color: white;
  border:1px solid rgb(216, 148, 148);
  border-radius: 20px;
}
#reply {
	width:60%;
	margin:0px auto;
	border:1px solid lightgray;
	text-align: center;
}
.replyBtn {
    width:100px;
    height: 35px;
    background-color: rgb(248, 248, 248);
    border: 1px solid gainsboro;
}
.replyBtn:hover {
	opacity: 0.8;
	color:rgb(216, 148, 148);
}
</style>
<body>
<div id="container">
<jsp:include page="/WEB-INF/views/include/header.jsp"/>
  <div id="section">
    <hr/>
  	<div id="title">게시판 글 내용</div>
  	<div id="btnBack">	
  		<c:if test="${sMid == vo.mid || sLevel == 0}">
	  		<input type="button" class="btnBack2" value="수정하기" onclick="location.href='boardUpdate?idx=${vo.idx}&pag=${pag}&pageSize=${pageSize}&genre=${genre}&style=${style}';">
	  		<input type="button" class="btnBack2" value="삭제하기" onclick="boardDelCheck()">
  		</c:if>
  		<c:if test="${flag == 1 }">
  			<input type="button" class="btnBack2" value="돌아가기" onclick="history.back()"/>
  		</c:if> 
  		<c:if test="${flag != 1}">
  			<input type="button" class="btnBack2" value="돌아가기" onclick="location.href='${ctp}/board/board?pag=${pag}&pageSize=${pageSize}&genre=${genre}&style=${style}';"/>
  		</c:if>
  	</div>
  	<div id="main1">
  		<div class="content" id="photo"><img src="${ctp}/data/ckeditor/board/${vo.FSName}" style="width:100%; height:100%;"/></div>
  		<div class="content" id="content">
  			<div id="title2">${vo.title}</div>
  			<div id="mid2"><font color="orange" style=" font-size:23px;">ID </font> ${vo.mid}</div>
  			<div id="date2">${fn:substring(vo.WDate,0,16)}</div>
  			<div id="topic2">
  				<div class="genre">#${vo.genre}</div>
		      <div class="genre">#${vo.style}</div>
  			</div>
  			<div id="good2"><a href="javascript:goodCheck(${vo.idx})" style="color:black;text-decoration: none"><span style="color:rgb(216, 148, 148); font-size:30px;">♡ </span>  ${vo.good}</a> <i class="fa-solid fa-eye" style="margin-left:10px; color:gray;"></i> ${vo.readNum}</div>
  		</div>
  	</div>
  	<div style="font-size:23px; margin:20px auto 5px 50px;">내용</div>
  	<div id="main2" style="overflow:auto;"><br/> ${fn:replace(vo.content,newLine,"<br/>")}</div>
  </div>
  <hr/>
  <div style="font-size:30px; width:60%; margin:10px auto;">댓글</div>
	<!-- 댓글 출력 처리 -->
	<div id="reply">
		<table class="table table-hover" style="width:1140px;">
		  <tr style="background-color: rgb(231, 231, 231);">
		    <th style="width:20%">작성자</th>
		    <th style="width:50%">댓글내용</th>
		    <th style="width:20%">작성일자</th>
		    <!-- <th style="width:10%">답글</th> -->
		  </tr>
		  
		  <c:forEach var="replyVo" items="${replyVos}">
		    <tr>
		      <td >
		      <c:if test="${replyVo.level == 0}"> <!-- 부모댓글의 경우는 들여쓰기 하지 않는다. -->
		        ${replyVo.mid}
		      </c:if>
		      <c:if test="${replyVo.level != 0}">
		      	<c:forEach var="i" begin="1" end="${replyVo.level}">&nbsp;&nbsp;</c:forEach>
		        	└ ${replyVo.mid}
		      </c:if>
		        <c:if test="${sMid == replyVo.mid || sLevel == 0}">
		          <a href="javascript:replyDelCheck(${replyVo.idx})" title="삭제하기">X</a>
		        </c:if>
		      </td>
		      <td >
		        ${fn:replace(replyVo.content,newLine,"<br/>")}
		      </td>
		      <td>
	          ${fn:substring(replyVo.WDate,0,16)}
		      </td>
		      <%-- <td>
		        <input type="button" value="답글" class="replyBtn" onclick="insertReply('${replyVo.idx}','${replyVo.level}','${replyVo.levelOrder}')" id="replyBoxOpenBtn${replyVo.idx}"/>
		        <input type="button" value="닫기" class="replyBtn" onclick="closeReply('${replyVo.idx}')" id="replyBoxCloseBtn${replyVo.idx}"  style="display:none;"/>
		      </td> --%>
		    </tr>
		    <tr>
		      <td colspan="4" class="m-0 p-0" style="border-top:none;"><div id="replyBox${replyVo.idx}"></div></td>
		    </tr>
		  </c:forEach>
		  
		</table>
	</div>

	<!-- 댓글 입력 -->
	<form name="replyForm" method="post" style="width:60%; margin:20px auto;">
		<table class="table text-center">
		  <tr>
		    <td style="width:90%" class="text-left">
		      댓글 작성 
		      <textarea rows="4" name="content3" id="content3" class="form-control"></textarea>
		    </td>
		    <td style="width:15%">
		    	<br/>
		    	<p>${sMid}</p>
		    	<p>
		    	  <c:if test="${sMid != null}"><input type="button" value="댓글달기" onclick="replyCheck()" class="replyBtn"/></c:if>
		    	  <%-- <c:if test="${!empty replyContent}"><input type="button" value="댓글수정" onclick="boReplyUpdate(${replyIdx})" class="btn btn-info btn-sm"/></c:if> --%>
		    	</p>
		    </td>
		  </tr>
		</table>
		<%-- 
		<input type="hidden" name="boardIdx" value="${vo.idx}"/>
		<input type="hidden" name="hostIp" value="${pageContext.request.remoteAddr}"/>
		<input type="hidden" name="mid" value="${sMid}"/>
		<input type="hidden" name="nickName" value="${sNickName}"/>
		<input type="hidden" name="pag" value="${pag}"/>
		<input type="hidden" name="pageSize" value="${pageSize}"/>
		--%>
	</form>

</div>
  
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>  
<!-- </div>  --> 
</body>
</html>