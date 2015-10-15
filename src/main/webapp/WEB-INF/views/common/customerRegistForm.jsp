<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="/WEB-INF/tlds/taglib.tld" prefix="taglib"%>
<%@ page language="java" contentType="text/html;charset=utf-8"%>
<%
    /* ============================================================================== */
    /* =   PAGE : 인증 요청 PAGE                                                    = */
    /* = -------------------------------------------------------------------------- = */
    /* =   Copyright (c)  2012.02   KCP Inc.   All Rights Reserved.                 = */
    /* ============================================================================== */

    /* ============================================================================== */
    /* =   환경 설정 파일 Include                                                   = */
    /* = -------------------------------------------------------------------------- = */
%>
<%@ page import="kr.co.kcp.CT_CLI"%>
<%@ page import="java.text.*" %>
<%@ page import="java.util.*" %>
<%
    /* = -------------------------------------------------------------------------- = */
    /* =   환경 설정 파일 Include END                                               = */
    /* ============================================================================== */

    /* ============================================================================== */
    /* =   Hash 데이터 생성 필요 데이터                                             = */
    /* = -------------------------------------------------------------------------- = */
    /* = 사이트코드 ( up_hash 생성시 필요 )                                         = */
    /* = -------------------------------------------------------------------------- = */

    String site_cd   = "S6186";

    /* = -------------------------------------------------------------------------- = */
    /* = 주문번호  ( up_hash 생성시 필요 )                                           = */
    /* = -------------------------------------------------------------------------- = */

    String ordr_idxx = "TEST" + (new SimpleDateFormat("yyyyMMddHHmmssSSSSSSS").format(new Date())); // 주문번호 생성 예제

    /* = -------------------------------------------------------------------------- = */
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
        <title>*** KCP Online Payment System [JSP Version] ***</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="../css/sample.css" rel="stylesheet" type="text/css">
            
	    <!-- Latest compiled and minified CSS -->
		<link href="<%= request.getContextPath() %>/css/issue_style.css" rel="stylesheet" type="text/css">
	    <link rel="stylesheet" href="<%= request.getContextPath() %>/jquery-ui-1.11.4.custom/jquery-ui.css">
		<link rel="stylesheet" href="<%= request.getContextPath() %>/bootstrap-3.3.4-dist/css/bootstrap.css">
		<script type="text/javascript" src="<%= request.getContextPath() %>/js/jquery-1.11.2.js"></script>
		<script type="text/javascript" src="<%= request.getContextPath() %>/jquery-ui-1.11.4.custom/jquery-ui.js"></script>
		<script type="text/javascript" src="<%= request.getContextPath() %>/bootstrap-3.3.4-dist/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="<%= request.getContextPath() %>/js/addys.js"></script>
		
        <script type="text/javascript">

            // 결제창 종료후 인증데이터 리턴 함수
            function auth_data( frm )
            {
                var auth_form     = document.form_auth;
                var nField        = frm.elements.length;
                var response_data = "";

                // up_hash 검증 
                if( frm.up_hash.value != auth_form.veri_up_hash.value )
                {
                    alert("up_hash 변조 위험있음");
                    
                }              
                
               /* 리턴 값 모두 찍어보기 (테스트 시에만 사용) */
                var form_value = "";

                for ( i = 0 ; i < frm.length ; i++ )
                {
                    form_value += "["+frm.elements[i].name + "] = [" + frm.elements[i].value + "]\n";
                }
                alert(form_value);
            }
            
            // 인증창 호출 함수
            function auth_type_check()
            {
                var auth_form = document.form_auth;
    
                if( auth_form.ordr_idxx.value == "" )
                {
                    alert( "주문번호는 필수 입니다." );
    
                    return false;
                }
                else
                {
                    if( ( navigator.userAgent.indexOf("Android") > - 1 || navigator.userAgent.indexOf("iPhone") > - 1 ) == false ) // 스마트폰이 아닌경우
                    {
	                    var return_gubun;
	                    var width  = 410;
	                    var height = 500;
	
	                    var leftpos = screen.width  / 2 - ( width  / 2 );
	                    var toppos  = screen.height / 2 - ( height / 2 );
	
	                    var winopts  = "width=" + width   + ", height=" + height + ", toolbar=no,status=no,statusbar=no,menubar=no,scrollbars=no,resizable=no";
	                    var position = ",left=" + leftpos + ", top="    + toppos;
	                    var AUTH_POP = window.open('','auth_popup', winopts + position);
                    }
                    
                    auth_form.target = "auth_popup"; // !!주의 고정값 ( 리턴받을때 사용되는 타겟명입니다.)
                    auth_form.action = "<%= request.getContextPath() %>/kcp/kcpcert_proc_req.jsp"; // 인증창 호출 및 결과값 리턴 페이지 주소
                    
                    return true;
                }
            }
    
            /* 예제 */
            window.onload=function()
            {
                var today            = new Date();
                var year             = today.getFullYear();
                var month            = today.getMonth() + 1;
                var date             = today.getDate();
                var time             = today.getTime();
                var year_select_box  = "<option value=''>선택 (년)</option>";
                var month_select_box = "<option value=''>선택 (월)</option>";
                var day_select_box   = "<option value=''>선택 (일)</option>";
                
                if(parseInt(month) < 10) {
                    month = "0" + month;
                }
    
                if(parseInt(date) < 10) {
                    date = "0" + date;
                }
    
                year_select_box = "<select name='year' class='frmselect' id='year_select'>";
                year_select_box += "<option value=''>선택 (년)</option>";
       
                for(i=year;i>(year-100);i--)
                {
                    year_select_box += "<option value='" + i + "'>" + i + " 년</option>";
                }
                
                year_select_box  += "</select>";
                month_select_box  = "<select name=\"month\" class=\"frmselect\" id=\"month_select\">";
                month_select_box += "<option value=''>선택 (월)</option>";
                
                for(i=1;i<13;i++)
                {
                    if(i < 10)
                    {
                        month_select_box += "<option value='0" + i + "'>" + i + " 월</option>";
                    }
                    else
                    {
                        month_select_box += "<option value='" + i + "'>" + i + " 월</option>";
                    }
                }
                
                month_select_box += "</select>";
                day_select_box    = "<select name=\"day\"   class=\"frmselect\" id=\"day_select\"  >";
                day_select_box   += "<option value=''>선택 (일)</option>";
                for(i=1;i<32;i++)
                {
                    if(i < 10)
                    {
                        day_select_box += "<option value='0" + i + "'>" + i + " 일</option>";
                    }
                    else
                    {
                        day_select_box += "<option value='" + i + "'>" + i + " 일</option>";
                    }
                }
                
                day_select_box += "</select>";
                
                document.getElementById( "year_month_day"  ).innerHTML = year_select_box + month_select_box + day_select_box;
            }

            function goRigist(){
            	
            	var frm=document.RegistForm;
            	
            	if(frm.customerKey.value==''){
    				alert('인증된 핸드폰 번호가 없습니다.');
    				return;
    			}
            	
           		if(frm.tokenstate.value!='1'){
       				alert('인증확인을 하시기 바랍니다.');
       				return;
       			}
            	
            	if(frm.customerPw.value==''){
    				alert('등록하실 비밀번호를  입력 하시기 바랍니다.');
    				return;
    			}
    			
    			if(frm.customerRePw.value==''){
    				alert('등록하실 비밀번호를 재입력 하시기 바랍니다.');
    				return;
    			}

    			if(frm.customerPw.value!=frm.customerRePw.value){
    				alert('등록하실 비밀번호가 재입력 비밀번호와 같지 않습니다.');
    				frm.customerPw.value='';
    				frm.customerRePw.value='';
    				
    				frm.customerPw.focus(1);
    				return;
    			}

    			if (confirm('회원 가입을 하시겠습니까?')){ 
    	    		
	    		    $.ajax({
	    		        type: "POST",
	    		        async:false,
	    		           url:  "<%= request.getContextPath() %>/common/customerregist",
	    		           data:$("#RegistForm").serialize(),
	    		           success: function(result) {
	
	    						if(result=='1'){
	    							 alert('회원 가입을 성공했습니다.');

	    							 if('${type}'==='survey'){
	    								 location.href="<%= request.getContextPath() %>/surveyloginform"; 
	    							 }else{
	    								 location.href="<%= request.getContextPath() %>/customerloginform"; 
	    							 }
	    							 
	    						} else if(result=='2'){
	    							 alert('인증요청 된 정보가 없습니다.');
	    						} else if(result=='3'){
	    							 alert('인증번호 오류\n재인증 하시기 바랍니다.');
	    						} else {
	    							 alert('회원 가입을 실패했습니다.');
	    						}
	
	    		           },
	    		           error:function(){
	    		        	   
	    		        	   alert('회원 가입을 실패했습니다.');
	    		           }
	    		    });
    		    
    	    	}
            }	
            function getToken(){
            	
            	var frm=document.RegistForm;
            	
            	if(frm.customerKeyView.value==''){
    				alert('인증하실 핸드폰 번호가 없습니다.');
    				return;
    			}
            	
            	frm.customerKey.value=frm.customerKeyView.value;
            	
            	$.ajax({
    		        type: "POST",
    		        async:false,
    		           url:  "<%= request.getContextPath() %>/common/gettoken",
    		           data:$("#RegistForm").serialize(),
    		           success: function(result) {

    						if(result=='0'){
    							
    						    alert('인증요청을 성공했습니다.\n발송된 인증번호를 입력하시기 바랍니다.');
    							frm.customerKeyView.disabled=true;
                                
    						} else if(result=='1'){
    							
	   							 alert('이미 등록된 핸드폰 번호입니다.');
						    } else{
						    	
    							 alert('인증요청을 실패했습니다.');
    						}
    						
    						 frm.tokenstate.value=result;

    		           },
    		           error:function(){
    		        	   
    		        	   alert('[error]인증요청을 실패했습니다.');
    		        	   frm.tokenstate.value='-1';
    		           }
    		    });
            }	 
            function getTokenConfirm(){
            	
            	var frm=document.RegistForm;
            	
           		if(frm.tokenstate.value!='0'){
           			
           			if(frm.tokenstate.value=='1'){
           				alert('이미 인증확인이 된 번호입니다.');
           				return;
           			}
       				alert('인증요청을 하시기 바랍니다.');
       				return;
       			}
           		
            	if(frm.customerKey.value==''){
    				alert('인증하실 핸드폰 번호가 없습니다.');
    				return;
    			}
            	
            	if(frm.tokenView.value==''){
    				alert('인증번호가 없습니다.');
    				return;
    			}
            	
            	frm.token.value=frm.tokenView.value;
            	
            	$.ajax({
    		        type: "POST",
    		        async:false,
    		           url:  "<%= request.getContextPath() %>/common/gettokenconfirm",
    		           data:$("#RegistForm").serialize(),
    		           success: function(result) {

    						if(result=='1'){
    							
    							 //alert('인증요청을 성공했습니다.\n발송된 인증번호를 입력하시기 바랍니다.');
    							 document.all('pwform').style.display="inline";
    							 document.all('reqbtn').style.display="none";
    							 frm.tokenView.disabled=true;
                                
    						} else if(result=='3'){
    							
	   							 alert('인증정보 오류');
	   							 
						    } else{
						    	
    							 alert('인증확인을 실패했습니다.');
    						}
    						
    						 frm.tokenstate.value=result;

    		           },
    		           error:function(){
    		        	   
    		        	   alert('[error]인증확인을 실패했습니다.');
    		        	   frm.tokenstate.value='-1';
    		           }
    		    });
            }
        </script>
    </head>
    <body oncontextmenu="return false;" ondragstart="return false;" onselectstart="return false;">
    <div class="container">
      <h2>회원가입</h2>
            <form name="form_auth">
                <table width="589" cellpadding="0" cellspacing="0">
                    <tr style="height:14px"><td style="background-image:url('../img/boxtop589.gif');"></td></tr>
                    <tr>
                        <td style="background-image:url('../img/boxbg589.gif')">
        
                            <!-- 상단 테이블 Start -->
                            <table width="551px" align="center" cellspacing="0" cellpadding="16">

                                <tr style="height:11px"><td style="background:url('../img/boxbtm551.gif') no-repeat;"></td></tr>
                            </table>
                            <!-- 상단 테이블 End -->
                            <input type="hidden" name="ordr_idxx" value="0"/>
                            <input type="hidden" name="user_name" value=""/>
                            <input type="hidden" id="year_month_day"/>
                            <input type="hidden"  name="sex_code" value="01"/>
                            <input type="hidden" name="local_code" value="01" />
                            <!-- 주문 정보 출력 테이블 Start -->
                           
                            <!-- 주문 정보 출력 테이블 End -->
        
                            <!-- 결제 버튼 테이블 Start -->
                            <table width="527" align="center" cellspacing="0" cellpadding="0" class="margin_top_20">
                                <!-- 결제 요청/처음으로 이미지 버튼 -->
                                <tr id="show_pay_btn">
                                    <td colspan="2" align="center">
                                  <!--      <input type="image" src="<%= request.getContextPath() %>/img/btn_certi.gif" onclick="return auth_type_check();" width="108" height="37" alt="요청합니다" />  -->
                                    </td>
                                </tr>
                            </table>
                            <!-- 결제 버튼 테이블 End -->
                        </td>
                    </tr>
                </table>
        
                <!-- 요청종류 -->
                <input type="hidden" name="req_tx"       value="cert"/>
                <!-- 요청구분 -->
                <input type="hidden" name="cert_method"  value="01"/>
                <!-- 웹사이트아이디 -->
                <input type="hidden" name="web_siteid"   value=""/> 
                <!-- 노출 통신사 default 처리시 아래의 주석을 해제하고 사용하십시요 
                     SKT : SKT , KT : KTF , LGU+ : LGT
                <input type="hidden" name="fix_commid"      value="KTF"/>
                -->
                <!-- 사이트코드 -->
                <input type="hidden" name="site_cd"      value="<%= site_cd %>" />
                <!-- Ret_URL : 인증결과 리턴 페이지 ( 가맹점 URL 로 설정해 주셔야 합니다. ) -->
                <input type="hidden" name="Ret_URL"      value="<%= request.getContextPath() %>/kcp/kcpcert_proc_req.jsp" />
                <!-- cert_otp_use 필수 ( 메뉴얼 참고)
                     Y : 실명 확인 + OTP 점유 확인 , N : 실명 확인 only
                -->
                <input type="hidden" name="cert_otp_use" value="Y"/>
                <!-- cert_enc_use 필수 (고정값 : 메뉴얼 참고) -->
                <input type="hidden" name="cert_enc_use" value="Y"/>

                <input type="hidden" name="res_cd"       value=""/>
                <input type="hidden" name="res_msg"      value=""/>

                <!-- up_hash 검증 을 위한 필드 -->
                <input type="hidden" name="veri_up_hash" value=""/>

                <!-- 본인확인 input 비활성화 -->
                <input type="hidden" name="cert_able_yn" value=""/>

                <!-- web_siteid 검증 을 위한 필드 -->
                <input type="hidden" name="web_siteid_hashYN" value=""/>

                <!-- 가맹점 사용 필드 (인증완료시 리턴)-->
                <input type="hidden" name="param_opt_1"  value="opt1"/> 
                <input type="hidden" name="param_opt_2"  value="opt2"/> 
                <input type="hidden" name="param_opt_3"  value="opt3"/> 
            </form>
            
            <form commandName="customerVo"   id="RegistForm" name="RegistForm"  method="post" role="form" action="<%= request.getContextPath() %>/customer/regist">
              <input type="hidden" name="tokenstate"          id="tokenstate"         value="-1"  />
           	  <table class="table table-bordered" >
			 	<tr>
		          <th class='text-center' style="background-color:#E6F3FF;width:120px" >핸드폰 번호:</th>
		          <th><div class="form-inline">
		        	  <input type="text" class="form-control" id=customerKeyView name="customerKeyView" value="" placeholder="핸드폰번호" >
		        	  <input type="hidden" id=customerKey name="customerKey"  value=""/> 
			          <button id="reqbtn" type="button" class="btn btn-info" onClick="getToken()" >인증요청</button>
			           <h5><font style="color:#FF9900">가입을 위해 최초로 핸드폰 인증이 필요합니다.</font></h5>   
			          </div>
		          </th>
		      	</tr>
		      	<tr>
		          <th class='text-center' style="background-color:#E6F3FF" >인증번호:</th>
		          <th>
		          <div class="form-inline">
		          <input type="text" class="form-control" id="tokenView" name="tokenView" style='ime-mode:active;' maxlength="200" value="" placeholder="인증번호"  />
		          <input type="hidden" id=token name="token"  value=""/> 
		          <button id="memoinfobtn" type="button" class="btn btn-info" onClick="getTokenConfirm()" >인증확인</button>
		          <h5><font style="color:#FF9900">발송된 인증번호를 입력하세요</font></h5>   
		    	  </div>
		          </th>
		      	</tr>
		      	</table>
		        <div id="pwform" name="pwform" style="display:none" >
			      <table class="table table-bordered" >
			      	<tr>
			          <th class='text-center' style="background-color:#E6F3FF;width:120px" >패스워드:</th>
			          <th>
			          <div class="form-inline">
			            <input type="password" class="form-control" id="customerPw" name="customerPw" style='ime-mode:active;' maxlength="200" value="" placeholder="패스워드"  />
			    	  </div>
			          </th>
			      	</tr>
			      	<tr>
			          <th class='text-center' style="background-color:#E6F3FF" >재입력:</th>
			          <th>
			          <div class="form-inline">
			           <input type="password" class="form-control" id="customerRePw" name="customerRePw" style='ime-mode:active;' maxlength="200" value="" placeholder="패스워드 재입력"  />
			    	  </div>
			          </th>
			      	</tr>
				  </table>				
			      <button type="button" class="btn btn-default" onclick="goRigist()">가입</button>
	       		</div>
	       <c:choose>
	    		<c:when test="${type=='survey'}">
					 <h5><strong><a href="<%= request.getContextPath() %>/surveyloginform" ><font style="color:#428bca"> <span class="glyphicon glyphicon-arrow-left"></span> 뒤로가기</font></a></strong></h5>
				</c:when>
				<c:otherwise>
					 <h5><strong><a href="<%= request.getContextPath() %>/customerloginform" ><font style="color:#428bca"> <span class="glyphicon glyphicon-arrow-left"></span> 뒤로가기</font></a></strong></h5>
				</c:otherwise>
			</c:choose>
	      </form>
        </div>
    </body>
</html>