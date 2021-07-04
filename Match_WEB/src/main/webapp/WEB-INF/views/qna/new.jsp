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
<script src="https://www.gstatic.com/firebasejs/8.6.8/firebase-app.js"></script>

	<script
		src="https://www.gstatic.com/firebasejs/8.6.8/firebase-analytics.js"></script>
	<script
		src="https://www.gstatic.com/firebasejs/8.6.5/firebase-database.js"></script>
	<h3>QnA 글 쓰기</h3>
	<!--첨부파일을 전송할때는 반드시 post enctype = multipart/form-data  -->
	<form action="insert.qn" method="post" enctype="multipart/form-data">
		<table>
		<tr>
			<th>카테고리</th>
	<!-- 			String[] category =
				 new String[]{"운영정책","계정/인증","이벤트/초대", "이용 제재", "기타"
				 , "모모 채팅", "모모 종목", "모모 매너", "모모 종목" };-->
	 			<td><select name="category" id="category" style="float: left; background-color: white;">
							<option value="운영정책" id="unyung">운영정책</option>
							<option value="계정/인증" id="certify">계정/인증</option>
							<option value="이벤트/초대" id="invite">이벤트/초대</option>
							<option value="이용 제재" id="sanction">이용 제재</option>
							<option value="모모 채팅" id="chat">모모 채팅</option>
							<option value="모모 종목" id="event">모모 종목</option>
							<option value="모모 매너" id="manner">모모 매너</option>
							<option value="기타" id="etc">기타</option>
						</select>
				<input type="text" name="bbb" id="bbb" style="float: left; margin-left: 10px;"/>
						</td>
		</tr>
			<tr><th class="w-px160">제목</th>
				<td><input type="text" name='title' title='제목' class='chk' id="title"></td>
			</tr>
			
			<tr><th class="w-px160">작성자</th>
				<td>${logininfo.name}</td>
			</tr>
			
			<tr><th class="w-px160">내용</th>
				<td><textarea name='content' title='내용' class="chk" id="content1"></textarea> </td>
			</tr>
			
			<tr><th class="w-px160">파일첨부</th>
				<td class="left">
					<label>
						<input type="file" name='file' id='attach-file' />
						<img alt="x" src="imgs/select.png" class="file-img" />
					</label>
					<span id='file-name'></span>
					<span id='delete-file'><i class="fas fa-times"> </i></span>
				</td>
			</tr>
		</table>
	</form>
	<div class="btnset">					<!-- //boolean -->
		<a class="btn-fill" onclick="if( emptyCheck() ){ myFunction();}" >저장 </a>
		<a class="btn-empty" href="list.qn" >취소 </a>
		
	</div>
	<script type="text/javascript" src="js/file_check.js"></script>
	<script>
	$(document).ready(function(){
		var idval = $('#bbb')
		$('#category').on('change', function(){
			var element = $(this).find('option:selected');
			var myTag = element.attr('value');
			idval.val(myTag);
		});
	});
	
	</script>
	<script>
		
  
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


 

</script>



	<script>
			
            function myFunction() {

                
				var category = document.getElementById("bbb").value;
				var title = document.getElementById("title").value;
				var content = document.getElementById("content1").value;
				
				console.log(bbb);
				console.log(category);

                //firebase에 쓰기

                firebase.database().ref('matchapp/qna').push({

                    category: category,
                    title: title,
                    content: content
                	
                	
                	
                    

                }, (result)=>{
                	$('form').submit();
                });
                
                

            }

            
            
        </script>
</body>
</html>