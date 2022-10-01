<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>title</title>
<jsp:include page="/WEB-INF/views/include/bs4.jsp"/>
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
    if(txtpwd == "") {
        pwddemo.innerHTML = " *비밀번호를 입력해주세요."
        document.getElementById("txtpwd").focus();
        return false;
    }
    else if(txtpwd.length < 8 ) {
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
    if(txtmail == "" || txtmail2 == "") {
        maildemo.innerHTML = " *이메일을 입력해주세요."
        document.getElementById("txtmail").focus();
        return false;
    }
    else {
        maildemo.innerHTML = " "
    }
    if(txttel == "") {
    	teldemo.innerHTML = " *전화번호를 입력해주세요."
  		document.getElementById("txttel").focus();
      return false;
    }
    else if(regex6.test(txttel)) {
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
	if(fName.trim() == "") {
		myform.photo.value = "noimage"
	}
	else {
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
	}	
    
		
    if(myform.chk.checked == false) {
        alert("회원 약관에 동의해주세요.");   
        return false;
    }
    else if(sw == 0){
    	alert("아이디 중복확인을 해주세요");
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

function blurname() {
    let txtname = document.getElementById("txtname").value;
    const regex1 = /[^가-힣]/g;

    if(txtname == "") {
        namedemo.innerHTML = " *이름을 입력해주세요."
        return false;
    }
    else if(regex1.test(txtname)) {
        namedemo.innerHTML = " *이름은 한글로만 입력 가능합니다.."
        return false;
    }
    else {
        namedemo.innerHTML = "<font color='green'> *성명을 입력하셨습니다.</font> "
    }
}

function blurage() {
    let txtage = document.getElementById("txtage").value;
    const regex2 = /[0-9]{8}/g;

    if(txtage == "") {
        agedemo.innerHTML = " *생년월일을 입력해주세요."
        return false;
    }
    else if(!regex2.test(txtage)) {
        agedemo.innerHTML = " *생년월일은 8자리 숫자로만 입력해주세요."
        return false;
    }
    else {
    agedemo.innerHTML = "<font color='green'> *생년월일을 입력하셨습니다.</font> "
    }
}
function blurtel() {
	let txttel = document.getElementById("txttel").value;
	const regex6 = /\D/g;
	
	if(txttel == "") {
  	teldemo.innerHTML = " *전화번호를 입력해주세요."
		document.getElementById("txttel").focus();
    return false;
  }
  else if(regex6.test(txttel)) {
    teldemo.innerHTML = " *전화번호는 공백없이 숫자로만 입력해주세요."
    document.getElementById("txttel").focus();
    return false;
  }
  else {
    teldemo.innerHTML = "<font color='green'> *전화번호를 입력하셨습니다.</font> "
  }
}

function blurid() {
    let txtid = document.getElementById("txtid").value;
    const regex4 = /[^A-Za-z0-9]/g;

    if(txtid == "") {
        iddemo.innerHTML = " *아이디를 입력해주세요."
        return false;
    }
    else if(regex4.test(txtid)) {
        iddemo.innerHTML = " *아이디는 영문과 숫자만 입력해주세요."
        return false;
    }
    else {
        iddemo.innerHTML = "<font color='green'> *아이디를 입력하셨습니다.</font> "
    }
}

function blurpwd() {
    let txtpwd = document.getElementById("txtpwd").value;
    let pwdcheck = document.getElementById("pwdcheck").value;
    const regex5 = /(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$/

    if(txtpwd == "") {
        pwddemo.innerHTML = " *비밀번호를 입력해주세요."
        return false;
    }
    else if(txtpwd.length < 8 ) {
        pwddemo.innerHTML = " *비밀번호는 8자리 이상 입력해주세요. "
        return false
    }
    else if(!regex5.test(txtpwd)) {
        pwddemo.innerHTML = " *비밀번호는 영문, 숫자, 특수문자를 포함해주세요."
        return false;
    }
    else {
        pwddemo.innerHTML = " "
    }
    if(pwdcheck == "") {
        pwdcheckdemo.innerHTML = " *비밀번호를 다시 한번 입력해주세요."
        return false;
    }
    else if(pwdcheck != txtpwd ) {
        pwdcheckdemo.innerHTML = " *입력한 비밀번호와 다릅니다."
        return false;
    }
    else {
        pwdcheckdemo.innerHTML = "<font color='green'> *비밀번호를 입력하셨습니다.</font> "
    }
}

function blurmail() {
    let txtmail = document.getElementById("txtmail").value;

    if(txtmail == "" ) {
        maildemo.innerHTML = " *이메일을 입력해주세요."
        return false;
    }
    else {
        maildemo.innerHTML = "<font color='green'> *이메일을 입력하셨습니다.</font>  "
    }
}

//id중복체크
function idCheck() {
	let mid = myform.txtid.value;
	
	if(mid == "") {
		iddemo.innerHTML = " *아이디를 입력해주세요."
	  document.getElementById("txtid").focus();
		return false;
	}
	
		
	$.ajax({
		type : "post",
		url  : "${ctp}/member/signupIdCheck",
		data :{mid : mid},
		
		success: function(data) {
			if(data == "1") {
				iddemo.innerHTML = " *중복된 아이디가 있습니다.";
			}
			else {
				iddemo.innerHTML = "<font color='green'> *가입 가능한 아이디입니다.</font>";
				sw = 1;
			}
		},
		error : function() {
			alert("오류");
		}
	})
}

</script>
</head>
<style>
#section {
  border: 1px solid rgb(177, 171, 171);
  width: 700px;
  margin: 50px auto 150px;
  color:rgb(75, 73, 73);
}
#head2 {
  text-align: center;
  margin: 40px auto;
}
#sec2 {
  margin:0px auto;
  padding: 0px 75px 0px;
}
.txt {
  margin: 30px 0px;
  width: 200px;
  height: 30px;
  font-size: 15px;
}
.text {
  font-size: 17px;
  font-weight: 550;
  margin-bottom: 0px;
}
#complete {
  margin: 40px auto;
  text-align: center;
  width: 400px;
}
.complete {
  height: 60px;
  width: 150px;
  margin: 0px 5px;
  font-size: 18px;
  color: rgb(249, 249, 250);
  background-color: rgb(216, 117, 117);
  border: 0ch;
}
.complete:hover {
  opacity: 0.8;
  cursor: pointer;
}
#chk {  
  margin: 50px 0px 30px;
}
.btn {
  color: rgb(12,12,51);
  font-size: 13px;
  background-color: rgb(241, 239, 239);
  border: 1px solid;
  width: 70px;
  padding: 3px;
}
.btn:hover {
  opacity: 0.8;
  cursor: pointer;
}
.peach {
	  text-align: center;
	  margin:30px; auto;
}
.peach a {
    font-size: 70px;
    font-weight: bold;
    color: rgb(216, 148, 148);
    text-decoration: none;
  
}
</style>
<body>
<div class="peach"><a href="${ctp}/">peach<i class="fa-solid fa-seedling"></i></a></div>
<div id="section">
<form id="myform" method="post" enctype="multipart/form-data" >
  <div id="head2">
      <h2 style="font-weight: bold;">회원가입</h2>
  </div>
  <div id="sec2">    
      <div id="name">
          <label>
          <span class="text"><span style="color: red;">*</span>성명</span><span id="namedemo" style="font-size:14px; color: red;"></span><br/>
          <input type="text" id="txtname" name="name" class="txt" placeholder="성명을 입력해주세요." onblur="blurname();" style="margin-top:5px;" maxlength="8"  autofocus></label>
          
      </div>
      <div id="age">
          <label>
          <span class="text"><span style="color: red;">*</span>생년월일</span><span id="agedemo" style="font-size:14px; color: red; position: absolute;"></span><br/>
          <input type="text" id=txtage name="age" class="txt" style="margin-top:5px"   onblur="blurage();" maxlength="8" placeholder="예)19940227"></label> 
      </div>
      <div id="id">
          <label>
          <span class="text"><span style="color: red;">*</span>아이디</span><span id="iddemo" style="font-size:14px; color: red; position: absolute;"></span><br/>
          <input type="id" id="txtid" name="mid" class="txt" placeholder="아이디를 입력해주세요." onblur="blurid();" style="margin-top:5px"  /></label>
          <input type="button" id="idcheck" name="idcheck" class="btn" value="중복확인" onclick="idCheck()"/>
      </div>
      <div id="pwd">
          <label>
          <span class="text"><span style="color: red;">*</span>비밀번호</span><span id="pwddemo" style="font-size:14px; color: red;" ></span><br/>
          <input type="password" id="txtpwd" name="pwd" class="txt" placeholder="영문,숫자,특수문자 8~20자" style="margin-top:5px" onblur="blurpwd();" maxlength="20" /></label><br/>
          <span class="text"><span style="color: red;">*</span>비밀번호 확인</span><span id="pwdcheckdemo" style="font-size:14px; color: red;"></span><br/>
          <input type="password" id="pwdcheck" name="pwdcheck" class="txt" placeholder="비밀번호 확인" onblur="blurpwd();" style="margin-top:5px"  />
      </div>
      <div id="mail">
          <label>
          <span class="text"><span style="color: red;">*</span>이메일</span><span id="maildemo" style="font-size:14px; color: red; position: absolute;"></span><br/>
          <input type="text" id="txtmail" name="txtmail" class="txt" onblur="blurmail();" style="margin-top:5px" /></label> @
          <input type="text" id="txtmail2" name="txtmail2" class="txt" placeholder="직접입력" onblur="blurmail();" style="margin-top:5px" />
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
          <span class="text"><span style="color: red;">*</span>전화번호</span><span id="teldemo" style="font-size:14px; color: red;"></span><br/>
          <input type="tel" id="txttel" name="tel" class="txt" style="margin-top:5px" placeholder="하이픈('-')없이 입력" onblur="blurtel()"/></label>
      </div>
      <div id="address">
          <span class="text">주소</span><br/>
          <input type="text" id="sample6_postcode"  name="txtaddress" class="txt" style="margin:5px auto; width:150px" placeholder="우편번호" >
          <input type="button" id="btnaddress" onclick="sample6_execDaumPostcode()" name="btnaddress"  class="btn" value="주소검색" ><br/>
          <input type="text" id="sample6_address"  name="txtaddress1" class="txt" style="margin:5px auto; width:400px"  >
          <input type="text" id="sample6_extraAddress"  name="txtaddress2" class="txt" placeholder="참고항목" style="margin:5px auto; width:400px" >
          <input type="text" id="sample6_detailAddress"  name="txtaddress3" class="txt" placeholder="상세주소" style="margin:5px auto; width:400px" >
      </div>
      <div  class="form-group">
      회원 사진(파일용량:2MByte이내) :
      <input type="file" name="fName" id="file" class="form-control-file border"/>
    	</div>
      <div id="check">
          <input type="checkbox" id="chk" name="chk"/>
          <label for="chk"><span class="text">약관에 동의 하시면 체크를 해주세요.</span></label>
          <input type="button" id="btnchk" name="btnchk" class="btn" value="약관보기" onclick="newwin()">
      </div>
      <div id="complete">
          <input type="button" id="ok" class="complete"  value="가입하기" onclick="complete()"/>
          <input type="reset" id="reset" class="complete"  value="돌아가기" onclick="location.href='login.st';"/>
      </div>
  </div>
  <input type="hidden" name="photo"/>
  <input type="hidden" name="email"/>
  <input type="hidden" name="address" id="address">
</form>
</div>
</body>
</html>