<%@include file="/WEB-INF/views/common/common.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<form action="/member/joinAction.do" method = "post">
	<table  align="center">
	<tr>
		<td>
			<a href = "/board/boardList.do">List</a>
		</td>
	</tr>
		<tr>
			<td>
					<table id="boardTable" border = "1">
						<tr>
							<td width="80" align="center">id</td>
							<td width = "200">
								<input type="text" name = userId>
							</td>
						</tr>
						<tr>
							<td width="80" align="center">pw</td>
							<td>
								<input type="password" name = userPw>
							</td>
						</tr>
						<tr>
							<td width="80" align="center">pw check</td>
							<td>
								<input type="password">
							</td>
						</tr>
						<tr>
							<td width="80" align="center">name</td>
							<td>
								<input type="text" name = "userName">
							</td>
						</tr>
						<tr>
							<td width="80" align="center">phone</td>
							<td>
								<select width = "50px" name = "userPhone1">
									<option selected="selected" value="010">010</option>
									<option value="011">011</option>
									<option value="019">019</option>
								</select>
								-
								<input type="number" name = "userPhone2" style="width : 50px">
								-
								<input type="number" name = "userPhone3" style="width : 50px">
							</td>
						</tr>
						<tr>
							<td width="80" align="center">postNo</td>
							<td>
								<input type="number" name = "userAddr1">
							</td>
						</tr>
						<tr>
							<td width="80" align="center">adress</td>
							<td>
								<input type="text" name = "userAddr2">
							</td>
						</tr>
						<tr>
							<td width="80" align="center">company</td>
							<td>
								<input type="text" name = "userCompany">
							</td>
						</tr>
					</table>
			</td>
		</tr>
		<tr>
			<td align="right">
				<input type = "submit" value="join">
			</td>
		</tr>
</table>	
</form>
</body>
</html>