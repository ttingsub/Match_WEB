<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://www.gstatic.com/firebasejs/7.2/firebase.js"></script>

</head>
<body>
<div class="wrap_content">
<script src="https://www.gstatic.com/firebasejs/8.6.8/firebase-app.js"></script>

	<script
		src="https://www.gstatic.com/firebasejs/8.6.8/firebase-analytics.js"></script>
	<script
		src="https://www.gstatic.com/firebasejs/8.6.5/firebase-database.js"></script>
	<h3>QnA 글 수정</h3>
	<!--첨부파일을 전송할때는 반드시 post enctype = multipart/form-data  -->
	<form action="update.qn" method="post" enctype="multipart/form-data">
		<table>
			<tr>
				<th class="w-px160">카테고리</th>
	 			<td>${vo.category}
	 				<%-- <select name="category" id="category" style="float: left;">
	 						<option value="">선택</option>
							<option value="운영정책" ${vo.category eq '운영정책' ? 'selected' : ''}>운영정책</option>
							<option value="계정/인증" ${vo.category eq '계정/인증' ? 'selected' : ''}>계정/인증</option>
							<option value="이벤트/초대" ${vo.category eq '이벤트/초대' ? 'selected' : ''}>이벤트/초대</option>
							<option value="이용 제재" ${vo.category eq '이용 제재' ? 'selected' : ''}>이용 제재</option>
							<option value="모모 채팅" ${vo.category eq '모모 채팅' ? 'selected' : ''}>모모 채팅</option>
							<option value="모모 종목" ${vo.category eq '모모 종목' ? 'selected' : ''}>모모 종목</option>
							<option value="모모 매너" ${vo.category eq '모모 매너' ? 'selected' : ''}>모모 매너</option>
							<option value="기타" ${vo.category eq '기타' ? 'selected' : ''}>기타</option>
						</select>
					<input type="hidden" name="categorySelect" id="categorySelect" style="float: left; margin-left: 10px;"/> --%>
				</td>
			</tr>
			
			<tr><th class="w-px160">제목</th>
				<td><input type="text" name='title' title='제목' class='chk' value="${vo.title}" id="title"></td>
			</tr>
			
			<tr><th class="w-px160">작성자</th>
				<td>${logininfo.name}</td>
			</tr>
			
			<tr><th class="w-px160">내용</th>
				<td><textarea name='content' title='내용' class="chk" id="content1">${vo.content }</textarea> </td>
			</tr>
			
			<tr><th class="w-px160">첨부파일</th>
				<td class="left">
					<label>
						<input type="file" name='file' id='attach-file' />
						<img alt="x" src="imgs/select.png" class="file-img" />
					</label>
					<span id='file-name'>${vo.filename }</span>
					<span id='delete-file'><i class="fas fa-times"> </i></span>
				</td>
			</tr>
		</table>
		<input type="hidden" name='id' value="${vo.id}" />
		<input type="hidden" name='filename' value="${vo.filename}" />
	</form>
	<div class="btnSet">					<!-- //boolean -->
		<a class="btn-fill" onclick="if( emptyCheck() ){ myFunction();}" >저장 </a>
		<a class="btn-fill" href="list.qn" >취소 </a>
	</div>
	</div>
	
	
	<script type="text/javascript" src="js/file_check.js">


	</script>
	<script type="text/javascript">
	if( ${!empty vo.filename}){
		$('#delete-file').css('display' , 'inline');
	}
	if( emptyCheck() ){
		$('[name=filename]').val(
				$('#file-name').text()
				)
	}
	
	/* 카테고리 변경될 때 */
/* 	$(document).ready(function(){
		var idval = $('#categorySelect')
		$('#category').on('change', function(){
			var element = $(this).find('option:selected');
			var myTag = element.attr('value');
			idval.val(myTag);
		});
	}); */
	
	/* 파이어베이스 */
	var firebaseConfig = {
		    apiKey: "AIzaSyCXREheHWnwVa7eL6I5zKGAjuRdwKp7QRc",
		    authDomain: "match-app-b8c4a.firebaseapp.com",
		    databaseURL: "https://match-app-b8c4a-default-rtdb.firebaseio.com",
		    projectId: "match-app-b8c4a",
		    storageBucket: "match-app-b8c4a.appspot.com",
		    messagingSenderId: "217394658931",
		    appId: "1:217394658931:web:5a5fda3f5e377b29f3f406",
		    measurementId: "G-0NK2LLS1Z8"
		  };
	  // Initialize Firebase
	  firebase.initializeApp(firebaseConfig);
	  firebase.analytics();
		  
	  var database = firebase.database();
	  var demo = document.getElementById("demo");
	  var preObject = document.getElementById("object");
	
	  function myFunction() {
		/* var category = document.getElementById("categorySelect").value; */
		var title = document.getElementById("title").value;
		var content = document.getElementById("content1").value;

			/* 문의 카테고리 강제 선택 */
/* 			if(category == "") {
				alert('문의 카테고리를 선택해 주세요');
				return false;
			} */

            //firebase에 쓰기
            firebase.database().ref('matchapp/qna'+title).set({
//                 category: category,
                title: title,
                content: content
              }, (result)=>{
              	$('form').submit();
              });
          }
	</script>
</body>
</html>