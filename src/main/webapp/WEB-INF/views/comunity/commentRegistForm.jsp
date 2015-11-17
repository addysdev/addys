<%@ include file="/WEB-INF/views/addys/base.jsp" %>
<SCRIPT>

//사용자 수정
function fcComunity_Regist(){

	var frm=document.comunityForm;

	if(frm.comment.value==''){
		alert('남길 talk이 없습니다.');
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
						 alert('talk 남기기를 성공했습니다.');
						 
						// fcComunity_list();
					} else{
						 alert('talk 남기기를 실패했습니다.');
					}
					
					$('#commentRegistForm').dialog('close');
					
	           },
	           error:function(){
	        	   
	        	   alert('talk 남기기를 실패했습니다.');
	        	   $('#commentRegistForm').dialog('close');
	           }
	    });
	//}
}

function fcComunity_close(){
	
	commonDim(false);
	 
	$("#commentRegistForm").dialog('close');
}

function fcComunity_multiRegist(){
	
    var url;
    var frm = document.comunityForm;
    var fileName = '';
    var pos = '';
    var ln = '';
    var gap = '';
    var gap1 = '';
	
    url="<%= request.getContextPath() %>/comunity/comunityregist?comment="+comment;
	
    if($("#files").val() != ''){
    	
        fileName = document.all.files.value;
        pos = fileName.lastIndexOf("\\");
        ln = fileName.lastIndexOf("\.");
        gap = fileName.substring(pos + 1, ln);
        gap1 = fileName.substring(ln+1);
        
        if(gap1=="jpg" || gap1=="JPG" || gap1=="gif" || gap1=="GIF" || gap1=="png" || gap1=="PNG"){//
            url="<%= request.getContextPath() %>/comunity/comunityregist?fileName="+gap+"&extension="+gap1+"&comment="+comment;
        }else {
        	alert("이미지 파일만 등록 부탁드립니다.");
            return;
        }
        
    }else{
    
		if(frm.comment.value==''){
			alert('남길 talk이 없습니다.');
			return;
		}
    }
	
	var comment=frm.comment.value;

    commonDim(true);
    frm.action = url;
    frm.target="file_result";

    frm.submit();        
}

</SCRIPT>
<!-- 사용자관리 -->
<body>
<div class="container-fluid">
<iframe id="file_result" name="file_result" style="display: none" ></iframe>
<form:form commandName="comunityVO"  id="comunityForm" name="comunityForm" method="post" target="file_result" enctype="multipart/form-data" >
<input type="hidden" name="customerKey" id="customerKey" value="${customerKey}" >
<input type="hidden" name="customerId" id="customerId" value="${customerId}" >
<input type="hidden" name="commentType" id="commentType" value="${staffYn}" >
<input type="hidden" name="groupId" id="groupId" value="${groupId}" >
<p><textarea style='height:102px;ime-mode:active;' row="4" class="form-control" id="comment" maxlength="200" name="comment"  value=""  placeholder="글올리기"/></p>
<h5><strong><font style="color:#FF9900">이미지 업로드 <em class="bold"> 이미지파일</em></font></strong></h5>
 <input type="file"  id="files" name="files" />
 <br>
<button id="cumunitysavebtn" type="button" class="btn btn-primary" onClick="fcComunity_multiRegist()">talk남기기</button> 
<!-- <button id="cumunityclosebtn" type="button" class="btn btn-danger" onClick="fcComunity_close()">취소</button>  -->
</form:form>
</div>
</body>
<script>
$('#comment').focus(1); 
</script>