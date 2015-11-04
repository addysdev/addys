<%@ include file="/WEB-INF/views/addys/base.jsp" %>
<SCRIPT>

//사용자 수정
function fcComunity_Regist(){

	var frm=document.comunityForm;

	if(frm.comment.value==''){
		alert('등록 내용이 없습니다.');
		return;
	}
	
	
	//if (confirm('커뮤니티에 글을 올리 시겠습니까?')){ 
		
	    $.ajax({
	        type: "POST",
	        async:false,
	           url:  "<%= request.getContextPath() %>/comunity/commentregist",
	           data:$("#comunityForm").serialize(),
	           success: function(result) {

					if(result=='1'){
						 alert('글이 정상적으로 올라갔습니다.');
						 fcComunity_list();
					} else{
						 alert('글 등록을 실패했습니다.');
					}
					
					$('#commentRegistForm').dialog('close');
					
	           },
	           error:function(){
	        	   
	        	   alert('글 등록을 실패했습니다.');
	        	   $('#commentRegistForm').dialog('close');
	           }
	    });
	//}
}

function fcComunity_close(){
	$("#commentRegistForm").dialog('close');
}

function commentSet(){
	
	document.comunityForm.comment.value=document.comunityForm.commentsample.value;
}
</SCRIPT>
<!-- 사용자관리 -->
<body>
<div class="container-fluid">
<form:form commandName="comunityVO" id="comunityForm" name="comunityForm" method="post" action="" >
<input type="hidden" name="customerKey" id="customerKey" value="${customerKey}" >
<input type="hidden" name="customerId" id="customerId" value="${customerId}" >
<input type="hidden" name="commentType" id="commentType" value="${staffYn}" >
<input type="hidden" name="groupId" id="groupId" value="${groupId}" >
<p><textarea style='height:102px;ime-mode:active;' row="4" class="form-control" id="comment" maxlength="200" name="comment"  value=""  placeholder="글올리기"/></p>

			<select class="form-control" title="" id=""commentsample"" name="commentsample" value="" onChange="commentSet()" >
            	<option value="안녕?" >안녕?</option>
                <option value="대박나세요" >대박나세요</option>
                <option value="너무 좋아요" >너무 좋아요</option>
                <option value="사업 번창하세요" >사업 번창하세요</option>
                <option value="강추합니다." >강추합니다.</option>
            </select>
            <br>
<button id="cumunitysavebtn" type="button" class="btn btn-primary" onClick="fcComunity_Regist()">글올리기</button> 
<!-- <button id="cumunityclosebtn" type="button" class="btn btn-danger" onClick="fcComunity_close()">취소</button>  -->
</form:form>
</div>
</body>
<script>
$('#comment').focus(1); 
</script>