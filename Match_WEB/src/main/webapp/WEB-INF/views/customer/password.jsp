<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
<h3>비밀번호 변경</h3>
<form method="post" action="passwordmod.cu">
	<table class='w-pct50'>
		<tr>
			<th class='w-px160'>현재 비밀번호</th>
			<td><input type="password" name='old_pw'/>
			</td>
		</tr>
		<tr><th class='w-px160'>새 비밀번호</th>
			<td><input type='password' name='pw' class='chk' /><br>
				<div class='valid'>비밀번호를 입력하세요(영문대/소문자, 숫자를 모두 포함)</div>
			</td>
		</tr>
		
		<tr><th class='w-px160'>비밀번호 확인</th>
			<td><input type='password' name='pw_ck' class='chk' /><br>
				<div class='valid'>비밀번호를 다시 입력하세요</div>
			</td>
		</tr>
	</table>
	<input type='hidden' name='id' value='${vo.id}' />
</form>
<div class='imsi'>
	<a class='btn-fill' onclick='goPassUpdate()'>저장</a>
	<a class='btn-fill' href='list.cu'>취소</a>
</div>

</div>
<script type="text/javascript" src="js/join_check.js"></script>
<script type="text/javascript">

/* 하는 중 */
function goPassUpdate() {
// 공백체크
	if( $('[name=old_pw]').val()=='' ){
		alert('현재 비밀번호를 입력하세요!');
		$('[name=old_pw]').focus();
		return;
	}else if( ( $('[name=pw]').val()=='' ) ){
		alert('비밀번호를 입력하세요!');
		$('[name=pw]').focus();
		return;
	}else if( ( $('[name=pw_ck]').val()=='' )){
		alert('비밀번호를 입력하세요!');
		$('[name=pw_ck]').focus();
		return;
	}
	
// 	alert($('[name=old_pw]').val());
// 	alert('${vo.pw}');
// 	alert($('[name=old_pw]').val() != '${vo.pw}');


// 비밀번호 동일한지 확인
	if( $('[name=old_pw]').val() != '${vo.pw}' ){
		alert('현재 비밀번호가 일치하지 않습니다');
		$('[name=old_pw]').focus();
		return;
	}
	
// 새 비밀번호, 비밀번호 체크 유효성 검사
	if( ! item_check( $('[name=pw]') ) ) return;
	if( ! item_check( $('[name=pw_ck]') ) ) return;	
	
// 현재 비밀번호와 새 비밀번호 달라야 함
	if( $('[name=old_pw]').val() == $('[name=pw]').val()){
		alert("현재 비밀번호와 다른 비밀번호를 설정해 주세요");
		$('[name=pw_ck]').focus();
		return;
	}

	
// 폼 전송
	if( confirm('정말 수정하시겠습니까?') ){
		$('form').submit();
	}
	

}


function item_check( tag ){

	var result = join.tag_status( tag );

	if( result.code =='invalid' ){
		alert( '수정 불가!\n' + result.desc );
		tag.focus();
		return false;
	}else return true;

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
</script>

	
</body>
</html>