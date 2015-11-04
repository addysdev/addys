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
    	var groupId='${groupId}';
    	
    	$('#comunityList').attr("style","display:block");
    	$('#counselList').attr("style","display:none");
    	
    	$('#tab1').attr("class","active");
    	$('#tab2').attr("class","");
    	
        $.ajax({
            type: "POST",
               url:  "<%= request.getContextPath() %>/comunity/comunitylist?customerKey="+customerKey+"&groupId="+groupId,
               success: function(result) {
                  
                   $("#comunityList").html(result);
               },
               error:function() {
                  
               }
        });
    }
 // 리스트 조회
    function fcCounsel_list(){
		
    	var customerKey='${customerKey}';
    	var groupId='${groupId}';
    	
    	$('#comunityList').attr("style","display:none");
    	$('#counselList').attr("style","display:block");
    	
    	$('#tab1').attr("class","");
    	$('#tab2').attr("class","active");

        $.ajax({
            type: "POST",
               url:  "<%= request.getContextPath() %>/comunity/counsellist?customerKey="+customerKey+"&groupId="+groupId,
               success: function(result) {
                  
                   $("#counselList").html(result);
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
	
	function resultView(id){
		
		$(id).attr("style","display:block");

	}

	 //레이어팝업 : 상담처리 Layer 팝업
    function replyView(idx){

    	$('#replyList').dialog({
            resizable : false, //사이즈 변경 불가능
            draggable : true, //드래그 불가능
            closeOnEscape : true, //ESC 버튼 눌렀을때 종료

            width : 400,
            height : 500,
            modal : true, //주위를 어둡게

            open:function(){
                //팝업 가져올 url
                $(this).load('<%= request.getContextPath() %>/comunity/replylist?idx='+idx);
                //$("#userRegist").dialog().parents(".ui-dialog").find(".ui-dialog-titlebar").hide();
                $(".ui-widget-overlay").click(function(){ //레이어팝업외 화면 클릭시 팝업 닫기
                    $("#replyList").dialog('close');

                    });
            }
            ,close:function(){
                $('#replyList').empty();

            }
        });
    };
    function tmt_winLaunch(theURL,winName,targetName,features) {
		
		eval(winName+"=window.open('"+theURL+"','"+targetName+"','"+features+"')");

	}
    function fcbuy_hotdeal(){
    	
  	  //location.href="http://jeonpro76.newfree3.freesell.co.kr";
  	  
	  	var h=screen.height-(screen.height*(8.5/100));
		var s=screen.width-10;
		//alert('귀하의 모니터 해상도는 ' + s + ' x ' + h + '입니다.');

	    tmt_winLaunch('http://jeonpro76.newfree3.freesell.co.kr/m/soho_pagelist.html' , 'qaz', 'qaz', 'status=no,location=no,menubar=no,toolbar=no,width='+s+',height ='+h+',left=0,top=0,resizable=yes,scrollbars=yes');
		
	  	  
    }
    function fcgo_mhome(){
    	
      //location.href="http://addys.shopnote.kr/";
	  	var h=screen.height-(screen.height*(8.5/100));
		var s=screen.width-10;
		//alert('귀하의 모니터 해상도는 ' + s + ' x ' + h + '입니다.');

	    tmt_winLaunch('http://addys.shopnote.kr/' , 'qaz', 'qaz', 'status=no,location=no,menubar=no,toolbar=no,width='+s+',height ='+h+',left=0,top=0,resizable=yes,scrollbars=yes');
		
    }
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
    <button id="deferbtn" type="button" class="btn btn-primary btn-sm" onClick="fcgo_mhome()" >모바일 홈페이지</button>
    <button id="deferbtn" type="button" class="btn btn-danger btn-sm" onClick="fcbuy_hotdeal()" >핫딜구매하기</button>
    <br><br>
      <c:choose>
        <c:when test="${staffYn=='Y'}">
        	<!-- 조회결과리스트 -->
			<div id=comunityList></div>
      		<div id="commentRegistForm"  title="답글올리기"></div>
		</c:when>
		<c:otherwise>
			<ul class="nav nav-tabs">
			  <li id="tab1" class="active"><a href="javascript:fcComunity_list()">글올리기</a></li>
			  <li id="tab2" ><a href="javascript:fcCounsel_list()">1:1문의</a></li>
			</ul>
			<br>
			<!-- 조회결과리스트 -->
		    <div id=comunityList style="display:none"></div>
		    <!-- 조회결과리스트 -->
		    <div id=counselList style="display:none"></div>
      		<div id="commentRegistForm"  title="글올리기"></div>
    		<div id="counselRegistForm"  title="1:1문의"></div>
		</c:otherwise>
	</c:choose>
	  <div id="customerModify"  title="고객 정보변경"></div>
	  <div id="replyList"  title="답글정보"></div>
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
