<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<title>AI</title>
</head>
<body>
	<!--Content  -->
	<table class="tb_list">
		<tr><th class='w-px100'>아이디</th>
			<th class='w-px100'>회원명</th>
			<th class='w-px100'>이메일</th>
		</tr>
		<c:forEach items="${list}" var="vo">
			<tr>
				<th><a href='detail.cu?id=${vo.id}'> ${vo.id} </a></th>
				<th><a href='detail.cu?id=${vo.id}'> ${vo.name} </a></th>
				<th><a href='detail.cu?id=${vo.id}'> ${vo.email}</a></th>
			</tr>
		</c:forEach>
	</table>

</body>
</html>