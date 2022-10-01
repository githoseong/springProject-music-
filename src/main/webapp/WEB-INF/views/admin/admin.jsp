<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>title</title>
  <jsp:include page="/WEB-INF/views/include/bs4.jsp"/>
  <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
  <script>
  google.charts.load('current', {'packages':['bar']});
  google.charts.setOnLoadCallback(drawChart);
  
  var count = 0;
  var data;
  var chart;
  var options;
  
  function drawChart() {
  data = new google.visualization.DataTable();
  data.addColumn('string', 'Dialogue');
  data.addColumn('number', '전체회원');
  data.addColumn('number', '1등회원');
  data.addRow(['총사용금액', , 1]); 
  data.addRow(['총다운수', ${vo.down}, ${vo.maxDown}]); 
  data.addRow(['총방문수', ${vo.VCo}, ${vo.maxVcnt}]); 
  data.addRow(['오늘방문수', ${vo.TCnt}, ${vo.maxTcnt}]); 
  
    options = {
      chart: {
        title: 'peach 통계 그래프',
      }
    };

    chart = new google.charts.Bar(document.getElementById('part11'));

    chart.draw(data, google.charts.Bar.convertOptions(options));
  }
  
  google.charts.load('current', {'packages':['corechart']});
	google.charts.setOnLoadCallback(numGraph3);
	google.charts.setOnLoadCallback(numGraph4);
	
	function numGraph3() {
	 	 var data = new google.visualization.DataTable();
		 data.addColumn('string', '음악');
		data.addColumn('number', '다운수');
		data.addRows([
			['${vos2.get(0).title}', ${vos2.get(0).downNum}],
			['${vos2.get(1).title}', ${vos2.get(1).downNum}],
			['${vos2.get(2).title}', ${vos2.get(2).downNum}]
		]);
		var options = {title:'음악 다운로드 순위',
			width:'100%',	
			height:300};
		var chart = new google.visualization.PieChart(document.getElementById('part331'));
		chart.draw(data, options);
		window.addEventListener('resize', numGraph3, false);
	  }
	function numGraph4() {
	 	 var data = new google.visualization.DataTable();
		 data.addColumn('string', '뮤직비디오');
		data.addColumn('number', '조회수');
		data.addRows([
			['${vos3.get(0).title}', ${vos3.get(0).readNum}],
			['${vos3.get(1).title}', ${vos3.get(1).readNum}],
			['${vos3.get(2).title}', ${vos3.get(2).readNum}],
		]);
		var options = {title:'뮤직비디오 조회 순위',
			width:'100%',	
			height:300};
		var chart = new google.visualization.PieChart(document.getElementById('part332'));
		chart.draw(data, options);
		window.addEventListener('resize', numGraph4, false);
	  }

  	function Music() {
  		document.getElementById("Music").style.color="rgb(216, 148, 148)";
	    document.getElementById("Music").style.backgroundColor="white";
	    document.getElementById("Video").style.color="black";
	    document.getElementById("Video").style.backgroundColor="rgb(248, 248, 248)";
	    document.getElementById("part44").style.display="none";
	    document.getElementById("part4").style.display="block";
  	}
  	function Video() {
  		document.getElementById("Video2").style.color="rgb(216, 148, 148)";
	    document.getElementById("Video2").style.backgroundColor="white";
	    document.getElementById("Music2").style.color="black";
	    document.getElementById("Music2").style.backgroundColor="rgb(248, 248, 248)";
	    document.getElementById("part4").style.display="none";
	    document.getElementById("part44").style.display="block";
  	}
	
  </script>
</head>
<jsp:include page="/WEB-INF/views/include/style.jsp"/>
<style>
#container {
    width: 1905px;
    background-color: lightgray;
}
#section {
    width: 90%;
    z-index: 1;
    margin: 40px auto;
    height: 1200px;
}
.part {
	margin:10px 10px ;
	background-color: white;
}
#part1 {
	width:31%;
	height:50%;
	float:left;
}
#part11 {
	height:60%;
	margin-bottom: 20px;
}
#part12 {
	width:90%;
	height:40%;
}
.part122 {
	float:left;
	width:50%;
	height:40%;
	text-align: center;
	font-weight:bold
}
#part2 {
	width:65%;
	height:50%;
	float:left;
	padding:30px;
}
#part2Title {
	font-size: 23px;
	margin:0px auto 10px 10px;
	
}
#part3 {
	width:40%;
	height:37%;
	float:left;
}
.part33 {
	width:50%;
	float:left;
}
#part4 {
	width:55%;
	height:37%;
	float:left;
	padding:30px;
}
#part44 {
	width:55%;
	height:37%;
	float:left;
	padding:30px;
}
#part4Title {
	font-size: 23px;
	margin:0px auto 10px 10px;
}
.tex {
	color:gray;
}
#select1 {
    text-align: center;
}
.Music {
    width:49%;
    height: 45px;
    background-color: white;
    color: rgb(216, 148, 148);
    border: 1px solid gainsboro;
}
.Video {
    width:49%;
    height: 45px;
    background-color: rgb(248, 248, 248);
    border: 1px solid gainsboro;
}
</style>
<body>
<div id="container">
<jsp:include page="/WEB-INF/views/admin/admin2.jsp"/>
  <div id="section">
  	<div id="part1" class="part">
	  <div id="part11"></div>
	  <div id="part12">
	  	<div class="part122"><span class="tex">총사용금액</span><br/>${vo.mon} 원</div>
	  	<div class="part122"><span class="tex">총다운수</span><br/>${vo.down} 회</div>
	  	<div class="part122"><span class="tex">총방문수</span><br/>${vo.VCo} 회</div>
	  	<div class="part122"><span class="tex">오늘방문수</span><br/>${vo.TCnt} 회</div>
	  </div>
	  </div>
	  <div id="part2" class="part">
	  	<div id="part2Title">회원 사용 금액 순위</div>
	  	<c:forEach var="vo" items="${vos}" varStatus="st">
		  	<div>
		  		<table class="table table-hover">
		  			<tr>
		  				<td style="width:7%">${st.count}</td>
		  				<td style="width:43%">
		  					<div style="float:left; width:16%; height:60px;"><img src="${ctp}/member/${vo.photo}" style="width:100%; height:100%;"/></div>
		  					<div style="float:left; margin-left:20px;">${vo.mid}<br/><span style="color:gray;">${vo.name}</span></div>
		  				</td>
		  				<td style="width:20%">${vo.moneyTotal} 원</td>
		  				<td style="width:10%">${vo.VCount} 회</td>
		  				<td style="width:20%">
		  					<c:if test="${vo.level == 0}">운영자</c:if>
		  					<c:if test="${vo.level == 1}">준회원</c:if>
		  					<c:if test="${vo.level == 2}">정회원</c:if>
		  					<c:if test="${vo.level == 3}">우수회원</c:if>
		  				</td>
		  			</tr>
		  		</table>
		  	</div>
	  	</c:forEach>
	  </div>
	  <div id="part3" class="part">
	  	<div class="part33" id="part331" ></div>
	  	<div class="part33" id="part332" ></div>
	  </div>
	  <div id="part4" class="part" >
	  	<div id="part4Title">음악 다운로드 순위</div>
	  	<div id="select1">
	  		<input type="button" value="Music"  id="Music" class="Music" onclick="Music()"> 
        <input type="button" value="Video"  id="Video" class="Video" onclick="Video()">
      </div>   
	  	<c:forEach var="vo" items="${vos2}" varStatus="st">
		  	<div>
		  		<table class="table table-hover">
		  			<tr>
		  				<td style="width:10%;">${st.count}</td>
		  				<td style="width:50%;"><div style="width:16%; height:60px; float:left;"><img src="${ctp}/pds/${vo.FSName2}" style="width:100%; height:100%;"/></div><div style="float:left; margin-left:20px;">${vo.title}</div></td>
		  				<td style="width:30%;">${vo.artist}</td>
		  				<td style="width:10%;">${vo.downNum} 회</td>
		  			</tr>
		  		</table>
		  	</div>
	  	</c:forEach>
	  </div>
	  <div id="part44" class="part" style="display:none;">
	  	<div id="part4Title">뮤직비디오 조회 순위</div>
	  	<div id="select1">
	  		<input type="button" value="Music"  id="Music2" class="Music" onclick="Music()"> 
        <input type="button" value="Video"  id="Video2" class="Video" onclick="Video()">
      </div>   
	  	<c:forEach var="vo" items="${vos3}" varStatus="st">
		  	<div>
		  		<table class="table table-hover">
		  			<tr>
		  				<td style="width:10%;">${st.count}</td>
		  				<td style="width:50%;"><div style="width:16%; height:60px; float:left;"><img src="${ctp}/video/${vo.FSName}" style="width:100%; height:100%;"/></div><div style="float:left; margin-left:20px;">${vo.title}</div></td>
		  				<td style="width:30%;">${vo.artist}</td>
		  				<td style="width:10%;">${vo.readNum} 회</td>
		  			</tr>
		  		</table>
		  	</div>
	  	</c:forEach>
	  </div>
  </div>
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>  
</div>
</body>
</html>