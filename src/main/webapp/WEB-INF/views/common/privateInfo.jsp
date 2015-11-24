<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/views/addys/base.jsp" %>
<!DOCTYPE html>
<html>
  <head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Latest compiled and minified CSS -->
	<link href="<%= request.getContextPath() %>/css/reset.css" rel="stylesheet">
	<link href="<%= request.getContextPath() %>/css/common.css" rel="stylesheet">
	<link href="<%= request.getContextPath() %>/css/style.css" rel="stylesheet">
	
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
	 <br><br><br><br>

	     <h5><strong><font style="color:#428bca">애디스 담당직원으로 등록되신 사용자입니다.</font></strong></h5>
	     <h5><strong><font style="color:#428bca">애디스 담당직원 또는 일반 사용자 옵션을 선택후 입장해주시기 바랍니다.</font></strong></h5>
	     <br>
	     <div class="form-inline text-center">
		 	애디스 담당직원<input type="radio" name="staffselect" value="01" checked=true > <br>
		 	일반 사용자<input type="radio" name="staffselect" value="02"> <br>
	 	</div>
	 	<br>
	 	<button type="button" class="btn btn-primary" onClick="javascript:goNext()">입장</button> 
    </div>
  </form>
  </body>
</html>
