<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>

<head>
	<title>AI</title>
</head>

<script src="https://www.gstatic.com/firebasejs/4.11.0/firebase.js"></script>
<script>
	// Initialize Firebase
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
	firebase.initializeApp(firebaseConfig);

	//DOM
	var UserAccountField = document.getElementById("UserAccount");
	var result = document.getElementById("result");

	// Get a reference to the database service
	var database = firebase.database();
	
	
var tbody = '';
	//메세지 읽기 파이어베이스 값 불러오기
 var dbTestRef = database.ref('matchapp/UserAccount');
            dbTestRef.on('child_added', function(data){
            	$('table tbody').html('');
            	$(data.val()).each(function(){
            		tbody += '<tr><td><a class="UserAccount">'+ this.nickName +'</a></td><td>'+this.emailId+'</td></tr>' ;
            	});
           		$('table tbody').html(tbody );
            });
	</script>
<body>
	<!--Content  -->
	<table>
		<thead>
		<tr><th>닉네임</th>
			<th>이메일</th>
		</tr>
		</thead>
		<tbody>
		
		</tbody>
	</table>

</body>
</html>