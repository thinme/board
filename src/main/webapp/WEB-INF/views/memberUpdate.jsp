<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<title>memberUpdate title here</title>
<head>
	
	<script src="./resources/compnent/jquery-3.3.1.min.js"></script>
	<script src="./resources/compnent/jquery-ui-1.12.1.custom/jquery-ui.min.js"></script>
	<script src="./resources/compnent/jquery-loading-master/dist/jquery.loading.min.js"></script>
	<script src="./resources/compnent/jqueryPrint/jqueryPrint.js"></script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="./resources/js/member.js" charset="UTF-8"></script>
	<link rel="stylesheet" type="text/css" href="./resources/css/member.css">
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
							<a onclick="goBoardList()">게시글목록</a>
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
<h1>회원수정페이지</h1>

	<form action="./memberUpdateOk" id="detailfrm" method="post">
	<input type="hidden" id="memberIdx" name="memberIdx" value="${memberVo.memberIdx}">
	<input type="hidden" id="memberName" name="memberName" value="${memberVo.memberName}">
	<table>
		<tr>
		</tr>
		<tr>
			<td>이름</td>
			<td>${memberVo.memberName}</td> 
		</tr>
		<tr>
			<td>ID</td>
			<td><input type="text" value="${memberVo.memberId}" name="memberId" id="memberId" ></td>
		</tr>
		<tr>
			<td>PW</td>
			<td><input type="password"  value="${memberVo.memberPassword}" name="memberPassword" id="memberPassword" ></td>
		</tr>
		<tr>
			<td>이메일</td>
			<td><input type="text" value="${memberVo.memberEmail}" name="memberEmail" id="memberEmail" ></td>
		</tr>
		<tr>
			<td>주소 : </td>
			<td> 
				<div>
					<input type="text" name="memberZipcode" id="memberZipcode" value="${memberVo.memberZipcode}"/>
					<input type="button" id="memberZipcodeBtn" value="주소검색">
					<span id="ZipcodeResult" style="margin-left: 5px;"></span>
					<br>
					<input type="text" name="memberAdress" id="memberAdress" value="${memberVo.memberAdress}" style="width: 400px;"/>
					<br>
					<input type="text" name="memberDetailAdress" id="memberDetailAdress" value="${memberVo.memberDetailAdress}"/>
					<br>
					<input type="text" id="memberExtraAdress" name="memberExtraAdress" value="${memberVo.memberExtraAdress}" placeholder="참고항목">
				 </div>
			</td>
		</tr>
		 <c:if test="${ sessionAuth eq 'master' or sessionAuth eq 'manager'}">
		<tr>
			<td> 권한</td>
			<td><select name="memberAuth" id="memberAuth" >
				<option value="member"> member</option>
				<option value="master"> master</option>
				<option value="manager">manager</option>
				</select>
			</td>
		</tr>
		</c:if>
	</table>
	</form>
		<div class="rightBtn">
			<input type="button" id = "upBtn" value="수정완료" class="alter">
			<input type="button" id="listBtn" value=" 회원 목록이동" class="alter"/>
		</div>
</div>
</body>
</html>