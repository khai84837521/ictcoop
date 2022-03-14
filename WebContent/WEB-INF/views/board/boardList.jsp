<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>list</title>
</head>
<script type="text/javascript">

	$j(document).ready(function(){
		
		var chkParams = [];
		
		if($j('input:hidden[name=chked]') != null){
			$j('input:hidden[name=chked]').each(function() { 
				arr.push(this.value); 
			}
		});
		
		alert(chkParams);
		
// 		var typeChk = [];
// 		$j("input[name=typeChk]").each(function() { 
// 			arr.push(this.value); 
// 		});
		
// 		alert(typeChk);
		
	
		
		$j("#chkBoxAll").click(function() {
			if($j("#chkBoxAll").is(":checked")){
				$j("input[name=typeChk]").prop("checked", true);
			}
			else $j("input[name=typeChk]").prop("checked", false);
		});
		
		
		$j("input[name=typeChk]").click(function() {
			var total = $j("input[name=typeChk]").length;
			var checked = $j("input[name=typeChk]:checked").length;

			if(total != checked) $j("#chkBoxAll").prop("checked", false);
			else $j("#chkBoxAll").prop("checked", true); 
		});
		

	});

</script>
<body>
<c:forEach items = "${chk}" var = "chk">
	<input type = "hidden" value = "${chk}" name = "chked">
</c:forEach>
<table  align="center">
	<tr>
		<td align="right">
			total : ${totalCnt}
		</td>
	</tr>
	<tr>
		<td>
			<table id="boardTable" border = "1">
				<tr>
					<td width="80" align="center">
						Type
					</td>
					<td width="40" align="center">
						No
					</td>
					<td width="300" align="center">
						Title
					</td>
				</tr>
				<c:forEach items="${boardList}" var="list">
					<tr>
						<td align="center">
							${list.boardType}
						</td>
						<td>
							${list.boardNum}
						</td>
						<td>
							<a href = "/board/${list.boardType}/${list.boardNum}/boardView.do?pageNo=${pageNo}">${list.boardTitle}</a>
						</td>
					</tr>	
				</c:forEach>
			</table>
		</td>
	</tr>
	<tr>
		<td align="right">
			<a href ="/board/boardWrite.do">글쓰기</a>
		</td>
	</tr>
	<tr align="left">
		<td>
			<form action="/board/boardList.do" method = "get" id = "form">
			<input type ="checkbox" id ="chkBoxAll" name = "typeChk" value = "all">전체
			<c:forEach var = "comCodeList" items = "${comCodeList}" varStatus="status">
				<input type ="checkbox" name = "typeChk" value="${comCodeList.codeId}">${comCodeList.codeName}
			</c:forEach>
			<input type = "submit" id = "search" value="조회">
			</form>
		</td>
	</tr>
</table>	
</body>
</html>