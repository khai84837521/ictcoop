<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>boardWrite</title>
</head>
<script type="text/javascript">

	$j(document).ready(function(){
		
		$j("#submit").on("click",function(){
			var $frm = $j('.boardWrite :input');
			var param = $frm.serialize();
			console.log(param);
			$j.ajax({
			    url : "/board/boardWriteAction.do",
			    dataType: "json",
			    type: "POST",
			    data : param,
			    success: function(data, textStatus, jqXHR)
			    {
					alert("작성완료");
					
					alert("메세지:"+data.success);
					
					location.href = "/board/boardList.do?pageNo=1";
			    },
			    error: function (jqXHR, textStatus, errorThrown)
			    {
			    	alert("실패");
			    }
			});
		});
	
	

	});
	
	var count = 1;
	
	function addRow() {
		
	      var dynamicTable = document.getElementById('boardWriter');
	      var newRow1 = dynamicTable.insertRow(0);
	      var cell1 = newRow1.insertCell();
	      cell1.setAttribute('align','center');
	      cell1.setAttribute('width','120');
	      var cell2 = newRow1.insertCell();
	      var newRow2 = dynamicTable.insertRow(1);
	      var cell3 = newRow2.insertCell();
	      cell3.setAttribute('align','center');
	      var cell4 = newRow2.insertCell();
	      var newRow3 = dynamicTable.insertRow(2);
	      var cell5 = newRow3.insertCell();
	      cell5.setAttribute('align','center');
	      var cell6 = newRow3.insertCell();
	      
	      cell1.innerHTML = 'Type';
	      cell2.innerHTML = '<select name = "boardVoList['+count+'].boardType">'
	      						+'<c:forEach var = "comCodeList" items = "${comCodeList}" varStatus="status">'
	      							+'<option value = "${comCodeList.codeId}">${comCodeList.codeName}</option>'
	      						+'</c:forEach>'
	      					+'</select>'
	      					+ "<input style='float: right;' type='button' value='행삭제' onclick='deleteRow(this)'>";
	      cell3.innerHTML = 'Title';
	      cell4.innerHTML = '<input name="boardVoList['+count+'].boardTitle" type="text" size="50" value="${board.boardTitle}">';
	      cell5.innerHTML = 'Comment';
	      cell6.innerHTML = '<textarea name="boardVoList['+count+'].boardComment" rows="20" cols="55">${board.boardComment}</textarea>';
	      
	      count++
	   }

	function deleteRow(rownum) {
		  // table element 찾기
		  const dynamicTable = document.getElementById('boardWriter');
     	  var index = rownum.parentNode.parentNode.rowIndex;
		  if(dynamicTable.rows.length != 4){
			  dynamicTable.deleteRow(index+2);
			  dynamicTable.deleteRow(index+1);
			  dynamicTable.deleteRow(index);
		  }
	}
</script>
<body>
<form class="boardWrite">
	<table align="center">
		<tr>
			<td align="right">
			<input type="button" value="행추가" onclick='addRow()'>
			<input id="submit" type="button" value="작성">
			</td>
		</tr>
		<tr>
			<td>
				<table border ="1" id = "boardWriter">
					<tr>
						<td width="120" align="center">
						Type
						</td>
						<td width="400">
						<select name = "boardVoList[0].boardType">
							<c:forEach var = "comCodeList" items = "${comCodeList}" varStatus="status">
								<option value = "${comCodeList.codeId}">${comCodeList.codeName}</option>
							</c:forEach>
						</select>
						<input style="float: right;" type='button' value='행삭제' onclick='deleteRow(this)'>
						</td>
					</tr>
					<tr>
						<td width="120" align="center">
						Title
						</td>
						<td width="400">
						<input name="boardVoList[0].boardTitle" type="text" size="50" value="${board.boardTitle}"> 
						</td>
					</tr>
					<tr>
						<td height="300" align="center">
						Comment
						</td>
						<td valign="top">
						<textarea name="boardVoList[0].boardComment"  rows="20" cols="55">${board.boardComment}</textarea>
						</td>
					</tr>
					<tr>
						<td align="center">
						Writer
						</td>
						<td>
						</td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td align="right">
				<a href="/board/boardList.do">List</a>
			</td>
		</tr>
	</table>
</form>	
</body>
</html>