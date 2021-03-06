<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>list</title>
</head>
<script type="text/javascript">

	function chkAll() {
		var total = $j("input[name=typeChk]").length;
		var checked = $j("input[name=typeChk]:checked").length;

		if(total != checked) $j("#chkBoxAll").prop("checked", false);
		else $j("#chkBoxAll").prop("checked", true); 
	}

	$j(document).ready(function(){
		
		chkAll();
		
		var chkParams = [];
		
		if($j('input:hidden[name=chked]') != null){
			$j('input:hidden[name=chked]').each(function() { 
				chkParams.push(this.value); 
			})
		};
		
		
		var typeChk = [];
		$j("input[name=typeChk]").each(function() { 
			typeChk.push(this.value); 
		});

		
		for (var i = 0; i < typeChk.length; i++) {
			for (var k = 0; k < chkParams.length; k++) {
				if(chkParams[k] == typeChk[i]){
					$j("#"+typeChk[i]).prop("checked", true);
					chkAll();
				}
			}	
		}
		
	
		
		$j("#chkBoxAll").click(function() {
			if($j("#chkBoxAll").is(":checked")){
				$j("input[name=typeChk]").prop("checked", true);
			}
			else {
				$j("input[name=typeChk]").prop("checked", false);
			}
		});
		
		
		$j("input[name=typeChk]").click(function() {
			chkAll();
		});
		
		

	});

</script>
<body>
<c:forEach items = "${chk}" var = "chk">
	<input type = "hidden" value = "${chk}" name = "chked">
</c:forEach>
<table  align="center">
	<tr>
		<td>
		<table width="100%">
			<tr>
				<td>
					<c:choose>
						<c:when test="${sessionScope.user.userId == null }">
							<a href = "/member/login.do">login</a>
							<a href = "/member/join.do">join</a>
						</c:when>
						<c:otherwise>
							${sessionScope.user.userName }
						</c:otherwise>
					</c:choose>
				</td>
				<td align="right">
					total : ${totalCnt}
				</td>			
			</tr>
		</table>
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
							${list.codeName}
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
			<a href ="/board/boardWrite.do">?????????</a>
			<c:if test="${sessionScope.user != null }">
				<a href = "/member/logOut.do">????????????</a>
			</c:if>
		</td>
	</tr>
	<tr align="left">
		<td>
			<form action="/board/boardList.do" method = "get" id = "form">
			<input type ="checkbox" id ="chkBoxAll">??????
			<c:forEach var = "comCodeList" items = "${comCodeList}" varStatus="status">
				<input id = "${comCodeList.codeId}" type ="checkbox" name = "typeChk" value="${comCodeList.codeId}">${comCodeList.codeName}
			</c:forEach>
			<input type = "submit" id = "search" value="??????">
			</form>
		</td>
	</tr>
</table>	
</body>
</html>