<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>boardView</title>
	<script type="text/javascript">
		//�Խ��� �� ����
		$j(document).ready(function(){
			
			$j("#updateBtn").on("click",function(){
				if($j('#updateBtn').val() == "Ȯ��"){
					var uConfirm = confirm("�����Ͻðڽ��ϱ�?");
					if(uConfirm == true){
						var $frm = $j('.boardUpdate :input');
						var param = $frm.serialize();
						
						$j.ajax({
						    url : "/board/boardUpadateAction.do",
						    dataType: "json",
						    type: "POST",
						    data : param,
						    success: function(data, textStatus, jqXHR)
						    {
								alert("�����Ϸ�");
								location.reload();
						    },
						    error: function (jqXHR, textStatus, errorThrown)
						    {
						    	alert("����");
						    }
						});
					}else{
						location.reload();
					}
				}else{
					$j('#boardTitle').html('<input name="boardTitle" type="text" size="50" value="${board.boardTitle}">');
					$j('#boardComment').html('<textarea name="boardComment"  rows="20" cols="55">${board.boardComment}</textarea>');
					$j('#deleteBtn').attr('type', 'hidden');
					$j('#updateBtn').val("Ȯ��");	
				}
			}); //������ �� ����

			//�Խ��� �� ����
			$j('#deleteBtn').on("click", function(){
				var deleteConfirm = confirm('�����Ͻðڽ��ϱ�?');
				if(deleteConfirm == true){
					var params = {
							boardNum : $j('#boardNum').val() 
						};
					
					$j.ajax({
						url : "/board/boardDeleteAction.do",
						type : "POST",
						data : params,
					    success: function(data, textStatus, jqXHR)
					    {
							alert("�����Ϸ�");
							
							location.href = "/board/boardList.do";
					    },
					    error: function (jqXHR, textStatus, errorThrown)
					    {
					    	alert("����");
					    }
					});
				}

			});		//�Խ��� �� ����
			
		});//document ready
	</script>
	
</head>
<body class = "boardUpdate">
<!-- hidden tags -->
<input id = "boardNum" name = "boardNum" type="hidden" value="${boardNum}">
<table align="center">
		<tr>
			<td align="right">
					<input id = "updateBtn" type="button" value="����"> <!-- �Խ��� ���� ��ư -->
					<input id = "deleteBtn" type="button" value="����"> <!-- �Խ��� ����  ��ư-->
			</td>
			
		</tr>

	<tr>
		<td>
			<table border ="1">
				<tr>
					<td width="120" align="center">
					Type
					</td>
					<td width="400">
					<span id = "boardType">
					${board.boardType}
					</span>
					</td>
				</tr>
				<tr>
					<td width="120" align="center">
					Title
					</td>
					<td width="400">
					<span id = "boardTitle">
					${board.boardTitle}
					</span>
					</td>
				</tr>
				<tr>
					<td height="300" align="center">
					Comment
					</td>
					<td>
					<span id = "boardComment">
					${board.boardComment}
					</span>
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
</body>
</html>