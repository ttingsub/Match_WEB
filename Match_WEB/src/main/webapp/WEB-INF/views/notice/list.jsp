<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="https://www.gstatic.com/firebasejs/4.11.0/firebase.js"></script>

<body>
	<h3>모모 고객센터</h3>
	<form action="list.no" method="post">
		<div id='list-top'>
			<div>
				<ul>
					<li>
						<select name="search" class="w-px80">
							<option value="all" ${page.search eq 'all' ? 'selected' : '' }>전체</option>
							<option value="title" ${page.search eq 'title' ? 'selected' : '' }>제목</option>
							<option value="content" ${page.search eq 'content' ? 'selected' : '' }>내용</option>
							<option value="writer" ${page.search eq 'writer' ? 'selected' : '' }>작성자</option>
						</select>
					</li>
					<li><input type="text" name="keyword" value='${page.keyword }' class="w-px300"/></li>
					<li><a class="btn-fill" onclick="$('form').submit()">검색</a></li>
				</ul>
				<ul>
					<c:if test="${logininfo.name eq '관리자' }"><%-- 관리자인지 아닌지 테스트 --%>
						<li><a class="btn-fill" href="new.no">글쓰기</a></li>
					</c:if>
				</ul>
			</div>
		</div>
		<!-- 검색했을 때 페이지를 1로 -->
		<input type="hidden" name="curPage" value="1"/>
	</form>
	<table class='tb_list'>
		<tr>
			<th class="w-px60">번호</th>
			<th class="w-px100">제목</th>
			<th class="w-px100">작성자</th>			
			<th class="w-px120">작성일자</th>			
		</tr>
		
		<c:forEach items="${page.list}" var="vo">
			<tr>
				<td>${vo.no}</td>
				<td class="left">
					<c:forEach var="i" begin="1" end="${vo.indent }" >
						${i eq vo.indent ? "<img src='imgs/re.gif'/>" : "&nbsp&nbsp;" }
					</c:forEach>
					<a href="view.no?id=${vo.id}">${vo.title}</a>
				</td>
					<td>${vo.writer}</td>
					<td>${vo.writedate}</td>
			</tr>
		</c:forEach>
		
<%-- 파이어베이스
 		</thead>
			<tbody>
			
			</tbody>
			
			
			<tr>
				<td>${vo.no}</td>
				<td class="left">
					<c:forEach var="i" begin="1" end="${vo.indent }" >
						${i eq vo.indent ? "<img src='imgs/re.gif'/>" : "&nbsp&nbsp;" }
					</c:forEach>
					<a href="view.no?id=${vo.id}">${vo.title}</a>
				</td>
					<td>${vo.writer}</td>
					<td>${vo.writedate}</td>
			</tr> --%>
		
	</table>
	<div class="btnSet">
		<jsp:include page="/WEB-INF/views/include/page.jsp"/>
	</div>
<!-- 	<script>
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
				    measurementId "G-0NK2LLS1Z8"
		};
		firebase.initializeApp(firebaseConfig);
		
		var ServiceCenterField = document.getElementById("ServiceCenter"); 
		var database = firebase.database();

		
		var tbody = '';
		
		var dbTestRef = database.ref('matchapp/ServiceCenter');
			dbTestRef.on('child_added', function(data){
				$('table tbody').html('');
				console.log('>',data.val());
				
				
				$(data.val()).each(function(){
					tbody += '<tr><td><a class="ServiceCenter">' + this.title + '</a></td><td>' + this.writer +'</td><td>' + this.time + '</td></tr>'  ;
				});
				$('table tbody').html(tbody);
//	 			console.log(Post);
			}); 
	</script>-->
</body>
</html>









