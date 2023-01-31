<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<script src="./resources/compnent/jquery-3.3.1.min.js"></script>
	<script src="./resources/compnent/jquery-ui-1.12.1.custom/jquery-ui.min.js"></script>
	<script src="./resources/compnent/jquery-loading-master/dist/jquery.loading.min.js"></script>
	<script src="./resources/compnent/jqueryPrint/jqueryPrint.js"></script>
	
	<script src="./resources/js/board.js" charset="UTF-8"></script> 
	<script src="https://code.iconify.design/iconify-icon/1.0.2/iconify-icon.min.js"></script>
	<script src="https://code.iconify.design/iconify-icon/1.0.2/iconify-icon.min.js"></script>
	<link rel="stylesheet" type="text/css" href="./resources/css/board.css">
<title>detail title here</title>
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
	<a onclick="goBoard()"></a><img src="./resources/img/logo.png"></a>
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
<h1>상세글 보기</h1>

<form id="detailFrm" method="POST">
<input type="hidden" id="boardIdx" name="boardIdx" value="${boardVo.boardIdx}">
	<div class="detail_1">
		<label for="boardNoticeYn" style="width:40%;">공지여부</label>
		<c:choose>
		<c:when test="${boardVo.boardNoticeYn eq 1}">
		<iconify-icon icon="bx:circle"></iconify-icon>
		</c:when>
		<c:when test="${boardVo.boardNoticeYn eq 0 or boardVo.boardNoticeYn eq null}">
		<iconify-icon icon="bx:x"></iconify-icon>
		</c:when>
		</c:choose>
	</div>
	<div>
		<label for="boardWriteDate"class="detail_1">작성일자</label>
		<input type="text" name="boardWriteDate" id="boardWriteDate" value="${boardVo.boardWriteDate}" readonly/>
	</div>
	<div>
		<label for="boardMemberId" class="detail_1">작성ID</label>
		<input type="text" name="boardMemberId" id="boardMemberId" value="${boardVo.boardMemberId}"  readonly/>
	</div>
	<div>
		<label for="boardTitle" class="detail_1">글 제목</label>
		<input type="text" name="boardTitle" id="boardTitle" value="${boardVo.boardTitle}"  readonly/>
	</div>
	<div>
		<label for="boardContent" class="detail_1">내용</label>
	</div>
	<div>
		<textarea id="boardContent" name="boardContent" readonly>${boardVo.boardContent}</textarea>
	</div>
</form>
<div class="btn">
	<c:choose>
		 <c:when test="${sessionId eq boardVo.boardMemberId or sessionAuth eq 'master' or sessionAuth eq 'manager'}">
			<button type="button" onclick="goUp(${boardVo.boardIdx})">수정하기</button>	
			<button type="button"  id="delBtn">삭제</button>		
		</c:when>
	</c:choose>
			<button type="button" id="listBtn">글 목록</button>
	<br>
</div>
<form name="replyInsert" method="POST">
    <input type="hidden" name="loginId" id="loginId" value="${sessionId}">
	<input type="hidden" id="bno" name="bno" value="${boardVo.boardIdx}" />
	<c:if test="${sessionId != null}">
	<div>
		<label for="replyText" class="detail_1">댓글</label>
	</div>
	<div class="text">
		<textarea id="replyText" name="replyText" placeholder="댓글을 적어보세요" style="height:150px;"></textarea>
		<br>
			<button type="button" id="replyInsert" >댓글등록하기</button>
	</div>
	</c:if>
</form>
<br>
<br>
<h3 style="text-align:left;">댓글목록</h3>
<div id="replyList">


	<%-- <c:forEach items="${replyList}" var="reple">
			<p> 작성자 : ${reple.replyer}/등록일 : ${reple.regDate}</p>
			<p>${reple.replyText}</p>
			<c:if test="${sessionId eq reply.writer}">
				<button id="repUpBtn">수정하기</button>
				<button id="repDelBtn">삭제하기</button>
			</c:if>
	</c:forEach> --%>
</div>
</div>
</body>
</html>