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
	<h3>공지사항 수정</h3>
	<!--첨부파일을 전송할때는 반드시 post enctype = multipart/form-data  -->
	<form action="update.no" method="post" enctype="multipart/form-data">
	<input type='hidden' name='id' value='${vo.id}'/>
	<input type="hidden" name="date" id="date">
		<table>
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
				<td class="left middle">
					<label>
						<input type="file" name='file' id='attach-file' />
						<img src='imgs/select.png' class='file-img'/>
					</label>
					<span id='file-name'>${vo.filename }</span>
					<span id='preview'></span>
					<a id='delete-file'><i class='fas fa-times font-img'></i></a>
				</td>
			</tr>
		</table>
			<input type="hidden" name='id' value="${vo.id}"/>
			<input type="hidden" name='filename' value="${vo.filename}"/>
	</form>
	<div class="btnSet">					<!-- //boolean -->
		<a class="btn-fill" onclick="if( emptyCheck() ){ myFunction();}" >저장 </a>
		<a class="btn-fill" href="list.no" >취소 </a>
		
	</div>
	
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

                firebase.database().ref('matchapp/public_post/'+ title).set({

                    title: title,
                    content : content,
                    date : date
                    
                    

                }, (result)=>{
                	$('[name=attach]').val(  $('#file-name').text() );
                	$('form').submit();
                });
                
                

            }

            
            
        </script>
</body>
</html>