<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
<title>모모</title>
<!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="resources/assets/favicon.ico" />
        <!-- Font Awesome icons (free version)-->
        <script src="https://use.fontawesome.com/releases/v5.15.3/js/all.js" crossorigin="anonymous"></script>
        <!-- Google fonts-->
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
        <link href="https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700" rel="stylesheet" type="text/css" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />
        <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon">
<link rel="icon" href="/favicon.ico" type="image/x-icon">

<style type="text/css">


#foot{
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
	<script	src="https://www.gstatic.com/firebasejs/8.6.8/firebase-analytics.js"></script>
	<script	src="https://www.gstatic.com/firebasejs/8.6.5/firebase-database.js"></script>
<script type="text/javascript">
//파이어베이스
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
	
	
	var PostField = document.getElementById("Post"); 
	var database = firebase.database();

	
	var tbody = '', idx = -1;
	var tfoot = '', idx = -1;
	
	var noimgpath = "this.src='imgs/momo.logo2.png'";
	
	var dbTestRef = database.ref('matchapp/Post');
		dbTestRef.on('child_added', function(data){
 			console.log('>',data.val());
			
			
			$(data.val()).each(function(){
			 idx += 1;
			 
			 /* for (int i = 0; i<5; i++){
				 tbody += '<div class="portfolio-caption-heading">' + data.val().title + '</div><div class="portfolio-caption-subheading text-muted">'+ data.val().writer + '</div>' ; 
					$('div.title').html(tbody);
			 } */
				
			 if( idx==0 ){
					tbody += '<div class="portfolio-item"><a class="portfolio-link" data-bs-toggle="modal" href="#portfolioModal1"><div class="portfolio-hover"><div class="portfolio-hover-content"><i class="fas fa-plus fa-3x"></i></div></div><img class="img-fluid" src="https://firebasestorage.googleapis.com/v0/b/match-app-b8c4a.appspot.com/o/matchapp%2FpostImg%2F'+ data.val().imgPath +'?alt=media&token=https://firebasestorage.googleapis.com/v0/b/match-app-b8c4a.appspot.com/o/matchapp%2FpostImg%2Ffe3e9df7-8d9a-490f-8422-f1d4e3aa6d85.jpg?alt=media&token=6c73ac4e-d1f4-44d8-bd24-0b2fc4b34c16" style="width:300px; height:300px;" onerror="'+ noimgpath +'"/></a><div class="portfolio-caption"></div></div><div class="portfolio-caption-heading">' + data.val().title + '</div><div class="portfolio-caption-subheading text-muted">'+ data.val().writer + '</div>' ; 
					$('div.title').html(tbody);
					tbody = "";
					tfoot += '<div class="modal-body"><h3 class="text-uppercase">' + data.val().title + '</h3><p class="item-intro text-muted">' + data.val().game + '</p><img class="img-fluid d-block mx-auto" src="https://firebasestorage.googleapis.com/v0/b/match-app-b8c4a.appspot.com/o/matchapp%2FpostImg%2F'+ data.val().imgPath +'?alt=media&token=https://firebasestorage.googleapis.com/v0/b/match-app-b8c4a.appspot.com/o/matchapp%2FpostImg%2Ffe3e9df7-8d9a-490f-8422-f1d4e3aa6d85.jpg?alt=media&token=6c73ac4e-d1f4-44d8-bd24-0b2fc4b34c16" style="width:300px; height:300px;" onerror="'+ noimgpath +'"/><p>' + data.val().content + '</p><ul class="list-inline"><li><strong>일시:&nbsp; </strong>' + data.val().time +'</li><li><strong>장소: </strong>' + data.val().place + '</li></ul><button class="btn btn-info btn-xl text-uppercase" data-bs-dismiss="modal" type="button"><i class="fas fa-times me-1"></i>닫기</button></div>';
					$('div.action_title').html(tfoot);
					tfoot = "";
				} else if( idx==1 ){
					tbody += '<div class="portfolio-item"><a class="portfolio-link" data-bs-toggle="modal" href="#portfolioModal2"><div class="portfolio-hover"><div class="portfolio-hover-content"><i class="fas fa-plus fa-3x"></i></div></div><img class="img-fluid" src="https://firebasestorage.googleapis.com/v0/b/match-app-b8c4a.appspot.com/o/matchapp%2FpostImg%2F'+ data.val().imgPath +'?alt=media&token=https://firebasestorage.googleapis.com/v0/b/match-app-b8c4a.appspot.com/o/matchapp%2FpostImg%2Ffe3e9df7-8d9a-490f-8422-f1d4e3aa6d85.jpg?alt=media&token=6c73ac4e-d1f4-44d8-bd24-0b2fc4b34c16" style="width:300px; height:300px;" onerror="'+ noimgpath +'"/></a><div class="portfolio-caption"></div></div><div class="portfolio-caption-heading">' + data.val().title + '</div><div class="portfolio-caption-subheading text-muted">'+ data.val().writer + '</div>' ;
					$('div.title1').html(tbody);
					tbody = "";
					tfoot += '<div class="modal-body"><h3 class="text-uppercase">' + data.val().title + '</h3><p class="item-intro text-muted">' + data.val().game + '</p><img class="img-fluid d-block mx-auto" src="https://firebasestorage.googleapis.com/v0/b/match-app-b8c4a.appspot.com/o/matchapp%2FpostImg%2F'+ data.val().imgPath +'?alt=media&token=https://firebasestorage.googleapis.com/v0/b/match-app-b8c4a.appspot.com/o/matchapp%2FpostImg%2Ffe3e9df7-8d9a-490f-8422-f1d4e3aa6d85.jpg?alt=media&token=6c73ac4e-d1f4-44d8-bd24-0b2fc4b34c16" style="width:300px; height:300px;" onerror="'+ noimgpath +'"/><p>' + data.val().content + '</p><ul class="list-inline"><li><strong>일시:&nbsp; </strong>' + data.val().time +'</li><li><strong>장소: </strong>' + data.val().place + '</li></ul><button class="btn btn-info btn-xl text-uppercase" data-bs-dismiss="modal" type="button"><i class="fas fa-times me-1"></i>닫기</button></div>';
					$('div.action_title1').html(tfoot);
					tfoot = "";
				} else if( idx==2 ){
					tbody += '<div class="portfolio-item"><a class="portfolio-link" data-bs-toggle="modal" href="#portfolioModal3"><div class="portfolio-hover"><div class="portfolio-hover-content"><i class="fas fa-plus fa-3x"></i></div></div><img class="img-fluid" src="https://firebasestorage.googleapis.com/v0/b/match-app-b8c4a.appspot.com/o/matchapp%2FpostImg%2F'+ data.val().imgPath +'?alt=media&token=https://firebasestorage.googleapis.com/v0/b/match-app-b8c4a.appspot.com/o/matchapp%2FpostImg%2Ffe3e9df7-8d9a-490f-8422-f1d4e3aa6d85.jpg?alt=media&token=6c73ac4e-d1f4-44d8-bd24-0b2fc4b34c16" style="width:300px; height:300px;" onerror="'+ noimgpath +'"/></a><div class="portfolio-caption"></div></div><div class="portfolio-caption-heading">' + data.val().title + '</div><div class="portfolio-caption-subheading text-muted">'+ data.val().writer + '</div>' ;
					$('div.title2').html(tbody);
					tbody = "";
					tfoot += '<div class="modal-body"><h3 class="text-uppercase">' + data.val().title + '</h3><p class="item-intro text-muted">' + data.val().game + '</p><img class="img-fluid d-block mx-auto" src="https://firebasestorage.googleapis.com/v0/b/match-app-b8c4a.appspot.com/o/matchapp%2FpostImg%2F'+ data.val().imgPath +'?alt=media&token=https://firebasestorage.googleapis.com/v0/b/match-app-b8c4a.appspot.com/o/matchapp%2FpostImg%2Ffe3e9df7-8d9a-490f-8422-f1d4e3aa6d85.jpg?alt=media&token=6c73ac4e-d1f4-44d8-bd24-0b2fc4b34c16" style="width:300px; height:300px;" onerror="'+ noimgpath +'"/><p>' + data.val().content + '</p><ul class="list-inline"><li><strong>일시:&nbsp; </strong>' + data.val().time +'</li><li><strong>장소: </strong>' + data.val().place + '</li></ul><button class="btn btn-info btn-xl text-uppercase" data-bs-dismiss="modal" type="button"><i class="fas fa-times me-1"></i>닫기</button></div>';
					$('div.action_title2').html(tfoot);
					tfoot = "";
				} else if( idx==3 ){
					tbody += '<div class="portfolio-item"><a class="portfolio-link" data-bs-toggle="modal" href="#portfolioModal4"><div class="portfolio-hover"><div class="portfolio-hover-content"><i class="fas fa-plus fa-3x"></i></div></div><img class="img-fluid" src="https://firebasestorage.googleapis.com/v0/b/match-app-b8c4a.appspot.com/o/matchapp%2FpostImg%2F'+ data.val().imgPath +'?alt=media&token=https://firebasestorage.googleapis.com/v0/b/match-app-b8c4a.appspot.com/o/matchapp%2FpostImg%2Ffe3e9df7-8d9a-490f-8422-f1d4e3aa6d85.jpg?alt=media&token=6c73ac4e-d1f4-44d8-bd24-0b2fc4b34c16" style="width:300px; height:300px;" onerror="'+ noimgpath +'"/></a><div class="portfolio-caption"></div></div><div class="portfolio-caption-heading">' + data.val().title + '</div><div class="portfolio-caption-subheading text-muted">'+ data.val().writer + '</div>' ;
					$('div.title3').html(tbody);
					tbody = "";
					tfoot += '<div class="modal-body"><h3 class="text-uppercase">' + data.val().title + '</h3><p class="item-intro text-muted">' + data.val().game + '</p><img class="img-fluid d-block mx-auto" src="https://firebasestorage.googleapis.com/v0/b/match-app-b8c4a.appspot.com/o/matchapp%2FpostImg%2F'+ data.val().imgPath +'?alt=media&token=https://firebasestorage.googleapis.com/v0/b/match-app-b8c4a.appspot.com/o/matchapp%2FpostImg%2Ffe3e9df7-8d9a-490f-8422-f1d4e3aa6d85.jpg?alt=media&token=6c73ac4e-d1f4-44d8-bd24-0b2fc4b34c16" style="width:300px; height:300px;" onerror="'+ noimgpath +'"/><p>' + data.val().content + '</p><ul class="list-inline"><li><strong>일시:&nbsp; </strong>' + data.val().time +'</li><li><strong>장소: </strong>' + data.val().place + '</li></ul><button class="btn btn-info btn-xl text-uppercase" data-bs-dismiss="modal" type="button"><i class="fas fa-times me-1"></i>닫기</button></div>';
					$('div.action_title3').html(tfoot);
					tfoot = "";
				} else if( idx==4 ){
					tbody += '<div class="portfolio-item"><a class="portfolio-link" data-bs-toggle="modal" href="#portfolioModal5"><div class="portfolio-hover"><div class="portfolio-hover-content"><i class="fas fa-plus fa-3x"></i></div></div><img class="img-fluid" src="https://firebasestorage.googleapis.com/v0/b/match-app-b8c4a.appspot.com/o/matchapp%2FpostImg%2F'+ data.val().imgPath +'?alt=media&token=https://firebasestorage.googleapis.com/v0/b/match-app-b8c4a.appspot.com/o/matchapp%2FpostImg%2Ffe3e9df7-8d9a-490f-8422-f1d4e3aa6d85.jpg?alt=media&token=6c73ac4e-d1f4-44d8-bd24-0b2fc4b34c16" style="width:300px; height:300px;" onerror="'+ noimgpath +'"/></a><div class="portfolio-caption"></div></div><div class="portfolio-caption-heading">' + data.val().title + '</div><div class="portfolio-caption-subheading text-muted">'+ data.val().writer + '</div>' ;
					$('div.title4').html(tbody);
					tbody = "";
					tfoot += '<div class="modal-body"><h3 class="text-uppercase">' + data.val().title + '</h3><p class="item-intro text-muted">' + data.val().game + '</p><img class="img-fluid d-block mx-auto" src="https://firebasestorage.googleapis.com/v0/b/match-app-b8c4a.appspot.com/o/matchapp%2FpostImg%2F'+ data.val().imgPath +'?alt=media&token=https://firebasestorage.googleapis.com/v0/b/match-app-b8c4a.appspot.com/o/matchapp%2FpostImg%2Ffe3e9df7-8d9a-490f-8422-f1d4e3aa6d85.jpg?alt=media&token=6c73ac4e-d1f4-44d8-bd24-0b2fc4b34c16" style="width:300px; height:300px;" onerror="'+ noimgpath +'"/><p>' + data.val().content + '</p><ul class="list-inline"><li><strong>일시:&nbsp; </strong>' + data.val().time +'</li><li><strong>장소: </strong>' + data.val().place + '</li></ul><button class="btn btn-info btn-xl text-uppercase" data-bs-dismiss="modal" type="button"><i class="fas fa-times me-1"></i>닫기</button></div>';
					$('div.action_title4').html(tfoot);
					tfoot = "";
				} else if( idx==5 ){
					tbody += '<div class="portfolio-item"><a class="portfolio-link" data-bs-toggle="modal" href="#portfolioModal6"><div class="portfolio-hover"><div class="portfolio-hover-content"><i class="fas fa-plus fa-3x"></i></div></div><img class="img-fluid" src="https://firebasestorage.googleapis.com/v0/b/match-app-b8c4a.appspot.com/o/matchapp%2FpostImg%2F'+ data.val().imgPath +'?alt=media&token=https://firebasestorage.googleapis.com/v0/b/match-app-b8c4a.appspot.com/o/matchapp%2FpostImg%2Ffe3e9df7-8d9a-490f-8422-f1d4e3aa6d85.jpg?alt=media&token=6c73ac4e-d1f4-44d8-bd24-0b2fc4b34c16" style="width:300px; height:300px;" onerror="'+ noimgpath +'"/></a><div class="portfolio-caption"></div></div><div class="portfolio-caption-heading">' + data.val().title + '</div><div class="portfolio-caption-subheading text-muted">'+ data.val().writer + '</div>' ;
					$('div.title5').html(tbody);
					tbody = "";
					tfoot += '<div class="modal-body"><h3 class="text-uppercase">' + data.val().title + '</h3><p class="item-intro text-muted">' + data.val().game + '</p><img class="img-fluid d-block mx-auto" src="https://firebasestorage.googleapis.com/v0/b/match-app-b8c4a.appspot.com/o/matchapp%2FpostImg%2F'+ data.val().imgPath +'?alt=media&token=https://firebasestorage.googleapis.com/v0/b/match-app-b8c4a.appspot.com/o/matchapp%2FpostImg%2Ffe3e9df7-8d9a-490f-8422-f1d4e3aa6d85.jpg?alt=media&token=6c73ac4e-d1f4-44d8-bd24-0b2fc4b34c16" style="width:300px; height:300px;" onerror="'+ noimgpath +'"/><p>' + data.val().content + '</p><ul class="list-inline"><li><strong>일시:&nbsp; </strong>' + data.val().time +'</li><li><strong>장소: </strong>' + data.val().place + '</li></ul><button class="btn btn-info btn-xl text-uppercase" data-bs-dismiss="modal" type="button"><i class="fas fa-times me-1"></i>닫기</button></div>';
					$('div.action_title5').html(tfoot);
					tfoot = "";
				}
			});
			
			
		});
		
</script>
<!--         Navigation -->
<!--         <nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="mainNav"> -->
<!--             <div class="container"> -->
<!--                <a class="navbar-brand" href="#page-top"><img src="resources/assets/img/MoMo-logo.svg" alt="..." /></a> -->
<!--                 <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation"> -->
<!--                     Menu -->
<!--                     <i class="fas fa-bars ms-1"></i> -->
<!--                 </button> -->
<!--                 <div class="collapse navbar-collapse" id="navbarResponsive"> -->
<!--                     <ul class="navbar-nav text-uppercase ms-auto py-4 py-lg-0"> -->
<!--                         <li class="nav-item"><a class="nav-link" href="#services">Services</a></li> -->
<!--                         <li class="nav-item"><a class="nav-link" href="#portfolio">Portfolio</a></li> -->
<!--                         <li class="nav-item"><a class="nav-link" href="#about">About</a></li> -->
<!--                         <li class="nav-item"><a class="nav-link" href="#team">Team</a></li> -->
<!--                         <li class="nav-item"><a class="nav-link" href="#contact">Contact</a></li> -->
<!--                         <li class="nav-item"><a class="nav-link" href="#">Service Center</a></li> -->
<!--                     </ul> -->
<!--                 </div> -->
<!--             </div> -->
<!--         </nav> -->
        <!-- Masthead-->
<div class="wrap_content">
                <!-- Services-->
        <section class="page-section" id="services">
            <div class="container">
            	<div>
                    <img alt="모모" src="imgs/momo.logo2.png" style="width: 300px; height: 300px;" >
                </div>
                <div class="text-center">
                    <h2 class="section-heading text-uppercase">우리 모두의 모임, 모모</h2>
                    <h3 class="section-subheading text-muted">같이 운동할 친구 어디 없나?</h3>
                </div>
                <div class="row text-center">
                    <div class="col-md-4">
                        <span class="fa-stack fa-4x">
                            <img alt="matching" src="imgs/matching.png" style="width: 100px; height: 100px;">
                        </span>
                        <h4 class="my-3">혼자 운동은 이제 그만!</h4>
                        <p class="text-muted">혼자서 하는 운동이 외롭거나 홈 트레이닝이 지겹다면, 모모를 통해 함께 운동하세요!</p>
                    </div>
                    <div class="col-md-4">
                        <span class="fa-stack fa-4x">
                            <img alt="computer" src="imgs/android.png" style="width: 100px; height: 100px;">
                        </span>
                        <h4 class="my-3">실시간으로 현재 모임 확인!</h4>
                        <p class="text-muted">모모 어플리케이션을 다운로드 받아 실시간으로 모임을 만들고, 운동 약속을 잡으세요!</p>
                    </div>
                    <div class="col-md-4">
                        <span class="fa-stack fa-4x">
                            <img alt="schedule" src="imgs/schedule.png" style="width: 100px; height: 100px;">
                        </span>
                        <h4 class="my-3">당신이 원하는 대로!</h4>
                        <p class="text-muted">내가 하고 싶을 때, 내가 하고 싶은 곳에서 운동 모임을 만들 수 있습니다!</p>
                    </div>
                </div>
            </div>
        </section>
        <!-- Portfolio Grid-->
        <section class="page-section bg-light" id="portfolio">
            <div class="container">
                <div class="text-center">
                    <h2 class="section-heading text-uppercase">실시간 모임 현황</h2>
                    <h3 class="section-subheading text-muted">모모에 올라온 모임을 확인하고 상대방과 경기를 잡아보세요!</h3>
                </div>
                
                <div class="row">
                    <div class="col-lg-4 col-sm-6 mb-4">
                        <!-- Portfolio item 1-->
                        <div class="title"></div>
                    </div>
                    <div class="col-lg-4 col-sm-6 mb-4">
                        <!-- Portfolio item 2-->
                        <div class="title1"></div>
                    </div>
                    <div class="col-lg-4 col-sm-6 mb-4">
                        <!-- Portfolio item 3-->
                        <div class="title2"></div>
                    </div>
                    <div class="col-lg-4 col-sm-6 mb-4 mb-lg-0">
                        <!-- Portfolio item 4-->
                        <div class="title3"></div>
                    </div>
                    <div class="col-lg-4 col-sm-6 mb-4 mb-sm-0">
                        <!-- Portfolio item 5-->
                        <div class="title4"></div>
                    </div>
                    <div class="col-lg-4 col-sm-6">
                        <!-- Portfolio item 6-->
                        <div class="title5"></div>
                    </div>
                </div>
            </div>
        </section>
        <!-- About-->
        <section class="page-section" id="about">
            <div class="container">
                <div class="text-center">
                    <h2 class="section-heading text-uppercase">지금의 모모가 되기까지</h2>
                    <h3 class="section-subheading text-muted">모모는 오직 여러분들만을 위해 일해왔습니다.</h3>
                </div>
                <ul class="timeline">
                    <li>
                        <div class="timeline-image"><img class="rounded-circle img-fluid" src="resources/assets/img/about/5.jpg" alt="..." /></div>
                        <div class="timeline-panel">
                            <div class="timeline-heading">
                                <h4>2020-2021</h4>
                                <h4 class="subheading">AI활용 응용소프트웨어 개발자 양성</h4>
                            </div>
                            <div class="timeline-body"><p class="text-muted">2020년 12월 31일 개강한 'AI활용 응용소프트웨어 개발자 양성 프로그램'을 통해 기초와 기반을 다지고, 2021년 5월 중순 경 3명의 조가 편성되었다.</p></div>
                        </div>
                    </li>
                    <li class="timeline-inverted">
                        <div class="timeline-image"><img class="rounded-circle img-fluid" src="resources/assets/img/about/6.jpg" alt="..." /></div>
                        <div class="timeline-panel">
                            <div class="timeline-heading">
                                <h4>May 2021</h4>
                                <h4 class="subheading">모모 기획</h4>
                            </div>
                            <div class="timeline-body"><p class="text-muted">스포츠 매칭이라는 주제로 많은 어플들이 있었으나 많은 서비스가 중단되곤 하였다. </p></div>
                        </div>
                    </li>
                    <li>
                        <div class="timeline-image"><img class="rounded-circle img-fluid" src="resources/assets/img/about/1.jpg" alt="..." /></div>
                        <div class="timeline-panel">
                            <div class="timeline-heading">
                                <h4>Jun 2021</h4>
                                <h4 class="subheading">모모 설계</h4>
                            </div>
                            <div class="timeline-body"><p class="text-muted">지난 7개월간 학교에서 배운 내용을 잘 활용해 질 좋은 서비스를 제공할 수 있도록 준비하였다.</p></div>
                        </div>
                    </li>
                    <li class="timeline-inverted">
                        <div class="timeline-image"><img class="rounded-circle img-fluid" src="resources/assets/img/about/8.jpg" alt="..." /></div>
                        <div class="timeline-panel">
                            <div class="timeline-heading">
                                <h4>July 2021</h4>
                                <h4 class="subheading">우리 모두의 모임</h4>
                            </div>
                            <div class="timeline-body"><p class="text-muted">모모는 운동은 좋아하지만 같이 할 동료가 없어서 운동을 못한 사람, 팀은 있지만 상대가 없어서 경기를 못한 팀, 항상 같은 친구들과 경기를 해서 지루함을 느끼는 친구들을 포함한 모두를 위해 창설되었다. 이제 언제 어디서나 우리 모두의 모임을 가질 수 있게 되었다.</p></div>
                        </div>
                    </li>
                    <li class="timeline-inverted">
                        <div class="timeline-image">
                            <h4>
                                Come &
                                <br />
                                 Join
                                <br />
                                Us!
                            </h4>
                        </div>
                    </li>
                </ul>
            </div>
        </section>
        <!-- Team-->
        <section class="page-section bg-light" id="team">
            <div class="container">
                <div class="text-center">
                    <h2 class="section-heading text-uppercase">Our Amazing Team</h2>
                    <h3 class="section-subheading text-muted">MOMO's Developer.</h3>
                </div>
                <div class="row">
                    <div class="col-lg-4">
                        <div class="team-member">
                            <img class="mx-auto rounded-circle" src="resources/assets/img/team/1.jpg" alt="..." />
                            <h4>전 준 원</h4>
                            <p class="text-muted">Team Leader</p>
<<<<<<< HEAD
                            <a class="btn btn-dark btn-social mx-2" href="https://twitter.com/" target="_blank"><i class="fab fa-twitter"></i></a>
                            <a class="btn btn-dark btn-social mx-2" href="https://www.facebook.com/" target="_blank"><i class="fab fa-facebook-f"></i></a>
                            <a class="btn btn-dark btn-social mx-2" href="https://www.instagram.com" target="_blank"><i class="fab fa-linkedin-in"></i></a>
=======
                            <a class="btn btn-dark btn-social mx-2" target="_blank" href="https://twitter.com/"><i class="fab fa-twitter"></i></a>
                            <a class="btn btn-dark btn-social mx-2" target="_blank" href="https://www.facebook.com/"><i class="fab fa-facebook-f"></i></a>
                            <a class="btn btn-dark btn-social mx-2" target="_blank" href="https://www.instagram.com"><i class="fab fa-linkedin-in"></i></a>
>>>>>>> 5af76be3a0a17e7a268ed2700e0ad0c00227b0fa
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="team-member">
                            <img class="mx-auto rounded-circle" src="resources/assets/img/team/2.jpg" alt="..." />
                            <h4>정 고 운</h4>
                            <p class="text-muted">Developer</p>
<<<<<<< HEAD
                            <a class="btn btn-dark btn-social mx-2" href="https://twitter.com/" target="_blank"><i class="fab fa-twitter"></i></a>
                            <a class="btn btn-dark btn-social mx-2" href="https://www.facebook.com/profile.php?id=100011275692256" target="_blank"><i class="fab fa-facebook-f"></i></a>
                            <a class="btn btn-dark btn-social mx-2" href="https://www.instagram.com/" target="_blank"><i class="fab fa-linkedin-in"></i></a>
=======
                            <a class="btn btn-dark btn-social mx-2" target="_blank" href="https://twitter.com/"><i class="fab fa-twitter"></i></a>
                            <a class="btn btn-dark btn-social mx-2" target="_blank" href="https://www.facebook.com/profile.php?id=100011275692256"><i class="fab fa-facebook-f"></i></a>
                            <a class="btn btn-dark btn-social mx-2" target="_blank" href="https://www.instagram.com/"><i class="fab fa-linkedin-in"></i></a>
>>>>>>> 5af76be3a0a17e7a268ed2700e0ad0c00227b0fa
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="team-member">
                            <img class="mx-auto rounded-circle" src="resources/assets/img/team/3.jpg" alt="..." />
                            <h4>최 명 섭</h4>
                            <p class="text-muted">Developer</p>
<<<<<<< HEAD
                            <a class="btn btn-dark btn-social mx-2" href="https://twitter.com/" target="_blank"><i class="fab fa-twitter"></i></a>
                            <a class="btn btn-dark btn-social mx-2" href="https://www.facebook.com/myeongseob.choe/" target="_blank"></i></a>
                            <a class="btn btn-dark btn-social mx-2" href="https://www.instagram.com/" target="_blank"><i class="fab fa-linkedin-in"></i></a>
=======
                            <a class="btn btn-dark btn-social mx-2" target="_blank" href="https://twitter.com/"><i class="fab fa-twitter"></i></a>
                            <a class="btn btn-dark btn-social mx-2" target="_blank" href="https://www.facebook.com/campaign/landing.php?&campaign_id=1662308814&extra_1=s%7Cc%7C514638008096%7Ce%7C%ED%8E%98%EC%9D%B4%EC%8A%A4%20%EB%B6%81%7C&placement=&creative=514638008096&keyword=%ED%8E%98%EC%9D%B4%EC%8A%A4%20%EB%B6%81&partner_id=googlesem&extra_2=campaignid%3D1662308814%26adgroupid%3D69637362208%26matchtype%3De%26network%3Dg%26source%3Dnotmobile%26search_or_content%3Ds%26device%3Dc%26devicemodel%3D%26adposition%3D%26target%3D%26targetid%3Dkwd-303215285480%26loc_physical_ms%3D1009856%26loc_interest_ms%3D%26feeditemid%3D%26param1%3D%26param2%3D&gclid=CjwKCAjwlYCHBhAQEiwA4K21m0sO7qe5z-9GnSDgGKjp6t36yAV9z09t6KBZ7qFxuMlpPWoCGCx8rRoCWMEQAvD_BwE"><i class="fab fa-facebook-f"></i></a>
                            <a class="btn btn-dark btn-social mx-2" target="_blank" href="https://www.instagram.com/"><i class="fab fa-linkedin-in"></i></a>
>>>>>>> 5af76be3a0a17e7a268ed2700e0ad0c00227b0fa
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-8 mx-auto text-center"><p class="large text-muted">모모 팀의 개발자들입니다. 궁금한 게 있으시면 QnA 게시판으로 문의를 주시거나 개인적으로 메시지를 보내 주세요</p></div>
                </div>
            </div>
        </section>

        
        <!-- Footer-->
        <footer class="footer py-4">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-lg-4 text-lg-start">Copyright &copy; 모모 2021<br/>대표전화 : 062-362-7798</div><br/>
                    <div class="col-lg-4 my-3 my-lg-0">
                        <a class="btn btn-dark btn-social mx-2" target="_blank" href="https://twitter.com/"><i class="fab fa-twitter"></i></a>
                        <a class="btn btn-dark btn-social mx-2" target="_blank" href="https://www.facebook.com/"><i class="fab fa-facebook-f"></i></a>
                        <a class="btn btn-dark btn-social mx-2" target="_blank" href="https://www.instagram.com/"><i class="fab fa-linkedin-in"></i></a>
                    </div>
                    <div class="col-lg-4 text-lg-end">
                        <!-- <div class="portfolio-item"> -->
                        <a class="link-dark text-decoration-none me-3" data-bs-toggle="modal" href="#Privacy">Privacy Policy</a>
                        <a class="link-dark text-decoration-none" data-bs-toggle="modal" href="#Use">Terms of Use</a>
                        <!-- </div> -->
                    </div>
                </div>
            </div>
        </footer>
          <div class="portfolio-modal modal fade" id="Privacy" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="close-modal" data-bs-dismiss="modal"><img src="resources/assets/img/close-icon.svg" alt="Close modal" /></div>
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-lg-8">
                                <div class="modal-body">
                                    <!-- Project details-->
                                    <h2 class="text-uppercase">개인 정보 보호 정책</h2>
                                    <div class="pad10 lh_160" style="text-align: left;">
<div><span style="font-family: 나눔고딕, 'Nanum Gothic'; font-size: 12px;"><span class="bold">우리 모두의 모임</span> (이하 '모모'는) 고객님의 개인정보를 중요시하며, "정보통신망 이용촉진 및 정보보호"에 관한 법률을 준수하고 있습니다.</span><br>
<p><span style="font-family: 나눔고딕, 'Nanum Gothic'; font-size: 12px;">모모는 개인정보취급방침을 통하여 고객님께서 제공하시는 개인정보가 어떠한 용도와 방식으로 이용되고 있으며, 개인정보보호를 위해 어떠한 조치가 취해지고 있는지 알려드립니다.</span></p>
<p><span style="font-family: 나눔고딕, 'Nanum Gothic'; font-size: 12px;">모모는 개인정보취급방침을 개정하는 경우 웹사이트 공지사항(또는 개별공지)을 통하여 공지할 것입니다.</span></p>
<p><span style="font-family: 나눔고딕, 'Nanum Gothic'; font-size: 12px;">ο 본 방침은 : 2021 년 07 월 16 일 부터 시행됩니다.</span></p>
</div>
<p><span style="font-family: 나눔고딕, 'Nanum Gothic'; font-size: 12px;">&nbsp;</span></p>
<h3><span style="font-family: 나눔고딕, 'Nanum Gothic'; font-size: 12px;">■ 수집하는 개인정보 항목</span></h3>
<span style="font-family: 나눔고딕, 'Nanum Gothic'; font-size: 12px;">모모는 회원가입, 상담, 서비스 신청 등등을 위해 아래와 같은 개인정보를 수집하고 있습니다.</span>
<ul>
<li><span style="font-family: 나눔고딕, 'Nanum Gothic'; font-size: 12px;">수집항목(일반회원) : 이름, 아이디, 비밀번호, 생년월일, 성별, 이메일, 자택전화번호, 휴대폰번호, 자택주소</span></li>
<li><span style="font-family: 나눔고딕, 'Nanum Gothic'; font-size: 12px;">수집항목(기업회원) : 이름, 아이디, 비밀번호, 이메일, 일반전화번호, 팩스번호, 휴대폰번호, 업체명, 사업자번호, 사업장주소</span></li>
<li><span style="font-family: 나눔고딕, 'Nanum Gothic'; font-size: 12px;">개인정보 수집방법 : 홈페이지(회원가입)</span></li>
</ul>
<p><span style="font-family: 나눔고딕, 'Nanum Gothic'; font-size: 12px;">&nbsp;</span></p>
<p><span style="font-family: 나눔고딕, 'Nanum Gothic'; font-size: 12px;">&nbsp;</span></p>
<h3><span style="font-family: 나눔고딕, 'Nanum Gothic'; font-size: 12px;">■ 개인정보의 수집 및 이용목적</span></h3>
<p><span style="font-family: 나눔고딕, 'Nanum Gothic'; font-size: 12px;">모모는 수집한 개인정보를 다음의 목적을 위해 활용합니다.</span></p>
<ul style="font-family: 나눔고딕, 'Nanum Gothic'; font-size: 12px;">
<li>회원 관리</li>
<li>민원처리</li>
<li>고지사항 전달</li>
<li>마케팅 및 광고에 활용</li>
<li>교육정보전달</li>
</ul>
<p><span style="font-family: 나눔고딕, 'Nanum Gothic'; font-size: 12px;">&nbsp;</span>&nbsp;</p>
<h3><span style="font-family: 나눔고딕, 'Nanum Gothic'; font-size: 12px;">■ 개인정보의 보유 및 이용기간</span></h3>
<p><span style="font-family: 나눔고딕, 'Nanum Gothic'; font-size: 12px;">원칙적으로, 개인정보 수집 및 이용목적이 달성된 후에는 해당 정보를 지체 없이 파기합니다. 단, 관계법령의 규정에 의하여 보존할 필요가 있는 경우 직업학교는 아래와 같이 관계법령에서 정한 일정한 기간 동안 회원정보를 보관합니다.</span></p>
<ul>
<li><span style="font-family: 나눔고딕, 'Nanum Gothic'; font-size: 12px;">보존 항목 : 이름, 아이디, 생년월일, 성별, 전화번호, 주소</span></li>
<li><span style="font-family: 나눔고딕, 'Nanum Gothic'; font-size: 12px;">보존 기간 : 파기요청시 파기</span></li>
</ul>
<br>
<p><span style="font-family: 나눔고딕, 'Nanum Gothic'; font-size: 12px;">&nbsp;</span></p>
<p><span style="font-family: 나눔고딕, 'Nanum Gothic'; font-size: 12px;">&nbsp;</span></p>
<h3><span style="font-family: 나눔고딕, 'Nanum Gothic'; font-size: 12px;">■ 개인정보의 파기절차 및 방법</span></h3>
<p><span style="font-family: 나눔고딕, 'Nanum Gothic'; font-size: 12px;">모모는 원칙적으로 개인정보 수집 및 이용목적이 달성된 후에는 해당 정보를 지체없이 파기합니다. 파기절차 및 방법은 다음과 같습니다.</span></p>
<ul>
<li style="font-family: 나눔고딕, 'Nanum Gothic'; font-size: 12px;">파기절차</li>
</ul>
<div style="padding-left: 60px; font-family: 나눔고딕, 'Nanum Gothic'; font-size: 12px;">회원님이 회원가입 등을 위해 입력하신 정보는 목적이 달성된 후 별도의 DB로 옮겨져(종이의 경우 별도의 서류함) 내부 방침 및 기타 관련 법령에 의한 정보보호 사유에 따라(보유 및 이용기간 참조) 일정 기간 저장된 후 파기되어집니다.</div>
<div style="padding-left: 60px;"><span style="font-family: 나눔고딕, 'Nanum Gothic'; font-size: 12px;">별도 DB로 옮겨진 개인정보는 법률에 의한 경우가 아니고서는 보유되어지는 이외의 다른 목적으로 이용되지 않습니다.</span></div>
<ul>
<li style="font-family: 나눔고딕, 'Nanum Gothic'; font-size: 12px;">파기방법</li>
</ul>
<p style="padding-left: 60px; font-family: 나눔고딕, 'Nanum Gothic'; font-size: 12px;">전자적 파일형태로 저장된 개인정보는 기록을 재생할 수 없는 기술적 방법을 사용하여 삭제합니다.</p>
<p><span style="font-family: 나눔고딕, 'Nanum Gothic'; font-size: 12px;">&nbsp;</span></p>
<p><span style="font-family: 나눔고딕, 'Nanum Gothic'; font-size: 12px;">&nbsp;</span></p>
<h3><span style="font-family: 나눔고딕, 'Nanum Gothic'; font-size: 12px;">■ 개인정보 제공</span></h3>
<p><span style="font-family: 나눔고딕, 'Nanum Gothic'; font-size: 12px;">모모는 이용자의 개인정보를 원칙적으로 외부에 제공하지 않습니다. 다만, 아래의 경우에는 예외로 합니다.</span></p>
<ul>
<li><span style="font-family: 나눔고딕, 'Nanum Gothic'; font-size: 12px;">이용자들이 사전에 동의한 경우</span></li>
<li><span style="font-family: 나눔고딕, 'Nanum Gothic'; font-size: 12px;">법령의 규정에 의거하거나, 수사 목적으로 법령에 정해진 절차와 방법에 따라 수사기관의 요구가 있는 경우</span></li>
</ul>
<p><span style="font-family: 나눔고딕, 'Nanum Gothic'; font-size: 12px;">&nbsp;</span></p>
<p>&nbsp;</p>
<h3><span style="font-family: 나눔고딕, 'Nanum Gothic'; font-size: 12px;">■ 수집한 개인정보의 위탁</span></h3>
<p><span style="font-family: 나눔고딕, 'Nanum Gothic'; font-size: 12px;">모모는 서비스 이행을 위해 아래와 같이 외부 전문업체에 위탁하여 운영하고 있습니다.</span></p>
<ul>
<li><span style="font-family: 나눔고딕, 'Nanum Gothic'; font-size: 12px;">위탁 대상자 : 우리페이지</span></li>
<li><span style="font-family: 나눔고딕, 'Nanum Gothic'; font-size: 12px;">위탁업무 내용 : 웹사이트 및 시스템 관리</span></li>
</ul>
<br>
<h3><span style="font-family: 나눔고딕, 'Nanum Gothic'; font-size: 12px;">■ 이용자 및 법정대리인의 권리와 그 행사방법</span></h3>
<ul>
<li><span style="font-family: 나눔고딕, 'Nanum Gothic'; font-size: 12px;">이용자는 언제든지 등록되어 있는 자신의 개인정보를 조회하거나 수정할 수 있으며 가입해지를 요청할 수도 있습니다.</span></li>
<li><span style="font-family: 나눔고딕, 'Nanum Gothic'; font-size: 12px;">이용자들의 개인정보 조회,수정을 위해서는 '개인정보변경'(또는 '회원정보수정' 등)을 가입해지(동의철회)를 위해서는 "회원탈퇴"를 클릭하여 본인 확인 절차를 거치신 후 직접 열람, 정정 또는 탈퇴가 가능합니다.</span></li>
<li><span style="font-family: 나눔고딕, 'Nanum Gothic'; font-size: 12px;">혹은 개인정보관리책임자에게 서면, 전화 또는 이메일로 연락하시면 지체없이 조치하겠습니다.</span></li>
<li><span style="font-family: 나눔고딕, 'Nanum Gothic'; font-size: 12px;">귀하가 개인정보의 오류에 대한 정정을 요청하신 경우에는 정정을 완료하기 전까지 당해 개인정보를 이용 또는 제공하지 않습니다. 또한 잘못된 개인정보를 제3자에게 이미 제공한 경우에는 정정 처리결과를 제3자에게 지체없이 통지하여 정정이 이루어지도록 하겠습니다.</span></li>
<li><span style="font-family: 나눔고딕, 'Nanum Gothic'; font-size: 12px;">모모는 이용자의 요청에 의해 해지 또는 삭제된 개인정보는 "직업학교가 수집하는 개인정보의 보유 및 이용기간"에 명시된 바에 따라 처리하고 그 외의 용도로 열람 또는 이용할 수 없도록 처리하고 있습니다.</span></li>
</ul>
<br>
<p><span style="font-family: 나눔고딕, 'Nanum Gothic'; font-size: 12px;">&nbsp;</span></p>
<p><span style="font-family: 나눔고딕, 'Nanum Gothic'; font-size: 12px;">&nbsp;</span></p>
<h3><span style="font-family: 나눔고딕, 'Nanum Gothic'; font-size: 12px;">■ 개인정보 자동수집 장치의 설치, 운영 및 그 거부에 관한 사항</span></h3>
<p><span style="font-family: 나눔고딕, 'Nanum Gothic'; font-size: 12px;">모모는 귀하의 정보를 수시로 저장하고 찾아내는 '쿠키(cookie)' 등을 운용합니다. 쿠키란 웹사이트를 운영하는데 이용되는 서버가 귀하의 브라우저에 보내는 아주 작은 텍스트 파일로서 귀하의 컴퓨터 하드디스크에 저장됩니다.</span></p>
<p><span style="font-family: 나눔고딕, 'Nanum Gothic'; font-size: 12px;">모모은(는) 다음과 같은 목적을 위해 쿠키를 사용합니다.</span></p>
<ul>
<li><span style="font-family: 나눔고딕, 'Nanum Gothic'; font-size: 12px;">쿠키 등 사용 목적</span></li>
</ul>
<div style="padding-left: 60px;"><span style="font-family: 나눔고딕, 'Nanum Gothic'; font-size: 12px;">1. 회원과 비회원의 접속 빈도나 방문 시간 등을 분석, 이용자의 취향과 관심분야를 파악 및 자취 추적, 각종 이벤트 참여 정도 및 방문 회수 파악 등을 통한 타겟 마케팅 및 개인 맞춤 서비스 제공</span></div>
<div style="padding-left: 60px;"><span style="font-family: 나눔고딕, 'Nanum Gothic'; font-size: 12px;">2. 귀하는 쿠키 설치에 대한 선택권을 가지고 있습니다. 따라서, 귀하는 웹브라우저에서 옵션을 설정함으로써 모든 쿠키를 허용하거나, 쿠키가 저장될 때마다 확인을 거치거나, 아니면 모든 쿠키의 저장을 거부할 수도 있습니다.</span></div>
<br>
<ul>
<li>
<p><span style="font-family: 나눔고딕, 'Nanum Gothic'; font-size: 12px;">쿠키 설정 거부 방법</span></p>
<ol>
<li><span style="font-family: 나눔고딕, 'Nanum Gothic'; font-size: 12px;">쿠키 설정을 거부하는 방법으로는 회원님이 사용하시는 웹 브라우저의 옵션을 선택함으로써 모든 쿠키를 허용하거나 쿠키를 저장할 때마다 확인을 거치거나, 모든 쿠키의 저장을 거부할 수 있습니다.</span></li>
<li><span style="font-family: 나눔고딕, 'Nanum Gothic'; font-size: 12px;">설정방법 예(인터넷 익스플로어의 경우) : 웹 브라우저 상단의 도구 &gt; 인터넷 옵션 &gt; 개인정보</span></li>
<li><span style="font-family: 나눔고딕, 'Nanum Gothic'; font-size: 12px;">단, 귀하께서 쿠키 설치를 거부하였을 경우 서비스 제공에 어려움이 있을 수 있습니다.</span></li>
</ol>
</li>
</ul>
<p><span style="font-family: 나눔고딕, 'Nanum Gothic'; font-size: 12px;">&nbsp;</span></p>
<p><span style="font-family: 나눔고딕, 'Nanum Gothic'; font-size: 12px;">&nbsp;</span></p>
<h3><span style="font-family: 나눔고딕, 'Nanum Gothic'; font-size: 12px;">■ 개인정보에 관한 민원서비스</span></h3>
<p><span style="font-family: 나눔고딕, 'Nanum Gothic'; font-size: 12px;">모모는 고객의 개인정보를 보호하고 개인정보와 관련한 불만을 처리하기 위하여 아래와 같이 관련 부서 및 개인정보관리책임자를 지정하고 있습니다.</span></p>
<div>
<ul class="a">
<li><span style="font-family: 나눔고딕, 'Nanum Gothic'; font-size: 12px;">개인정보보호책임자 : 최명섭</span></li>
<li><span style="font-family: 나눔고딕, 'Nanum Gothic'; font-size: 12px;">연락처 : 010-5606-7426</span></li>
<li><span style="font-family: 나눔고딕, 'Nanum Gothic'; font-size: 12px;">이메일 : wmffprtk66@naver.com</span></li>
</ul>
</div>
<p><span style="font-family: 나눔고딕, 'Nanum Gothic'; font-size: 12px;">&nbsp;</span></p>
<ul>
<li><span style="font-family: 나눔고딕, 'Nanum Gothic'; font-size: 12px;">귀하께서는 직업학교의 서비스를 이용하시며 발생하는 모든 개인정보보호 관련 민원을 개인정보관리책임자 혹은 담당부서로 신고하실 수 있습니다.</span></li>
<li><span style="font-family: 나눔고딕, 'Nanum Gothic'; font-size: 12px;">모모는 이용자들의 신고사항에 대해 신속하게 충분한 답변을 드릴 것입니다.</span></li>
<li><span style="font-family: 나눔고딕, 'Nanum Gothic'; font-size: 12px;">기타 개인정보침해에 대한 신고나 상담이 필요하신 경우에는 아래 기관에 문의하시기 바랍니다.</span>
<div>
<ol>
<li><span style="font-family: 나눔고딕, 'Nanum Gothic'; font-size: 12px;">개인분쟁조정위원회 (www.1336.or.kr/1336)</span></li>
<li><span style="font-family: 나눔고딕, 'Nanum Gothic'; font-size: 12px;">정보보호마크인증위원회 (www.eprivacy.or.kr/02-580-0533~4)</span></li>
<li><span style="font-family: 나눔고딕, 'Nanum Gothic'; font-size: 12px;">대검찰청 인터넷범죄수사센터 (http://icic.sppo.go.kr/02-3480-3600)</span></li>
<li><span style="font-family: 나눔고딕, 'Nanum Gothic'; font-size: 12px;">경찰청 사이버테러대응센터 (www.ctrc.go.kr/02-392-0330)</span></li>
</ol>
</div>
</li>
</ul>		</div>
                                    
                                    <button class="btn btn-info btn-xl text-uppercase" data-bs-dismiss="modal" type="button">
                                        <i class="fas fa-times me-1"></i>
                                        Close Privacy Policy
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
  <!-- 이용약관(Terms of Use) -->
<div class="portfolio-modal modal fade" id="Use" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="close-modal" data-bs-dismiss="modal"><img src="resources/assets/img/close-icon.svg" alt="Close modal" /></div>
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-lg-8">
                                <div class="modal-body">
                                    <!-- Project details-->
                                    <h2 class="text-uppercase">이용 약관</h2>
<div style="text-align: left;">
<h2>제 1 장 총칙</h2>
<p><strong>제 1 조 ( 목적 )</strong></p>
<p>이 이용약관 ( 이하 “ 약관 ” 또는 “ 이용계약 ”) 은 '우리 모두의 모임(모모)' ( 이하 “ 회사 ” 라 합니다 ) 가 운영 관리하는 웹사이트 www.momo.co.kr 및 momo.com ( 이하 “ 사이트 ” 라 합니다 ) 에서 제공하는 인터넷 관련 서비스 ( 이하 “ 서비스 ”) 를 이용함에 있어 회사와 이용자의 권리 • 의무 및 책임 사항을 규정함을 목적으로 합니다 .</p>
<p><strong>제 2 조 ( 용어의 정의 )</strong></p>
<p>1. 본 약관에서 정하는 용어의 정의는 다음과 같습니다 .</p>
<p>① “ 사이트 ” 란 회사가 컴퓨터 등 정보통신설비를 이용하여 서비스를 이용자에게 제공할 수 있도록 설정한 가상공간을 말하며 , 아울러 사이트를 운영하는 사업자의 의미로도 사용합니다 .<br>
② “ 이용자 ” 란 사이트에 접속하여 이 약관에 따라 사이트가 제공하는 서비스를 받는 회원 및 비회원을 말합니다 .<br>
③ “ 회원 ” 이라 함은 사이트에 개인정보 및 회사정보를 제공하여 회원등록을 한 자로서 , 사이트의 정보를 지속적으로 제공받으며 , 사이트가 제공하는 서비스를 계속적으로 이용할 수 있는 자를 말합니다 . <br>
④ “ 비회원 ” 이라 함은 회원에 가입하지 않고 사이트가 제공하는 서비스를 이용하는 자를 말합니다 . <br>
⑤ " 개인정보 ” 란 생존하는 개인에 관한 정보로서 성명 , 주민등록번호 등의 사항에 의하여 특정 개인을 식별할 수 있는 정보 ( 당해 정보만으로는 특정 개인을 인식할 수 없더라도 다른 정보와 용이하게 결합하여 식별할 수 있는 것을 포함 ) 를 말합니다 . <br>
⑥ “ 아이디 ” 란 회원의 식별과 회원의 서비스 이용을 위하여 회원이 설정하고 회사가 승인하여 회사에 등록된 영문 , 숫자 또는 영문과 숫자의 조합을 말합니다 . <br>
⑦ “ 비밀번호 ” 란 회원의 동일성 확인을 위하여 회원 스스로가 설정하여 회사에 등록된 영문과 숫자의 조합을 말합니다 . <br>
⑧ “ 서비스 ” 란 이 약관 제 4 조에 정한바 대로 회사가 사이트를 통하여 이용자를 위하여 유료 또는 무료로 제공하는 행위 또는 그 행위의 대상인 유 • 무형의 물건 자체를 의미합니다 . </p>
<p>2. 본 약관에서 사용하는 용어의 정의는 제 1 항에서 정하는 것을 제외하고는 관계법령 및 서비스 별 안내에서 정하는 바에 의합니다 .</p>
<p><strong>제 3 조 ( 약관의 명시 효력 및 변경 )</strong></p>
<p>1. 이 약관은 이용자들이 알 수 있도록 회사의 서비스가 제공되는 사이트의 첫 화면에 게시하거나 기타의 방법으로 회원에게 공지함으로써 효력이 발생합니다 . 단 , 약관의 내용은 이용자가 연결화면을 통하여 볼 수 있도록 할 수 있습니다 .</p>
<p>2. 회사는 전자상거래등에서의소비자보호에관한법률 , 약관의규제등에관한법률 , 전자거래기본법 , 전자서명법 , 정보통신망이용촉진등에관한법률 , 소비자보호법 , 개인정보보호법 등 관련 법을 위배하지 않는 범위에서 이 약관을 개정할 수 있으며 , 회사가 약관을 변경하는 경우에는 적용일자 및 변경사유를 명시하여 그 적용일자 30 일 전부터 사이트에 공지합니다 . 단 , 이용자에게 불리한 약관의 변경인 경우에는 상동 기간에 e-mail 등으로 이용자에게 개별 통지합니다 . 이 경우 , 이용자의 연락처 미기재 및 변경 등으로 인하여 개별 통지가 어려운 경우에 한하여 본 약관에 의한 공지로써 개별 통지한 것으로 간주합니다 . 변경된 약관은 본 조 제 1 항의 방법으로 공지함으로써 효력을 발생합니다 .</p>
<p>3. 이 약관에 동의하는 것은 정기적으로 회사가 운영하는 인터넷 사이트를 방문하여 약관의 변경사항을 확인하는 것에 동의함을 의미합니다 . 변경된 약관에 대한 정보를 알지 못하여 발생하는 회원 또는 이용자의 피해에 대하여 회사는 책임을 부담하지 않습니다 .</p>
<p>4. 회원은 변경된 약관에 동의하지 않을 경우 회원 탈퇴 ( 이용계약의 해지 ) 를 요청할 수 있으며 , 회사가 제 2 항에 따라 변경된 약관을 공지 또는 통지하면서 이용자에게 약관 변경 적용일까지 거부의사를 표시하지 아니할 경우 , 약관의 변경에 동의한 것으로 간주한다는 내용을 공지 또는 통지하였음에도 이용자가 명시적으로 약관 변경에 대한 거부의사를 표시하지 아니하면 , 회사는 이용자가 변경 약관에 동의한 것으로 간주합니다 .</p>
<h2>제 2 장 서비스의 이용</h2>
<p><strong>제 4 조 ( 서비스의 제공 )</strong></p>
<p>1. 사이트는 다음과 같은 서비스를 제공합니다 .</p>
<p>① 쇼핑관련 정보 제공 서비스 <br>
② 사이트에서 상품 또는 용역에 대한 정보의 제공 <br>
③ 기타 사이트가 정하는 이용자에게 유용한 부가 서비스</p>
<p>2. 사이트는 회원 또는 이용자가 사용하는 서비스에 대해 일정량의 사용료를 청구 할 수 있습니다 .</p>
<p>3. 서비스 이용은 사이트의 업무상 기술상 특별한 지장이 없는 경우 연중 무휴 , 1 일 24 시간을 원칙으로 합니다 . 단 사이트는 천재지변 또는 전기공급 중단 등의 이에 준하는 불가항력으로 인하여 서비스를 제공할 수 없는 경우에는 서비스 제공에 관한 책임이 면제 됩니다 . 또한 이용자의 귀책사유로 인한 서비스 이용의 장애에 대하여 책임을 지지 않습니다 .</p>
<p>4. 회사는 이용자가 서비스를 이용하여 기대하는 손익이나 서비스를 통하여 얻은 자료로 인한 손해에 관하여 책임을 지지 않습니다 . 또한 회사는 이용자가 서비스에 게재한 정보 , 자료 , 사실의 신뢰도 , 정확성 등 내용에 관하여 책임을 지지 않습니다 .</p>
<p>5. 회사는 서비스의 운용과 관련하여 사이트 화면 , 홈페이지 , 전자우편 등에 광고를 게재할 수 있습니다 .</p>
<p>6. 회사는 광고업무와 관련하여 회원 전체 또는 일부의 개인 정보에 관한 통계자료를 작성하여 이를 사용할 수 있고 , 서비스를 통하여 회원의 컴퓨터에 쿠키를 전송할 수 있습니다 . 이 경우 회원은 쿠키의 수신을 거부하거나 쿠키의 수신에 대하여 경고하도록 사용하는 컴퓨터의 브라우저 설정을 변경할 수 있습니다 . 이 외의 개인정보 보호에 관해서는 관련법령 및 회사의 " 개인정보취급방침 " 에 준합니다 .</p>
<p><strong>제 5 조 ( 서비스의 중단 )</strong></p>
<p>1. 회사는 컴퓨터 등 정보통신설비의 보수 점검 교체 및 고장 , 통신의 두절 등의 사유가 발생한 경우에는 서비스 제공을 일시적으로 중단할 수 있습니다 .</p>
<p>2. 본 조 제 1 항에 의한 서비스 중단의 경우 회사는 제 8 조에 정한 방법으로 이용자에게 통지합니다 .</p>
<h2>제 3 장 회원가입계약</h2>
<p><strong>제 6 조 ( 회원가입 )</strong></p>
<p>1. 만 14 세 이상의 자라면 누구나 ( 국내 거주 외국인 포함 ) 사이트가 정한 가입 양식에 따라 이 약관에 동의한다는 의사 표시를 함으로써 회원가입을 신청합니다 .</p>
<p>2. 사이트는 본 조 제 1 항과 같이 회원으로 가입할 것을 신청한 이용자 중 다음 각호에 해당하지 않는 한 회원으로 등록합니다 .</p>
<p>① 만 14 세 미만의 자가 이용신청을 하는 경우 <br>
② 등록내용에 허위 , 기재누락 , 오기가 있는 경우 <br>
③ 다른 사람의 명의를 이용하여 신청하는 경우 <br>
④ 회원으로 등록하는 것이 사이트의 기술상 또는 업무 수행상 현저히 지장이 있다고 판단하는 경우 <br>
⑤ 기타 신청자의 귀책 사유로 이용 승낙이 곤란한 경우 ( 제 7 조 제 3 항에 의하여 이전에 회원자격을 상실한 적이 있는 경우 포함 )</p>
<p>&nbsp;</p>
<p>3. 회원가입계약의 성립시기는 사이트의 승낙이 회원에게 도달한 시점으로 합니다 .</p>
<p>4. 회원은 등록사항의 변경이 있는 경우 , 즉시 변경사항을 최신의 정보로 수정하여야 합니다 . 단 , ID 등 변경이 불가능한 사항은 수정할 수 없습니다 . 수정하지 않은 정보로 인하여 발생하는 손해는 당해 회원이 부담하며 , 회사는 이에 대하여 아무런 책임을 지지 않습니다 .</p>
<p>5. 회사는 회원의 정보를 서비스를 제공하기 위한 목적 이외의 용도로 사용하거나 이용자의 동의 없이 제 3 자에게 제공하지 않습니다 .</p>
<p>6. 회사는 회원의 개인정보를 보호하기 위한 정책을 수립하고 개인정보보호 책임자를 지정하여 이를 게시합니다 .</p>
<p>7. 기타 회원의 개인정보 수집 , 이용 , 보유 , 제공 , 처리 등에 관한 사항은 관련 법령 및 개인정보 취급방침에 따릅니다 .</p>
<p><strong>제 7 조 ( 회원 탈퇴 및 자격상실 )</strong></p>
<p>1. 회원은 회사에 언제든지 탈퇴 ( 즉 , 이용계약 해지 ) 를 요청할 수 있으며 회사가 탈퇴요청 접수일로부터 24 시간 이내 회원 탈퇴 처리를 함으로써 본 이용계약은 해지됩니다 .</p>
<p>2. 회원탈퇴로 인해 발생한 불이익에 대한 책임은 회원 본인이 져야 하며 , 이용계약이 해지되면 회사는 회원에게 부가적으로 제공한 각종 혜택을 회수할 수 있습니다 .</p>
<p>3. 회사는 불량회원 관리 및 타 법률에 의해 보존해야 할 필요가 있는 경우에는 회원의 개인정보를 일정기간 보유합니다 .</p>
<p>4. 회원이 다음 각 호의 사유에 해당하는 경우 , 회사는 회원자격을 제한 및 사이트 이용을 제한할 수 있습니다 .</p>
<p>① 등록 신청 시에 허위 내용 및 다른 사람의 명의를 허락 없이 이용하여 등록한 경우 <br>
② 사이트에 제공되는 정보를 변경하는 등 사이트의 운영을 방해한 경우 <br>
③ 다른 회원의 아이디 (ID) 를 부정 사용하는 행위 <br>
④ 범죄행위를 목적으로 하거나 기타 범죄행위와 관련된 행위 <br>
⑤ 선량한 풍속 , 기타 사회질서를 해하는 행위 <br>
⑥ 타인의 명예를 훼손하거나 모욕하는 행위 <br>
⑦ 타인의 지적재산권 등의 권리를 침해하는 행위 <br>
⑧ 해킹행위 또는 컴퓨터 바이러스의 유포 행위 <br>
⑨ 타인의 의사에 반하여 광고성 정보 등 일정한 내용을 지속적으로 전송하는 행위 <br>
⑩ 서비스의 안전적인 운영에 지장을 주거나 줄 우려가 있는 일체의 행위 <br>
⑪ 사이트를 이용하여 법령과 이 약관이 금지하는 행위를 하는 경우 <br>
⑫ 기타 관계법령 및 본 약관상의 제반 규정을 위반하는 경우</p>
<p>5. 회사는 본 조 제 4 항에 따라 회원 자격을 제한하거나 본 조 제 6 항에 따른 통지로써 본 이용계약을 해지할 수 있습니다 .</p>
<p>6. 회사가 본 이용계약을 해지하는 경우 , 회사는 회원등록을 말소하며 회원에게 전자우편 또는 기타의 방법을 통하여 해지사유를 밝혀 해지의사를 통지합니다 . 이용계약은 회사의 해지의사를 회원에게 통지한 시점에 종료됩니다 .</p>
<p>7. 본 조에서 정한 바에 따라 이용계약이 종료될 시에는 회사는 별도 통지 없이 해당 회원에게 부가적으로 제공한 각종 혜택을 회수할 수 있습니다 .</p>
<p><strong>제 8 조 ( 회원에 대한 통지 )</strong></p>
<p>1. 회사가 회원에 대한 통지를 하는 경우 , 회원이 사이트에 제출한 전자우편 주소로 할 수 있습니다 .</p>
<p>2. 회사는 불특정다수 회원에 대한 통지의 경우 소정의 기간 동안 사이트에 게시함으로써 개별 통지에 갈음할 수 있습니다 .</p>
<h2>제 4 장 사이트와 이용자의 의무사항</h2>
<p><strong>제 9 조 ( 개인정보보호 )</strong></p>
<p>회사는 이용자의 개인정보를 보호하기 위하여 최선을 다하고 있으며 이와 관련하여서는 개인정보 취급방침에 따릅니다 .</p>
<p><strong>제 10 조 ( 회사의 의무 )</strong></p>
<p>1. 회사는 법령과 이 약관이 정하는 바에 따라 지속적이고 , 안정적으로 재화 또는 용역을 제공하는데 최선을 다합니다 .</p>
<p>2. 회사는 이용자가 안전하게 인터넷 서비스를 이용할 수 있도록 이용자의 개인정보 ( 신용정보 포함 ) 보호를 위한 보안 시스템을 갖추어야 합니다 .</p>
<p>3. 회사는 이용고객으로부터 제기되는 의견이나 불만이 정당하다고 객관적으로 인정될 경우에는 적절한 절차를 거쳐 즉시 처리하여야 합니다 . 다만 , 즉시 처리가 곤란한 경우는 이용자에게 그 사유와 처리일정을 통보하여야 합니다 .</p>
<p>4. 회사는 소비자보호단체의 소비자보호 업무의 추진에 필요한 자료 등의 제공요구에 적극 협력합니다 .</p>
<p>5. 사이트가 상품이나 용역에 대하여「표시 • 광고의공정화에관한법률」제 3 조 소정의 부당한 표시 • 광고행위를 함으로써 이용자가 손해를 입은 때에는 이를 배상할 책임을 집니다 .</p>
<p><strong>제 11 조 ( 이용자의 의무 )</strong></p>
<p>1. 이용자는 다음 행위를 하여서는 안됩니다 .</p>
<p>① 신청 또는 변경 시 허위내용의 등록 <br>
② 사이트에 게시된 정보의 변경 <br>
③ 사이트가 정한 정보 이외의 정보 ( 컴퓨터 프로그램등 ) 등의 송신 또는 게시 <br>
④ 사이트 기타 제 3 자의 저작권 등 지적재산권에 대한 침해 <br>
⑤ 사이트 기타 제 3 자의 명예를 손상시키거나 업무를 방해하는 행위 <br>
⑥ 외설 또는 폭력적인 메시지 • 화상 • 음성 기타 공서양속에 반하는 정보를 사이트에 공개 또는 게시하는 행위 <br>
⑦ 다른 이용자의 ID, 비밀번호 , 주민등록번호를 도용하는 행위 <br>
⑧ 기타 관계법령에 위반 등 기타 회사가 부적절하다고 판단하는 행위</p>
<p>2. 회사는 본 조 제 1 항의 사항 등 사이트의 운영상 부적절 하다고 판단한 정보가 사이트에 게시되거나 사이트와 링크된 곳에 게시된 경우 , 회사는 이용자 기타 정보의 게시를 행한 자의 승낙 및 사전 통지 없이 사이트에 게재된 당해 정보를 삭제하거나 사이트에 확장된 링크를 차단할 수 있습니다 . ( 단 , 회사는 이러한 정보의 삭제 • 링크의 차단 등을 할 의무를 지지 않습니다 .)</p>
<p><strong>제 12 조 ( 회원의 ID 및 비밀번호 관리 )</strong></p>
<p>1. ID 와 비밀번호에 대한 관리책임은 회원에게 있습니다 .</p>
<p>2. 회사는 이용자 ID 에 의하여 제반 이용자 관리업무를 수행 하므로 회원이 이용자 ID 를 변경하고자 하는 경우 회사가 인정할 만한 사유가 없는 한 이용자 ID 의 변경을 제한할 수 있습니다 .</p>
<p>3. 이용고객이 등록한 이용자 ID 및 비밀번호에 의하여 발생되는 사용상의 과실 또는 제 3 자에 의한 부정사용 등에 대한 모든 책임은 해당 이용고객에게 있습니다 .</p>
<p>4. 회원이 자신의 ID 및 비밀번호를 도난 당하거나 제 3 자가 사용하고 있음을 인지한 경우에는 바로 사이트에 통보하고 사이트의 안내에 따라야 합니다 .</p>
<h2>제 5 장 기타</h2>
<p><strong>제 13 조 ( 저작권의 보호 )</strong></p>
<p>1. 회사가 작성한 저작물에 대한 저작권 기타 지적재산권은 회사에 귀속합니다 .</p>
<p>2. 이용자는 사이트의 서비스를 이용함으로써 얻은 정보 중 회사에게 지적재산권이 귀속된 정보를 회사의 사전 승낙 없이 복제 , 송신 , 출판 , 배포 , 방송 기타 방법에 의하여 영리목적으로 이용하거나 제 3 자에게 이용하게 하여서는 안됩니다 .</p>
<p>3. 회사는 이용자가 등록한 게시물을 검색에 노출하거나 , 판촉 , 홍보 및 기타의 자료로 무상 사용할 수 있습니다 . 다만 , 해당 게시물을 등록한 이용자가 게시물의 삭제와 함께 사용중지를 요청한 경우에는 즉시 사용을 중지합니다 .</p>
<p><strong>제 14 조 ( 면책조항 )</strong></p>
<p>1. 회사는 천재지변 , 전쟁 및 기타 이에 준하는 불가항력으로 인하여 서비스를 제공할 수 없는 경우에는 서비스 제공에 대한 책임이 면제됩니다 .</p>
<p>2. 회사는 기간통신 사업자가 전기통신 서비스를 중지하거나 정상적으로 제공하지 아니하여 손해가 발생한 경우 책임이 면제됩니다 .</p>
<p>3. 회사는 이용자의 귀책사유로 인한 서비스 이용의 장애 또는 손해에 대하여 책임을 지지 않습니다 .</p>
<p>4. 회사는 이용자가 서비스를 이용함으로써 기대되는 수익을 얻지 못하거나 서비스를 통해 얻은 자료를 이용하여 발생한 손해에 대해서는 책임을 부담하지 않습니다 .</p>
<p>5. 이용자 또는 제 3 자가 사이트 및 서비스 화면에 게재한 각종 정보 , 자료 , 사실 등의 내용에 관한 신뢰도 또는 정확성 등에 대하여 해당 이용자와 제 3 자가 책임을 지며 , 회사는 이를 보증 하거나 그와 관련하여 어떠한 책임도 부담하지 아니 합니다 .</p>
<p>6. 회사는 서비스이용과 관련하여 이용자의 고의 또는 과실로 인하여 이용자 또는 제 3 자에게 발생한 손해에 대하여는 아무런 책임을 부담하지 않습니다 .</p>
<p>7. 회사의 사이트 및 서비스 화면에서 링크 , 배너 등을 통하여 연결된 회사 ( 이하 “ 피연결회사 ”) 와 이용자 간에 해당 피연결회사가 독자적으로 제공하는 재화 등에 대하여 이루어진 거래의 경우 , 회사는 이에 대해서 책임을 지지 않습니다 .</p>
<p><strong>제 15 조 ( 분쟁해결 )</strong></p>
<p>사이트는 이용자로부터 제출되는 불만사항 및 의견은 우선적으로 그 사항을 처리합니다 . 다만 , 신속한 처리가 곤란한 경우에는 이용자에게 그 사유와 처리일정을 즉시 통보합니다 .</p>
<p><strong>제 16 조 ( 손해배상 등 )</strong></p>
<p>서비스 이용과 관련하여 이용자의 귀책 사유로 회사 및 / 또는 제 3 자에게 손해가 발생한 경우 , 회사는 당해 이용자에게 손해 배상을 청구할 수 있습니다 .</p>
<p><strong>제 17 조 ( 재판권 및 준거법 )</strong></p>
<p>1. 서비스 이용으로 발생한 분쟁에 대해 소송이 제기되는 경우 서울중앙지방법원을 합의관할법원으로 합니다 .</p>
<p>2. 회사와 이용자간에 제기된 소송에는 한국법을 적용합니다 .</p>
<p><strong>제 18 조 ( 약관 외 준칙 )</strong></p>
<p>1. 이 약관에서 정하지 아니한 사항과 이 약관의 해석에 관하여는 약관의규제등에관한법률 , 공정거래위원회가 정하는 지침 및 관계법령 또는 상관례에 따릅니다 .</p>
<p>2. 회사는 필요한 경우 특정 서비스에 관하여 적용될 사항 ( 이하 “ 개별약관 ”) 을 정하여 이를 사이트 서비스 화면 게시 등을 통하여 공지할 수 있습니다 .</p>
<p>3. 회사는 필요한 경우 서비스 이용과 관련된 세부적인 내용 ( 이하 " 이용정책 ") 을 정하여 이를 사이트 서비스 화면 게시 등을 통하여 공지할 수 있습니다 .</p>
<p>4. 개별약관이나 이용정책의 변경이 있을 경우 회사는 변경 내용의 효력발생일 7 일 이전에 해당 변경 사항을 공지합니다 .</p>
<p>5. 회원은 항상 개별약관이나 이용정책의 내용에 변경이 있는지 여부를 주시하여야 하며 , 변경사항의 공지가 있을 시에는 이를 확인하여야 합니다 .</p>
<p><strong>제 19 조 ( 기타 조항 )</strong></p>
<p>1. 회사는 필요한 경우 특정 서비스나 기능의 전부 또는 일부를 사이트를 통해 미리 공지한 후 일시적 또는 영구적으로 수정하거나 중단할 수 있습니다 .</p>
<p>2. 각 당사자는 상대방의 서면동의 없이 이 약관상의 권리와 의무를 제 3 자에게 양도하거나 처분할 수 없습니다 .</p>
<p>3. 이 약관과 관련하여 당사자간의 합의에 의하여 추가로 작성된 계약서 , 협정서 , 통보서 등과 회사의 정책변경 , 법령의 제 • 개정 또는 공공기관의 고시나 지침 등에 의하여 회사가 사이트를 통해 공지하는 내용도 이용계약의 일부를 구성합니다 .</p>
<h2>[ 부칙 ]</h2>
<p><span style="color: #FF0000;">제 1 조 ( 시행일 ) 이 약관은 2021 년 7 월 16 일부터 시행합니다 .</span></p>
<p>본 약관에 대한 저작권은 회사에 귀속하며 무단복제 , 배포 , 전송 기타 저작권과 침해 행위를 엄금합니다 .</p>
<p>출처 : ADIDAS KOREA</p>
</div>
                                    
                                    <button class="btn btn-info btn-xl text-uppercase" data-bs-dismiss="modal" type="button">
                                        <i class="fas fa-times me-1"></i>
                                        Close Terms of Use
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>   
        
        <!-- Portfolio Modals-->
        <!-- Portfolio item 1 modal popup-->
        <div class="portfolio-modal modal fade" id="portfolioModal1" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="close-modal" data-bs-dismiss="modal"><img src="resources/assets/img/close-icon.svg" alt="Close modal" /></div>
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-lg-8">
                                
								<div class="action_title"></div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Portfolio item 2 modal popup-->
        <div class="portfolio-modal modal fade" id="portfolioModal2" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="close-modal" data-bs-dismiss="modal"><img src="resources/assets/img/close-icon.svg" alt="Close modal" /></div>
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-lg-8">
                                
								<div class="action_title1"></div>
								
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Portfolio item 3 modal popup-->
        <div class="portfolio-modal modal fade" id="portfolioModal3" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="close-modal" data-bs-dismiss="modal"><img src="resources/assets/img/close-icon.svg" alt="Close modal" /></div>
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-lg-8">
                                
								<div class="action_title2"></div>
								
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Portfolio item 4 modal popup-->
        <div class="portfolio-modal modal fade" id="portfolioModal4" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="close-modal" data-bs-dismiss="modal"><img src="resources/assets/img/close-icon.svg" alt="Close modal" /></div>
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-lg-8">
                                
								<div class="action_title3"></div>
								
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Portfolio item 5 modal popup-->
        <div class="portfolio-modal modal fade" id="portfolioModal5" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="close-modal" data-bs-dismiss="modal"><img src="resources/assets/img/close-icon.svg" alt="Close modal" /></div>
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-lg-8">
                                
								<div class="action_title4"></div>
								
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Portfolio item 6 modal popup-->
        <div class="portfolio-modal modal fade" id="portfolioModal6" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="close-modal" data-bs-dismiss="modal"><img src="resources/assets/img/close-icon.svg" alt="Close modal" /></div>
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-lg-8">
                                
								<div class="action_title5"></div>
								
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        
                        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Portfolio about team -->
        <a href="#"><img alt="" src="imgs/TOP3.png" style="position: fixed; right: 120px; bottom: 300px; width: 100px; height: 100px;"></a>
		<a href="#portfolio"><div style="position: fixed; right: 150px; bottom: 290px; float: left;">Matching</div></a>   			
		<a href="#about"><div style="position: fixed; right: 150px; bottom: 260px; float: left;">About</div></a>        <!-- Bootstrap core JS-->
		<a href="#team"><div style="position: fixed; right: 150px; bottom: 230px; float: left;">Team</div></a>        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
        <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
        <!-- * *                               SB Forms JS                               * *-->
        <!-- * * Activate your form at https://startbootstrap.com/solution/contact-forms * *-->
        <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
        <script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
        
       </div>
</body>
</html>