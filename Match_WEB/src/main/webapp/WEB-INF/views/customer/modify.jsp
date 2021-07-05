<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<title>모모</title>
</head>
<body>
	<h3>회원 정보</h3>
	<form method="post" action="update.cu">
	<table>
		<tr>
			<th>아이디</th>
			<td><input type='text' name='id' value="${vo.id}" readonly="readonly"/></td>
		</tr>
		<tr>
			<th>성명</th>
			<td><input type='text' name='name' value="${vo.name}"/></td>
		</tr>
		<tr>
			<th>비밀번호</th>
			<td><input type='text' name='pw' value="${vo.pw}"/></td>
		</tr>
	
		<tr>
			<th>성별</th>
			<td>
				<label><input type="radio" ${vo.gender eq '남' ? 'checked': '' } name='gender' value='남' checked="checked"/>남</label>
				<label><input type="radio" ${vo.gender eq '남' ? 'checked': '' } name='gender' value='여' />여</label>
			</td>
		</tr>
		<tr>
			<th>이메일</th>
			<td><input type="email" name='email' value="${vo.email}"/></td>
		</tr>
	
		<tr>
			<th>전화번호</th>
			<td><input type="tel" name='tel' value="${vo.tel}"/></td>
		</tr>
	
	</table>
	</form>
	<div class='imsi'>
		<a class='btn-fill' onclick='$("form").submit()'>저장</a>
		<a class='btn-fill' href='list.cu'>취소</a>
		
	</div>
	
</body>
</html>