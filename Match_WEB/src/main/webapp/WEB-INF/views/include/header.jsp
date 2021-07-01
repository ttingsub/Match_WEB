 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<header style="border-bottom: 1px solid #ccc; padding: 15px 0; text-align: center; " id="head">
		<div class='category' style='margin-left: 100px'>
			<ul>
				<li><a href='<c:url value="/" />'><img alt="x" src="imgs/momo.logo.png" style="width: 54px; height: 48px;"></a></li>
				<li><a class="${category eq 'bo' ? 'active' : ''}" href='list.bo'>모임</a></li>
				<li><a class="${category eq 'vi' ? 'active' : ''}" href='list.vi'>시각화</a></li>
				<li><a class="${category eq 'da' ? 'active' : ''}" href='list.da'>공공데이터</a></li>
				<li class='momo-center'><a class="${category eq 'no' ? 'active' : ''}" href='list.no'>고객센터</a>
				 <c:if test="${logininfo.name eq '관리자' }">
					<li><a class="${category eq 'cu' ? 'active' : ''}" href='list.cu'>고객관리</a></li>
					<li><a class="${category eq 'hr' ? 'active' : ''}" href='list.hr'>사원관리</a></li>
				</c:if> 
			</ul>
		</div>
		<div class="subMenu">
			<ul >
			</ul>
			<ul >
			</ul>
			<ul >
				<li><a href="list.no">공지사항</a></li>
				<li><a href="list.qn">자주 묻는 질문</a></li>
				<li><a href="#">Contact Us</a></li>
			</ul>
			<ul >
			</ul>
			<!-- 임시 -->
			<ul >
				<li><a href="#">서브메뉴1</a></li>
				<li><a href="#">서브메뉴2</a></li>
				<li><a href="#">서브메뉴3</a></li>
			</ul>
			<ul >
				<li><a href="#">서브메뉴1</a></li>
				<li><a href="#">서브메뉴2</a></li>
				<li><a href="#">서브메뉴3</a></li>
			</ul>
			<ul >
			</ul>
		
		</div>
		
		<div style="position: absolute; right: 0; top: 25px; margin-right: 100px">
			<ul>
				<!--로그인 하지 않은경우  -->
				<c:if test="${empty logininfo}">
					<li><a class="btn-fill" href='login'>로그인</a></li>
					<li><a class="btn-fill" href='member'>회원가입</a></li>
				</c:if>
				<c:if test="${!empty logininfo}">
					<li><strong>${logininfo.name}</strong> 님</li>
					<li><a class="btn-fill" href='logout'>로그아웃</a></li>
				</c:if>
			</ul>
		</div>
</header>
<style>
	header ul , header ul  li {
	margin: 0; padding: 0; display: inline; }
	.category{font-size: 18px;}
	.category li:not(:first-child){padding-left: 30px}
	.category li a:hover,
	.category li a.active{ font-weight: bold; color: #0000cd;}
	.category ul li {
		overflow: auto;
	}
	.subMenu { width: 120px;
		    margin: 0;
/* 		    position: absolute; */
/* 		    top: 60px; */
/* 		    left: 260px; */
 		 display: none;  
	}
	.subMenu ul{
		display: block;
		    position: absolute;
		    top: 60px;
		
	/*
		display: flex;
	    flex-direction: column;
	    */
/* 	    width: 150px; */
/* 		float: none; */
/* 		 display: none;  */
	}
	.subMenu ul li {
		padding: 0;
		display: block;
	}
	
</style>
<script>
$('.category ul li:eq(4)').hover(function(){
// $('.momo-center').hover(function(){
	$('.subMenu').css('display', 'block');
	$('.subMenu ul').css('display', 'none');
	console.log( $(this).offset().left + 30 )
	$('.subMenu ul').eq(2).css('left',  $(this).offset().left + 30 );
	$('.subMenu ul').eq(2).css('display', 'block');
// 	$('.subMenu ul').eq($(this).index()).css('left',  $(this).offset().left + ($(this).index()>0 ? 30 : 0) );
// 	$('.subMenu ul').eq($(this).index()).css('display', 'block');
// }, function(){
// 	$('.subMenu').css('display', 'none');
});
$('.subMenu').mouseleave(function(){
	$('.subMenu').css('display', 'none');
	
});


</script>