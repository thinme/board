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
	<link rel="stylesheet" type="text/css" href="./resources/css/board.css">
	<link rel="stylesheet" type="text/css" href="./resources/compnent/jquery-ui-1.12.1.custom/jquery-ui.min.css">
	<link rel="stylesheet" type="text/css" href="./resources/compnent/jquery-loading-master/dist/jquery.loading.min.css">
<meta charset="UTF-8">
<title>Insert title here</title>
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

<div class="detail">
<h1 style="width:50%;">boardUpdate</h1>
	<form id="upFrm" method="post">
		<input type="hidden" name="boardIdx" id="boardIdx" value="${boardVo.boardIdx}">
			<c:if test="${sessionId eq boardVo.boardMemberId or sessionAuth eq 'master' }">
			<div>
				<label for="boardNoticeYn">공지여부</label>
					<c:choose>
						<c:when test="${boardVo.boardNoticeYn eq 1}">
						<input type="radio" name="boardNoticeYn" value="1" checked="checked"/>공지등록
						<input type="radio" name="boardNoticeYn" value="0"/>공지해제
					</c:when>
					<c:when test="${boardVo.boardNoticeYn eq 0 or boardVo.boardNoticeYn eq null}">
						<input type="radio" name="boardNoticeYn" value="1"/>공지등록
						<input type="radio" name="boardNoticeYn" value="0" checked="checked"/>공지해제
					</c:when>
					</c:choose>
			</div>
				<div>
					<label for="boardWriteDate">작성일</label>
					<input type="text" class="dateInput" id="boardWriteDate" name="boardWriteDate" value="${boardVo.boardWriteDate}">
				</div>
				<div>
					<label for="boardMemberId">작성ID</label>
					<input type="text" id="boardMemberId" name="boardMemberId" value="${boardVo.boardMemberId}" readonly="readonly">
				</div>
				<div>
					<label for="boardMemberName">작성자</label>
					<input type="text" id="boardMemberName" name="boardMemberName" value="${boardVo.boardMemberName}" readonly="readonly">
				</div>
				<div>
					<label for="boardTitle">글제목</label>
					<input type="text" id="boardTitle" name="boardTitle" maxlength="30" value="${boardVo.boardTitle}">
				</div>
				<div style="position: relative;">
					<label for="boardcontent">내용</label>
					<div class="textCnt-wrapper">
						<span class="textCnt">0</span>
			    		<span class="textTotal">&nbsp;/&nbsp;1000자</span>
		    		</div>
				</div>
				<div>
					<textarea id="boardContent" name="boardContent" placeholder="내용을입렫바람">${boardVo.boardContent}</textarea>  
				</div>
			</c:if>
	</form>
	<div>
		<button type="button" id="listBtn">게시글목록</button>
		<button type="button" id="upBtn" value="수정완료">수정완료</button>
	</div>
</div>

</body>
</html>