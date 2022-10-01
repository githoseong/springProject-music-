<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="/WEB-INF/views/include/bs4.jsp"/>
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
    /* height: 2000px; */
}
#title3 {
	text-align: center;
	margin:30px auto;
}
#topBtn {
	margin-left:200px;
}
.btn {
	width:120px;
  height: 45px;
  background-color: white;
  border: 1px solid gainsboro;
}
.btn:hover {
    cursor: pointer;
    color:rgb(216, 148, 148);
    opacity: 0.8;
}
#footer {
	margin-top:140px;
}
</style>
<body>
<div id="container">
<jsp:include page="/WEB-INF/views/include/header.jsp"/>
  <hr/>
  <section id="section">
  <div id="topBtn">
  	<input type="button" value="문의 보내기" onclick="location.href='${ctp}/member/ask'" class="btn" />
  </div>
   <h2 style="font-weight:bold" id="title3">문의 내역</h2>
   <div>
     <table id="th" class="table table-hover">
         <thead>
             <tr>
                 <th style="width:100px">번호</th>
                 <th style="width:450px">문의제목</th>
                 <th style="width:130px">문의날짜</th>
                 <th style="width:130px">아이디</th>
                 <th style="width:130px">답변내역
                 
                 </th>
             </tr>
         </thead>
	         <c:forEach var="vo" items="${vos}" varStatus="st">
	         <tbody>
	             <tr>
	                 <td>${st.count}</td>
	                 <td style="text-align: left;"><a href="${ctp}/member/askContent?idx=${vo.idx}" style="color:black;">${vo.title}</a></td>
	                 <td>${fn:substring(vo.askDate,0,16)}</td>
	                 <td>${vo.mid}</td>
	                 <td>
	                 	<c:if test="${vo.answer == 'NO'}">문의중</c:if>
	                 	<c:if test="${vo.answer == 'OK'}"><font color="blue">답변완료</font></c:if>
	                 </td>
	             </tr>
	         </tbody>
	         </c:forEach>    
     </table>
	 </div>
 </section>
 
<!-- 블록 페이징 처리 시작 -->
<div class="text-center">
  <ul class="pagination justify-content-center">
	  <c:if test="${pageVO.pag > 1}">
	    <li class="page-item"><a href="askList?pag=1&pageSize=${pageVO.pageSize}" class="page-link text-secondary">◁◁</a></li>
	  </c:if>
	  <c:if test="${pageVO.curBlock > 0}">
	    <li class="page-item"><a href="askList?pag=${(pageVO.curBlock-1)*pageVO.blockSize + 1}&pageSize=${pageVO.pageSize}" class="page-link text-secondary">◀</a></li>
	  </c:if>
	  <c:forEach var="i" begin="${(pageVO.curBlock*pageVO.blockSize)+1}" end="${(pageVO.curBlock*pageVO.blockSize)+pageVO.blockSize}">
	    <c:if test="${i <= pageVO.totPage && i == pageVO.pag}">
	      <li class="page-item active"><a href="askList?pag=${i}&pageSize=${pageVO.pageSize}" class="page-link text-light bg-secondary border-secondary">${i}</a></li>
	    </c:if>
	    <c:if test="${i <= pageVO.totPage && i != pageVO.pag}">
	      <li class="page-item"><a href='askList?pag=${i}&pageSize=${pageVO.pageSize}' class="page-link text-secondary">${i}</a></li>
	    </c:if>
	  </c:forEach>
	  <c:if test="${pageVO.curBlock < pageVO.lastBlock}">
	    <li class="page-item"><a href="askList?pag=${(pageVO.curBlock+1)*pageVO.blockSize + 1}&pageSize=${pageVO.pageSize}" class="page-link text-secondary">▶</a></li>
	  </c:if>
	  <c:if test="${pageVO.pag != pageVO.totPage}">
	    <li class="page-item"><a href="askList?pag=${pageVO.totPage}&pageSize=${pageVO.pageSize}" class="page-link text-secondary">▷▷</a></li>
	  </c:if>
  </ul>
</div>
<!-- 블록 페이징 처리 끝 -->  
  
<jsp:include page="/WEB-INF/views/include/footer.jsp"/> 
</div>
</body>
</html>