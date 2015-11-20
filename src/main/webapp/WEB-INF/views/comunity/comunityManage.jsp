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

	<script type="text/javascript" src="<%= request.getContextPath() %>/js/jquery-1.11.2.js"></script>
	<script type="text/javascript" src="<%= request.getContextPath() %>/jquery-ui-1.11.4.custom/jquery-ui.js"></script>
	<script type="text/javascript" src="<%= request.getContextPath() %>/bootstrap-3.3.4-dist/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="<%= request.getContextPath() %>/js/addys.js"></script>
	<script>
    
 	var realYN='Y';
    
    function fcReg_comment() {

    	var url='<%= request.getContextPath() %>/comunity/commentregistform';
    	
    	var customerKey='${customerKey}';
    	
    	$('#commentRegistForm').dialog({
            resizable : false, //사이즈 변경 불가능
            draggable : true, //드래그 불가능
            closeOnEscape : true, //ESC 버튼 눌렀을때 종료

            width : 400,
            height : 270,
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

            width : 400,
            height : 270,
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

    function setTab(flag){

    	if(flag=='03'){
    		
    		realYN='Y';
    		
    		$('#comunityList').attr("style","display:block");
        	$('#counselList').attr("style","display:none");
        	$('#aslist').attr("style","display:none");
        	$('#hotdeal').attr("style","display:none");
        	$('#mhome').attr("style","display:none");
        	
        	$('#tab1').attr("class","");
        	$('#tab2').attr("class","");
        	$('#tab3').attr("class","active");
        	$('#tab4').attr("class","");
        	$('#tab5').attr("class","");
        	
    	}else if(flag=='01'){
    		
    		realYN='N';
    		
    		$('#comunityList').attr("style","display:none");
        	$('#counselList').attr("style","display:block");
        	$('#aslist').attr("style","display:none");
        	$('#hotdeal').attr("style","display:none");
        	$('#mhome').attr("style","display:none");
        	
        	$('#tab1').attr("class","active");
        	$('#tab2').attr("class","");
        	$('#tab3').attr("class","");
        	$('#tab4').attr("class","");
        	$('#tab5').attr("class","");
        	
    	}else if(flag=='02'){
    		
    		realYN='N';
    		
    		$('#comunityList').attr("style","display:none");
        	$('#counselList').attr("style","display:none");
        	$('#aslist').attr("style","display:block");
        	$('#hotdeal').attr("style","display:none");
        	$('#mhome').attr("style","display:none");
        	
        	$('#tab1').attr("class","");
        	$('#tab2').attr("class","active");
        	$('#tab3').attr("class","");
        	$('#tab4').attr("class","");
        	$('#tab5').attr("class","");
        	
    	}else if(flag=='04'){
    		
    		realYN='N';
    		
    		$('#comunityList').attr("style","display:none");
        	$('#counselList').attr("style","display:none");
        	$('#aslist').attr("style","display:none");
        	$('#hotdeal').attr("style","display:block");
        	$('#mhome').attr("style","display:none");
        	
        	$('#tab1').attr("class","");
        	$('#tab2').attr("class","");
        	$('#tab3').attr("class","");
        	$('#tab4').attr("class","active");
        	$('#tab5').attr("class","");
        	
    	}else if(flag=='05'){
    		
    		realYN='N';
    		
    		$('#comunityList').attr("style","display:none");
        	$('#counselList').attr("style","display:none");
        	$('#aslist').attr("style","display:none");
        	$('#hotdeal').attr("style","display:none");
        	$('#mhome').attr("style","display:block");
        	
        	$('#tab1').attr("class","");
        	$('#tab2').attr("class","");
        	$('#tab3').attr("class","");
        	$('#tab4').attr("class","");
        	$('#tab5').attr("class","active");
        	
    	}else{
    		
    		realYN='N';
    	}

    }
    // 리스트 조회
    function fcComunity_list(){
		
    	var customerKey='${customerKey}';
    	var groupId='${groupId}';

        $.ajax({
            type: "POST",
               url:  "<%= request.getContextPath() %>/comunity/comunitylist?customerKey="+customerKey+"&groupId="+groupId,
               success: function(result) {
                  
                   $("#comunityList").html(result);
                   $('#fset').focus(1); 
               },
               error:function() {
                  
               }
        });
        
        var secval='3000';//3초단위
		
        if(realYN=='Y'){
        
			interval('fcComunity_list()',secval);
		
        }
    }
   
    /*
	 *interval에따른 시간차 함수
	 */
	 function interval(method,secval){

	 	setTimeout(method,secval);
	 	
	 }
 // 리스트 조회
    function fcCounsel_list(){
		
    	var customerKey='${customerKey}';
    	var groupId='${groupId}';
    	
    	$('#comunityList').attr("style","display:none");
    	$('#counselList').attr("style","display:block");
    	$('#aslist').attr("style","display:none");
    	$('#hotdeal').attr("style","display:none");
    	$('#mhome').attr("style","display:none");
    	
    	$('#tab1').attr("class","active");
    	$('#tab2').attr("class","");
    	$('#tab3').attr("class","");
    	$('#tab4').attr("class","");
    	$('#tab5').attr("class","");

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
    
    function imageView(imageurl) {

    	var url='<%= request.getContextPath() %>/comunity/imageview';
    	
    	$('#imageView').dialog({
            resizable : false, //사이즈 변경 불가능
            draggable : true, //드래그 불가능
            closeOnEscape : true, //ESC 버튼 눌렀을때 종료

           // width : 100,
           // height : 100,
            modal : true, //주위를 어둡게

            open:function(){
                //팝업 가져올 url
            	 $(this).load(url+'?imageurl='+imageurl);

            }
            ,close:function(){
                $('#imageView').empty();
            }
        });
    };

    function resultView(idx,counselResult,userName){

    	var url='<%= request.getContextPath() %>/comunity/counseldetail';

    	$('#counselResult').dialog({
            resizable : false, //사이즈 변경 불가능
            draggable : true, //드래그 불가능
            closeOnEscape : true, //ESC 버튼 눌렀을때 종료

            width : 280,
            height : 200,
            modal : true, //주위를 어둡게

            open:function(){
                //팝업 가져올 url
            	 $(this).load(url+'?idx='+idx+'&counselResult='+encodeURIComponent(counselResult)+'&userName='+encodeURIComponent(userName));

            }
            ,close:function(){
                $('#counselResult').empty();
            }
        });
    };
    
    // 핫딜
    function fc_hotdeal(){
    	
    	$('#comunityList').attr("style","display:none");
    	$('#counselList').attr("style","display:none");
    	$('#aslist').attr("style","display:none");
    	$('#hotdeal').attr("style","display:block");
    	$('#mhome').attr("style","display:none");
    	
    	$('#tab1').attr("class","");
    	$('#tab2').attr("class","");
    	$('#tab3').attr("class","");
    	$('#tab4').attr("class","active");
    	$('#tab5').attr("class","");

        $.ajax({
            type: "POST",
               url:  "<%= request.getContextPath() %>/comunity/hotdeal",
               success: function(result) {
                  
                   $("#hotdeal").html(result);
               },
               error:function() {
                  
               }
        });
    }
    
 // 회사소개
    function fc_mhome(){
		
    	$('#comunityList').attr("style","display:none");
    	$('#counselList').attr("style","display:none");
    	$('#aslist').attr("style","display:none");
    	$('#hotdeal').attr("style","display:none");
    	$('#mhome').attr("style","display:block");
    	
    	$('#tab1').attr("class","");
    	$('#tab2').attr("class","");
    	$('#tab3').attr("class","");
    	$('#tab4').attr("class","");
    	$('#tab5').attr("class","active");

        $.ajax({
            type: "POST",
               url:  "<%= request.getContextPath() %>/comunity/mhome",
               success: function(result) {
                  
                   $("#mhome").html(result);
               },
               error:function() {
                  
               }
        });
    }
  </script>
  </head>
   <body>
  <form method="post" id="logoutForm" name="logoutForm"  role="form" >
  </form>
	  <div id="wrap" class="wrap" >
	  <!-- 헤더 -->
	  <header>
	    <div class="mb_top"  id="header">
	      <h1 class="head_logo"><img src="<%= request.getContextPath() %>/images/logo_addys2.png" alt="addys"  /></h1>
	    </div>
	  </header>
	  <!--//헤더 -->    
	 <br><br><br><br>
      <c:choose>
        <c:when test="${staffYn=='Y'}">
        	<!-- 조회결과리스트 -->
        	 <fieldset>
		       	<div class="form-inline text-right">
		             <img vertical-align="bottom" height="22px" width="22px" src="http://www.30mcart.ir/images/contact/phone.png"><span class="bar"><strong>&nbsp;&nbsp;${groupName}</strong></span>
		             &nbsp;&nbsp;<img vertical-align="bottom" height="20px" width="20px" src="http://images.gofreedownload.net/gear-34957.jpg" onClick="fcConfig_modify()">
		             &nbsp;&nbsp;<img vertical-align="bottom" height="20px" width="20px" src="http://wiki.opencloudengine.org/download/thumbnails/5636108/%E1%84%85%E1%85%A9%E1%84%80%E1%85%B3%E1%84%8B%E1%85%A1%E1%84%8B%E1%85%AE%E1%86%BA.png?version=1&modificationDate=1426577291000&api=v2" onClick="goLogout()">
		           </div>
		    </fieldset>
			<div id=comunityList></div>
      		<div id="commentRegistForm"  title="talk하기"></div>
      		<div id="imageView"  title="이미지"></div>
		</c:when>
		<c:otherwise>
			<ul class="nav nav-tabs">
			  <li id="tab1" class="active" ><a href="javascript:setTab('01');fcCounsel_list()">문의하기</a></li>
			  <li id="tab2" ><a href="javascript:setTab('02');alert('waiting..');">As조회</a></li>
			  <li id="tab3" ><a href="javascript:setTab('03');fcComunity_list()">매장과talk</a></li>
			  <li id="tab4" ><a href="javascript:setTab('04');fc_hotdeal()">핫딜</a></li>
			  <li id="tab5" ><a href="javascript:setTab('05');fc_mhome()">회사소개</a></li>
			 
			 <fieldset>
		       	<div class="form-inline text-right">
		             <img vertical-align="bottom" height="22px" width="22px" src="http://www.30mcart.ir/images/contact/phone.png"><span class="bar"><strong>&nbsp;&nbsp;${groupName}</strong></span>
		             &nbsp;&nbsp;<img vertical-align="bottom" height="20px" width="20px" src="http://images.gofreedownload.net/gear-34957.jpg" onClick="fcConfig_modify()">
		             &nbsp;&nbsp;<img vertical-align="bottom" height="20px" width="20px" src="http://wiki.opencloudengine.org/download/thumbnails/5636108/%E1%84%85%E1%85%A9%E1%84%80%E1%85%B3%E1%84%8B%E1%85%A1%E1%84%8B%E1%85%AE%E1%86%BA.png?version=1&modificationDate=1426577291000&api=v2" onClick="goLogout()">
		           </div>
		    </fieldset>
		    			  
			</ul>
			<br>
			<!-- 조회결과리스트 -->
		    <div id=comunityList style="display:none"></div>
		    <!-- 조회결과리스트 -->
		    <div id=counselList style="display:none"></div>
		    
		    <div id=aslist style="display:none"></div>
		    <div id="hotdeal" style="display:none"></div>
		    <div id="mhome" style="display:none"></div>
		    
      		<div id="commentRegistForm"  title="talk하기"></div>
    		<div id="counselRegistForm"  title="문의하기"></div>
    		<div id="imageView"  title="이미지"></div>
    		<div id="counselResult"  title="답변내용"></div>
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

if('${staffYn}'=='Y'){
	alert('직원 전용 talk 서비스 입니다.');
	setTab('03');
	fcComunity_list();
}else{

	setTab('01');
	fcCounsel_list();
	
}

</script>
