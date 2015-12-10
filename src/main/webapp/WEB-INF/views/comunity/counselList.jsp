<%@ include file="/WEB-INF/views/addys/base.jsp" %>
<SCRIPT>
    // 페이지 이동
    function goPageCsPageList(page) {
        document.csConForm.curPage.value = page;
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
    
    // 페이지 이동
    function fcCs_View(idx,counselResult,userName,customerKey,counsel,counselImage) {

    	var curPage='${csConVO.curPage}';
    	var groupId='${csConVO.groupId}';

    	$.ajax({
            type: "POST",
            url:  '<%= request.getContextPath() %>/comunity/counseldetail?idx='+idx+'&counselResult='+encodeURIComponent(counselResult)+'&userName='+encodeURIComponent(userName)+'&counsel='+encodeURIComponent(counsel)+'&customerKey='+customerKey+'&counselImage='+counselImage+'&curPage='+curPage+'&groupId='+groupId,
            success: function(result) {
             
                   $("#counselList").html(result);
            },
            error:function(){

            }
        });
    }
    


</SCRIPT>
 <!-- container -->
<form:form class="form-inline" role="form" commandName="csConVO" id="csConForm" name="csConForm" method="post" action="" >
 <input type="hidden" name="curPage"             id="curPage"            value="1" />
 <input type="hidden" name="rowCount"            id="rowCount"           value="10"/>
 <input type="hidden" name="totalCount"          id="totalCount"         value=""  />
  <div id="container" class="comunity" >
    <div id="m_content" >
      <div class="clm_acdo_cont">
        <div class="clm_acdo_tit">
          <h1>문의하기</h1>
        </div>
        <div class="clm_acdo_sec">
          <ul class="odr_goods_lst">
          	<c:if test="${!empty counselList}">
            <c:forEach items="${counselList}" var="CounselVO" varStatus="status">
            <!-- List -->
            <li>
              <div class="clm_acont ">
                <div class="order_acont">
                  <div class="display_store">
                    <span class="place"> <span class="date">${CounselVO.counselDateTime}</span> </span> <span class="type"><span class="type_in">답변완료</span></span>
                  </div>
                  <span class="img_area"> <span> <img src="${CounselVO.counselImage}" alt="" > </span> </span>
                  <div class="summary">
                    <div>
                      <a href="javascript:fcCs_View('${CounselVO.idx}','${CounselVO.counselResult}','${CounselVO.userName}','${CounselVO.customerKey}','${CounselVO.counsel}','${CounselVO.counselImage}')">${CounselVO.counsel}</a>
                    </div>
                  </div>
                </div>
              </div>
            </li>
            <!--// List -->
            </c:forEach>
            </c:if>
          </ul>
        </div>
      </div>
     <!-- 페이징 -->
     <taglib:paging cbFnc="goPageAsPageList" totalCount="${totalCount}" curPage="${csConVO.curPage}" rowCount="${csConVO.rowCount}" />
     <!-- //페이징 -->
    </div>
  </div>
  </form:form>
  <!-- //container -->


   