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
	
	  function init(){

	  	opener.selfClose();

	  }
	  
	// 리스트 조회
	 function fcBoard_list(){
			
	        $.ajax({
	            type: "POST",
	               url:  "<%= request.getContextPath() %>/board/comunitylist?groupId=${groupId}",
	                    data:$("#comunityForm").serialize(),
	               success: function(result) {

	                   $("#boardList").html(result);
	               },
	               error:function() {

	               }
	        });

	   	 var secval='3000';//3초단위
		 
		 interval('fcBoard_list()',secval);
	    }
		
	 /*
	 *interval에따른 시간차 함수
	 */
	 function interval(method,secval){

	 	setTimeout(method,secval);
	 	
	 }
	 
	
	</script>
  </head>
  <body onLoad = "init();">
  <div class="container-fluid">
    <!-- 서브타이틀 영역 : 시작 -->
	<div class="sub_title">
   		<p class="titleP"></p>
	</div>
	<!-- 서브타이틀 영역 : 끝 -->
	  <!-- 조회조건 -->
	  <form:form class="form-inline" role="form" commandName="comunityVO" id="comunityForm" name="comunityForm" method="post" action="" >
	    <input type="hidden" name="groupId" id="groupId" value="${groupId}" >
        <fieldset>
        	<div class="form-group">
              <h3><strong><font style="color:#428bca"><span class="glyphicon glyphicon-plus-sign"></span>(주)애디스 다이랙트</font></strong></h3>
            </div>
	    </fieldset>
	  </form:form>
	  <!-- //조회 -->
  <br>
  <!-- 조회결과리스트 -->
  <div id=boardList></div>
<br>
<%@ include file="/WEB-INF/views/addys/footer.jsp" %>
</div>
</body>
<script type="text/javascript">

    fcBoard_list();

</script>
</html>