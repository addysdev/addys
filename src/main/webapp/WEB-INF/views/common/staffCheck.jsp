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

    <div class="container">
	<fieldset>
       	<div class="form-inline text-center">
             <h3><strong><font style="color:#428bca">(주)애디스 다이랙트</font></strong></h3>
             <img vertical-align="bottom" height="22px" width="22px" src="http://www.30mcart.ir/images/contact/phone.png"><span class="bar"><strong>&nbsp;&nbsp;${customerKey}</strong></span>
             &nbsp;&nbsp;<img vertical-align="bottom" height="20px" width="20px" src="http://images.gofreedownload.net/gear-34957.jpg" onClick="fcConfig_modify()">
             &nbsp;&nbsp;<img vertical-align="bottom" height="20px" width="20px" src="http://wiki.opencloudengine.org/download/thumbnails/5636108/%E1%84%85%E1%85%A9%E1%84%80%E1%85%B3%E1%84%8B%E1%85%A1%E1%84%8B%E1%85%AE%E1%86%BA.png?version=1&modificationDate=1426577291000&api=v2" onClick="goLogout()">
           </div>
    </fieldset>
    <br>
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
