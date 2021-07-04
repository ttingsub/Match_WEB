<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>QnA 글 보기</h3>
<table>
<!-- String[] category = 
new String[]{"운영정책","계정/인증","이벤트/초대", "이용 제재", "기타", "모모 채팅", "모모 종목", "모모 매너", "모모 종목" }; -->
	<tr>
		<th class="w-px100">제목</th>
		<td colspan="5" class="left"> ${vo.title}</td>
		<th class="w-px100">카테고리</th>
		<td></td>
	</tr>
		<tr>
		<th class="w-px40">작성자</th>
		<td>${vo.writer}</td>
		<th class="w-px120">작성일자</th>
		<td class="w-px120">${vo.writedate}</td>
		<th class="w-px80">조회수</th>
		<td class="w-px80">${vo.readcnt}</td>
	</tr>
	<tr>
		<th>내용</th>
		<td colspan="5" class="left"> ${ fn:replace (vo.content , crlf ,'<br>') }</td>
	</tr>
	<tr>
		<th>첨부파일</th>
		<td colspan="5" class="left">${vo.filename}
		<c:if test="${! empty vo.filename}">
			<a href="download.qn?id=${vo.id}">
				<i class="fas fa-download"></i>
			</a>
		</c:if>
	</tr>
</table>

<div class="btnset">
 	 <a class="btn-fill" href='list.qn?curPage=${page.curPage}&search=${page.search}&keyword=${page.keyword}'>
	 	목록으로
	 </a> 
	 <c:if test="${logininfo.admin eq 'Y' }">
	 	<a class="btn-fill" href="modify.qn?id=${vo.id}">수정</a>
	 	<a class="btn-fill" onclick="if (confirm('정말 삭제하시겠습니까?') ){ location='delete.qn?id=${vo.id}' } ">
	 	삭제</a>

	 </c:if>
	  <c:if test="${logininfo.name eq '관리자'}">
	  	<a class="btn-fill" href="reply.qn?id=${vo.id}">답글쓰기</a>
	  </c:if>
</div>
</body>
</html>
















