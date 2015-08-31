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
            height : 300,
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

	</script>
  </head>
   <body>
    <div class="container">
      <br><br><br>
      <button id="deferbtn" type="button" class="btn btn-primary btn-lg" onClick="fcReg_comment()" >글올리기</button>
      <button id="deferbtn" type="button" class="btn btn-danger btn-lg" onClick="fcReg_counsel()" >1:1문의</button>
    <div id="commentRegistForm"  title="글올리기"></div>
    <div id="counselRegistForm"  title="1:1문의"></div>
    </div>
  </body>
</html>