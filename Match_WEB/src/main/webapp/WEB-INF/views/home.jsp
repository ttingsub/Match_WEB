<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<meta charset="utf-8">
       <script src="https://www.gstatic.com/firebasejs/7.2/firebase.js"></script>

	<title>Home</title>
</head>
<body>
<h1>
	Hello world!  
</h1>
 Firebase + Realtime + Web 

        <p id="demo">A Paragraph.</p>

        <pre id="object"></pre>

        <button type="button" onclick="myFunction()">데이터 쓰기</button>




<P>  The time on the server is ${serverTime}. </P>

<!-- The core Firebase JS SDK is always required and must be listed first -->
<script src="https://www.gstatic.com/firebasejs/8.6.8/firebase-app.js"></script>

<!-- TODO: Add SDKs for Firebase products that you want to use
     https://firebase.google.com/docs/web/setup#available-libraries -->
<script src="https://www.gstatic.com/firebasejs/8.6.8/firebase-analytics.js"></script>
<script src="https://www.gstatic.com/firebasejs/8.6.5/firebase-database.js"></script>
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

  var dbRef = firebase.database().ref().child("Demo");

  //dbRef.on('value',snap => demo.innerHTML = snap.val());

  dbRef.on('value',snap => {

      preObject.innerText = JSON.stringify(snap.val(),null,3);

  });

</script>
  
  
  
<script>

            function myFunction() {

                document.getElementById("demo").innerHTML = "쓰기를 완료";

                alert("쓰기 완료");

                

                //firebase에 쓰기

                firebase.database().ref('Demo').set({

                    username: "제발 ㅅㅂ",

                    age: 11                    

                });

            }

        </script>






</body>
</html>
