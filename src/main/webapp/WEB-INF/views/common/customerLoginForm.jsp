<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="/WEB-INF/tlds/taglib.tld" prefix="taglib"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="chrome=1,IE=edge" />
<meta http-equiv="Cache-Control" content="no-cache">
<meta http-equiv="Pragma" content="no-cache">
<meta name="viewport" content="width=device-width, initial-scale=1.0,minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
      
<link href="<%= request.getContextPath() %>/css/reset.css" rel="stylesheet">
<link href="<%= request.getContextPath() %>/css/common.css" rel="stylesheet">
<link href="<%= request.getContextPath() %>/css/style.css" rel="stylesheet">
<link href="<%= request.getContextPath() %>/css/login.css" rel="stylesheet">

<title>Login</title>
<style></style>

<script type="text/javascript" src="<%= request.getContextPath() %>/js/jquery-1.11.2.js"></script>
<script type="text/javascript" src="<%= request.getContextPath() %>/jquery-ui-1.11.4.custom/jquery-ui.js"></script>
<script type="text/javascript" src="<%= request.getContextPath() %>/bootstrap-3.3.4-dist/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%= request.getContextPath() %>/js/addys.js"></script>
	<script>
    /// key down function (엔터키가 입력되면 검색함수 호출)
    function checkKey(event){
        if(event.keyCode == 13){
        	goLogin();
            return false;
        } else{
            return true;
        }
    }
	
	
	function goLogin(){
		
		var frm = document.loginForm;
		var customerKey = frm.customerKey.value;
		var customerPw =  frm.customerPw.value;
	
		if(customerKey==''){
			alert('핸드폰 번호를 입력하시기 바랍니다.');
			return;
		}
		
		if(customerPw==''){
			alert('Password를 입력하시기 바랍니다.');
			return;
		}

		setCookie("addys_customerkey", $('#customerKey').val());

		frm.groupName.value='물류정상';
		//frm.groupName.value=frm.groupId.options[frm.groupId.selectedIndex].text;
		
		try {
			document.loginForm.submit();
		} catch(e) {}
	}
	
	function goRegistForm(){
		
		setCookie("addys_customerkey", $('#customerKey').val());
		
		location.href="<%= request.getContextPath() %>/customerregistform";
		//	location.href="<%= request.getContextPath() %>/kcp/kcpcert_start.jsp";
	}
	
	function goPwSearch(){
		
		setCookie("addys_customerkey", $('#customerKey').val());
		
		location.href="<%= request.getContextPath() %>/customerpwform";
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
<div id="wrap" class="wrap" >
  <!-- 헤더 -->
  <header>
    <div class="mb_top">
      <h1 class="head_logo"><img src="<%= request.getContextPath() %>/images/logo_addys_w.png" alt="addys"  /></h1>
    </div>
  </header>
  <!--//헤더 --> 
  <form  id="loginForm" name="loginForm"  method="post" role="form" action="<%= request.getContextPath() %>/customer/login">
  <input type="hidden" name="loginType" value="comunity" >
  <input type="hidden" name="groupName" value="" >
  <!-- container -->
  <div id="container">
    <div id="m_content" >
     <!-- 셀렉박스 -->
	     <div class="m_selbox" >
       		<c:if test="${group_comboList.size() > 1}">
				<select class="m_schtype"  style='width:135px' id="groupId" name="groupId" value="">
	                  <c:forEach var="groupVO" items="${group_comboList}" >
	                  	<option value="${groupVO.groupId}">${groupVO.groupName}</option>
	                  </c:forEach>
	            </select>
            </c:if>
	      </div>
	  <!-- //셀렉박스 -->
      <!-- 로그인영역 -->
      <div class="m_combx">
        <fieldset>
          <legend>로그인 영역</legend>
          <form id="login_form" method="post">
            <!-- 로그인 -->
            <div class="m_inplogin">
              <ul class="m_inp_data">
                <li>
                  <label for="inp_id" class="blind">핸드폰번호</label>
                  <span class="inpbx">
                  <input type="text" id="customerKey" name="customerKey" placeholder="핸드폰번호">
                  <span class="sp_login ico_id">&nbsp;</span></span></li>
                <li>
                  <label for="inp_pw" class="blind">비밀번호</label>
                  <span class="inpbx">
                  <input type="password" id="customerPw" name="customerPw" placeholder="비밀번호">
                  <span class="sp_login ico_pw">&nbsp;</span></span></li>
              </ul>
              <!-- 자동로그인 체크 -->
       <!--  <div class="log_check">
                <span class="left"> <span class="inpchk chk_checked">
                <input type="checkbox" id="keep_login" name="keepLogin" value="Y" checked="">
                </span>
                <label for="chk_log">자동 로그인</label>
                </span> <span class="right"> <span class="inpchk chk_checked">
                <input type="checkbox" id="keep_id" value="Y" checked="">
                </span>
                <label for="chk_id">아이디 저장</label>
                </span>
              </div>  -->      
              <!--//자동로그인 체크 -->
            </div>
            <!-- //로그인 -->
            <!-- 로그인버튼 -->
            <div class="bnbox">
              <button type="button" class="bn_gray" onclick="goLogin()">입장하기</button>
            </div>
            <!--//로그인버튼 -->
            <!-- 가입,비번찾기 -->
	        <div class="login_join">
	          <h3 class="line_tit"></h3>
	          <ul class="log_joinlist">
	            <li> <span class="tit">정보를 잊어 버리셨나요?</span> <span class="txt"> <!--span class="line">|</span --> <a href="javascript:goPwSearch()"><strong>비밀번호 찾기</strong></a></span> </li>
	            <li> <span class="tit">아직 회원이 아니세요?</span> <span class="txt"><a href="javascript:goRegistForm()"><strong>간편가입</strong></a> </li>
	          </ul>
	        </div>
	        <!--//가입,비번찾기 -->
            <!-- 이용안내 -->
            <div class="m_tip">
              <span class="ico_tip">&nbsp;</span>등록을 하시면 다음과 같은 서비스를 이용 가능하십니다.
              <ul class="m_tip_list">
                <li>1. 문의하기</li>
                <li>2. A/S 과정열람</li>
                <li>3. 매장과 채팅</li>
                <li>4. Hot Deal & Event</li>
              </ul>
            </div>
            <!--//이용안내 -->
          </form>
        </fieldset>
      </div>
      <!--//로그인영역 -->
    </div>
  </div>
  <!--//container -->
  </form>
  <div id="footer" class="footer">
    <span class="Copyright">Copyright 2015 ⓒ addys Corp. All rights reserved. v1.0.0</span>
  </div>
</div>
</body>
</html>
<script>

var cust_frm = document.loginForm;
var cust_key = getCookie("addys_customerkey");

if( cust_key != null && trim(cust_key) != '' && cust_key != 'null' ){
	cust_frm.customerKey.value = cust_key;
}

</script>