<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<title>모모</title>
	
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	
<style type="text/css">

table tr td { text-align:left; }

input[name=addr] { width:calc(100% - 24px); }

.valid, .invalid { font-size:13px; font-weight:bold; }

.valid { color:green; }

.invalid { color:red; }

</style>

</head>
<body>
<div class="wrap_content">
<h3>회원정보 수정</h3>
<p class='w-pct50 right' style='margin:0 auto; padding-bottom:10px'>* 는 필수입력항목입니다</p>
<form method="post" action="update.cu">
<input type="hidden" name="id" value="${vo.id}"/>
<table class='w-pct50'>
	<tr>
		<th class="w-px160">* 아이디</th>
	<td>${vo.id}</td>
	</tr>

	<tr>
		<th class="w-px160">* 비밀번호</th>
		<td><a class='btn-fill-s' id='btn-pass' href='password.cu?id=${logininfo.id}'>비밀번호 변경</a></td>
	</tr>
	
	<tr>
		<th class="w-px160">* 성명</th>
		<td>${vo.name}</td>
	</tr>

	<tr>
		<th class="w-px160">* 성별</th>
		<td>${vo.gender}</td>
	</tr>
	
	<tr>
		<th class="w-px160">* 이메일</th>
		<td><input type="email" name='email' value="${vo.email}" class='chk'/><br>
		</td>
	</tr>

	<tr><th class='w-px160'>생년월일</th>
		<td><input type='text' name='birth' value="${vo.birth}" readonly />
			<span id='delete' style='display:none; color:red; position:relative; right:25px; cursor:pointer;'><i class="fas fa-times"></i></span>
		</td>
	</tr>

	<tr><th class='w-px160'>연락처</th>
		<td><input type='text' name='tel' min="0" value="${vo.tel}"/>
		</td>
	</tr>
	
	<tr><th class='w-px160'>주소</th>
		<td><a class='btn-fill-s' onclick="daum_post()">우편번호찾기</a>
			<input type='text' name='post' class='w-px60 back-trans' value='${vo.post}' readonly /><br>
			<input type='text' name='addr' id='addr1' readonly />
			<input type='text' name='addr' id='addr2'/>
		</td>
	</tr>
</table>
</form>

<div class='btnSet'>
<!-- 	<a class='btn-fill' onclick='$("form").submit()'>저장</a> -->
	<a class='btn-fill' onclick='go_update()'>저장</a>
	<a class='btn-fill' onclick="history.back();">취소</a> <!-- 취소 누르면 뒤로가기 -->
	<a class='btn-fill' onclick="{drop_out()}">회원 탈퇴</a>
</div>
</div>
	
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="js/join_check.js"></script>

<!-- DB에 있는 주소 나눠 삽입 -->
   <script>
   $(function(){
		var oldString = '${vo.addr}';
		var splitstr = oldString.split(',');
		$('[id=addr1]').val(splitstr[0]);
		$('[id=addr2]').val(splitstr[1]);
   })
   
   
 
	   function drop_out() {
	alert("drop_out() 진입");
	var pw_check = prompt('탈퇴하시려면 현재 비밀번호를 입력하세요');
		alert("pw_check : " + pw_check)
	
	if(pw_check == '${vo.pw}') {
		alert('비밀번호가 일치합니다.');
	location.href="delete.cu?id=${vo.id }";
	alert("정상적으로 탈퇴되었습니다.");
		return true;
	}else{
		alert('비밀번호가 일치하지 않습니다.');
		return false;
	}
   }
;
   </script>
<script type="text/javascript">

$(function(){
	var today = new Date();
	var endDay = 
		new Date( today.getFullYear()-13, today.getMonth(), today.getDate()-1 );

 
	$('[name=birth]').datepicker({
		dayNamesMin: ['일', '월', '화', '수', '목', '금', '토']
		, dateFormat : 'yy-mm-dd'
		, changeYear : true
		, changeMonth : true
		, showMonthAfterYear: true
		, monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월'
							, '7월', '8월', '9월', '10월', '11월', '12월']
		, maxDate : endDay
		, minDate : "-100Y"
		, yearRange : "1900:2020"
	});

});

$('.chk').on('keyup', function(e){

	if( $(this).attr('name')=='id' ){
		if( e.keyCode==13 ){
			id_check();
			return;
		}else
			$(this).removeClass('chked');
	} 

	validate( $(this) );
});

function validate( tag ){

	var data = join.tag_status( tag );
	tag.siblings('div').text( data.desc );	
	tag.siblings('div').removeClass();
	tag.siblings('div').addClass( data.code );

}

$('[name=birth]').change(function(){
	$('#delete').css('display', 'inline');
});

$('#delete').click(function(){
	$('[name=birth]').val('');
	$('#delete').css('display', 'none');
});
	

function daum_post(){
	new daum.Postcode({
		oncomplete:function( data ){
			$('[name=post]').val( data.zonecode );
			//도로명주소 R, 지번주소 J
			var address = data.userSelectedType=='R' 
							? data.roadAddress : data.jibunAddress;
			if( data.buildingName !='' ) address += ' (' + data.buildingName + ')';						
			$('[name=addr]').eq(0).val( address );
		}
	}).open();
}

function go_update(){
	
	if( ! item_check( $('[name=email]') ) ) return;
	
	/* 연락처 유효성 체크 */
	if( $('[name=tel]') ) {
		var userTel = $('[name=tel]').val();
		var regUserTel = /^010\d{4}\d{4}$/;//010로 시작하고 숫자로 4자, 숫자로 4자로 유효성검사
		
		if(userTel != "") {
			while (true) {
				if (!regUserTel.test(userTel)) {
					alert("전화번호 형식이 잘못되었습니다.");
					userTel.focus();
					return false;
				} else {
					break;
				}
			}
		}
		if( confirm("정말 수정하시겠습니까?") ) {$("form").submit();};	
	}
	
	function item_check( tag ){
		var result = join.tag_status( tag );

		if( result.code =='invalid' ){
			alert( '회원정보 수정 불가!\n' + result.desc );
			tag.focus();
			return false;
		}else return true;
	}
}
</script>
</body>
</html>