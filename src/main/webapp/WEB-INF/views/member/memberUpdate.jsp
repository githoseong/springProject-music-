<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>title</title>
<jsp:include page="/WEB-INF/views/include/bs4.jsp"/>  
<script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<%-- <jsp:include page="/WEB-INF/views/js/woo.js"/> --%>
<script src="${ctp}/js/woo.js"></script>
<script type="text/javascript">
  'use strict'
  let sw = 0;
  function complete() {
    let txtname = document.getElementById("txtname").value;
    let txtage = document.getElementById("txtage").value;
    let txtid = document.getElementById("txtid").value;
    let txtpwd = document.getElementById("txtpwd").value;
    let pwdcheck = document.getElementById("pwdcheck").value;
    let txtmail = document.getElementById("txtmail").value;
    let txtmail2 = document.getElementById("txtmail2").value;
    let txttel  = document.getElementById("txttel").value;
    
	  let email = txtmail + '@' + txtmail2;
    
	 // 사진 업로드 체크
		let fName = myform.fName.value;
		let ext = fName.substring(fName.lastIndexOf(".")+1);	// 파일 확장자 발췌
		let uExt = ext.toUpperCase();		// 확장자를 대문자로 변환
		let maxSize = 1024 * 1024 * 2; 	// 업로드할 회원사진의 용량은 2MByte까지로 제한한다.
    
    const regex1 = /[^가-힣]/g;
    const regex2 = /[0-9]{8}/g;
    const regex4 = /[^A-Za-z0-9]/g;
    const regex5 = /(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$/
    const regex6 = /\D/g;
    // const regex6 = /\d{10,11}/g;

    if(txtname == "") {
        namedemo.innerHTML = " *이름을 입력해주세요."
        document.getElementById("txtname").focus();
        return false;
    }
    else if(regex1.test(txtname)) {
        namedemo.innerHTML = " *이름은 한글로만 입력 가능합니다.."
        document.getElementById("txtname").focus();
        return false;
    }
    else {
        namedemo.innerHTML = " "
        // document.getElementById("txtname").style.borderColor="green";
    }
    if(txtage == "") {
        agedemo.innerHTML = " *생년월일을 입력해주세요."
        document.getElementById("txtage").focus();
        return false;
    }
    else if(!regex2.test(txtage)) {
        agedemo.innerHTML = " *생년월일은 8자리 숫자로 입력해주세요."
        document.getElementById("txtage").focus();
        return false;
    }
    else {
        agedemo.innerHTML = " "
    }    

    if(txtid == "") {
        iddemo.innerHTML = " *아이디를 입력해주세요."
        document.getElementById("txtid").focus();
        return false;
    }
    else if(regex4.test(txtid)) {
        iddemo.innerHTML = " *아이디는 영문과 숫자만 입력해주세요."
        document.getElementById("txtid").focus();
        return false;
    }
    else {
        iddemo.innerHTML = " "
    }
    if(txtpwd != "") {
	    if(txtpwd.length < 8 ) {
	        pwddemo.innerHTML = " *비밀번호는 8자리 이상 입력해주세요. "
	        document.getElementById("txtpwd").focus();
	        return false
	    }
	    else if(!regex5.test(txtpwd)) {
	        pwddemo.innerHTML = " *비밀번호는 영문, 숫자, 특수문자를 포함해주세요."
	        document.getElementById("txtpwd").focus();
	        return false;
	    }
	    else {
	        pwddemo.innerHTML = " "
	    }
    
	    if(pwdcheck == "") {
	        pwdcheckdemo.innerHTML = " *비밀번호를 다시 한번 입력해주세요."
	        document.getElementById("pwdcheck").focus();
	        return false;
	    }
	    else if(pwdcheck != txtpwd ) {
	        pwdcheckdemo.innerHTML = " *입력한 비밀번호와 다릅니다."
	        document.getElementById("pwdcheck").focus();
	        return false;
	    }
	    else {
	        pwdcheckdemo.innerHTML = " "
	    }
    }
    if(txtmail == "" || txtmail2 == "") {
        maildemo.innerHTML = " *이메일을 입력해주세요."
        document.getElementById("txtmail").focus();
        return false;
    }
    else {
        maildemo.innerHTML = " "
    }
    if(regex6.test(txttel)) {
        teldemo.innerHTML = " *전화번호는 공백없이 숫자로만 입력해주세요."
        document.getElementById("txttel").focus();
        return false;
    }
    else {
        teldemo.innerHTML = " "
    }
    // 전송전에 '주소'를 하나로 묶어서 전송처리 준비한다.
		let postcode = myform.sample6_postcode.value + " ";
		let roadAddress = myform.sample6_address.value + " ";
		let detailAddress = myform.sample6_detailAddress.value + " ";
		let extraAddress = myform.sample6_extraAddress.value + " ";
		myform.address.value = postcode + "/" + roadAddress + "/" + detailAddress + "/" + extraAddress;


		// 전송전에 파일에 관한 사항체크...
		if(fName.trim() != "") {
				let fileSize = document.getElementById("file").files[0].size;
				
				if(uExt != "JPG" && uExt != "GIF" && uExt != "PNG") {
					alert("업로드 가능한 파일은 'JPG/GIF/PNG'파일 입니다.");
					return false;
				}
				else if(fName.indexOf(" ") != -1) {
					alert("업로드 파일명에 공백을 포함할 수 없습니다.");
					return false;
				}
				else if(fileSize > maxSize) {
					alert("업로드 파일의 크기는 2MByte를 초과할수 없습니다.");
					return false;
				}
				else {
					myform.email.value = email;
					myform.submit();
				}
		}	
		else {
			myform.email.value = email;
			myform.submit();
		}
	}

function onmail() {
    let btnmail = document.getElementById("btnmail").value
    document.getElementById("txtmail2").value = btnmail;
    
}    


function newwin() {
    let url = "${ctp}/member/signup_child";
    let winname = "newWindow";
    let winx = 700;
    let winy = 750;
    let x = (window.screen.width/2) - (winx/2);
    let y = (window.screen.height/2) - (winy/2);
    window.open(url,winname,"width="+winx+",height="+winy+",left="+x+",top="+y);
}

function memDelete() {
		let ans = confirm("회원탈퇴를 진행 하시겠습니까?");
		if(ans) {
			location.href="${ctp}/member/memDelete";
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
    height: 1000px;
}
#title0 {
	text-align:center;
	font-size:20px;		
	margin:50px;
} 
#main1 {
	border:1px solid lightgray;
	height:100px;
}
#main1-1 {
	width:8%;
	height:90%;
	margin:5px auto 5px 5px;
	float:left;
}
#main1-2 {
	height:90%;
	border-left:1px solid lightgray;
	float:left;
	margin:3px auto auto 20px;
	padding:30px;
	font-size:15px;
}
.btn0 {
    width: 100px;
    height: 40px;
    font-size: 15px;
    color: rgb(249, 249, 250);
    margin: 10px 5px;
    background-color: rgb(216, 117, 117);
    border: 0ch;
}
.btn0:hover {
    cursor: pointer;
    opacity: 0.8;
    color:white;
}
</style>
<body>
<div id="container">
<jsp:include page="/WEB-INF/views/include/header.jsp"/>
<hr/>
  <div id="section">
	  <div id="title0">회원 정보 수정</div>
	  	<div id="main1">
	  		<div id="main1-1"><img src="${ctp}/member/${vo.photo}" style="width:100%;height:100%;"/></div>
	  		<div id="main1-2"><span id="peach0">peach<i class="fa-solid fa-seedling"></i></span>에 오신 것을 환영합니다. <span style="font-weight:bold;">${vo.name}</span>님은 <span style="font-weight:bold;">
		  		<c:if test="${vo.level == 1}">
		  		[준회원]
		  		</c:if>
		  		<c:if test="${vo.level == 2}">
		  		[정회원]
		  		</c:if>
		  		<c:if test="${vo.level == 3}">
		  		[우수회원]
		  		</c:if>
		  		<c:if test="${vo.level == 0}">
		  		[운영자]
		  		</c:if>
		  		</span>입니다.</div>
	  	</div>
	  	<form id="myform" method="post" enctype="multipart/form-data" >
  <div id="sec2">    
      <div id="id">
          <label>
          <span class="text"><span style="color: red;">*</span>아이디</span><span id="iddemo" style="font-size:14px; color: red; position: absolute;"></span><br/>
          <input type="id" id="txtid" name="mid" class="txt" placeholder="아이디를 입력해주세요." value="${sMid}" readonly  style="margin-top:5px"  /></label>
      </div>
      <div id="name">
          <label>
          <span class="text"><span style="color: red;">*</span>성명</span><span id="namedemo" style="font-size:14px; color: red;"></span><br/>
          <input type="text" id="txtname" name="name" class="txt" placeholder="성명을 입력해주세요." value="${vo.name}"  style="margin-top:5px;" maxlength="8"  autofocus></label>
      </div>
      <div id="age">
          <label>
          <span class="text"><span style="color: red;">*</span>생년월일</span><span id="agedemo" style="font-size:14px; color: red; position: absolute;"></span><br/>
          <input type="text" id=txtage name="age" class="txt" style="margin-top:5px" value="${vo.age}"   maxlength="8" placeholder="예)19940227"></label> 
      </div>
      <div id="pwd">
          <label>
          <span class="text"><span style="color: red;">*</span>비밀번호</span><span id="pwddemo" style="font-size:14px; color: red;" ></span><br/>
          <input type="password" id="txtpwd" name="pwd" value="${sPwd}" class="txt" placeholder="영문,숫자,특수문자 8~20자" style="margin-top:5px"  maxlength="20" /></label><br/>
          <span class="text"><span style="color: red;">*</span>비밀번호 확인</span><span id="pwdcheckdemo" style="font-size:14px; color: red;"></span><br/>
          <input type="password" id="pwdcheck" name="pwdcheck" value="${sPwd}" class="txt" placeholder="비밀번호 확인" style="margin-top:5px"  />
      </div>
      <div id="mail">
          <label>
          <c:set var="emails" value="${fn:split(vo.email,'@')}"/>
				  <c:set var="email1" value="${emails[0]}"/>
				  <c:set var="email2" value="${emails[1]}"/>
          <span class="text"><span style="color: red;">*</span>이메일</span><span id="maildemo" style="font-size:14px; color: red; position: absolute;"></span><br/>
          <input type="text" id="txtmail" name="txtmail" class="txt" style="margin-top:5px" value="${email1}"/></label> @
          <input type="text" id="txtmail2" name="txtmail2" class="txt" placeholder="직접입력"  style="margin-top:5px" value="${email2}"/>
          <select name="btnmail" id="btnmail" onchange="onmail()">
              <option value="선택">
                  선택
              </option>
              <option value="naver.com">
                  naver.com
              </option>
              <option value="daum.net">
                  daum.net
              </option>
              <option value="google.com">
                  google.com
              </option>
              <option value="nate.com">
                  nate.com
              </option>
          </select>
      </div>
      <div id="tel">
          <label>
          <span class="text">전화번호</span><span id="teldemo" style="font-size:14px; color: red;"></span><br/>
          <input type="tel" id="txttel" name="tel" class="txt" style="margin-top:5px" placeholder="하이픈('-')없이 입력" value="${vo.tel}"/></label>
      </div>
      <div id="address">
      		<c:set var="address" value="${fn:split(vo.address,'/')}"/>
      		<c:set var="address1" value="${address[0]}"/>
      		<c:set var="address2" value="${address[1]}"/>
      		<c:set var="address3" value="${address[2]}"/>
      		<c:set var="address4" value="${address[3]}"/>
          <span class="text">주소</span><br/>
          <input type="text" id="sample6_postcode"  name="txtaddress" class="txt" style="margin:5px auto; width:150px" placeholder="우편번호" value="${address1}" >
          <input type="button" id="btnaddress" onclick="sample6_execDaumPostcode()" name="btnaddress"  value="주소검색" ><br/>
          <input type="text" id="sample6_address"  name="txtaddress1" class="txt" style="margin:5px auto; width:400px" value="${address2}"  >
          <input type="text" id="sample6_extraAddress"  name="txtaddress2" class="txt" placeholder="참고항목" style="margin:5px auto; width:400px"  value="${address3}" >
          <input type="text" id="sample6_detailAddress"  name="txtaddress3" class="txt" placeholder="상세주소" style="margin:5px auto; width:400px" value="${address4}"  >
      </div>
      <div  class="form-group">
      회원 사진(파일용량:2MByte이내) :<img src="${ctp}/member/${vo.photo}" width="80px"/>
      <input type="file" name="fName" id="file" class="form-control-file border"/>
    	</div>
      <div id="complete">
          <input type="button" id="ok" class=" btn0"  value="수정하기"  onclick="complete()"/>
          <input type="reset" id="reset" class=" btn0"  value="돌아가기"  onclick="history.back();"/>
          <input type="button" class=" btn0" style="margin-left:800px; background-color:lightgray; color:red;" value="회원탈퇴"  onclick="memDelete()"/>
          
      </div>
  </div>
  <input type="hidden" name="photo" value="${vo.photo}"/>
  <input type="hidden" name="email"/>
  <input type="hidden" name="address" id="address">
</form>
  </div>
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>  
</div>  
</body>
</html>