<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>모모</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="resources/assets/favicon.ico" />
<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v5.15.3/js/all.js"
	crossorigin="anonymous"></script>
<!-- Google fonts-->
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700"
	rel="stylesheet" type="text/css" />
<link
	href="https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700"
	rel="stylesheet" type="text/css" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="css/styles.css" rel="stylesheet" />
<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon">
<link rel="icon" href="/favicon.ico" type="image/x-icon">

<style type="text/css">
#head {
	display: none;
}

#foot {
	display: none;
}

/* #wrap header .masthead {
	display: inline;
} */
</style>

<!-- 파이어베이스 -->
<script src="https://www.gstatic.com/firebasejs/7.2/firebase.js"></script>

</head>


<body id="page-top">

	<script src="https://www.gstatic.com/firebasejs/8.6.8/firebase-app.js"></script>
	<script
		src="https://www.gstatic.com/firebasejs/8.6.8/firebase-analytics.js"></script>
	<script
		src="https://www.gstatic.com/firebasejs/8.6.5/firebase-database.js"></script>
	<script type="text/javascript">
		//파이어베이스
		// Initialize Firebase
		var firebaseConfig = {
			apiKey : "AIzaSyCXREheHWnwVa7eL6I5zKGAjuRdwKp7QRc",
			authDomain : "match-app-b8c4a.firebaseapp.com",
			databaseURL : "https://match-app-b8c4a-default-rtdb.firebaseio.com",
			projectId : "match-app-b8c4a",
			storageBucket : "match-app-b8c4a.appspot.com",
			messagingSenderId : "217394658931",
			appId : "1:217394658931:web:5a5fda3f5e377b29f3f406",
			measurementId : "G-0NK2LLS1Z8"
		};
		firebase.initializeApp(firebaseConfig);

		var PostField = document.getElementById("Post");
		var database = firebase.database();

		var tbody = '', idx = -1;

		var dbTestRef = database.ref('matchapp/Post');
		dbTestRef
				.on(
						'child_added',
						function(data) {
							console.log('>', data.val());

							$(data.val())
									.each(
											function() {
												idx += 1;

												/* for (int i = 0; i<5; i++){
												 tbody += '<div class="portfolio-caption-heading">' + data.val().title + '</div><div class="portfolio-caption-subheading text-muted">'+ data.val().writer + '</div>' ; 
													$('div.title').html(tbody);
												} */

												if (idx == 0) {
													tbody += '<div class="portfolio-item"><a class="portfolio-link" data-bs-toggle="modal" href="#portfolioModal1"><div class="portfolio-hover"><div class="portfolio-hover-content"><i class="fas fa-plus fa-3x"></i></div></div><img class="img-fluid" src="https://firebasestorage.googleapis.com/v0/b/match-app-b8c4a.appspot.com/o/matchapp%2FpostImg%2F'
															+ data.val().imgPath
															+ '?alt=media&token=https://firebasestorage.googleapis.com/v0/b/match-app-b8c4a.appspot.com/o/matchapp%2FpostImg%2Ffe3e9df7-8d9a-490f-8422-f1d4e3aa6d85.jpg?alt=media&token=6c73ac4e-d1f4-44d8-bd24-0b2fc4b34c16" style="width:300px; height:300px;"/></a><div class="portfolio-caption"></div></div><div class="portfolio-caption-heading">'
															+ data.val().title
															+ '</div><div class="portfolio-caption-subheading text-muted">'
															+ data.val().writer
															+ '</div>';
													$('div.title').html(tbody);
													tbody = "";
												} else if (idx == 1) {
													tbody += '<div class="portfolio-item"><a class="portfolio-link" data-bs-toggle="modal" href="#portfolioModal2"><div class="portfolio-hover"><div class="portfolio-hover-content"><i class="fas fa-plus fa-3x"></i></div></div><img class="img-fluid" src="https://firebasestorage.googleapis.com/v0/b/match-app-b8c4a.appspot.com/o/matchapp%2FpostImg%2F'
															+ data.val().imgPath
															+ '?alt=media&token=https://firebasestorage.googleapis.com/v0/b/match-app-b8c4a.appspot.com/o/matchapp%2FpostImg%2Ffe3e9df7-8d9a-490f-8422-f1d4e3aa6d85.jpg?alt=media&token=6c73ac4e-d1f4-44d8-bd24-0b2fc4b34c16" style="width:300px; height:300px;"/></a><div class="portfolio-caption"></div></div><div class="portfolio-caption-heading">'
															+ data.val().title
															+ '</div><div class="portfolio-caption-subheading text-muted">'
															+ data.val().writer
															+ '</div>';
													$('div.title1').html(tbody);
													tbody = "";
												} else if (idx == 2) {
													tbody += '<div class="portfolio-item"><a class="portfolio-link" data-bs-toggle="modal" href="#portfolioModal3"><div class="portfolio-hover"><div class="portfolio-hover-content"><i class="fas fa-plus fa-3x"></i></div></div><img class="img-fluid" src="https://firebasestorage.googleapis.com/v0/b/match-app-b8c4a.appspot.com/o/matchapp%2FpostImg%2F'
															+ data.val().imgPath
															+ '?alt=media&token=https://firebasestorage.googleapis.com/v0/b/match-app-b8c4a.appspot.com/o/matchapp%2FpostImg%2Ffe3e9df7-8d9a-490f-8422-f1d4e3aa6d85.jpg?alt=media&token=6c73ac4e-d1f4-44d8-bd24-0b2fc4b34c16" style="width:300px; height:300px;"/></a><div class="portfolio-caption"></div></div><div class="portfolio-caption-heading">'
															+ data.val().title
															+ '</div><div class="portfolio-caption-subheading text-muted">'
															+ data.val().writer
															+ '</div>';
													$('div.title2').html(tbody);
													tbody = "";
												} else if (idx == 3) {
													tbody += '<div class="portfolio-item"><a class="portfolio-link" data-bs-toggle="modal" href="#portfolioModal4"><div class="portfolio-hover"><div class="portfolio-hover-content"><i class="fas fa-plus fa-3x"></i></div></div><img class="img-fluid" src="https://firebasestorage.googleapis.com/v0/b/match-app-b8c4a.appspot.com/o/matchapp%2FpostImg%2F'
															+ data.val().imgPath
															+ '?alt=media&token=https://firebasestorage.googleapis.com/v0/b/match-app-b8c4a.appspot.com/o/matchapp%2FpostImg%2Ffe3e9df7-8d9a-490f-8422-f1d4e3aa6d85.jpg?alt=media&token=6c73ac4e-d1f4-44d8-bd24-0b2fc4b34c16" style="width:300px; height:300px;"/></a><div class="portfolio-caption"></div></div><div class="portfolio-caption-heading">'
															+ data.val().title
															+ '</div><div class="portfolio-caption-subheading text-muted">'
															+ data.val().writer
															+ '</div>';
													$('div.title3').html(tbody);
													tbody = "";
												} else if (idx == 4) {
													tbody += '<div class="portfolio-item"><a class="portfolio-link" data-bs-toggle="modal" href="#portfolioModal5"><div class="portfolio-hover"><div class="portfolio-hover-content"><i class="fas fa-plus fa-3x"></i></div></div><img class="img-fluid" src="https://firebasestorage.googleapis.com/v0/b/match-app-b8c4a.appspot.com/o/matchapp%2FpostImg%2F'
															+ data.val().imgPath
															+ '?alt=media&token=https://firebasestorage.googleapis.com/v0/b/match-app-b8c4a.appspot.com/o/matchapp%2FpostImg%2Ffe3e9df7-8d9a-490f-8422-f1d4e3aa6d85.jpg?alt=media&token=6c73ac4e-d1f4-44d8-bd24-0b2fc4b34c16" style="width:300px; height:300px;"/></a><div class="portfolio-caption"></div></div><div class="portfolio-caption-heading">'
															+ data.val().title
															+ '</div><div class="portfolio-caption-subheading text-muted">'
															+ data.val().writer
															+ '</div>';
													$('div.title4').html(tbody);
													tbody = "";
												} else if (idx == 5) {
													tbody += '<div class="portfolio-item"><a class="portfolio-link" data-bs-toggle="modal" href="#portfolioModal6"><div class="portfolio-hover"><div class="portfolio-hover-content"><i class="fas fa-plus fa-3x"></i></div></div><img class="img-fluid" src="https://firebasestorage.googleapis.com/v0/b/match-app-b8c4a.appspot.com/o/matchapp%2FpostImg%2F'
															+ data.val().imgPath
															+ '?alt=media&token=https://firebasestorage.googleapis.com/v0/b/match-app-b8c4a.appspot.com/o/matchapp%2FpostImg%2Ffe3e9df7-8d9a-490f-8422-f1d4e3aa6d85.jpg?alt=media&token=6c73ac4e-d1f4-44d8-bd24-0b2fc4b34c16" style="width:300px; height:300px;"/></a><div class="portfolio-caption"></div></div><div class="portfolio-caption-heading">'
															+ data.val().title
															+ '</div><div class="portfolio-caption-subheading text-muted">'
															+ data.val().writer
															+ '</div>';
													$('div.title5').html(tbody);
													tbody = "";
												}
											});

						});
	</script>

	<header class="masthead">
		<div class="container">
			<div class="masthead-subheading">　</div>
			<div class="masthead-heading text-uppercase">　</div>
			<a class="btn btn-info btn-xl text-uppercase" href="momo.ho">모모
				시작하기!</a>
		</div>
	</header>

</body>
</html>























<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
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
	<h1>홈화면 구상중.</h1>
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

                    address: " set(address)",

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
 --%>