 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<header style="border-bottom: 1px solid #ccc; padding-bottom: 0px; text-align: center;" id="head">
		<div class="category" style="margin-left: 100px; ">
		<div style="float: right; margin-right: 20px; margin-top: 0px; font-size: 0.6em;">
			<ul>
				<!--로그인 하지 않은경우  -->
				<c:if test="${empty logininfo  }">
					<li><a href="login" class="btn-outline-info">로그인</a></li>
					<li><a href="member" class="btn-outline-info">회원가입</a></li>
				</c:if>
				<!--로그인 한 경우  -->
				<c:if test="${!empty logininfo  }">
					<li><strong>${logininfo.name}</strong> 님</li>
					<li><a href='modify.cu?id=${logininfo.id}'>회원정보 수정</a></li>
					<li><a href='logout'>로그아웃</a></li>
				</c:if>
			</ul>
		</div>
		<div style="padding-top: 20px; font-weight:bold;">
			<ul>
				<li class="menu"><a href="/match/"><img alt="x" src="imgs/momo.logo.png" style="width: 80px; height: 80px; float: left;"></a></li>
				<li style="padding:  10px 20px; line-height: 80px;"class="menu"><a href="momo.ho">모모 소개</a></li>
				<li style="padding:  10px 20px; line-height: 80px;"class="menu"><a href="list.bo">커뮤니티</a></li>
				<li style="padding:  10px 20px; line-height: 80px;"class="menu"><a href="list.no">공지사항</a></li>
				<li style="padding:  10px 20px; line-height: 80px;"class="menu"><a href="list.qn">QnA</a></li>
				<c:if test="${logininfo.name eq '관리자' }">
					<li style="padding:  10px 20px; line-height: 80px; " class="menu"><a href="list.cu">회원관리</a></li>
				</c:if>
				
			</ul>
		</div>
		</div>
		<div class="subMenu">
			<ul>
			</ul>
			<ul>
			</ul>
			
			<ul>
			</ul>
			<!-- 임시 -->
			<ul>
				<li><a href="#">서브메뉴1</a></li>
				<li><a href="#">서브메뉴2</a></li>
				<li><a href="#">서브메뉴3</a></li>
			</ul>
			<ul>
				<li><a href="#">서브메뉴1</a></li>
				<li><a href="#">서브메뉴2</a></li>
				<li><a href="#">서브메뉴3</a></li>
			</ul>
			<ul>
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
$('.category ul li:eq(5)').hover(function(){
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