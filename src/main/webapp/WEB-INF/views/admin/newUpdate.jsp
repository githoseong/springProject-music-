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
  function check() {
  	let maxSize = 1024 * 1024 * 20;
  	let title = $("#title").val();
  	let file = $("#file").val();
  	let file2 = $("#file2").val();
  	let artist = $("#artist").val();
  	let genre = $("#genre").val();
  	let country = $("#country").val();
  	let time = $("#time").val();
  	let release = $("#release").val();
  	let content = $("#content").val();
  	
  	if(file == "" && file == null) {
  		alert("업로드할 음악파일을 선택하세요");
  		return false;
  	}
  	else if(file2 == "" && file2 == null) {
  		alert("업로드할 그림파일을 선택하세요");
  		return false;
  	}
  	else if(title.trim() == "") {
  		alert("제목을 입력하세요.");
  		document.getElementById("title").focus();
  		return false;
  	}
  	else if(artist.trim() == "") {
  		alert("아티스트를 입력하세요.");
  		document.getElementById("artist").focus();
  		return false;
  	}
  	else if(genre.trim() == "") {
  		alert("장르를 입력하세요.");
  		document.getElementById("genre").focus();
  		return false;
  	}
  	else if(country.trim() == "") {
  		alert("나라를 입력하세요.");
  		document.getElementById("country").focus();
  		return false;
  	}
  	else if(time.trim() == "") {
  		alert("시간을 입력하세요.");
  		document.getElementById("time").focus();
  		return false;
  	}
  	else if(release.trim() == "") {
  		alert("발매일을 입력하세요.");
  		document.getElementById("release").focus();
  		return false;
  	}
  	else if(content.trim() == "") {
  		alert("내용을 입력하세요.");
  		document.getElementById("content").focus();
  		return false;
  	}
  	
  	let fileSize = 0;
  	let files = document.getElementById("file").files;
  	for(let i=0; i<files.length; i++) {
  		file = files[i];
  		let fName = file.name;
  		
  		if(fName != "") {
    		
    		let ext = fName.substring(fName.lastIndexOf(".")+1)		// pdsTest/atom.jpg
  	    	let uExt = ext.toUpperCase();
   			
   			if(uExt != "MP3" && uExt != "WAV") {
 	    		alert("업로드 가능한 파일은 'MP3/WAV' 입니다.")
 	    		return false;
  	    	}
   			else {
   				fileSize += file.size;
   			}
  		}
  	}
  	
  	let fileSize2 = 0;
  	let files2 = document.getElementById("file2").files;
  	for(let i=0; i<files2.length; i++) {
  		file2 = files2[i];
  		let fName2 = file2.name;
  		
  		if(fName2 != "") {
    		
    		let ext2 = fName2.substring(fName2.lastIndexOf(".")+1)		// pdsTest/atom.jpg
  	    	let uExt2 = ext2.toUpperCase();
   			
   			if(uExt2 != "JPG" && uExt2 != "PNG") {
 	    		alert("업로드 가능한 파일은 'JPG','PNG 입니다.")
 	    		return false;
  	    	}
   			else {
   				fileSize2 += file2.size;
   			}
  		}
  	}
  	
  	if(fileSize > maxSize) {
  		alert("업로드할 음악파일의 최대용량은 20MByte 입니다.")
  		return false;
  	}
  	else if(fileSize2 > maxSize) {
  		alert("업로드할 그림파일의 최대용량은 20MByte 입니다.")
  		return false;
  	}
  	else {
  		let ans = confirm("정말 수정하시겠습니까?");
  		if(ans) {
	  		myForm.fileSize.value = fileSize;
	  		myForm.fileSize2.value = fileSize2;
	  		myForm.submit();
  		}
  	}
  }
</script>
</head>
<style>
#container {
    width: 1905px;
}
#section {
    width: 40%;
    z-index: 1;
    margin: 40px auto;
    height: 350px; 
}
#upload {
	text-align: center;
	font-size:30px;
	font-weight:bold;
	margin:10px auto 50px;
}
.inp {
	width:500px;	
	height:40px;
}
table {
	font-size:20px;
}
#newUpdate {
	width:100%;
  height: 45px;
  background-color: white;
  color: rgb(216, 148, 148);
  border: 1px solid gainsboro;
}
</style>
<body>
<div id="container">
<jsp:include page="/WEB-INF/views/admin/admin2.jsp"/>
  <div id="section">
  	<div id="upload">음악 수정</div>
		<form name="myForm" method="post"  enctype="multipart/form-data">
			<table>
				<tr><td style="width:130px;">제목</td><td ><input type="text" id="title" name="title" class="inp" style="margin-left:0px;" value="${vo.title}"></td></tr>
				<tr><td >아티스트</td><td><input type="text" id="artist" name="artist" class="inp"  value="${vo.artist}"></td></tr>
				<tr><td >장르</td><td><input type="text" id="genre" name="genre" class="inp"  value="${vo.genre}"></td></tr>
				<tr><td >국가</td><td><input type="text" id="country" name="country" class="inp" value="${vo.country}"></td></tr>
				<tr><td >재생시간</td><td><input type="text" id="time" name="time1" class="inp" value="${vo.time1}"></td></tr>
				<tr><td >발매일</td><td><input type="text" id="release" name="release1" class="inp" value="${vo.release1}"></td></tr>
				<tr><td >내용</td><td><input type="text" id="content" name="content" class="inp" value="${vo.content}"></td></tr>
			</table>
				<input type="file" name="file" id="file" multiple="multiple" class="form-control-file border" accept=".mp3,.wav">
				음악: ${vo.FName}
				<input type="file" name="file2" id="file2" multiple="multiple" class="form-control-file border" accept=".jpg,.png">
				<div>
				<div style="float:left">사진:</div> <div style="width:60px; height:60px;float:left;"><img src="${ctp}/pds/${vo.FSName2}" style="width:100%; height:100%; "></div></div> 
				<input type="button" value="수정하기" onclick="check()" id="newUpdate" >
				<input type="hidden" name="fileSize"/>
				<input type="hidden" name="fileSize2"/>
				<input type="hidden" name="fName" value="${vo.FName}"/>
				<input type="hidden" name="fSName" value="${vo.FSName}"/>
				<input type="hidden" name="fName2" value="${vo.FName2}"/>
				<input type="hidden" name="fSName2" value="${vo.FSName2}"/>
		</form>
	</div>
</div>			
</body>
</html>