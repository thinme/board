<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<script src="./resources/compnent/jquery-3.3.1.min.js"></script>
	<script src="./resources/compnent/jquery-ui-1.12.1.custom/jquery-ui.min.js"></script>
	<script src="./resources/compnent/jquery-loading-master/dist/jquery.loading.min.js"></script>
	<script src="./resources/compnent/jqueryPrint/jqueryPrint.js"></script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="./resources/js/member.js" charset="UTF-8"></script> 
	<link rel="stylesheet" type="text/css" href="./resources/css/member.css">
<meta charset="UTF-8">
<title>Detail title here</title>
<style>
.loginBox{
	float:right;
	
	text-align:center;
	z-index:1;
	border: 5px solid #F4E8F6;
	position: realitive;
	background-color:white;
	font-color:white;
	cursor:pointer;
}
.imgfile{
	width:70px;
	height:70px;
	cursor:pointer;
}
</style>
</head>
<body>
<div class="logo">
	<a onclick="goBoard()"><img src="./resources/img/logo.png"></a>
	<div class="loginBox">
		<c:choose>
	 		<c:when test="${sessionId eq null}"> 
				<a onclick="goLogin()"><img src="./resources/img/memberlogin.png" class="imgfile"/></a>
			</c:when> 
		 	<c:when test="${sessionId ne null}">
				<p>${sessionName} 님 어서오세요.</p>
				<a onclick="dropMenu()"><img src="./resources/img/memberlogin.png" class="imgfile"/></a>
				<div id="dropMenu" style="display:none;">
					<c:choose>
						<c:when test="${sessionAuth eq 'master' or sessionAuth eq 'manager'}">
							<a onclick="goMemberList()">회원관리</a>
						</c:when>
						<c:when test="${sessionAuth eq 'member'}">
							<a onclick="goMyPage(${sessionIdx})" class="imgfile">내 정보</a>
						</c:when>
					</c:choose>
					<hr>
					<a href="./logout">로그아웃하기</a>
				</div>
			</c:when>
		</c:choose>	
	</div>
</div>
<div class="detail">
	<h1>상세보기</h1>
	<form id="memberdetail" method="post">	
	<input type="hidden" id="memberIdx" name="memberIdx" value="${memberVo.memberIdx}"/>
		<table>
			<tr>
				<td>번호</td>
				<td>${memberVo.memberIdx}</td>
			</tr>
			<tr>
				<td>이름</td>
				<td>${memberVo.memberName}</td>
			</tr>
			<tr>
				<td>아이디</td>
				<td>${memberVo.memberId}</td>
			</tr>
			<tr>
				<td>이메일</td>
				<td>${memberVo.memberEmail}</td>
			</tr>
			<tr>
				<td>우편번호</td>
				<td>${memberVo.memberZipcode}</td>
			</tr>
			<tr>
				<td>주소</td>
				<td>${memberVo.memberAdress}${memberVo.memberDetailAdress}${memberVo.memberExtraAdress}</td>
			</tr>
			<tr>
				<td>등록일자</td>
				<td>${memberVo.memberRegDate}</td>
			</tr>
			<tr>
				<td>업데이트일자</td>
				<td>${memberVo.memberUpdateDate}</td>
			</tr>
			<tr>
				<td>등록ID</td>
				<td>${memberVor.memberRegId}</td>
			</tr>
			<tr>
				<td>업데이트ID</td>
				<td>${memberVo.memberUpdateId}</td>
			</tr>
			<tr>
				<td>등록IP</td>
				<td>${memberVo.memberRegIp}</td>
			</tr>
			<tr>
				<td>업데이트IP</td>
				<td>${memberVo.memberUpdateIp}</td>
			</tr>
			<tr>
				<td>직위</td>
				<td>${memberVo.memberAuth}</td>
			</tr>
		</table>
	
		<div class="rightBtn">
		<button type="button" onclick="goUpdate(${memberVo.memberIdx})" >수정하기</button>
		<button id="delBtn" name="delBtn" type="button" type="submit" onsubmit="return false;">삭제</button> 
		<button  type="button" onclick="goBoardList()">글 목록</button>
	</div>
	</form>
</div>
</body>
</html>