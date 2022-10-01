<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>title</title>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script>
  function check() {
	  	let maxSize = 1024 * 1024 * 20;
	  	let title = $("#title").val();
	  	let file = $("#file").val();
	  	let artist = $("#artist").val();
	  	let time = $("#time").val();
	  	let release = $("#release").val();
	  	let link = $("#link").val();
	  	let content = $("#content").val();
	  	
	  	if(file == "" && file == null) {
	  		alert("업로드할 음악파일을 선택하세요");
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
	  	else if(link.trim() == "") {
	  		alert("동영상 링크를 입력하세요.");
	  		document.getElementById("link").focus();
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
				myForm.submit();
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
#videoUpload {
	width:100%;
  height: 45px;
  background-color: white;
  color: rgb(216, 148, 148);
  border: 1px solid gainsboro;
}
table {
	font-size:20px;
}
#link {
	width:500px;
	height:200px;
}
</style>
<body>
<div id="container">
<jsp:include page="/WEB-INF/views/admin/admin2.jsp"/>
  <div id="section">
  	<div id="upload">비디오 수정</div>
			<form name="myForm" method="post"  enctype="multipart/form-data">
				<table>
					<tr><td style="width:130px;">제목</td><td><input type="text" id="title" name="title" class="inp" style="margin-left:0px;" value="${vo.title}"></td></tr>
					<tr><td>아티스트</td><td><input type="text" id="artist" name="artist" class="inp" value="${vo.artist}"></td></tr>
					<tr><td>재생시간</td><td><input type="text" id="time" name="time1" class="inp" value="${vo.time1}"></td></tr>
					<tr><td>발매일</td><td><input type="text" id="release" name="release1" class="inp" value="${vo.release1}"></td></tr>
					<tr><td>동영상링크</td><td><textarea  id="link" name="link" >${vo.link}</textarea></td></tr>
					<tr><td>내용</td><td><input type="text" id="content" name="content" class="inp" value="${vo.content}"></td></tr>
				</table>
					<input type="file" name="file" id="file" multiple="multiple" class="form-control-file border" accept=".jpg,.png">
					<div>
						<div style="float:left">사진:</div> <div style="width:200px; height:100px;float:left;"><img src="${ctp}/video/${vo.FSName}" style="width:100%; height:100%; "></div>
					</div>
					<input type="button" value="수정하기" onclick="check()" id="videoUpload"/>
				<input type="hidden" name="fileSize"/>
				<input type="hidden" name="fName" value="${vo.FName}"/>
				<input type="hidden" name="fSName" value="${vo.FSName}"/>
			</form>
	</div>		
</div>			
</body>
</html>