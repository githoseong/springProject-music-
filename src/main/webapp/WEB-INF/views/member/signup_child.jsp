<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
'ust strict'
function ok() {
    window.close();
}
</script>
</script>
</head>
<style>
.container {
    text-align: center;
}
li {
    text-align: left;
    margin: 30px auto;
}
#btn {
    opacity: 0.8;
    cursor: pointer;
}
</style>
<body>
<div class="container">
	 <h2>회원약관</h2>
	 <ul>
		 <li>이 약관은 회사가 인터넷 상에서 제공하는 모든 서비스의 이용절차 및 기타 필요한 사항에 적용됩니다.</li>
		 <li>신용카드 이용과 관련된 사항은 신용카드 회원약관(개인회원, 기업회원), 가맹점 약관 및 여신전문금융업법, 할부거래 이용에 관한 법률, 개인정보보호법 등의 적용을 받습니다.</li>
		 <li>이 약관에 명시되지 않은 사항 및 각 사이트 별 해당 서비스에 대해서는 전자거래기본법, 정보통신망 이용촉진 및 정보보호에 관한 법률 등 관계법령, 해당 서비스 별 관련법령 및 회사가 정한 서비스의 세부이용지침 등의 규정에 의합니다.</li>
		 <li>회원의 자격에 따라 서비스 이용의 일부가 제한될 수 있으며, 각 사이트의 별도 이용계약 체결여부에 따라 회원 자격 및 서비스 이용 범위가 변동될 수 있습니다.</li>
		 <li>회원의 개인정보는 개인정보보호법 등 관련법률이 정하는 바에 따라 엄격히 관리되며, 회원은 원하지 않는 경우 회사가 제공하는 정보의 수신을 거부할 수 있습니다.</li>
		 <li>회원은 회사가 제공하는 모든 서비스의 이용이 가능합니다. 다만, 회원 구분 및 등급 또는 유료서비스의 경우 일부 서비스 이용이 제한될 수 있습니다.</li>
	 </ul>
	 
	 <div>
	     <input type="button" value="닫기" id="btn" onclick="ok()"/>
	</div>
</div>
</body>
</html>