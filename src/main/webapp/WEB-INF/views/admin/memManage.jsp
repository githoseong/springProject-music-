<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>title</title>
  <jsp:include page="/WEB-INF/views/include/bs4.jsp"/>
  <script>
  	function userDel(mid) {
  		let ans = confirm("정말 탈퇴 시키겠습니까?")
  		if(ans) {
  			location.href="${ctp}/admin/userDel?mid="+mid;
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
    /* height: 1550px; */
}
#footer {
	margin-top:100px;
}
#member {
	text-align: center;
	margin:30px auto;
	font-size:30px;
	
}
</style>
<body>
<div id="container">
<jsp:include page="/WEB-INF/views/admin/admin2.jsp"/>
	<div id="section">
		<div id="member">회원 리스트</div>
		<table class="table table-hover">
			<tr>
				<td style="width:5%;">no</td>
				<td style="width:15%;">이름</td>
				<td style="width:17%;">아이디</td>
				<td style="width:18%;">메일</td>
				<td style="width:15%;">전화</td>
				<td style="width:10%;">등급</td>
				<td style="width:10%;">사용금액</td>
				<td style="width:10%;">탈퇴여부</td>
			</tr>
			<c:forEach var="vo" items="${vos}" varStatus="st">
				<tr>
					<td>${st.count}</td>
					<td>${vo.name}</td>
					<td>${vo.mid}</td>
					<td>${vo.email}</td>
					<td>${vo.tel}</td>
					<td>
						<c:if test="${vo.level == 0}">운영자</c:if>
						<c:if test="${vo.level == 1}">준회원</c:if>
						<c:if test="${vo.level == 2}">정회원</c:if>
						<c:if test="${vo.level == 3}">우수회원</c:if>
					</td>
					<td>${vo.moneyTotal}</td>
					<td>
					<c:if test="${vo.userDel == 'OK'}">
						<c:if test="${vo.applyDiff >= 30}"><a href="javascript:userDel('${vo.mid}')"><font color="red">탈퇴신청</font></a></c:if>
						<c:if test="${vo.applyDiff < 30}">탈퇴신청</c:if>
					</c:if>
					</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	
<!-- 블록 페이징 처리 시작 -->
<div class="text-center">
  <ul class="pagination justify-content-center">
	  <c:if test="${pageVO.pag > 1}">
	    <li class="page-item"><a href="memManage?pag=1&pageSize=${pageVO.pageSize}" class="page-link text-secondary">◁◁</a></li>
	  </c:if>
	  <c:if test="${pageVO.curBlock > 0}">
	    <li class="page-item"><a href="memManage?pag=${(pageVO.curBlock-1)*pageVO.blockSize + 1}&pageSize=${pageVO.pageSize}" class="page-link text-secondary">◀</a></li>
	  </c:if>
	  <c:forEach var="i" begin="${(pageVO.curBlock*pageVO.blockSize)+1}" end="${(pageVO.curBlock*pageVO.blockSize)+pageVO.blockSize}">
	    <c:if test="${i <= pageVO.totPage && i == pageVO.pag}">
	      <li class="page-item active"><a href="memManage?pag=${i}&pageSize=${pageVO.pageSize}" class="page-link text-light bg-secondary border-secondary">${i}</a></li>
	    </c:if>
	    <c:if test="${i <= pageVO.totPage && i != pageVO.pag}">
	      <li class="page-item"><a href='memManage?pag=${i}&pageSize=${pageVO.pageSize}' class="page-link text-secondary">${i}</a></li>
	    </c:if>
	  </c:forEach>
	  <c:if test="${pageVO.curBlock < pageVO.lastBlock}">
	    <li class="page-item"><a href="memManage?pag=${(pageVO.curBlock+1)*pageVO.blockSize + 1}&pageSize=${pageVO.pageSize}" class="page-link text-secondary">▶</a></li>
	  </c:if>
	  <c:if test="${pageVO.pag != pageVO.totPage}">
	    <li class="page-item"><a href="memManage?pag=${pageVO.totPage}&pageSize=${pageVO.pageSize}" class="page-link text-secondary">▷▷</a></li>
	  </c:if>
  </ul>
</div>
<!-- 블록 페이징 처리 끝 -->    	
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
</div>	
</body>
</html>