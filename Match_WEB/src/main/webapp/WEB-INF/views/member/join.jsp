<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Insert title here</title>

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<style type="text/css">

table tr td { text-align:left; }

input[name=addr] { width:calc(100% - 24px); }

.valid, .invalid { font-size:13px; font-weight:bold; }

.valid { color:green; }

.invalid { color:red; }

#foot {
	display: none;
}

</style>

</head>

<body>
<div class="wrap_content">
<p class='w-pct50 right' style='margin:0 auto; padding-bottom:10px'>* 는 필수입력항목입니다</p>
<form method="post" action="join">
<table class='w-pct50'>

<tr><th class='w-px160'>* 아이디</th>

	<td><input type='text' name='id' class='chk'  />
	<!-- onkeypress="if( event.keyCode==13 ){ id_check(); }" --> 
		<a class='btn-fill-s' id='btn-id'>아이디중복확인</a><br>
		<div class='valid'>아이디를 입력하세요(영문소문자, 숫자만 가능)</div>
	</td>
</tr>

<tr><th class='w-px160'>* 비밀번호</th>
	<td><input type='password' name='pw' class='chk' /><br>
		<div class='valid'>비밀번호를 입력하세요(영문대/소문자, 숫자를 모두 포함)</div>
	</td>
</tr>

<tr><th class='w-px160'>* 비밀번호 확인</th>
	<td><input type='password' name='pw_ck' class='chk' /><br>
		<div class='valid'>비밀번호를 입력하세요</div>
	</td>
</tr>

<tr><th class='w-px160'>* 성명</th>
	<td><input type='text' name='name' class='chk'/>
		<div class='valid'>성명을 입력하세요</div>
	</td>
</tr>

<tr><th class='w-px160'>* 성별</th>
	<td><label><input type='radio' name='gender' value='남' checked/>남</label>
		<label><input type='radio' name='gender' value='여'  />여</label>
	</td>

</tr>

<tr><th class='w-px160'>* 이메일</th>
	<td><input type='text' name='email' class='chk' /><br>
		<div class='valid'>이메일을 입력하세요</div>
	</td>
</tr>

<tr><th class='w-px160'>생년월일</th>
	<td><input type='text' name='birth' readonly />
		<span id='delete' style='display:none; color:red; position:relative; right:25px; cursor:pointer;'><i class="fas fa-times"></i></span>
	</td>
</tr>

<tr><th class='w-px160'>연락처</th>
	<td><input type='text' name='tel' placeholder='010********' />
	</td>
</tr>

<tr><th class='w-px160'>주소</th>
	<td><a class='btn-fill-s' onclick="daum_post()">우편번호찾기</a>
		<input type='text' name='post' class='w-px50' readonly /><br>
		<input type='text' name='addr' readonly />
		<input type='text' name='addr'/>
	</td>
</tr>
</table>

</form>
<div class='btnSet'>
<a class='btn-fill' onclick="go_join()">회원가입</a>
<a class='btn-fill' href='<c:url value="/"/>'>취소</a>
</div>
</div>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="js/join_check.js"></script>
<script type="text/javascript">

function go_join(){

	//중복확인 한 경우 : chked 클래스가 있음
	if( $('[name=id]').hasClass('chked') ){
		if( $('[name=id]').siblings('div').hasClass('invalid') ){
			alert('회원가입 불가!\n' + join.id.unusable.desc );
			$('[name=id]').focus();
			return;
		}

	}else{

	//중복확인 하지 않은 경우
		if( ! item_check( $('[name=id]') ) ) return;
		else{
			alert( join.id.valid.desc );
			$('[name=id]').focus();
			return;
		}
	}

	if( ! item_check( $('[name=pw]') ) ) return;
	if( ! item_check( $('[name=pw_ck]') ) ) return;
	if( ! item_check( $('[name=name]') ) ) return;
	
	/* 성명 유효성 체크 */
// 	if( $('[name=name]').val()=='' ){
// 		alert('성명을 입력하세요!');
// 		$('[name=name]').focus();
// 		return;
// 	}
/* 	if( $('[name=name]') ) {
		var userName = $('[name=name]').val();
		var regUserName = /^[가-힣]{2,5}$/;
		
		if(userName != "") {
			while (true) {
				if (!regUserName.test(userName)) {
					alert('회원가입 불가!\n' + "성명은 한글 2~5자로 작성해 주세요.");
					
					userName.focus();
					
					return;
				} else {
					break;
				}
			}
		}else{
			alert('회원가입 불가!\n' + "성명을 입력해 주세요");
			userName.focus();
			return;
		}
	} */
	
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
	}
	
	$('form').submit();
	
}

 

function item_check( tag ){

	var result = join.tag_status( tag );

	if( result.code =='invalid' ){
		alert( '회원가입 불가!\n' + result.desc );
		tag.focus();
		return false;
	}else return true;

}


 

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


$('#btn-id').on('click', function(){
	id_check();
});

 

function id_check(){

	var $id = $('[name=id]');
	var data = join.tag_status( $id );

	if( data.code == 'invalid'){
		alert( '중복확인 불필요\n' + data.desc );
		$id.focus();
		return;
	}
	$.ajax({
		type: 'post',
		url: 'id_check',
		data: { id: $id.val() },
		success: function( response ){

			response = join.id_usable( response );
			$id.siblings('div').text( response.desc );	
			$id.siblings('div').removeClass();
			$id.siblings('div').addClass( response.code );
			$id.addClass('chked');
			
		},error: function(req, text){
			alert(text+':'+req.status );
		}
	});
}

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



</script>
</body>
</html>