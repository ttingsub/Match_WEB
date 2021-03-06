<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#popup {
		width: 500px;
		height: 500px;
		border: 2px solid #666;
		display: none;
	}
	
	.popup {
		height: 100%;
		width: 100%;
	}
	
	#comment_regist span {
		width: 50%;
		float: left;
	}
</style>
</head>
<body>
<div class="wrap_content">
<h3>공지사항</h3>
<table>
	<tr>
		<th class="w-px160">제목</th>
		<td colspan="5" class="left"> ${vo.title}</td>
	</tr>
		<tr>
		<th class="w-px160">작성자</th>
		<td>${vo.name}</td>
		<th class="w-px160">작성일자</th>
		<td class="w-px110">${vo.writedate}</td>
		<th class="w-px160">조회수</th>
		<td class="w-px110">${vo.readcnt}</td>
	</tr>
	<tr>
		<th class="w-px160">내용</th>
		<td colspan="5" class="left"> ${ fn:replace (vo.content , crlf ,'<br>') }</td>
	</tr>
	<tr>
		<th class="w-px160">첨부파일</th>
		<td colspan="5" class="left">${vo.filename}
		<c:if test="${! empty vo.filename}">
			<span id="preview"></span>
			<a href="download.no?id=${vo.id}">
				<i class="fas fa-download font-img"></i>
			</a>
		</c:if>
		</td>
	</tr>
</table>

<div class="btnSet">
 	 <a class="btn-fill" href='list.no?curPage=${page.curPage}&search=${page.search}&keyword=${page.keyword}'>
	 	목록으로
	 </a> 
	 <c:if test="${logininfo.id eq 'admin' }">
	 	<a class="btn-fill" href="modify.no?id=${vo.id}">수정</a>
	 	<a class="btn-fill" onclick="if (confirm('정말 삭제하시겠습니까?') ){ location='delete.no?id=${vo.id}' } ">
	 	삭제</a>
	  	<a class="btn-fill" href="reply.no?id=${vo.id}">답글쓰기</a>
	  </c:if>
</div>
<div id='popup-background'></div>
<div id='popup' class='center'></div>
</div>
<script type="text/javascript" src="js/file_check.js"></script>
<script type="text/javascript">

function resize(){
	$('html, body').css('height', '100%');
	var headerFooter = $('header').outerHeight(true) + $('footer').outerHeight(true);
	var content = $('#content').outerHeight(true);
	var component = $('h3').outerHeight(true) + $('.btnSet').outerHeight(true)
					+ $('.comment').outerHeight(true)
					+ $('table').outerHeight(true) + 40;
	var height = '100%';
	if( content < component ) height = component + headerFooter;
	$('html, body').css('height', height);
	resizeBackground();
}

$(function(){
	
	if( ${!empty vo.filename} ){
		$('#delete-file').css('display', 'inline');
	
	//첨부된 파일이 있고 그 파일이 이미지파일인 경우 미리보기되게
		if( ${!empty vo.filename} ){
			if( isImage( '${vo.filename}' ) ){
				$('#preview').html( '<img src="${vo.filepath}" id="preview-img" class="file-img"/>' );
			}
		}
	}
// 	resize();
});

$(window).resize(function(){
	resize();
	moveCenter( $('#popup') );
});

$(window).scroll(function(){
	moveCenter( $('#popup') );
});

$(document).on('click', '#preview-img', function(){
	$('#popup, #popup-background').css('display', 'block');
	$('#popup').html( "<img src='${vo.filepath}' class='popup' />" );
	
}).on('click', '#popup-background', function(){
	$('#popup, #popup-background').css('display', 'none');
	
});

function setThumbnail(event) 
{ var reader = new FileReader(); 
reader.onload = function(event) { 
	var img = document.createElement("img"); 
	img.setAttribute("src", event.target.result); 
	document.querySelector("div#image_container").appendChild(img); }; 
	reader.readAsDataURL(event.target.files[0]); }

</script>
</body>
</html>
















