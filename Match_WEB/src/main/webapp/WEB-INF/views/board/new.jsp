<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://www.gstatic.com/firebasejs/7.2/firebase.js"></script>
<script src="https://www.gstatic.com/firebasejs/8.6.8/firebase-app.js"></script>

	<script
		src="https://www.gstatic.com/firebasejs/8.6.8/firebase-analytics.js"></script>
	<script
		src="https://www.gstatic.com/firebasejs/8.6.5/firebase-database.js"></script>
</head>
<body>
<div class="wrap_content">

<h3>커뮤니티 글쓰기</h3>
<!-- 파일업로드위한 form 설정 
   1. form 에서 데이터를 전송하는 방식은 반드시 post
   2. form 에 enctype="multipart/form-data" 을 반드시 지정
-->

<form action="insert.bo" method="post" enctype="multipart/form-data">
<table>
<tr><th class='w-px120'>제목</th>
	<td colspan="3"><input type='text' name='title' class='chk' title='제목' id="title"/></td>
</tr>
<tr><th class='w-px120'>작성자</th>	
	<td>${logininfo.name}</td>
	<th class='w-px120'>작성일자</th>
	<td><input type="text" name="date" id="date"></td>
</tr>
<tr><th class='w-px120'>내용</th>
	<td colspan="3"><textarea name='content' title='내용' class="chk" id="content1"></textarea></td>
</tr>	
		
<tr><th class='w-px120'>첨부파일</th>
	<td class='left middle' colspan="3">
		<label>
			<input type='file' name='file' id='attach-file'/>
			<a><img src='imgs/select.png' class='file-img' /></a>
		</label>
		<span id='file-name'></span>
		<span id='preview'></span>
		<a id='delete-file'><i class="fas fa-times font-img"></i></a>
	</td>
</tr>
</table>
</form>
<div class='btnSet'>
	<a class='btn-fill' onclick="if( emptyCheck() ){ myFunction();}">저장</a>
	<a class='btn-fill' href='list.bo'>취소</a>
</div>
</div>

<script type="text/javascript" src="js/file_check.js"></script>
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
<script type="text/javascript">
$(function(){
	var date = new Date();
	var year = date.getFullYear();
	var month = date.getMonth() + 1;
	var day = date.getDate();
	var hours = date.getHours();
	var minutes = date.getMinutes();
	$('#date').val( year + '-' + month + '-' + day);
});

	
</script>


	<script>
			
            function myFunction() {

                
				var title = document.getElementById("title").value;
				var content= document.getElementById("content1").value;
				var date= document.getElementById("date").value;
				
				
				
                //console.log("현재 : ", now);

                //firebase에 쓰기

                firebase.database().ref('matchapp/Board/'+ title).set({

                    title: title,
                    content : content,
                    date : date
                    
                    

                }, (result)=>{
                	$('form').submit();
                });
                
                

            }

            
            
        </script>
</body>
</html>








