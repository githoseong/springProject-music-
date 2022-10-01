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
  	function down(idx) {
  		let ans = confirm("정말 다운로드 하시겠습니까?");
  		if(ans) {
  			if('${vo2.money}' < 700) {
  				alert("돈이 부족합니다");
  			}
  			else {
  			
	  			$.ajax({
	  				type : "post",
	  				url  : "${ctp}/new/downNum",
	  				data : {idx : idx},
	  				success:function(data) {
	  					if(data == 1) {
	  						alert("이미 다운로드 한 음악입니다.");
	  					}
	  					else {
				  			document.getElementById('musicPart').click();
		  					opener.location.reload();
		  					window.close();
		  					alert("다운로드 완료되었습니다.");
	  					}	
	  				},
	  				error : function() {
	  					alert("전송오류");
	  				}
	  			}); 
  			}
  		}
  	}
  	function peach() {
  		opener.location="${ctp}/";
  		window.close();
  	}
  </script>
</head>
<style>
	#title {
		border-bottom:1px solid lightgray;
		font-size:26px;
		text-align: center;
		height:50px;
		padding:5px 0px;
	}
	#cash1 {
		border-bottom:1px solid lightgray;
		font-size:18px;
		height:40px;
		padding:5px 0px;
	}
	#cash2 {
		border:1px solid lightgray;
		width:90%;
		height:72%;
		background-color: white;
		margin:10px auto;
	}
	.cash3 {
		margin:10px 10px;
		height:28px;
	}
	.cash4 {
		float:left;
		width:70%;
		color:gray;
	}
	.cash5 {
		float:left;
		text-align:right;
		width:30%;
		font-weight:bold;
	}
	.btn {
    width:100%;
    height: 45px;
    background-color: white;
    color: rgb(216, 148, 148);
    border: 1px solid gainsboro;
	}
	#content {
		border:1px solid lightgray;
		width:90%;
		height:200px;
		background-color: white;
		margin:10px auto;
		padding:10px;
		font-size:13px;
	}
	.content2 {
		margin-top:10px;
	}
	.peach {
		  font-size: 50px;
		  font-weight: bold;
		  color: rgb(216, 148, 148);
		  text-decoration: none;
		  margin:0px auto;
		 	width:200px;
	  }
</style>
<body style="background-color:rgb(248, 248, 248)";>
	<div id="container">
		<div id="title">음악 다운로드</div>
		<div id="cash1">ㆍMP3 1곡 = 700원</div>
		<div style="height:220px;">
			<div id="cash2">
				<div class="cash3"><div class="cash4">보유 피치캐시</div><div class="cash5">${vo2.money}원</div></div>
				<div class="cash3"><div class="cash4">최종 결제금액</div><div class="cash5" style="color:rgb(216, 148, 148);">700원</div></div>
				<hr/>
				<div class="cash3"><div class="cash4" >결제 후 남은금액</div><div class="cash5">${vo2.money - 700}원</div></div>
			</div>
			<div style="margin:0px auto; width:60%; ">
				<div style="float:left; margin-left:60px;"><input type="button" value="결제하기" onclick="down(${vo.idx})" class="btn"></div>
				<div style="float:left; margin-left:5px;"><input type="button" value="취소하기" onclick="window.close()" class="btn"></div>
			</div>
		</div>
		<div id="content">
			<div style="font-size:20px;">유의 사항</div>
			<div class="content2">ㆍ다운로드 받은 콘텐츠의 재생 유효기간은 무제한이며,PC로 다운로드 받으신 MP3 파일은 영구 소유할 수 있습니다.</div>
			<div class="content2">ㆍ다운로드 받은 음악은 무료 재다운로드가 가능합니다.</div>
			<div class="content2">ㆍ다운로드 받은 음악은 1분 미리듣기가 사라지며 완곡을 들을 수 있습니다.</div>
		</div>	
		<div class="peach" onclick="peach()" style="cursor: pointer;">peach<i class="fa-solid fa-seedling"></i></div>
		
		<a href="${ctp}/pds/${vo.FSName}" download="${vo.FName}" id="musicPart" type="hidden"></a>
	</div>
</body>
</html>