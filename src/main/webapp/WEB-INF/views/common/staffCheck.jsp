<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/views/addys/base.jsp" %>
<!DOCTYPE html>
<html>
  <head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Latest compiled and minified CSS -->
	<link href="<%= request.getContextPath() %>/css/issue_style.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/jquery-ui-1.11.4.custom/jquery-ui.css">
	<link rel="stylesheet" href="<%= request.getContextPath() %>/bootstrap-3.3.4-dist/css/bootstrap.css">
	
	<link href="<%= request.getContextPath() %>/css/reset.css" rel="stylesheet">
	<link href="<%= request.getContextPath() %>/css/common.css" rel="stylesheet">
	<link href="<%= request.getContextPath() %>/css/style.css" rel="stylesheet">
	<link href="<%= request.getContextPath() %>/css/comunity.css" rel="stylesheet">
	<link href="<%= request.getContextPath() %>/css/list.css" rel="stylesheet">

	<script type="text/javascript" src="<%= request.getContextPath() %>/js/jquery-1.11.2.js"></script>
	<script type="text/javascript" src="<%= request.getContextPath() %>/jquery-ui-1.11.4.custom/jquery-ui.js"></script>
	<script type="text/javascript" src="<%= request.getContextPath() %>/bootstrap-3.3.4-dist/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="<%= request.getContextPath() %>/js/addys.js"></script>
	<script>
	
   
	function goNext() {
    	
		var staffselect=document.logoutForm.staffselect[0].checked;
		var staffYn='Y';

		if(staffselect==true){		
			staffYn='Y';
		}else{
			staffYn='N';
		}
		
		location.href="<%= request.getContextPath() %>/common/staffselect?staffYn="+staffYn;
    }
    
	//logout 처리
	var goLogout =  function() {

		//alert('logout');
		
		$('#logoutForm').attr({action:"<%= request.getContextPath() %>/common/logout?loginType=${loginType}"});
		
		try {
			logoutForm.submit();
		} catch(e) {}
	};

  </script>
  </head>
   <body>
  <form method="post" id="logoutForm" name="logoutForm"  role="form" >
    <div id="wrap" class="wrap" >
	  <!-- 헤더 -->
	  <header>
	    <div class="mb_top"  id="header">
	      <h1 class="head_logo"><img src="<%= request.getContextPath() %>/images/logo_addys_w.png" alt="addys"  /></h1>
	    </div>
	  </header>
	  <!--//헤더 -->    
	 <!-- container -->
	  <div id="container" class="comunity" >
	    <div id="m_content" >
	      <div class="clm_order_detail">
	        <!-- 안내내용 -->
	        <div class="clm_acdo_sec">
	          <dl class="clm_ip2">
	            <dd>
	              <p class="tx2">※ 애디스 담당직원으로 등록되신 사용자입니다.<br><br>※ 직원전용 옵션을 선택후 입장해주시기 바랍니다.</p>
	            </dd>
	          </dl>
	        </div>
	        <div class="clm_acdo_tit2">
	          <h2 class="h2_txo"> <strong><em class="num">1. </em></strong>직원전용 옵션 선택</h2>
	          <a href="javascript:void(0)" class="tit_desc"> <span class="sp_odr ic_arr">&nbsp;</span> </a>
	        </div>
	        <!--// 타이틀 --> 
	        <div class="clm_acdo_sec">
	          <dl class="clm_ip2">
	            <dd>
	              <p class="tx2">애디스 담당직원&nbsp;<input type="radio" name="staffselect" value="01" checked=true >&nbsp;
		 	                                                 일반 사용자&nbsp;<input type="radio" name="staffselect" value="02"></p>
	            </dd>
	          </dl>
	        </div>
	        <!--// 안내내용 --> 
	        <div class="clm_detail_btn">
	          <div class="clm_btn">
	            <a href="javascript:goNext();" class="btn_ty2">입장</a>
	          </div>
	        </div>
	      </div>
	    </div>
	  </div>
	  <div id="footer" class="footer">
	    <span class="Copyright">Copyright 2015 ⓒ addys Corp. All rights reserved. v1.0.0</span>
	  </div>
	  <!-- //container -->
    </div>
  </form>
  </body>
</html>
