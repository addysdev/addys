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
		
		try {
			document.loginForm.submit();
		} catch(e) {}
	}
	
	function goRegistForm(){
		
		location.href="<%= request.getContextPath() %>/customerregistform?type=survey";
		//	location.href="<%= request.getContextPath() %>/kcp/kcpcert_start.jsp";
	}
	
	function goPwSearch(){
		
		location.href="<%= request.getContextPath() %>/customerpwform?type=survey";
	}

	</script>
  </head>

   <body>
    <div class="container">
      <h2>(주)애디스 다이렉트  고객 만족도 조사 페이지</h2>
      <form  id="loginForm" name="loginForm"  method="post" role="form" action="<%= request.getContextPath() %>/customer/login">
      	<input type="hidden" name="loginType" value="survey" >
        <div class="form-group">
          <label for="customerKey">핸드폰 번호:</label>
          <input type="text" class="form-control" id=customerKey name="customerKey" placeholder="핸드폰번호">
        </div>
        <div class="form-group">
          <label for="customerId">Password:</label>
          <input type="password" class="form-control" id="customerPw" name="customerPw"  onkeypress="javascript:return checkKey(event);">
        </div>
       <button type="button" class="btn btn-default" onclick="goLogin()">로그인</button>
       <br><br>
       <button type="button" class="btn btn-default" onclick="goRegistForm()">회원가입</button>
       <button type="button" class="btn btn-default" onclick="goPwSearch()">비밀번호찾기</button>
      </form>
    </div>
  </body>
</html>