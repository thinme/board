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
	
	<script src="./resources/js/board.js" charset="UTF-8"></script> 
	<link rel="stylesheet" type="text/css" href="./resources/compnent/jquery-ui-1.12.1.custom/jquery-ui.min.css">
	<link rel="stylesheet" type="text/css" href="./resources/compnent/jquery-loading-master/dist/jquery.loading.min.css">
	
	<link rel="stylesheet" type="text/css" href="./resources/css/board.css">
<meta charset="UTF-8">
<title>boardInsert title here</title>
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
<div class="center">
<h1>게시글 등록</h1>
	<form id="insertFrm" method="post">
		<div>	
			<label for="notice">공지여부</label>
				<input type="radio" name="boardNoticeYn" value="1" />공지등록
				<input type="radio" name="boardNoticeYn" value="0" />공지해제
			
		</div>	
		<div>
			<label for="boardwriteDate">작성일자</label>
				<input type="text" class="dateInput" id="boardWriteDate" name="boardWriteDate" >
			
		</div>
		
		<div>
			<label for="boardMemberName">작성자 이름</label>
				<input type="text" name="boardMemberName" id="boardMemberName" value="${loginName}" placeholder="이름작성란" readonly/>
			
		</div>
		<div>
			<label for="boardMemberId">작성자 ID</label>
				<input type="text" name="boardMemberId" id="boardMemberId" value="${loginId}" placeholder="아이디작성란" readonly/>
			
		</div>
		<div>
			<label for="boardTitle">제목</label>
				<input type="text" name="boardTitle" id="boardTitle" maxlength="30" placeholder="30자이내로 제목을 작성 해주세요"/>
			
		</div>
		<div>
			<label for="boardContent">내용</label>
			<div>
				<span class="textCnt">0</span>
				<span class="textTotal">&nbsp;/&nbsp;500자</span>
			</div>
		</div>
		<div>
			<textarea id="boardContent" name="boardContent" maxlength="500" placeholder="내용을 입력해주세요"></textarea>
		</div>
	</form>
	
	<button type="button" id="insertBtn">등록</button>
	<button type="button" id="listBtn">목록가기</button>
</div>
</body>
</html>