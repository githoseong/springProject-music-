<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<div id="footer">
    <div style="background-color:rgb(235, 236, 236);" id="footer2">
        <footer id="foot">
            <div id="foot1">
                상호 : 피치 뮤직 ㅣ 대표이사 : 이호성 ㅣ개인정보취급자 : leehs030@naver.com  고객센터 : 02-1111-2222 ㅣ

주소 : 청주시 상당구 영운동 우리집 <br>

Fax : 02-1234-4567 ㅣ  E-mail : leehs030@naver.com <br/>

사업자등록번호 : 101-11-12345 ㅣ  
통신판매신고 : 제2020-청주-01467 <br/>

호스팅사업자 : (주)코리아센터
            </div>
            <div id="foot2" class="peach">
                <a href="${ctp}/" >peach<i class="fa-solid fa-seedling"></i></a>
            </div>
            <div id="foot3">
                <ul>
                    <li><i class="fa-brands fa-twitter-square"></i></li>
                    <li><i class="fa-brands fa-facebook-square"></i></li>
                    <li><i class="fa-brands fa-instagram-square"></i></li>
                    <li><i class="fa-solid fa-envelope"></i></li>
                </ul>
            </div>
        </footer>    
    </div>
</div>