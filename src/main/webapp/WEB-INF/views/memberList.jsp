<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	 
	
	<script src="./resources/compnent/jquery-3.3.1.min.js"></script>
	<script src="./resources/compnent/jquery-ui-1.12.1.custom/jquery-ui.min.js"></script>
	<script src="./resources/compnent/jquery-loading-master/dist/jquery.loading.min.js"></script>
	<script src="./resources/compnent/jqueryPrint/jqueryPrint.js"></script>
	
	<script src="./resources/js/member.js" charset="UTF-8"></script>
	<link rel="stylesheet" type="text/css" href="./resources/css/member.css">
<meta charset="UTF-8">
<title>List page</title>
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

	<form id="memberSearchfrm" method="post" class="searchBox">
	
			<select id="searchCondition" name="searchCondition" >
				<option value="" <c:if test="${search.searchCondition == null || search.searchCondition eq ''}">selected</c:if>>검색조건</option>
				<option value="memberId" <c:if test="${search.searchCondition eq 'memberId'}">selected</c:if>>아이디</option>
				<option value="memberName" <c:if test="${search.searchCondition eq 'memberName'}">selected</c:if>>이름</option>
			</select>
			<input type="text" id="memberSearchWord" name="memberSearchWord" value="${search.memberSearchWord}">
			<button id="searchBtn">검색</button>
		</form>
			<button type="button" onclick="memberDeleteChkList()" class="btn">삭제</button>
	<table class="boardTable">
		<thead>
			<tr>
				<td><input type="checkbox" id="checkAll" name="checkAll"></td>
				<td>번호</td>
				<td>이름</td>
				<td>ID</td>
				<td>이메일</td>
				<td>회원등록일자</td>
				<td>회원수정일자</td>
				<td>회원등록ID</td>
				<td>회원수정ID</td>
				<td>회원IP</td>
				<td>회원수정IP</td>
				<td>권한</td>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${memberVo}" var="memberVo">
				<tr ondblclick="goDetail(${memberVo.memberIdx})">
					<td onclick="event.cancelBubble=true">
					<input type="checkbox" id="${memberVo.memberIdx}" name="check" value="${memberVo.memberIdx}"/>
					</td>
					<td onclick="">${memberVo.memberIdx}</td>
					<td>${memberVo.memberName}</td>
					<td>${memberVo.memberId}</td>
					<td>${memberVo.memberEmail}</td>
					<td>${memberVo.memberRegDate}</td>
					<td>${memberVo.memberUpdateDate}</td>
					<td>${memberVo.memberRegId}</td>
					<td>${memberVo.memberUpdateId}</td>
					<td>${memberVo.memberRegIp}</td>
					<td>${memberVo.memberUpdateIp}</td>
					<td>${memberVo.memberAuth}</td>	
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div class="paging">
		<ul>
			<c:if test="${paging.prev}">
		    	<span>
		    		<a href='<c:url value="/memberList?page=${paging.startPage - 1}"/>'></a>
		    	</span>
		    </c:if>
		    <c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="num">
				<c:choose>
					<c:when test="${paging.cri.page eq num}">
						<span><a>${num}</a></span>
					</c:when>
					<c:otherwise>
						<span><a href='<c:url value="/memberList?page=${num}"/>'>${num}</a></span>
					</c:otherwise>
				</c:choose>
		    </c:forEach>
		    <c:if test="${paging.next && paging.endPage > 0}">
		    	<span>
		    		<a href='<c:url value="/memberList?page=${paging.endPage + 1}"/>'></a>
		    	</span>
		    </c:if>
		</ul>
	</div>
</body>
</html>
