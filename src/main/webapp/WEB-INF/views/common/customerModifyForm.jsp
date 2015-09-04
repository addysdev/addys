<%@ include file="/WEB-INF/views/addys/base.jsp" %>
<!DOCTYPE html>
<html>
 <head>
	<script>

		//사용자 수정
		function fcCustomer_modify(){

			var frm=document.customerModifyForm;
			
			if(frm.change_password.value==''){
				
				if (confirm('고객정보를 변경 하시겠습니까?')){ 
					
					if(document.customerModifyForm.r_customerKey1[0].checked==true){
						document.customerModifyForm.customerKey1.value='02';
					}else if(document.customerModifyForm.r_customerKey1[1].checked==true){
						document.customerModifyForm.customerKey1.value='03';
					}else if(document.customerModifyForm.r_customerKey1[2].checked==true){
						document.customerModifyForm.customerKey1.value='04';
					}else if(document.customerModifyForm.r_customerKey1[3].checked==true){
						document.customerModifyForm.customerKey1.value='05';
					}
					
					document.customerModifyForm.pw_modifyYn.value='N';
					
					$.ajax({
				        type: "POST",
				        async:false,
				           url:  "<%= request.getContextPath() %>/common/customermodify",
				           data:$("#customerModifyForm").serialize(),
				           success: function(result) {

								if(result=='1'){
									 alert('고객 정보 변경을 성공했습니다.');
								} else{
									 alert('고객 정보 변경을 실패했습니다.');
								}
								
								$('#customerModify').dialog('close');
								
								
				           },
				           error:function(){
				        	   
				        	   alert('고객 정보 변경을 실패했습니다.');
				        	   $('#customerModify').dialog('close');
				           }
				    });
					
				}
	
			}else{
				
	
				if(frm.cur_password.value==''){
					alert('현재 비밀번호를 입력 하시기 바랍니다.');
					return;
				}
				
				if(frm.change_password.value==''){
					alert('변경 비밀번호를  입력 하시기 바랍니다.');
					return;
				}
				
				if(frm.re_password.value==''){
					alert('변경 비밀번호를 재입력 하시기 바랍니다.');
					return;
				}
	
				$.ajax({
			        type: "POST",
			        async:false,
			           url:  "<%= request.getContextPath() %>/common/passwordcheck",
			           data: "curPwd=" + frm.cur_password.value,
			           success: function(result) {
	//alert(result);
			        	   frm.encpassword.value=result;
							
			           },
			           error:function(){
			        	   alert('Error: ' + e);
			           }
			    });
	
				if(frm.encpassword.value!=frm.regPassword.value){
					alert('현재 비밀번호가 맞지 않습니다.');
					frm.encpassword.value='';
					frm.cur_password.value='';
					frm.change_password.value='';
					frm.re_password.value='';
					frm.customerPw.value='';
					frm.cur_password.focus(1);
					return;
				}
				
				if(frm.cur_password.value==frm.change_password.value){
					alert('변경 비밀번호가 현재 비밀번호와 동일합니다.');
					frm.encpassword.value='';
					frm.cur_password.value='';
					frm.change_password.value='';
					frm.re_password.value='';
					frm.customerPw.value='';
					frm.cur_password.focus(1);
					return;
				}
				
				if(frm.re_password.value!=frm.change_password.value){
					alert('변경 비밀번호가 재입력 비밀번호와 같지 않습니다.');
					frm.encpassword.value='';
					frm.cur_password.value='';
					frm.change_password.value='';
					frm.re_password.value='';
					frm.customerPw.value='';
					frm.cur_password.focus(1);
					return;
				}
	
		    	if (confirm('비밀번호를 변경 하시겠습니까?')){ 
		    		
		    		frm.customerPw.value=frm.change_password.value;
		    		
					if(document.customerModifyForm.r_customerKey1[0].checked==true){
						document.customerModifyForm.customerKey1.value='02';
					}else if(document.customerModifyForm.r_customerKey1[1].checked==true){
						document.customerModifyForm.customerKey1.value='03';
					}else if(document.customerModifyForm.r_customerKey1[2].checked==true){
						document.customerModifyForm.customerKey1.value='04';
					}else if(document.customerModifyForm.r_customerKey1[3].checked==true){
						document.customerModifyForm.customerKey1.value='05';
					}
					
					document.customerModifyForm.pw_modifyYn.value='Y';
	
				    $.ajax({
				        type: "POST",
				        async:false,
				           url:  "<%= request.getContextPath() %>/common/customermodify",
				           data:$("#customerModifyForm").serialize(),
				           success: function(result) {
		
								if(result=='1'){
									 alert('고객 정보 변경을 성공했습니다.');
								} else{
									 alert('고객 정보 변경을 실패했습니다.');
								}
								
								$('#customerModify').dialog('close');
								
								
				           },
				           error:function(){
				        	   
				        	   alert('고객 정보 변경을 실패했습니다.');
				        	   $('#customerModify').dialog('close');
				           }
				    });
			    
		    	}
			}
		}
		function fcMofify_close(){
			$('#customerModify').dialog('close');
		}
	</script>
  </head>
  <body>
	<div class="container-fluid">
      <form:form class="form-inline" role="form" commandName="customerVO" id="customerModifyForm" name="customerModifyForm" method="post" action="">
      <input type="hidden" id="pw_modifyYn" name="pw_modifyYn" value="Y" >
      <input type="hidden" id="customerKey" name="customerKey" value="${customer.customerKey}" > 
	    <div class="form-group">
	        <br>
		    <table class="table table-bordered" >
		      	<tr>
		          <th class='text-center' style="background-color:#E6F3FF" >현재 비밀번호</th>
		          <th class='text-left'><input type="password" class="form-control" id="cur_password" name="cur_password" maxlength="50"  tabindex="2" value="" ></th>
		          <input type="hidden" id="regPassword" name="regPassword" value="${customer.customerPw}" > 
		          <input type="hidden" id="encpassword" name="encpassword" value="" > 
		          <input type="hidden" id="customerPw" name="customerPw" value="" > 
		          <input type="hidden" id="customerKey1" name="customerKey1" value="${customer.customerKey1}" >
		      	</tr>
		      	<tr>
		          <th class='text-center' style="background-color:#E6F3FF" >변경 비밀번호</th>
		          <th class='text-left'><input type="password" class="form-control" id="change_password" name="change_password" maxlength="50"  tabindex="2" value="" ></th>
		      	</tr>
		      	<tr>
		          <th class='text-center' style="background-color:#E6F3FF" >비밀번호 재입력</th>
		          <th class='text-left'><input type="password" class="form-control" id="re_password" name="re_password" maxlength="50"  tabindex="2" value="" ></th>
		      	</tr>
		      	<tr>
		          <div class="form-inline text-center">
				 	<img vertical-align="bottom" height="50px" width="50px" src="http://cdn.sketchpan.com/member/r/richij/draw/1218072552000/0.png"><input type="radio" name="r_customerKey1" value="02">
				 	<img vertical-align="bottom" height="50px" width="50px" src="http://cdn.sketchpan.com/member/h/han7013/draw/1244526522853/0.png"><input type="radio" name="r_customerKey1" value="03">
				 	<img vertical-align="bottom" height="50px" width="50px" src="http://cdn.sketchpan.com/member/h/haphumia/draw/1211348572390/0.png"><input type="radio" name="r_customerKey1" value="04">
				 	<img vertical-align="bottom" height="50px" width="50px" src="http://cdn.sketchpan.com/member/j/joheejin/draw/1210732196953/0.png"><input type="radio" name="r_customerKey1" value="05">
			 	</div> 
		      	</tr>
			  </table>
        	<button type="button" class="btn btn-primary" onClick="javascript:fcCustomer_modify()">수정</button>
	    </div>
	  </form:form>
	</div>
  </body>
</html>
<script>

if('02'=='${customer.customerKey1}'){
	
	document.customerModifyForm.r_customerKey1[0].checked=true;
	
}else if ('03'=='${customer.customerKey1}') {
	
	document.customerModifyForm.r_customerKey1[1].checked=true;
	
}else if ('04'=='${customer.customerKey1}') {
	
	document.customerModifyForm.r_customerKey1[2].checked=true;
	
}else if ('05'=='${customer.customerKey1}') {
	
	document.customerModifyForm.r_customerKey1[3].checked=true;
	
}
</script>

 

