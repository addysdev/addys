<%@ include file="/WEB-INF/views/addys/base.jsp" %>
<script>
      
	    // 페이지 이동
	    function goPageCsPageList() {

	        var dataParam = $("#csConForm").serialize();
	        commonDim(true);
	        $.ajax({
	            type: "POST",
	            url:  "<%= request.getContextPath() %>/comunity/counsellist",
	              data:dataParam,
	            success: function(result) {
	                   commonDim(false);
	                   $("#counselList").html(result);
	            },
	            error:function(){
	                commonDim(false);
	            }
	        });
	    }

</script>
<form:form class="form-inline" role="form" commandName="csConVO" id="csConForm" name="csConForm" method="post" action="" >
 <input type="hidden" name="curPage"             id="curPage"            value="${curPage}" />
 <input type="hidden" name="rowCount"            id="rowCount"           value="10"/>
 <input type="hidden" name="totalCount"          id="totalCount"         value=""  />
 <input type="hidden" name=groupId          id="groupId"         value="${groupId}"  />
 </form:form>
<!-- container -->
  <div id="container" class="comunity" >
    <div id="m_content" >
      <div class="clm_order_detail">
        <!-- 타이틀 -->
        <div class="clm_acdo_tit">
          <h1>문의하기 상세</h1>
          <div class="clm_acdo_tit_left">
            <a href="javascript:goPageCsPageList();" class="btn b_prev"><span class="sp_prev">이전</span></a>
          </div>
        </div>
        <!--// 타이틀 --> 
        <!-- 1.문의내용 -->
        <div class="clm_acdo_tit2">
          <h2 class="h2_txo"> <strong><em class="num">1. </em></strong>문의내용</h2>
          <a href="javascript:void(0)" class="tit_desc"> <span class="sp_odr ic_arr">&nbsp;</span> </a>
        </div>
        <div class="clm_acdo_sec">
          <dl class="clm_ip2">
            <dt><span class="tit">문의내용</span></dt>
            <dd>
              <p class="tx2">${counsel}</p>
            </dd>
          </dl>
          <c:if test="${counselImage!=null && counselImage!=''}">
          <hr class="odr_line_ty1">
          <dl class="clm_ip2">
            <dt><span class="tit">이미지</span></dt>
            <dd> <span class="img_area"> <span><a href="javascript:AutoResize('${counselImage}')"><img src="${counselImage}" alt="이미지"></a></span></dd>
          </dl>
          </c:if>
        </div>
        <!--// 1. 문의내용 --> 
        <c:if test="${counselResult!=null && counselResult!=''}">
        <!-- 2.답변내용 -->
        <div class="clm_acdo_tit2">
          <h2 class="h2_txo"> <strong><em class="date">2.</em></strong>&nbsp;답변내용</h2>
          <a href="javascript:void(0)" class="tit_desc"> <span class="sp_odr ic_arr">&nbsp;</span> </a>
        </div>
        <div class="clm_acdo_sec">
          <dl class="clm_ip2">
            <dt><span class="tit">담당자</span></dt>
            <dd>
              <p class="tx1">${userName}&nbsp; </p>
            </dd>
          </dl>
          <hr class="odr_line_ty1">
          <dl class="clm_ip2">
            <dt><span class="tit">답변</span></dt>
            <dd>
              <p class="tx1">${counselResult}
            </dd>
          </dl>
        </div>
        <!--// 2.답변내용 -->
        </c:if>
      </div>
    </div>
  </div>
  <!-- //container -->