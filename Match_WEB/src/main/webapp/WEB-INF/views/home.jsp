<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<script src="https://www.gstatic.com/firebasejs/7.2/firebase.js"></script>

<title>Home</title>
<link rel="stylesheet" type="text/css" href="css/common.css">
</head>
<body>
<img alt="x" src="imgs/header.png" style="width: 60%" />
	<h1>홈화면입니다. 막막합니다 ,,</h1>
	버튼누르면 real time에 등록됨 일단 이렇게 놔둠
	<p id="demo">A Paragraph.</p>

	<pre id="object"></pre>

	<button type="button" onclick="myFunction()">데이터 쓰기</button>




	<P>The time on the server is ${serverTime}.</P>

	<script src="https://www.gstatic.com/firebasejs/8.6.8/firebase-app.js"></script>

	<script
		src="https://www.gstatic.com/firebasejs/8.6.8/firebase-analytics.js"></script>
	<script
		src="https://www.gstatic.com/firebasejs/8.6.5/firebase-database.js"></script>
	<script>
  // Your web app's Firebase configuration
  // For Firebase JS SDK v7.20.0 and later, measurementId is optional
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


  //dbRef.on('value',snap => demo.innerHTML = snap.val());

 /*  dbRef.on('value',snap => {

      preObject.innerText = JSON.stringify(snap.val(),null,3);

  }); */


</script>



	<script>

            function myFunction() {

                document.getElementById("demo").innerHTML = "쓰기를 완료 5트";

                alert("쓰기 완료2");

                

                //firebase에 쓰기

                firebase.database().ref('matchapp/UserAccount').push({

                    address: " 웹에서 가져온 이름입니다.",

                    changed: 11,
                    
                    emailId: "테스트 테스트 테스트",
                    
                    idToken: "임시",
                    
                    latitude: 22,
                    
                    longitude: 33,
                    
                    nickName: "명섭",
                    
                    phoneNumber: "+821056067426"
                    
                    

                });

            }

            
            var dbTestRef = database.ref('matchapp/UserAccount/')
            dbTestRef.on('child_added', function(data){
            	console.log(data.val())
            })
        </script>






</body>
</html>
