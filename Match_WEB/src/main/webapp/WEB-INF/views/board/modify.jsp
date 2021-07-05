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
<h3>커뮤니티 글 수정</h3>
<form method="post" action='update.bo' enctype="multipart/form-data">
<input type='hidden' name='id' value='${vo.id}'/>
<table>
<tr><th class='w-px120'>제목</th>
	<td colspan="3"><input type='text' name='title' class='chk' title='제목' value='${vo.title}' id="title"/></td>
</tr>
<tr><th class='w-px120'>작성자</th>
	<td>${vo.name}</td>
	<th style="background-color: #55C4F6;">수정일자</th>
	<td><input type="text" name="date" id="date"></td>
</tr>
<tr><th class='w-px120'>내용</th>
	<td colspan="3"><textarea class='chk' title='내용' name='content' id="content1">${vo.content}</textarea></td>
</tr>
<tr><th class='w-px120'>첨부파일</th>
	<td class='left middle' colspan="3">
		<label>
			<input type='file' name='file' id='attach-file'/>
			<img src='imgs/select.png' class='file-img'/>
		</label>
		<span id='file-name'>${vo.filename}</span>
		<span id='preview'></span>
		<a id='delete-file'><i class='fas fa-times font-img'></i></a>
	</td>
</tr>
</table>
<input type='hidden' name='attach' />
</form>
<div class='btnSet'>
	<a class='btn-fill' 
	onclick="if( emptyCheck() ){ myFunction();}">저장</a>
	<a class='btn-empty' onclick='history.go(-1)'>취소</a>
</div>


<script type="text/javascript" src='js/file_check.js'></script>
<script type="text/javascript">
$(function(){
	if( ${!empty vo.filename} ){
		$('#delete-file').css('display', 'inline');
		
		//첨부파일이 이미지인경우 미리보기되게
		if( isImage('${vo.filename}') ){
			$('#preview').html( "<img src='${vo.filepath}' class='file-img' />" );
		}
	}
	
});

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
<script type="text/javascript">
$(function(){
	var date = new Date();
	var year = date.getFullYear();
	var month = date.getMonth() + 1;
	var day = date.getDate();
	var hours = date.getHours();
	var minutes = date.getMinutes();
	$('#date').val( year + '-' + month + '-' + day + ' / ' + hours + ':' + minutes);
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





