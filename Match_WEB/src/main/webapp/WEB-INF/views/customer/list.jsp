<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
   <title></title>
</head>
<body>
<c:if test="${logininfo.admin eq 'y'}">
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
      <h2>관리자만 이용할 수 있는 페이지입니다.</h2>
		<div>잘못된 접근입니다.</div>
</c:if>
<script type="text/javascript">
function resize(){
	console.log('resize')
	/*
	테이블 자체에 스크롤을 주는 경우
	$('.tb_wrap').css('height', $('#content').height() - $('h3').outerHeight(true)
				- $('#list-top').outerHeight(true) 
				- $('.page_list').closest('.btnSet').outerHeight(true) - 20);
	*/
	//브라우저에 스크롤을 주는 경우
	$('html, body').css('height', '100%');
	var headerFooter = $('header').outerHeight(true) + $('footer').outerHeight(true);
	var content = $('#content').outerHeight(true);
	var component = $('h3').outerHeight(true) + $('#list-top').outerHeight(true)
					+ $('.btnSet').outerHeight(true) + 40;
	var total = '100%';
	if( $('table.tb_list').length>0 && content < $('table.tb_list').outerHeight(true) + component  ){
		total = $('table.tb_list').outerHeight(true) + component + headerFooter;
	}else if( $('ul.grid').length>0 && content < $('ul.grid').outerHeight(true) + component ){
		total = $('ul.grid').outerHeight(true) + component + headerFooter;
	}
	$('html, body').css('height', total);
}
$(window).resize(function(){
	resize();
});
</script>
</body>
</html>