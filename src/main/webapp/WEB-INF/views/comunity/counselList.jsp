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
    function fcCs_View(idx,counselResult,userName,customerKey,counsel,counselImage,counselResultImage) {

    	var curPage='${csConVO.curPage}';
    	var groupId='${csConVO.groupId}';

    	$.ajax({
            type: "POST",
            url:  '<%= request.getContextPath() %>/comunity/counseldetail?idx='+idx+'&counselResult='+encodeURIComponent(counselResult)+'&userName='+encodeURIComponent(userName)+'&counsel='+encodeURIComponent(counsel)+'&customerKey='+customerKey+'&counselImage='+counselImage+'&counselResultImage='+counselResultImage+'&curPage='+curPage+'&groupId='+groupId,
            success: function(result) {
             
                   $("#counselList").html(result);
            },
            error:function(){

            }
        });
    }
    
    // 페이지 이동
    function fcReg_counselView() {

    	var curPage='${csConVO.curPage}';
    	var groupId='${csConVO.groupId}';

    	$.ajax({
            type: "POST",
            url:  '<%= request.getContextPath() %>/comunity/counselregistform?curPage='+curPage+'&groupId='+groupId,
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
      <div class="clm_acdo_tit">
          <h1>문의하기</h1>
            <a href="javascript:fcReg_counselView();" class="btn_ask">문의등록</a>
        </div>
          <div class="cs_cont">
       		<ul class="cs_list">
          	<c:if test="${!empty counselList}">
            <c:forEach items="${counselList}" var="CounselVO" varStatus="status">
            <!-- List -->
            <li><a href="javascript:fcCs_View('${CounselVO.idx}','${CounselVO.counselResult}','${CounselVO.userName}','${CounselVO.customerKey}','${CounselVO.counsel}','${CounselVO.counselImage}','${CounselVO.counselResultImage}')" class="box"> 
            <span class="title"><span class="cc_ellip_in">
            <c:if test="${CounselVO.counselResult!=null && CounselVO.counselResult!=''}">
            	<span class="type"><span class="type_in">답변완료</span>
            	</span>
             </c:if>
            &nbsp;${CounselVO.counsel}
            <c:if test="${CounselVO.counselImage!=null && CounselVO.counselImage!=''}">
            <span class="photo">사진</span>
            </c:if>
            </span></span> 
            <span class="date">${CounselVO.counselDateTime}</span> 
            </a></li>
            <!--// List -->
            </c:forEach>
            </c:if>
            <c:if test="${empty counselList}">
           <!-- List -->
            <li><a href="#" class="box"> 
            <span class="title"><span class="cc_ellip_in">
           
            &nbsp;등록된 문의내역이 없습니다.
           
            </span></span> 
            <span class="date"></span> 
            </a></li>
            <!--// List -->
          </c:if>
          </ul>
        </div>
         <!-- 페이징 -->
	     <taglib:paging cbFnc="goPageCsPageList" totalCount="${totalCount}" curPage="${csConVO.curPage}" rowCount="${csConVO.rowCount}" />
	     <!-- //페이징 -->
    </div>
  </div>
  </form:form>
  <!-- //container -->

   