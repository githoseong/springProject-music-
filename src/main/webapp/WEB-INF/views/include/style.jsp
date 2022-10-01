<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<style>
#head {
    height: 34px;
    z-index: 2;
    width: 1905px;
    border-bottom: 1px solid lightgray;
}
#headmenu2 {
    margin: 0px auto;
    text-align: right;
    width:360px;
    margin-right:350px;
    padding:2px;
	}
.headmenu2 {
    font-size: 17px;
    color: rgb(109, 106, 106);
    margin: 0px 13px;
    float:right;
}
.headmenu2 a {
	color:rgb(109, 106, 106);
}
.headmenu2 a:hover {
    color: black;
    text-decoration: none;
    
}
#header2 {
    width: 60%;
    margin: 40px auto;
}
#hImg {
	width:40px;
	height:40px;
	border-radius: 50px;
	overflow: hidden;
}
#title {
    margin-left: 50px;
}
#icon {
    position: relative;
    right: 30px;
    top: 3px;
    font-size: 23px;
    color: rgb(99, 98, 98);
}
.peach a {
    font-size: 50px;
    font-weight: bold;
    color: rgb(216, 148, 148);
    text-decoration: none
}
#search {
    width: 350px;
    height: 35px;
    border: 3px solid rgb(216, 148, 148);
    border-radius: 10px;
    font-size:15px
}
#search:focus {
    outline: none;
}
#menu {
    margin: 50px auto auto auto;
    height: 50px;
}
#menu2 li {
    float: left;
    margin-left: 30px;
    list-style: none;
    font-size: 17px;
    font-weight: 700;
    color: black;
}
#menu2 li a {
	text-decoration: none; color:black;
}
#menu2 li a:hover {
    color: rgb(216, 148, 148);
}
#char {
	text-decoration: none; color:black;
}
#char:hover {
	color: rgb(216, 148, 148);
	cursor: pointer;
}
#footer {
    border-top: 1px solid lightgray;
    margin: 10px auto 0px;
}
#foot {
    width: 60%;
    margin: 0px auto;
    height: 200px;
}
#foot1 {
    float: left;
    margin: 20px;
    width: 500px;
    font-size: 14px;
    color: rgb(117, 115, 115);
}
#foot2 {
    float: left;
    margin: 30px 10px 0px 310px;
    font-size: 50px;
    font-weight: bold;
    color: rgb(216, 148, 148);
}
#foot3 {
    width: 300px;
    margin: 10px auto auto 780px;
}
#foot3 > ul > li {
    list-style: none;
    float: left;
    margin-left: 15px;
    font-size: 40px;
    color: rgb(158, 145, 145);
}
#commercial {
	border:1px solid gray;
	width:300px;
	height:100px;
	position: absolute;
	top:100px;
	right:430px;
}
.loadingBox {
	position:absolute;
	top:50%;
	left:50%;
	height:40%;
}
.loadingBox .circle {transform:translate(-50%, -50%); width:160px; height:160px;  border-radius:20px; transition:all .5s; 
		border:3px solid;
    animation-name:spinCircle;
    animation-duration:0s;
    animation-iteration-count:infinite;
    animation-timing-function:linear;
    font-size:90px;
    text-align: center;
    padding:10px;
}
@keyframes spinCircle {
  from {
      transform:translate(-50%, -50%) rotate(0);
  }
  to {
      transform:translate(-50%, -50%) rotate(360deg);
  }
}
</style>