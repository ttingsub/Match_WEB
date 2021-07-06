<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<title>모모</title>
</head>
<body>
<h3>[ ${vo.name } 회원정보 ]</h3>
<table>
	<tr>
		<th class="w-px100">성명</th>	
		<th class="w-px100">성별</th>
		<th class="w-px100">이메일</th>
		<th class="w-px100">전화번호</th></tr>
	<tr>
		<td>${vo.name}</td>
		<td>${vo.gender }</td>
		<td>${vo.email }</td>
		<td>${vo.tel }</td>
	</tr>
</table>
<div class="imsi" style="margin-top: 30px; ">
	<a class='btn-fill' href='list.cu'>회원목록</a>
	<a class='btn-fill' href='modify.cu?id=${vo.id }'>회원 정보 수정</a>
	<c:if test="${vo.name ne '관리자' }">
	<a class='btn-fill' onclick='if(confirm("정말 삭제하시겠습니까?")){href="delete.cu?id=${vo.id }"} '  >회원 정보 삭제</a>
	</c:if>
</div>
</body>
</html>