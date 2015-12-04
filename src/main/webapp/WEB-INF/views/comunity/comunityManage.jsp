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
	<link href="<%= request.getContextPath() %>/css/comunity.css" rel="stylesheet">

	<script type="text/javascript" src="<%= request.getContextPath() %>/js/jquery-1.11.2.js"></script>
	<script type="text/javascript" src="<%= request.getContextPath() %>/jquery-ui-1.11.4.custom/jquery-ui.js"></script>
	<script type="text/javascript" src="<%= request.getContextPath() %>/bootstrap-3.3.4-dist/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="<%= request.getContextPath() %>/js/addys.js"></script>
	<script>
    
 	var realYN='Y';
    
    function fcReg_comment() {

    	var url='<%= request.getContextPath() %>/comunity/commentregistform';
    	
    	var customerKey='${customerKey}';

    	var h=screen.height-(screen.height*(8.5/100));
    	var s=screen.width-10;
    	
    	if(h<s){
    		s=h;
    	}
    	
    	$('#commentRegistForm').dialog({
            resizable : false, //사이즈 변경 불가능
            draggable : true, //드래그 불가능
            closeOnEscape : true, //ESC 버튼 눌렀을때 종료
            ////position : 'center',
            width : s,
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
    	
    	var h=screen.height-(screen.height*(8.5/100));
    	var s=screen.width-10;
    	
    	if(h<s){
    		s=h;
    	}

    	$('#counselRegistForm').dialog({
            resizable : false, //사이즈 변경 불가능
            draggable : true, //드래그 불가능
            closeOnEscape : true, //ESC 버튼 눌렀을때 종료
            ////position : 'center',
            width : s,
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
    	
    	var h=screen.height-(screen.height*(8.5/100));
    	var s=screen.width-10;
    	
    	if(h<s){
    		s=h;
    	}

    	$('#customerModify').dialog({
            resizable : false, //사이즈 변경 불가능
            draggable : true, //드래그 불가능
            closeOnEscape : true, //ESC 버튼 눌렀을때 종료
            //////position : 'center',
            width : s,
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
    		
    		$('#aslist').attr("style","display:none");
        	$('#counselList').attr("style","display:none");
        	$('#comunityList').attr("style","display:block");
        	$('#hotdeal').attr("style","display:none");
        	$('#mhome').attr("style","display:none");
        	
        	$('#tab1').attr("class","");
        	$('#tab2').attr("class","");
        	$('#tab3').attr("class","on");
        	$('#tab4').attr("class","");
        	$('#tab5').attr("class","");
        	
    	}else if(flag=='01'){
    		
    		realYN='N';
    		
    		$('#aslist').attr("style","display:block");
        	$('#counselList').attr("style","display:none");
        	$('#comunityList').attr("style","display:none");
    		$('#hotdeal').attr("style","display:none");
        	$('#mhome').attr("style","display:none");
        	
        	$('#tab1').attr("class","on");
        	$('#tab2').attr("class","");
        	$('#tab3').attr("class","");
        	$('#tab4').attr("class","");
        	$('#tab5').attr("class","");
        	
    	}else if(flag=='02'){
    		
    		realYN='N';
    		
    		$('#aslist').attr("style","display:none");
        	$('#counselList').attr("style","display:block");
        	$('#comunityList').attr("style","display:none");
    		$('#hotdeal').attr("style","display:none");
        	$('#mhome').attr("style","display:none");
        	
        	$('#tab1').attr("class","");
        	$('#tab2').attr("class","on");
        	$('#tab3').attr("class","");
        	$('#tab4').attr("class","");
        	$('#tab5').attr("class","");
        	
    	}else if(flag=='04'){
    		
    		realYN='N';
    		
    		$('#aslist').attr("style","display:none");
    		$('#counselList').attr("style","display:none");
        	$('#comunityList').attr("style","display:none");
        	$('#hotdeal').attr("style","display:block");
        	$('#mhome').attr("style","display:none");
        	
        	$('#tab1').attr("class","");
        	$('#tab2').attr("class","");
        	$('#tab3').attr("class","");
        	$('#tab4').attr("class","on");
        	$('#tab5').attr("class","");
        	
    	}else if(flag=='05'){
    		
    		realYN='N';
    		
    		$('#aslist').attr("style","display:none");
        	$('#counselList').attr("style","display:none");
        	$('#comunityList').attr("style","display:none");
    		$('#hotdeal').attr("style","display:none");
        	$('#mhome').attr("style","display:block");
        	
        	$('#tab1').attr("class","");
        	$('#tab2').attr("class","");
        	$('#tab3').attr("class","");
        	$('#tab4').attr("class","");
        	$('#tab5').attr("class","on");
        	
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
                   //$('#fset').focus(1); 
                   //window-location('#fset');
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
    	
    	$('#tab1').attr("class","");
    	$('#tab2').attr("class","on");
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
 
 // 리스트 조회
    function fcAs_list(){
		
    	var customerKey='${customerKey}';
    	var groupId='${groupId}';
    	
    	$('#comunityList').attr("style","display:none");
    	$('#counselList').attr("style","display:none");
    	$('#aslist').attr("style","display:block");
    	$('#hotdeal').attr("style","display:none");
    	$('#mhome').attr("style","display:none");
    	
    	$('#tab1').attr("class","on");
    	$('#tab2').attr("class","");
    	$('#tab3').attr("class","");
    	$('#tab4').attr("class","");
    	$('#tab5').attr("class","");

        $.ajax({
            type: "POST",
               url:  "<%= request.getContextPath() %>/comunity/aslist",
               success: function(result) {
                  
                   $("#aslist").html(result);
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

    	var h=screen.height-(screen.height*(8.5/100));
		var s=screen.width-10;
		
    	if(h<s){
    		s=h;
    	}
		
    	$('#replyList').dialog({
            resizable : false, //사이즈 변경 불가능
            draggable : true, //드래그 불가능
            closeOnEscape : true, //ESC 버튼 눌렀을때 종료
            ////position : 'center',
            width : s,
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

    function resultView(idx,counselResult,userName,customerKey,counsel,counselImage){

    	var h=screen.height-(screen.height*(8.5/100));
		var s=screen.width-10;
    	
		if(h<s){
    		s=h;
    	}
		
    	var url='<%= request.getContextPath() %>/comunity/counseldetail';

    	$('#counselResult').dialog({
            resizable : false, //사이즈 변경 불가능
            draggable : true, //드래그 불가능
            closeOnEscape : true, //ESC 버튼 눌렀을때 종료
            ////position : 'center',
            width : s,
            modal : true, //주위를 어둡게

            open:function(){
                //팝업 가져올 url
            	 $(this).load(url+'?idx='+idx+'&counselResult='+encodeURIComponent(counselResult)+'&userName='+encodeURIComponent(userName)+'&counsel='+encodeURIComponent(counsel)+'&customerKey='+customerKey+'&counselImage='+counselImage);

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
    	$('#tab4').attr("class","on");
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
    	$('#tab5').attr("class","on");

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
 
    //레이어팝업 : AS처리 Layer 팝업
    function fcAs_Detail(asNo){
    	
    	var h=screen.height-(screen.height*(8.5/100));
		var s=screen.width;
		
    	if(h<s){
    		s=h;
    	}

    	$('#asDetail').dialog({
            resizable : true, //사이즈 변경 불가능
            draggable : true, //드래그 불가능
            closeOnEscape : true, //ESC 버튼 눌렀을때 종료
            ////position : 'center',
            width : s,
            modal : true, //주위를 어둡게

            open:function(){
                //팝업 가져올 url
                $(this).load('<%= request.getContextPath() %>/comunity/asdetail?asNo='+asNo);
                //$("#userRegist").dialog().parents(".ui-dialog").find(".ui-dialog-titlebar").hide();
                $(".ui-widget-overlay").click(function(){ //레이어팝업외 화면 클릭시 팝업 닫기
                    $("#asDetail").dialog('close');

                    });
            }
            ,close:function(){
                $('#asDetail').empty();

            }
        });
    };
    
    function AutoResize(img){
    	   foto1= new Image();
    	   foto1.src=(img);
    	   Controlla(img);
    	 }
  	 function Controlla(img){
  	   if((foto1.width!=0)&&(foto1.height!=0)){
  	     viewFoto(img);
  	   }
  	   else{
  	     funzione="Controlla('"+img+"')";
  	     intervallo=setTimeout(funzione,20);
  	   }
  	 }
   	 function viewFoto(img){
   	   largh=foto1.width-20;
   	   altez=foto1.height-20;
   	   stringa="width="+largh+",height="+altez;
   	  // finestra=window.open(img,"",stringa);
   	  
	   	var h=screen.height-(screen.height*(8.5/100));
		var s=screen.width;
		
		if(h<s){
			s=h;
		}
		
		if(s<largh){
			largh=s;
		}

   	  	var url='<%= request.getContextPath() %>/comunity/imageview';
   	   
	   	$('#imageView').dialog({
	        resizable : false, //사이즈 변경 불가능
	        draggable : true, //드래그 불가능
	        closeOnEscape : true, //ESC 버튼 눌렀을때 종료
	        ////position : 'center',
	        width : largh,
	        modal : true, //주위를 어둡게
	
	        open:function(){
	            //팝업 가져올 url
	        	 $(this).load(url+'?imageurl='+img);
	
	        }
	        ,close:function(){
	            $('#imageView').empty();
	        }
	    });
   	   
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
     function imageClose(){
    	 
    	 $("#imageView").dialog('close');
    	 $('#imageView').empty();
     }
  </script>
  </head>
   <body>
  <form method="post" id="logoutForm" name="logoutForm"  role="form" >
  </form>
	 <div id="wrap" class="wrap" >
		  <c:choose>
	        <c:when test="${staffYn=='Y'}">
	        <!-- 헤더 -->
			  <header id="header">
			    <div id="m_gnb" class="mcom_gnbwrap mb_top">
			      <div class="mcom_gnb ">
			        <h1 class="head_logo"> <img src="<%= request.getContextPath() %>/images/logo_addys_w.png" alt="addys"  /></h1>
			        <div class="mcom_gnb_rgt">
			          <div class="b_toggle">
			            <ul>
			              <li> <a href="#" class="b_name"> <strong class="">${groupName}</strong> </a></li>
			              <li> <a href="javascript:fcConfig_modify()" class="b_cog"> <strong class="ico_cog"><span>설정</span></strong> </a></li>
			              <li><a href="javascript:goLogout()" class="b_logout"> 
			                <strong>로그아웃</strong></a>
			              </li>
			            </ul>
			          </div>
			        </div>
			      </div>
			    </div>
			  </header>
			  <!--//헤더 --> 
	  			<br><br><br><br><br><br><br>
	  			<div id=comunityList></div>
	      		<div id="commentRegistForm"  title="talk하기"></div>
	      		<div id="imageView"  title="이미지"></div>
	        </c:when>
			<c:otherwise>
			<!-- 헤더 -->
			  <header id="header">
			    <div id="m_gnb" class="mcom_gnbwrap mb_top">
			      <div class="mcom_gnb ">
			        <h1 class="head_logo"> <img src="<%= request.getContextPath() %>/images/logo_addys_w.png" alt="addys"  /></h1>
			        <div class="mcom_gnb_rgt">
			          <div class="b_toggle">
			            <ul>
			              <li> <a href="#" class="b_name"> <strong class="">${groupName}</strong> </a></li>
			              <li> <a href="javascript:fcConfig_modify()" class="b_cog"> <strong class="ico_cog"><span>설정</span></strong> </a></li>
			              <li><a href="javascript:goLogout()" class="b_logout"> 
			                <strong>로그아웃</strong></a>
			              </li>
			            </ul>
			          </div>
			        </div>
			      </div>
			    </div>
			    <div class="mcom_navwrap" style="overflow: hidden; z-index: 2000; -webkit-tap-highlight-color: transparent; height: 47px;">
			      <div class="mcom_nav" style="position: absolute; z-index: 1; left: 0px; top: 0px; transition-property: -webkit-transform; transform: translate3d(10px, 0px, 0px); transition-timing-function: cubic-bezier(0.33, 0.66, 0.66, 1); height: 100%; width: 2583px; transition-duration: 0ms;">
			        <ul style="width: 861px; height: 100%; position: absolute; left: 0px; top: 0px;">
			          <li id="tab1" class="on" index="0" style="float: left; width: 80px;"><a href="javascript:setTab('01');fcAs_list()"><span class="nav_mnu">A/S조회</span></a></li>
			          <li id="tab2" index="1" style="float: left; width: 80px;"><a href="javascript:setTab('02');fcCounsel_list();"><span class="nav_mnu">문의하기</span></a></li>
			          <li id="tab3" index="2" style="float: left; width: 80px;"><a href="javascript:setTab('03');fcComunity_list()"><span class="nav_mnu">매장과talk</span></a></li>
			          <li id="tab4" index="3" style="float: left; width: 50px;"><a href="javascript:setTab('04');fc_hotdeal()"><span class="nav_mnu">핫딜</span></a></li>
			          <li id="tab5" index="4" style="float: left; width: 80px;"><a href="javascript:setTab('05');fc_mhome()"><span class="nav_mnu">회사소개</span></a></li>
			        </ul>
			      </div>
			    </div>
			  </header>
			  <!--//헤더 --> 
	  			<br><br><br><br><br><br><br>
	  			<!-- 조회결과리스트 -->
			    <div id=comunityList style="display:none"></div>
			    <!-- 조회결과리스트 -->
			    <div id=counselList style="display:none"></div>
			    <div id=aslist style="display:none"></div>
			    <div id="hotdeal" style="display:none"></div>
			    <div id="mhome" style="display:none"></div>
			    
			    <div id=asDetail title="A/S상세"></div>
	      		<div id="commentRegistForm"  title="talk하기"></div>
	    		<div id="counselRegistForm"  title="문의하기"></div>
	    		<div id="imageView"  title="이미지" onClick="imageClose()"></div>
	    		<div id="counselResult"  title="문의상세"></div>
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
	fcAs_list();
	
}
</script>
