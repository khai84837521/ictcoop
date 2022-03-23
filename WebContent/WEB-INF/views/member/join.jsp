<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
	$j(document).ready(function(){
		//아이디 중복검사
// 		function idDup() {
			var status = false;
			$j("#idCheck").on("click",function(){
				var $frm = $j('#userId');
				var param = $frm.serialize();
				
				$j.ajax({
				    url : "/member/idCheck.do",
				    dataType: "json",
				    type: "POST",
				    data : param,
				    success: function(data, textStatus, jqXHR)
				    {
						if (data == "1") {
							alert("이미 존재하는 아이디 입니다.")
						}else{
							alert("사용가능한 아이디 입니다.")
							status = true;
							return status;
						}
				    },
				    error: function (jqXHR, textStatus, errorThrown)
				    {
				    	alert("실패");
				    }
				});
			});	
// 		}
		
			
	

		$j("#join").on("click",function(){
			if(IdCheck($j('#userId'))
				&&  status
				&&	pwCheck()
				&&	NameCheck($j('#userName'))
				&&	PhoneCheck($j('#userPhone1'), $j('#userPhone2'))
				&&	Addr1Check($j('#userAddr1'))
				&&	Addr2Check($j('#userAddr2'))
				&&	CompanyCheck($j('#userCompany'))
				== true){
				alert('회원가입 되었습니다.')
				$j('#joinForm').submit();
			}else{
				IdCheck($j('#userId'));
				pwCheck();
				NameCheck($j('#userName'));
				PhoneCheck($j('#userPhone1'), $j('#userPhone2'));
				Addr1Check($j('#userAddr1'));
				Addr2Check($j('#userAddr2'));
				CompanyCheck($j('#userCompany'));
				alert('회원정보를 수정해주세요');
			}
			
		});
		
		//정규식 사용
		$j('#userPhone2').on("keyup", function(){
			Regex($j('#userPhone2'));
		})
		
		$j('#userPhone3').on("keyup", function(){
			Regex($j('#userPhone3'));
		})
		
		$j('#userAddr1').on("keyup", function(){
			Regex($j('#userAddr1'));
		})
		

		//아이디 유효성
		function IdCheck(item){
			if (item.val() == "") {
				$j("#check_id_msg").text('아이디를 입력해 주세요');
				return false;
			}else{
				$j("#check_id_msg").text('');
				return true;
			}
		}
		
		
		//비밀번호 유효성
		function pwCheck(){
			if ($j('#userPw1').val() == "") {
				$j("#check_pw1_msg").text('비밀번호를 입력해 주세요');
				return false;
			}else{
				if ($j('#userPw1').val() != $j('#userPw2').val()) {
					$j("#check_pw2_msg").text('비밀번호를 확인해주세요');
					return false;
				}
			}
			$j("#check_pw1_msg").text('');
			$j("#check_pw2_msg").text('');
			return true;
		}
		
		//이름 유효성
		function NameCheck(item){
			if (item.val() == "") {
				$j("#check_name_msg").text('이름을 입력해 주세요');
				return false;
			}else{
				$j("#check_name_msg").text('');
				return true;
			}
		}
		
		function PhoneCheck(item1, item2){
			let phone2 = item1.val();
			let phone3 = item2.val();
			if (phone2 == "" || phone3 == "") {
				$j("#check_phone_msg").text('휴대폰 번호를 입력해주세요');
				return false;
			}else{
				$j("#check_phone_msg").text('');
				return true;
			}
		}
		
				
		function Addr1Check(item){
			if (item.val() == "") {
				$j("#check_addr1_msg").text('우편번호를 입력해주세요');
				return false;
			}else{
				$j("#check_addr1_msg").text('');
				return true;
			}
		}
		
		function Addr2Check(item){
			if (item.val() == "") {
				$j("#check_addr2_msg").text('주소를 입력해주세요');
				return false;
			}else{
				$j("#check_addr2_msg").text('');
				return true;
			}
		}
		
		function CompanyCheck(item){
			if (item.val() == "") {
				$j("#check_company_msg").text('회사를 입력해주세요');
				return false;
			}else{
				$j("#check_company_msg").text('');
				return true;
			}
		}
		

		//숫자만 입력 정규식
		function Regex(item){
			var regex = /[^0-9]/g;
			console.log(item.val());
			if(regex.test(item.val()) == true){
				item.val("");
				alert("숫자만 입력해주세요");
			}
		}
		
		
		
	});

</script>

</head>
<body>
	<table  align="center">
	<tr>
		<td>
			<a href = "/board/boardList.do">List</a>
		</td>
	</tr>
		<tr>
			<td>
				<form action="/member/joinAction.do" method = "post" id = "joinForm">
					<table id="boardTable" border = "1">
						<tr>
							<td width="80" align="center">id</td>
							<td width = "260">
								<input type="text" name = "userId" id = "userId">
								<input type="button" id ="idCheck" value="중복확인">
								<br><span id = "check_id_msg"></span>
							</td>

						</tr>
						<tr>
							<td width="80" align="center">pw</td>
							<td>
								<input type="password" name = "userPw" id = "userPw1">
								<br><span id = "check_pw1_msg"></span>
							</td>
						</tr>
						<tr>
							<td width="80" align="center">pw check</td>
							<td>
								<input type="password" id = "userPw2">
								<br><span id = "check_pw2_msg"></span>
							</td>
						</tr>
						<tr>
							<td width="80" align="center">name</td>
							<td>
								<input type="text" name = "userName" id = "userName">
								<br><span id = "check_name_msg"></span>
							</td>
						</tr>
						<tr>
							<td width="80" align="center">phone</td>
							<td>
								<select width = "50px" name = "userPhone1" >
									<option selected="selected" value="010">010</option>
									<option value="011">011</option>
									<option value="019">019</option>
								</select>
								-
								<input type="text" name = "userPhone2" style="width : 50px" id = "userPhone2">
								-
								<input type="text" name = "userPhone3" style="width : 50px" id = "userPhone3">
								<br><span id = "check_phone_msg"></span>
							</td>
						</tr>
						<tr>
							<td width="80" align="center">postNo</td>
							<td>
								<input type="text" name = "userAddr1" id = "userAddr1">
								<br><span id = "check_addr1_msg"></span>
							</td>
						</tr>
						<tr>
							<td width="80" align="center">adress</td>
							<td>
								<input type="text" name = "userAddr2" id = "userAddr2">
								<br><span id = "check_addr2_msg"></span>
							</td>
						</tr>
						<tr>
							<td width="80" align="center">company</td>
							<td>
								<input type="text" name = "userCompany" id = "userCompany">
								<br><span id = "check_company_msg"></span>
							</td>
						</tr>
					</table>
				</form>
			</td>
		</tr>
		<tr>
			<td align="right">
				<input type = "button" value="join" id = "join">
			</td>
		</tr>
</table>	
</body>
</html>