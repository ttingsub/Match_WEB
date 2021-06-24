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
	
	//고유 아이디 만들기
	function guid() {
		function s4() {
		  return ((1 + Math.random()) * 0x10000 | 0).toString(16).substring(1);
		}
		return s4() + s4() + '-' + s4() + '-' + s4() + '-' + s4() + '-' + s4() + s4() + s4();
	}

	//메세지 읽기
	var UserAccountRef = database.ref("UserAccount");
	UserAccountRef.on('child_added', function(snapshot) {
	  var data = snapshot.val();
		var UserAccount = data.nickName;
		if(UserAccount != undefined){
			result.value += UserAccount + "\n";
			
			logger.info(result);
			logger.info(UserAccount);

		}
	});
	</script>
<body>
	<!--Content  -->
	<table>
		<tr><th>고객명</th>
			<th>이메일</th>
		</tr>
		<c:forEach items="${list}" var="vo">
			<tr>
				<th><a id="result"></a></th>
				<th><a id="UserAccount"'></a></th>
			</tr>
		</c:forEach>
	</table>

</body>
</html>