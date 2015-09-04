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
	
    function fcReg_comment() {
    	
    	var url='<%= request.getContextPath() %>/comunity/commentregistform';
    	
    	var customerKey='${customerKey}';
    	
    	$('#commentRegistForm').dialog({
            resizable : false, //사이즈 변경 불가능
            draggable : true, //드래그 불가능
            closeOnEscape : true, //ESC 버튼 눌렀을때 종료

            width : 300,
            height : 300,
            modal : true, //주위를 어둡게

            open:function(){
                //팝업 가져올 url
                $(this).load(url+'?customerKey='+customerKey);

            }
            ,close:function(){
                $('#commentRegistForm').empty();
            }
        });
    };

    function fcReg_counsel() {
    	
    	var url='<%= request.getContextPath() %>/comunity/counselregistform';
    	var customerKey='${customerKey}';

    	$('#counselRegistForm').dialog({
            resizable : false, //사이즈 변경 불가능
            draggable : true, //드래그 불가능
            closeOnEscape : true, //ESC 버튼 눌렀을때 종료

            width : 300,
            height : 250,
            modal : true, //주위를 어둡게

            open:function(){
                //팝업 가져올 url
                $(this).load(url+'?customerKey='+customerKey);

            }
            ,close:function(){
                $('#counselRegistForm').empty();
            }
        });
    };
	function fcConfig_modify() {
    	
    	var url='<%= request.getContextPath() %>/common/customermodifyform';
    	var customerKey='${customerKey}';

    	$('#customerModify').dialog({
            resizable : false, //사이즈 변경 불가능
            draggable : true, //드래그 불가능
            closeOnEscape : true, //ESC 버튼 눌렀을때 종료

            width : 400,
            height : 415,
            modal : true, //주위를 어둡게

            open:function(){
                //팝업 가져올 url
                $(this).load(url+'?customerKey='+customerKey);

            }
            ,close:function(){
                $('#customerModify').empty();
            }
        });
    };
    // 리스트 조회
    function fcComunity_list(){
		
    	var customerKey='${customerKey}';
    	
        $.ajax({
            type: "POST",
               url:  "<%= request.getContextPath() %>/comunity/comunitylist?customerKey="+customerKey,
               success: function(result) {
                  
                   $("#comunityList").html(result);
               },
               error:function() {
                  
               }
        });
    }
    
	//logout 처리
	var goLogout =  function() {

		//alert('logout');
		
		$('#logoutForm').attr({action:"<%= request.getContextPath() %>/common/logout"});
		
		try {
			logoutForm.submit();
		} catch(e) {}
	};
	
  </script>
  </head>
   <body>
  <form method="post" id="logoutForm" name="logoutForm"  role="form" >
  </form>
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
      <c:choose>
        <c:when test="${staffYn=='Y'}">
			<button id="deferbtn" type="button" class="btn btn-primary btn-lg" onClick="fcReg_comment()" >답글올리기</button>
      		<div id="commentRegistForm"  title="답글올리기"></div>
		</c:when>
		<c:otherwise>
			<button id="deferbtn" type="button" class="btn btn-primary btn-lg" onClick="fcReg_comment()" >글올리기</button>
      		<button id="deferbtn" type="button" class="btn btn-danger btn-lg" onClick="fcReg_counsel()" >1:1문의</button>
      		<div id="commentRegistForm"  title="글올리기"></div>
    		<div id="counselRegistForm"  title="1:1문의"></div>
		</c:otherwise>
	</c:choose>
	  <br><br>
	  <!-- 조회결과리스트 -->
	  <div id=comunityList></div>
	  <div id="customerModify"  title="고객 정보변경"></div>
    </div>
  </body>
</html>
<script>
//alert('${strUserId}');
if('${customerKey}'==null || '${customerKey}'=='null' ){
	goLogout();
}

fcComunity_list();
</script>
