<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>boardView</title>
	<script type="text/javascript">
		//게시판 글 수정
		$j(document).ready(function(){
			
			$j("#updateBtn").on("click",function(){
				if($j('#updateBtn').val() == "확인"){
					var uConfirm = confirm("수정하시겠습니까?");
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
								alert("수정완료");
								location.reload();
						    },
						    error: function (jqXHR, textStatus, errorThrown)
						    {
						    	alert("실패");
						    }
						});
					}else{
						location.reload();
					}
				}else{
					$j('#boardTitle').html('<input name="boardTitle" type="text" size="50" value="${board.boardTitle}">');
					$j('#boardComment').html('<textarea name="boardComment"  rows="20" cols="55">${board.boardComment}</textarea>');
					$j('#deleteBtn').attr('type', 'hidden');
					$j('#updateBtn').val("확인");	
				}
			}); //개시판 글 수정

			//게시판 글 삭제
			$j('#deleteBtn').on("click", function(){
				var deleteConfirm = confirm('삭제하시겠습니까?');
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
							alert("삭제완료");
							
							location.href = "/board/boardList.do";
					    },
					    error: function (jqXHR, textStatus, errorThrown)
					    {
					    	alert("실패");
					    }
					});
				}

			});		//게시판 글 삭제
			
		});//document ready
	</script>
	
</head>
<body class = "boardUpdate">
<!-- hidden tags -->
<input id = "boardNum" name = "boardNum" type="hidden" value="${boardNum}">
<table align="center">
		<tr>
			<td align="right">
					<input id = "updateBtn" type="button" value="수정"> <!-- 게시판 수정 버튼 -->
					<input id = "deleteBtn" type="button" value="삭제"> <!-- 게시판 삭제  버튼-->
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