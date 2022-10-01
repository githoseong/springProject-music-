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
  	  	let topic = $("#topic").val();
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
  	  	else if(topic.trim() == "") {
  	  		alert("주제를 입력하세요.");
  	  		document.getElementById("topic").focus();
  	  		return false;
  	  	}
  	  	else if(content.trim() == "") {
  	  		alert("내용을 입력하세요.");
  	  		document.getElementById("content").focus();
  	  		return false;
  	  	}	
  		
  		
  		
  		let files = document.getElementById("file").files;
    	for(let i=0; i<files.length; i++) {
    		file = files[i];
    		let fName = file.name;
    		
    		if(fName != "") {
	    		
	    		let ext = fName.substring(fName.lastIndexOf(".")+1)	
	  	    	let uExt = ext.toUpperCase();
	   			
	   			if(uExt != "JPG" && uExt != "PNG") {
	 	    		alert("업로드 가능한 파일은 'JPG/PNG' 입니다.")
	 	    		return false;
	  	    }
	   			else {
  					myForm.submit();
  				}
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
#magazineUpload {
	width:100%;
  height: 45px;
  background-color: white;
  color: rgb(216, 148, 148);
  border: 1px solid gainsboro;
}
table {
	font-size:20px;
}
</style>
<body>
<div id="container">
<jsp:include page="/WEB-INF/views/admin/admin2.jsp"/>
  <div id="section">
  	<div id="upload">메거진 업로드</div>
			<form name="myForm" method="post" enctype="multipart/form-data">
				<table>
					<tr><td style="width:130px;">제목</td><td><input type="text"  id="title" name="title" class="inp" style="margin-left:0px;"></td></tr>
					<tr><td>주제</td><td><input type="text"  id="topic" name="topic" class="inp"></td></tr>
					<tr><td>설명</td><td><textarea id="content" name="content" style="width:700px; height:200px;"></textarea></td></tr>
				</table>
					<input type="file" name="file" id="file" multiple="multiple" accept=".jpg,.png"><br/>
					<input type="button" value="업로드" onclick="check()" id="magazineUpload"/>
					<input type="hidden" name="fileSize"/>
			</form>	
	</div>		
</div>			
</body>
</html>