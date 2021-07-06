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
<h3>비밀번호 변경</h3>
<form method="post" action="update.cu">
	<table class='w-pct50'>
		<tr>
			<th class='w-px160'>기존 비밀번호</th>
			<td><input type="password" name='old_pw' />
			</td>
		</tr>
		<tr><th class='w-px160'>비밀번호</th>
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
</form>
<div class='imsi'>
	<a class='btn-fill' onclick='goPassUpdate()'>저장</a>
	<a class='btn-fill' href='list.cu'>취소</a>
</div>

<script type="text/javascript">
/* 하는 중임 */
function goPassUpdate() {
	if( $('[name=old_pw]').val()=='' ){
		alert('기존 비밀번호를 입력하세요!');
		$('[name=old_pw]').focus();
		return;
	}
	
// 	alert($('[name=old_pw]').val());
	alert(${vo.pw});
// 	alert($('[name=old_pw]').val() != ${vo.pw});

	if( $('[name=old_pw]').val() != ${vo.pw} ){
		alert('기존 비밀번호가 일치하지 않습니다');
		$('[name=old_pw]').focus();
		return;
	}
	
	if( ! item_check( $('[name=pw]') ) ) return;
	if( ! item_check( $('[name=pw_ck]') ) ) return;	
	
	$('form').submit();

}


function item_check( tag ){

	var result = join.tag_status( tag );

	if( result.code =='invalid' ){
		alert( '수정 불가!\n' + result.desc );
		tag.focus();
		return false;
	}else return true;

}
</script>

	
</body>
</html>