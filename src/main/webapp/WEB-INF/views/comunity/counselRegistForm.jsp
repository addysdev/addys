<%@ include file="/WEB-INF/views/addys/base.jsp" %>
<SCRIPT>

//사용자 수정
function fcCunsel_Regist(){

	var frm=document.counselForm;

	if(frm.counsel.value==''){
		alert('1:1문의 내용이 없습니다.');
		return;
	}
	
	
	if (confirm('1:1 문의를 요청 하시겠습니까?')){ 
		
	    $.ajax({
	        type: "POST",
	        async:false,
	           url:  "<%= request.getContextPath() %>/comunity/counselregist",
	           data:$("#counselForm").serialize(),
	           success: function(result) {

					if(result=='1'){
						 alert('1:1문의가 정상적으로 처리되었습니다.\n접수된 내용은 확인되는데로 SMS로 답변드리겠습니다.');
						 fcCounsel_list();
					} else{
						 alert('1:1문의 요청이 실패했습니다.');
					}
					
					$('#counselRegistForm').dialog('close');
					
	           },
	           error:function(){
	        	   
	        	   alert('1:1문의 요청이 실패했습니다.');
	        	   $('#counselRegistForm').dialog('close');
	           }
	    });
	}
}

function fcComunity_close(){
	$("#counselRegistForm").dialog('close');
}
</SCRIPT>
<!-- 사용자관리 -->
<body>
<div class="container-fluid">
<form:form commandName="counselVO" id="counselForm" name="counselForm" method="post" action="" >
<input type="hidden" name="customerKey" id="customerKey" value="${customerKey}" >
<input type="hidden" name="customerId" id="customerId" value="${customerId}" >
<input type="hidden" name="counselState" id="counselState" value="01" >
<input type="hidden" name="groupId" id="groupId" value="SM001" >
<p><textarea style='height:102px;ime-mode:active;' row="4" class="form-control" id="counsel" maxlength="200" name="counsel"  value=""  placeholder="1:1문의"/></p>
		<br>
<button id="cumunitysavebtn" type="button" class="btn btn-primary" onClick="fcCunsel_Regist()">1:1상담</button> 
<!--<button id="cumunityclosebtn" type="button" class="btn btn-danger" onClick="fcComunity_close()">취소</button>-->
</form:form>
</div>
</body>
<script>
$('#counsel').focus(1); 
</script>