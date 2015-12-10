<%@ include file="/WEB-INF/views/addys/base.jsp" %>
	<script>
      
	    // 페이지 이동
	    function goPageAsPageList() {

	        var dataParam = $("#asConForm").serialize();
	        commonDim(true);
	        $.ajax({
	            type: "POST",
	            url:  "<%= request.getContextPath() %>/comunity/aslist",
	              data:dataParam,
	            success: function(result) {
	                   commonDim(false);
	                   $("#aslist").html(result);
	            },
	            error:function(){
	                commonDim(false);
	            }
	        });
	    }
	
	
		  function fcAs_StateProcess(asNo,asState,asSubState,asHistory){
				  
				  if (confirm('A/S 제품을 정상적으로 수령하셨습니까?')){
						
						$.ajax({
					        type: "POST",
					        async:false,
					           url:  "<%= request.getContextPath() %>/comunity/asstateprocess?asNo="+asNo+"&asState="+asState+"&asSubState="+asSubState+"&asHistory="+encodeURIComponent(asHistory),			  
					           success: function(result) {
		
									if(result=='1'){
										 alert('A/S 제품을 정상거으로 수령 완료하셨습니다.');
									} else{
										 alert('A/S 처리상태 변경을 실패했습니다.');
									}
									
									$('#asDetail').dialog('close');
									fcAs_listSearch();
									
					           },
					           error:function(){
					        	   
					        	   alert('A/S 처리상태 변경을 실패했습니다.');
					        	   $('#asDetail').dialog('close');
					           }
					    });
						
					}
				  
				  
			  }
		  
		   function fcAs_reTranspath(){
				
				var url=document.asConForm.reTransurl_Modify.value;
				var transno=document.asConForm.reTransportNo_Modify.value;
				
				var theURL=url+transno;
				
			//	var h=700;
			//	var s=800;

			    tmt_winLaunch(theURL, 'transObj', 'transObj', 'resizable=no,status=no,location=no,menubar=no,toolbar=no,width='+s+',height ='+h+',left=0,top=0,resizable=yes,scrollbars=yes');
			
			}
		   
			  /*
			   * 화면 POPUP
			   */
			  function tmt_winLaunch(theURL,winName,targetName,features) {
			  	
			  	var targetRandom=Math.random();
			  	eval(winName+"=window.open('"+theURL+"','"+targetRandom+"','"+features+"')");

			  }
		
	</script>
<form:form class="form-inline" role="form" commandName="asConVO" id="asConForm" name="asConForm" method="post" action="" >
 <input type="hidden" name="curPage"             id="curPage"            value="${curPage}" />
 <input type="hidden" name="rowCount"            id="rowCount"           value="10"/>
 <input type="hidden" name="totalCount"          id="totalCount"         value=""  />
 </form:form>
<!-- container -->
  <div id="container" class="comunity" >
    <div id="m_content" >
      <div class="clm_order_detail">
        <!-- 타이틀 -->
        <div class="clm_acdo_tit">
          <h1>A/S 상세</h1>
          <div class="clm_acdo_tit_left">
            <a href="javascript:goPageAsPageList();" class="btn b_prev"><span class="sp_prev">이전</span></a>
          </div>
        </div>
        <!--// 타이틀 --> 
        <!-- 1.접수정보 -->
        <div class="clm_acdo_tit2">
          <h2 class="h2_txo"> <strong><em class="num">1. </em></strong>접수정보</h2>
          <a href="javascript:void(0)" class="tit_desc"> <span class="sp_odr ic_arr">&nbsp;</span> </a>
        </div>
        <div class="clm_acdo_sec">
          <dl class="clm_ip2">
            <dt><span class="tit">접수일</span></dt>
            <dd>
              <p class="tx1">${asVO.asStartDateTime}</p>
            </dd>
          </dl>
          <hr class="odr_line_ty1">
          <dl class="clm_ip2">
            <dt><span class="tit">모델명</span></dt>
            <dd>
              <p class="tx2">${asVO.productName}</p>
            </dd>
          </dl>
          <hr class="odr_line_ty1">
          <dl class="clm_ip2">
            <dt><span class="tit">증상사진</span></dt>
            <dd> <span class="img_area"> <span><a href="javascript:AutoResize('${asVO.asImage}')"><img src="${asVO.asImage}" alt="상품이미지"></a></span></dd>
          </dl>
          <hr class="odr_line_ty1">
          <dl class="clm_ip2">
            <dt><span class="tit">증상</span></dt>
            <dd>
              <p class="tx1">${asVO.asDetail}</p>
            </dd>
          </dl>
          <hr class="odr_line_ty1">
          <dl class="clm_ip2">
            <dt><span class="tit">요청사항</span></dt>
            <dd>
              <p class="tx1">${asVO.customerRequest}</p>
            </dd>
          </dl>
          <hr class="odr_line_ty1">
          <dl class="clm_ip2">
            <dt><span class="tit">진행상황</span></dt>
            <dd>
              <p class="tx4">${asVO.asStateTrans}</p>
            </dd>
          </dl>
        </div>
        <!--// 1. 접수정보 --> 
        <!-- 2.배송정보 -->
        <div class="clm_acdo_tit2">
          <h2 class="h2_txo"> <strong><em class="date">2.</em></strong>&nbsp;배송정보</h2>
          <a href="javascript:void(0)" class="tit_desc"> <span class="sp_odr ic_arr">&nbsp;</span> </a>
        </div>
        <div class="clm_acdo_sec">
          <dl class="clm_ip2">
            <dt><span class="tit">받는분</span></dt>
            <dd>
              <p class="tx1">${asVO.receiveName}&nbsp; </p>
            </dd>
          </dl>
          <hr class="odr_line_ty1">
          <dl class="clm_ip2">
            <dt><span class="tit">연락처</span></dt>
            <dd>
              <p class="tx1">${asVO.receiveTelNo}
            </dd>
          </dl>
          <hr class="odr_line_ty1">
          <dl class="clm_ip2">
            <dt><span class="tit">주소</span></dt>
            <dd>
              <p class="tx1">
                ${asVO.receiveAddress} <br>
                ${asVO.receiveAddressDetail}
            </dd>
          </dl>
          <hr class="odr_line_ty1">
          <dl class="clm_ip2">
            <dt><span class="tit">운송업체</span></dt>
            <dd>
              <p class="tx1">
                ${asVO.reTransport}
                 <c:choose>
   						 <c:when test="${asVO.reTransurl!='N'}">
   						    <input type="hidden" name="reTransurl_Modify" id="reTransurl_Modify" value="${asVO.reTransurl}" >
   						    <input type="hidden" name="reTransportNo_Modify" id="reTransportNo_Modify" value="${asVO.reTransportNo}" >
   						  	[운송장 번호] :<a href="javascript:fcAs_reTranspath();"><span id="reTransNoId">${asVO.reTransportNo}</span></a>
	             	 	 </c:when>
						 <c:otherwise>
						    <input type="hidden" name="reTransurl_Modify" id="reTransurl_Modify" value="${asVO.reTransurl}" >
   						    <input type="hidden" name="reTransportNo_Modify" id="reTransportNo_Modify" value="${asVO.reTransportNo}" >
						  	[운송장 번호] : ${asVO.reTransportNo}
						 </c:otherwise>
	 			  </c:choose>
            </dd>
          </dl>
        </div>
        <!--// 2.배송정보 -->
     	<c:if test="${asVO.asSubState=='08'}">
        <div class="clm_detail_btn">
          <div class="clm_btn">
            <a href="javascript:fcAs_StateProcess('${asVO.asNo}','09','10','고객직접 수령확인');" class="btn_ty2">수령확인</a>
          </div>
        </div>
       </c:if>
      </div>
    </div>
  </div>
  <!-- //container -->