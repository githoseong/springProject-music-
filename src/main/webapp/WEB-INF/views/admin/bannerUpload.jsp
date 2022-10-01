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
    		}	
    	}	
  		let files2 = document.getElementById("file2").files;
    	for(let i=0; i<files2.length; i++) {
    		file2 = files2[i];
    		let fName2 = file2.name;
    		
    		if(fName2 != "") {
	    		
	    		let ext2 = fName2.substring(fName2.lastIndexOf(".")+1)	
	  	    	let uExt2 = ext2.toUpperCase();
	   			
	   			if(uExt2 != "JPG" && uExt2 != "PNG") {
	 	    		alert("업로드 가능한 파일은 'JPG/PNG' 입니다.")
	 	    		return false;
	  	    }
    		}	
    	}	
  		let files3 = document.getElementById("file3").files;
    	for(let i=0; i<files3.length; i++) {
    		file3 = files3[i];
    		let fName3 = file3.name;
    		
    		if(fName3 != "") {
	    		
	    		let ext3 = fName3.substring(fName3.lastIndexOf(".")+1)	
	  	    	let uExt3 = ext3.toUpperCase();
	   			
	   			if(uExt3 != "JPG" && uExt3 != "PNG") {
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
    height: 150px; 
}
#banner {
	text-align: center;
	font-size:30px;
	font-weight:bold;
	margin:10px auto 50px;
}
.inp {
	width:600px;
}
#bannerBtn {
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
  <div id="banner">배너 업로드</div>
		<form name="myForm" method="post" enctype="multipart/form-data">
				<input type="file" name="file" id="file" multiple="multiple" class="form-control-file border" accept=".jpg,.png" class="inp">
				<input type="file" name="file2" id="file2" multiple="multiple" class="form-control-file border" accept=".jpg,.png" class="inp">
				<input type="file" name="file3" id="file3" multiple="multiple" class="form-control-file border" accept=".jpg,.png" class="inp">
				<input type="button" value="업로드" onclick="check()" id="bannerBtn"/>
		</form>
	</div>
</div>		
</body>
</html>