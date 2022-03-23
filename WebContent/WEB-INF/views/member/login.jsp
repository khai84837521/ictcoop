<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">
	$j(document).ready(function(){
		
		
		$j('#login').on("click", function(){
			if($j('#userId').val() == ""){
				alert('아이디를 입력해주세요');
				return false;
			}else{
				if ($j('#userPw1').val() == "") {
					alert('비밀번호를 입력해주세요');
					return false;
				}else{
					return true;
				}
			}
		});
	});

</script>


<body>
<form action="loginAction.do" method = "post">
<table align = "center">
	<tr>
		<td>
			<table id="loginTable" border = "1">
				<tr>
					<td width="80" align="center">id</td>
					<td width = "260">
						<input type="text" name = "userId" id = "userId">
					</td>
		
				</tr>
				<tr>
					<td width="80" align="center">pw</td>
					<td>
						<input type="password" name = "userPw" id = "userPw1">
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td align = "center">
			<input type="submit" value = "로그인" id = "login">
		</td>
	</tr>
</table>
</form>
</body>
</html>