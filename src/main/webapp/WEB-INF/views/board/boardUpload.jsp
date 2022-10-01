<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>title</title>
<jsp:include page="/WEB-INF/views/include/bs4.jsp"/>
<script src="${ctp}/ckeditor/ckeditor.js"></script>
<script>
function uploadCheck() {
	var title = myForm.title.value;
	var content = myForm.content.value;
	let maxSize = 1024 * 1024 * 20;
	let file = $("#file").val();
	
	let fileSize = 0;
  	let files = document.getElementById("file").files;
  	for(let i=0; i<files.length; i++) {
  		file = files[i];
  		let fName = file.name;
  		
  		if(fName != "") {
	    		
	    		let ext = fName.substring(fName.lastIndexOf(".")+1)		// pdsTest/atom.jpg
	  	    	let uExt = ext.toUpperCase();
	   			
	   			if(uExt != "JPG" && uExt != "PNG") {
	 	    		alert("업로드 가능한 파일은 'JPG/PNG' 입니다.")
	 	    		return false;
	  	    	}
	   			else {
	   				fileSize += file.size;
	   			}
  		}
  	}
  	if(fileSize > maxSize) {
		alert("업로드할 음악파일의 최대용량은 20MByte 입니다.")
		return false;
		}
		else {
			myForm.fileSize.value = fileSize;
		}
	
	
	
	if(title.trim() == "") {
		alert("게시글 제목을 입력하세요");
		myForm.title.focus();
	}
	else if(file == "" && file == null) {
  		alert("업로드할 표지를 선택하세요");
  		return false;
  }
	else {
		myForm.submit();
	}
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
  height: 1380px;
}
#frame {
	width:85%;
	border: 2px solid #ccc;
	margin:0px auto;
}
.sel {
	width:100px; height:30px;
	margin:10px; auto;
	border-radius: 10px;
	border:1px solid;
}
.input {
	width:600px; height:40px;
	margin:5px; auto; 
	border-radius: 10px;
	border:1px solid;
}
#title2 {
	font-size:30px;
	margin:80px auto auto 20px;
}
.td1 {
	background-color: #EEE;
	width:100px;
	font-size:15px;
}
.inputBtn {
	width:100px;
	height:40px;
	border:1px solid rgb(231, 231, 231);
	font-weight:bold;
	font-size:17px;
	background-color:rgb(252, 252, 252);
	border-radius: 10px;
}
.inputBtn:hover {
	color:rgb(216, 148, 148);
} 
</style>
<body>
<div id="container">
<jsp:include page="/WEB-INF/views/include/header.jsp"/>
  <div id="section">
  <div id="title2">게시판 글쓰기</div>
  <hr/>
  <form name="myForm" method="post" enctype="multipart/form-data">
  <div style="text-align:right; margin:20px 90px 10px;">
	  <input type="button" value="발행하기" onclick="uploadCheck()" class="inputBtn"/>
	  <input type="button" value="돌아가기" onclick="history.back()" class="inputBtn"/>
  </div>
  	<div id="frame">
  		<table style="margin:0px auto;">
  			<tr>
  				<td class="td1">장르 선택</td>
  				<td >
  					<select class="sel" id="genre" name="genre">
  						<option>가요</option>
  						<option>팝</option>
  						<option>R&B</option>
  						<option>힙합</option>
  						<option>재즈</option>
  						<option>OST</option>
  						<option selected>기타</option>
  					</select>
  				주제 선택
  					<select class="sel" id="style" name="style">
  						<option>정보</option>
  						<option>리뷰</option>
  						<option selected>기타</option>
  					</select>
  				</td>
  			</tr>
  			<tr>
  				<td class="td1">제목</td>
  				<td ><input type="text" placeholder="제목을 입력하세요." id="title" name="title"  class="input" style="margin-left:5px;"/></td>
  			</tr>
  			<tr>
  				<td class="td1">아이디</td>
  				<td ><input type="text" readonly value="${sMid}" class="input" id="mid" name="mid"/></td>
  			</tr>
  			<tr>
  				<td class="td1">표지 선택</td>
  				<td><input type="file" name="file" id="file" multiple="multiple" class="form-control-file border" accept=".jpg,.png" ></td>
  			</tr>
  			<tr>
  				<td class="td1">내용</td>
  				<td ><textarea name="content" id="CKEDITOR" style="resize: none; margin:5px; auto; border-radius: 10px;border:1px solid;" ></textarea></td>
  				<script>
		      	CKEDITOR.replace("content",{
		      		height:800,
		      		filebrowserUploadUrl : "${ctp}/board/imageUpload",
		      		uploadUrl : "${ctp}/board/imageUpload"
		      	});
	      </script>
  			</tr>
  		</table>
  		<input type="hidden" name="pag" value="${pag}"/>
  		<input type="hidden" name="pageSize" value="${pageSize}"/>
  		<input type="hidden" name="fileSize"/>
  		</form>
  	</div>
	</div>
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
</div>
</body>
</html>