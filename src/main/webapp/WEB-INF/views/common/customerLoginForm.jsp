<%@ page contentType="text/html; charset=utf-8"%>
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

	function goLogin(){
		
		var frm = document.loginForm;
		var customerKey = frm.customerKey.value;
		var customerId =  frm.customerId.value;
	
		if(customerKey==''){
			alert('핸드폰 번호를 입력하시기 바랍니다.');
			return;
		}
		
		if(customerId==''){
			alert('고객번호를 입력하시기 바랍니다.');
			return;
		}
		
		try {
			document.loginForm.submit();
		} catch(e) {}
	}
	

	function statusChangeCallback(response) {

		//alert(response.status);
	    console.log('statusChangeCallback');
	    console.log(response);
	    // The response object is returned with a status field that lets the
	    // app know the current login status of the person.
	    // Full docs on the response object can be found in the documentation
	    // for FB.getLoginStatus().
	    if (response.status === 'connected') {
	      // Logged into your app and Facebook.
	  
	      var fbname;
	      var accessToken=response.authResponse.accessToken;
//alert(accessToken);
	         FB.api('/me', function(user) {  

		      fbname = user.name;

		      //alert(user.id); 
		      //alert(fbname); 
		      // alert(accessToken);

		    });  
	      
	      testAPI(response.authResponse.userID);  
	      
	      var frm=document.loginForm;
	      frm.id.value='system';
	      frm.pwd.value='1';

	      //goLogin();
	      
	    } else if (response.status === 'not_authorized') {
	      // The person is logged into Facebook, but not your app.
	      document.getElementById('status').innerHTML = 'Please log ' +
	        'into this app.';
	    } else {
	      // The person is not logged into Facebook, so we're not sure if
	      // they are logged into this app or not.
	      document.getElementById('status').innerHTML = 'Please log ' +
	        'into Facebook.';
	    }
	  }
	
	function testAPI(uid){
		//alert('uid::'+uid);
		FB.api('/v2.4/'+uid , function(response) {  
		document.getElementById('status').innerHTML='Thanks for logging in,'+response.name+'!';   
		    });  
	}

	  // This function is called when someone finishes with the Login
	  // Button.  See the onlogin handler attached to it in the sample
	  // code below.
	  function checkLoginState() {
		  
	    FB.getLoginStatus(function(response) {
	      statusChangeCallback(response);
	    });
	  }

	  window.fbAsyncInit = function() {
	    FB.init({
	      appId      : '734414233335059',
	      xfbml      : true,
	      version    : 'v2.4'
	    });
	  };

	  (function(d, s, id){
	     var js, fjs = d.getElementsByTagName(s)[0];
	     if (d.getElementById(id)) {return;}
	     js = d.createElement(s); js.id = id;
	     js.src = "//connect.facebook.net/en_US/sdk.js";
	     fjs.parentNode.insertBefore(js, fjs);
	   }(document, 'script', 'facebook-jssdk'));

	</script>
  </head>

   <body>
    <div class="container">
      <h2>(주)애디스 다이렉트</h2>
      <form  id="loginForm" name="loginForm"  method="post" role="form" action="<%= request.getContextPath() %>/customer/login">
        <div class="form-group">
          <label for="customerKey">핸드폰 번호:</label>
          <input type="text" class="form-control" id=customerKey name="customerKey" placeholder="핸드폰번호">
        </div>
        <div class="form-group">
          <label for="customerId">고객번호:</label>
          <input type="text" class="form-control" id="customerId" name="customerId" placeholder="고객번호">
        </div>
       <button type="button" class="btn btn-default" onclick="goLogin()">Submit</button>
      </form>
     <!--
      <br>
      <div id="status"></div>
      <div class="checkbox">
      <fb:login-button scope="public_profile,email" onlogin="checkLoginState();"></fb:login-button>
	  <div id="status">
	  </div>
      </div>
      <br>
      <div
	  class="fb-like"
	  data-share="true"
	  data-width="450"
	  data-show-faces="true">
	</div>
	-->
    </div>
  </body>
</html>