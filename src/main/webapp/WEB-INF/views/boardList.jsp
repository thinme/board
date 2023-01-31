<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>  
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
<meta charset="UTF-8">
<title>boardList title here</title>
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
				<button onclick="goLogin()" type="button" class="login">로그인하기</button>
				<br>
				<button onclick="goInsert()" type="button" class="login">회원가입하기</button>
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

<br>
<br>
<h1 style="text-align:center;">게시글 목록</h1>
<br>
<br>

<input type="hidden" name="loginId" id="loginId" value="${sessionId}">

<form id="searchFrm" method="post" class="searchBox">
	<select id="searchCondition" name="searchCondition">
		<option value="" <c:if test="${search.searchCondition == null || search.searchCondition eq '' }">selected</c:if>>검색조건</option>
		<option value="boardMemberId" <c:if test="${search.searchCondition eq 'boardMemberId' }">selected</c:if>>ID</option>
		<option value="boardMemberName" <c:if test="${ search.searchCondition eq 'boardMemberName' }">selected</c:if>>이름</option>
		<option value="boardTitle" <c:if test="${ search.searchCondition eq 'boardTitle' }">selected</c:if>>제목</option>
		<option value="boardContent" <c:if test="${ search.searchCondition eq 'boardContent' }">selected</c:if>>내용</option>
	</select>
	<input type="text" id="boardSearchWord" name="boardSearchWord" value="${search.boardSearchWord}"/>
	<button id="searchBtn">검색</button>
</form>
<br>
<div class="btn">
<button type="button" id="regBtn">게시글작성</button>
<c:choose>
	<c:when test="${sessionAuth eq 'master'}">
		<button type="button" onclick="boardDeleteChkList()" class="btn">삭제</button>
	</c:when>
</c:choose>
</div>
<table class="boardTable">
	<thead>
		<tr>
			<th><input type="checkbox" id=checkAll name="checkAll"></th>
			<th>번호</th>
			<th>제목</th>
			<th>내용</th>
			<th>작성자</th>
			<th>등록ID</th>
			<th>작성일자</th>
			<th>등록일자</th>
			<th>수정일자</th>
			<th>등록IP</th>
			<th>수정IP</th>
			<th>조회수</th>
		<tr>
	</thead>
	<tbody>
		<c:forEach items="${boardVo}" var="boardVo">
			<tr ondblclick="goDetail(${boardVo.boardIdx})">
				<td onclick="event.cancelBubble=true">
				<input type="checkbox" id="${boardVo.boardIdx}" name="check" value="${boardVo.boardIdx}"/>
				</td>
				<td onclick="">${boardVo.boardIdx}</td>
				<c:choose>
				<c:when test="${boardVo.boardNoticeYn eq 1}">
				<td><strong>[공지]</strong>${boardVo.boardTitle}</td>
				</c:when>
				<c:when test="${boardVo.boardNoticeYn eq 0 or boardVo.boardNoticeYn eq null}">
				<td>${boardVo.boardTitle}</td>
				</c:when>
				</c:choose>				
				<td>${boardVo.boardContent}</td>
				<td>${boardVo.boardMemberName}</td>
				<td name="boardMemberId">${boardVo.boardMemberId}</td>
				<td>${boardVo.boardWriteDate}</td>
				<td>${boardVo.boardRegDate}</td>
				<td>${boardVo.boardUpdateDate}</td>
				<td>${boardVo.boardRegIp}</td>
				<td>${boardVo.boardUpdateIp}</td>
				<td>${boardVo.viewCount}</td>
			</tr>
		</c:forEach>
	</tbody>
</table>
<div class="paging">
		<ul>
			<c:if test="${paging.prev}">
		    	<span>
		    		<a href='<c:url value="/boardList?page=${paging.startPage - 1}"/>'></a>
		    	</span>
		    </c:if>
		    <c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="num">
				<c:choose>
					<c:when test="${paging.cri.page eq num}">
						<span><a>${num}</a></span>
					</c:when>
					<c:otherwise>
						<span><a href='<c:url value="/boardList?page=${num}"/>'>${num}</a></span>
					</c:otherwise>
				</c:choose>
		    </c:forEach>
		    <c:if test="${paging.next && paging.endPage > 0}">
		    	<span>
		    		<a href='<c:url value="/boardList?page=${paging.endPage + 1}"/>'></a>
		    	</span>
		    </c:if>
		</ul>
</div>
</body>
</html>