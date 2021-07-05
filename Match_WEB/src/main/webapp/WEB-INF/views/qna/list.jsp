<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>모모 고객센터입니다</h3>
	<form action="list.qn" method="post">
		<div id='list-top'>
			<div>
				<ul>
					<li>
						<select name="search" class="w-px90">
							<option value="all" ${page.search eq 'all' ? 'selected' : '' }>전체</option>
							<option value="title" ${page.search eq 'title' ? 'selected' : '' }>제목</option>
							<option value="content" ${page.search eq 'content' ? 'selected' : '' }>내용</option>
							<option value="writer" ${page.search eq 'writer' ? 'selected' : '' }>작성자</option>
							<option value="category" ${page.search eq 'category' ? 'selected' : '' }>카테고리</option>
						</select>
					</li>
					<li><input type="text" name="keyword" value='${page.keyword }' class="w-px300" placeholder="어떤 점이 궁금하신가요?"/></li>
					<li><a class="btn-fill" onclick="$('form').submit()">검색</a></li>
				</ul>
				<ul>
					<c:if test="${!empty logininfo }">
						<li><a class="btn-fill" href="new.qn">글쓰기</a></li>
					</c:if>
				</ul>
			</div>
		</div>
		<!-- 검색했을 때 페이지를 1로 -->
		<input type="hidden" name="curPage" value="1"/>
	</form>
	<table class='tb_list'>
		<tr>
			<th class="w-px60">번호</th>
			<th class="w-px60">카테고리</th>
			<th class="w-pct60 back-fill">제목</th>
			<th class="w-px60">작성자</th>			
			<th class="w-px80">작성일자</th>			
		</tr>
		
		<c:forEach items="${page.list}" var="vo">
			<tr>
				<td>${vo.no}</td>
				<td>${vo.category}</td>
				<td class="left">
					<c:forEach var="i" begin="1" end="${vo.indent }" >
						${i eq vo.indent ? "<img src='imgs/re.gif'/>" : "&nbsp&nbsp;" }
					</c:forEach>
					<a href="view.qn?id=${vo.id}">${vo.title}</a>
				</td>
					<td>${vo.writer}</td>
					<td>${vo.writedate}</td>
			</tr>
		</c:forEach>
		
		
		
	</table>
	<div class="btnSet">
		<jsp:include page="/WEB-INF/views/include/page.jsp"/>
	</div>

</body>
</html>









