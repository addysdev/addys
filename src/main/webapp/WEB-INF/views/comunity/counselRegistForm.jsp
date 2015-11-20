<%@ include file="/WEB-INF/views/addys/base.jsp" %>
<SCRIPT>

//사용자 수정
function fcCunsel_Regist(){

	var frm=document.counselForm;

	if(frm.counsel.value==''){
		alert('문의 내용이 없습니다.');
		return;
	}
	
	
	//if (confirm('문의를 요청 하시겠습니까?')){ 
		
	    $.ajax({
	        type: "POST",
	        async:false,
	           url:  "<%= request.getContextPath() %>/comunity/counselregist",
	           data:$("#counselForm").serialize(),
	           success: function(result) {

					if(result=='1'){
						 alert('접수가 완료되었습니다.\n담당자가 확인 후 연락드리겠습니다.');
						 fcCounsel_list();
					} else{
						 alert('접수를 실패했습니다.');
					}
					fcCounsel_list();
					$('#counselRegistForm').dialog('close');
					
	           },
	           error:function(){
	        	   
	        	   alert('접수를 실패했습니다.');
	        	   $('#counselRegistForm').dialog('close');
	           }
	    });
	//}
}

function fcCounsel_close(){
	
	commonDim(false);
	
	alert('접수가 완료되었습니다.\n담당자가 확인 후 연락드리겠습니다.');
	fcCounsel_list();
	
	$("#counselRegistForm").dialog('close');
}

function fcCunsel_multiRegist(){
	
    var url;
    var frm = document.counselForm;
    var fileName = '';
    var pos = '';
    var ln = '';
    var gap = '';
    var gap1 = '';
    
	var counsel=frm.counsel.value;
	
    url="<%= request.getContextPath() %>/comunity/counselmultiregist?counsel="+counsel;
	
    if($("#files").val() != ''){
    	
        fileName = document.all.files.value;
        pos = fileName.lastIndexOf("\\");
        ln = fileName.lastIndexOf("\.");
        gap = fileName.substring(pos + 1, ln);
        gap1 = fileName.substring(ln+1);
        
        if(gap1=="jpg" || gap1=="JPG" || gap1=="gif" || gap1=="GIF" || gap1=="png" || gap1=="PNG"){//
            url="<%= request.getContextPath() %>/comunity/counselmultiregist?fileName="+gap+"&extension="+gap1+"&counsel="+counsel;
        }else {
        	alert("이미지 파일만 등록 부탁드립니다.");
            return;
        }
        
    }else{
    
		if(frm.counsel.value==''){
			alert('문의하실 내용이 없습니다.');
			return;
		}
    }


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
<form:form commandName="counselVO"  id="counselForm" name="counselForm" method="post" target="file_result" enctype="multipart/form-data" >
<input type="hidden" name="customerKey" id="customerKey" value="${customerKey}" >
<input type="hidden" name="customerId" id="customerId" value="${customerId}" >
<input type="hidden" name="counselState" id="counselState" value="01" >
<input type="hidden" name="groupId" id="groupId" value="${groupId}" >
<p><textarea style='height:102px;ime-mode:active;' row="4" class="form-control" id="counsel" maxlength="1000" name="counsel"  value=""  placeholder="문의"/></p>
<h5><font style="color:#FF9900">이미지 업로드 <em class="bold"> 이미지파일</em></font></h5>
 <input type="file" id="files" name="files" />
 <br>
<button id="cumunitysavebtn" type="button" class="btn btn-primary" onClick="fcCunsel_multiRegist()">접수</button> 
<!--<button id="cumunityclosebtn" type="button" class="btn btn-danger" onClick="fcComunity_close()">취소</button>-->
</form:form>
</div>
</body>
<script>
$('#counsel').focus(1); 
</script>