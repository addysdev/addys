<%@ include file="/WEB-INF/views/addys/base.jsp" %>
	<script>

	    // 페이지 이동
	    function goPagePageList() {

	        commonDim(true);
	        $.ajax({
	            type: "POST",
	            url:  "<%= request.getContextPath() %>/comunity/counsellist",
	            success: function(result) {
	                   commonDim(false);
	                   if(setFlag=='01'){
	                		setTab('01');fcAs_list()
	                	}else if(setFlag=='02'){
	                		setTab('02');fcCounsel_list();
	                	}else if(setFlag=='03'){
	                		setTab('03');fcComunity_list()
	                	}else if(setFlag=='04'){
	                		setTab('04');fc_hotdeal()
	                	}else if(setFlag=='05'){
	                		setTab('05');fc_mhome()
	                	}
	            },
	            error:function(){
	                commonDim(false);
	                
	                if(setFlag=='01'){
	                	setTab('01');fcAs_list()
	                }else if(setFlag=='02'){
	                	setTab('02');fcCounsel_list();
	                }else if(setFlag=='03'){
	                	setTab('03');fcComunity_list()
	                }else if(setFlag=='04'){
	                	setTab('04');fc_hotdeal()
	                }else if(setFlag=='05'){
	                	setTab('05');fc_mhome()
	                }
	            }
	        });
	    }
	
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
								
				                   if(setFlag=='01'){
				                		setTab('01');fcAs_list()
				                	}else if(setFlag=='02'){
				                		setTab('02');fcCounsel_list();
				                	}else if(setFlag=='03'){
				                		setTab('03');fcComunity_list()
				                	}else if(setFlag=='04'){
				                		setTab('04');fc_hotdeal()
				                	}else if(setFlag=='05'){
				                		setTab('05');fc_mhome()
				                	}
												
				           },
				           error:function(){
				        	   
				        	   alert('고객 정보 변경을 실패했습니다.');
	
			                   if(setFlag=='01'){
			                		setTab('01');fcAs_list()
			                	}else if(setFlag=='02'){
			                		setTab('02');fcCounsel_list();
			                	}else if(setFlag=='03'){
			                		setTab('03');fcComunity_list()
			                	}else if(setFlag=='04'){
			                		setTab('04');fc_hotdeal()
			                	}else if(setFlag=='05'){
			                		setTab('05');fc_mhome()
			                	}
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
								
				                   if(setFlag=='01'){
				                		setTab('01');fcAs_list()
				                	}else if(setFlag=='02'){
				                		setTab('02');fcCounsel_list();
				                	}else if(setFlag=='03'){
				                		setTab('03');fcComunity_list()
				                	}else if(setFlag=='04'){
				                		setTab('04');fc_hotdeal()
				                	}else if(setFlag=='05'){
				                		setTab('05');fc_mhome()
				                	}
								
								
				           },
				           error:function(){
				        	   
				        	   alert('고객 정보 변경을 실패했습니다.');
			                   if(setFlag=='01'){
			                		setTab('01');fcAs_list()
			                	}else if(setFlag=='02'){
			                		setTab('02');fcCounsel_list();
			                	}else if(setFlag=='03'){
			                		setTab('03');fcComunity_list()
			                	}else if(setFlag=='04'){
			                		setTab('04');fc_hotdeal()
			                	}else if(setFlag=='05'){
			                		setTab('05');fc_mhome()
			                	}
				           }
				    });
			    
		    	}
			}
		}
		function fcMofify_close(){
			$('#customerModify').dialog('close');
		}
	</script>
<!-- container -->
  <form:form class="form-inline" role="form" commandName="customerVO" id="customerModifyForm" name="customerModifyForm" method="post" action="">
   <input type="hidden" id="pw_modifyYn" name="pw_modifyYn" value="Y" >
   <input type="hidden" id="customerKey" name="customerKey" value="${customer.customerKey}" > 
  <div id="container" class="comunity" >
    <div id="m_content" >
      <div class="clm_order_detail">
        <!-- 타이틀 -->
        <div class="clm_acdo_tit">
          <h1>고객 정보 설정</h1>
          <div class="clm_acdo_tit_left">
            <a href="javascript:goPagePageList();" class="btn b_prev"><span class="sp_prev">이전</span></a>
          </div>
        </div>
        <!--// 타이틀 --> 
        <!-- 1.문의내용 -->
        <div class="clm_acdo_tit2">
          <h2 class="h2_txo"> <strong><em class="num">1. </em></strong>기본 이미지 선택</h2>
          <a href="javascript:void(0)" class="tit_desc"> <span class="sp_odr ic_arr">&nbsp;</span> </a>
        </div>
         <div class="clm_acdo_sec">
          <dl class="clm_ip2">
            <dd>
              <p class="tx2">
             		<img vertical-align="bottom" height="50px" width="50px" src="http://cdn.sketchpan.com/member/r/richij/draw/1218072552000/0.png"><input type="radio" name="r_customerKey1" value="02">
				 	<img vertical-align="bottom" height="50px" width="50px" src="http://cdn.sketchpan.com/member/h/han7013/draw/1244526522853/0.png"><input type="radio" name="r_customerKey1" value="03">
				 	<img vertical-align="bottom" height="50px" width="50px" src="http://cdn.sketchpan.com/member/h/haphumia/draw/1211348572390/0.png"><input type="radio" name="r_customerKey1" value="04">
				 	<img vertical-align="bottom" height="50px" width="50px" src="http://cdn.sketchpan.com/member/j/joheejin/draw/1210732196953/0.png"><input type="radio" name="r_customerKey1" value="05">
              </p>
            </dd>
          </dl>
        </div>
        <div class="clm_acdo_tit2">
          <h2 class="h2_txo"> <strong><em class="num">2. </em></strong>비밀번호 설정</h2>
          <a href="javascript:void(0)" class="tit_desc"> <span class="sp_odr ic_arr">&nbsp;</span> </a>
        </div>
        <div class="clm_acdo_sec">
          <dl class="clm_ip2">
            <dt><span class="tit">현재비밀번호</span></dt>
            	  <input type="hidden" id="regPassword" name="regPassword" value="${customer.customerPw}" > 
		          <input type="hidden" id="encpassword" name="encpassword" value="" > 
		          <input type="hidden" id="customerPw" name="customerPw" value="" > 
		          <input type="hidden" id="customerKey1" name="customerKey1" value="${customer.customerKey1}" >
            <dd>
              <p class="tx2">
              <span class="inpbx"><input type="password" id="cur_password" name="cur_password" maxlength="50"  value="" ></span>
              </p>
            </dd>
          </dl>
          <dl class="clm_ip2">
            <dt><span class="tit">변경비밀번호</span></dt>
            <dd>
              <p class="tx2">
                <span class="inpbx"><input type="password" id="change_password" name="change_password" maxlength="50"  value="" ></span>
              </p>
            </dd>
          </dl>
          <dl class="clm_ip2">
            <dt><span class="tit">재입력</span></dt>
            <dd>
              <p class="tx2">
               <span class="inpbx"><input type="password" id="re_password" name="re_password" maxlength="50"  value="" ></span>
              </p>
            </dd>
          </dl>
        </div>
        <!--// 1. 문의내용 --> 
       <div class="clm_detail_btn">
          <div class="clm_btn">
            <a href="javascript:fcCustomer_modify()();" class="btn_ty2">수정</a>
          </div>
        </div>
      </div>
    </div>
  </div>
  </form:form>
  <!-- //container -->	
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

 

