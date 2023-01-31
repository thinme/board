<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<script src="./resources/compnent/jquery-3.3.1.min.js"></script>
	<script src="./resources/compnent/jquery-ui-1.12.1.custom/jquery-ui.min.js"></script>
	<script src="./resources/compnent/jquery-loading-master/dist/jquery.loading.min.js"></script>
	<script src="./resources/compnent/jqueryPrint/jqueryPrint.js"></script>

	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="./resources/js/member.js" charset="UTF-8"></script>
	<link rel="stylesheet" type="text/css" href="./resources/css/board.css">
<meta charset="UTF-8">
<title>Member Insert</title>
<style type="text/css">
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
	<a onclick="goLogin()"><img src="./resources/img/memberlogin.png" class="imgfile"/></a>	
	</div>
</div>
<div class="logincheck">
	<form name="memberInsert" id="memberInsert" class="detail">
	<input type="hidden" id="memberAuth" value="${memberAuth}">
	<h1>회원가입</h1>
		<table>
				<tr>
					<td>이름 :</td>
					<td>
						<input type="text" value="" id="memberName" name="memberName"/>
						<span id="nameChkresult"></span>
					</td>
				</tr>
				<tr>
					<td>ID :</td>
					<td>
					<input type="text" value="" id="memberId" name="memberId" maxlength=20/>
					<span id="idChkresult"></span>
					</td>
				</tr>
				<tr>
					<td>Password :</td>
					<td>
					<input type="password" id="memberPassword" name="memberPassword"/>
					<span id="pswdChkresult"></span>
					</td>
				</tr>
				<tr>
					<td>Password check :</td>
					<td>
					<input type="password" id="membertempPswd" name="membertempPswd"/>
					<span id="pswdDplChkresult"></span>
					</td>
				</tr>
				<tr>
					<td>E-mail :</td>
					<td>
					<input type="text" value="" id="memberEmail" name="memberEmail"/>
					<span id="emailChkresult"></span>
					</td>
				</tr>
				<tr>
					<td>주소 : </td>
					<td> 
						<div>
							<input type="text" name="memberZipcode" id="memberZipcode" />
							<input type="button" id="memberZipcodeBtn" value="주소검색">
							<span id="ZipcodeResult" style="margin-left: 5px;"></span>
							<br>
							<input type="text" name="memberAdress" id="memberAdress" style="width: 400px;"/>
							<br>
							<input type="text" name="memberDetailAdress" id="memberDetailAdress"/>
							<br>
							<input type="text" id="memberExtraAdress" name="memberExtraAdress" placeholder="참고항목">
						 </div>
					</td>
				</tr>
		</table>
		<div class="leftBtn">
		<button type="button" id="insertBtn">회원가입</button>
		</div>	
	</form>
	
</div>
</body>
</html>