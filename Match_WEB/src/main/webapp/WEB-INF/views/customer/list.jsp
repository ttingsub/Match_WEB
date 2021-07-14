<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
   <title></title>
</head>
<body>
<c:if test="${logininfo.admin eq 'Y'}">
<div class="wrap_content">
   <!--Content  -->
   
   <h3>회원관리</h3>
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
</div>
</c:if>
<c:if test="${logininfo.admin ne 'y' }">
      <h2>관리자만 이용할 수 있는페이지입니다.</h2>

</c:if>
</body>
</html>