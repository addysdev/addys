<%@ include file="/WEB-INF/views/addys/base.jsp" %>
<SCRIPT>

// 페이지 이동
function goPageCsPageList() {

    var dataParam = $("#counselForm").serialize();
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

function fcCounsel_close(){
	
	commonDim(false);
	
	alert('접수가 완료되었습니다.\n담당자가 확인 후 연락드리겠습니다.');
	fcCounsel_list();

}

function fcCunsel_multiRegist(){
	
    var url;
    var frm = document.counselForm;
    var fileName = '';
    var pos = '';
    var ln = '';
    var gap = '';
    var gap1 = '';
    
	var counsel=frm.counsel.value;
	
    url="<%= request.getContextPath() %>/comunity/counselmultiregist?counsel="+counsel;
	
    if($("#files").val() != ''){
    	
        fileName = document.all.files.value;
        pos = fileName.lastIndexOf("\\");
        ln = fileName.lastIndexOf("\.");
        gap = fileName.substring(pos + 1, ln);
        gap1 = fileName.substring(ln+1);
        
        if(gap1=="jpg" || gap1=="JPG" || gap1=="gif" || gap1=="GIF" || gap1=="png" || gap1=="PNG"){//
            url="<%= request.getContextPath() %>/comunity/counselmultiregist?fileName="+gap+"&extension="+gap1+"&counsel="+counsel;
        }else {
        	alert("이미지 파일만 등록 부탁드립니다.");
            return;
        }
        
    }else{
    
		if(frm.counsel.value==''){
			alert('문의하실 내용이 없습니다.');
			return;
		}
    }


    commonDim(true);
    frm.action = url;
    frm.target="file_result";

    frm.submit();        
}

</SCRIPT>
<iframe id="file_result" name="file_result" style="display: none" ></iframe>
<form:form commandName="counselVO"  id="counselForm" name="counselForm" method="post" target="file_result" enctype="multipart/form-data" >
 <input type="hidden" name="curPage"             id="curPage"            value="${curPage}" />
 <input type="hidden" name="rowCount"            id="rowCount"           value="10"/>
 <input type="hidden" name="totalCount"          id="totalCount"         value=""  />
<input type="hidden" name="customerKey" id="customerKey" value="${customerKey}" >
<input type="hidden" name="customerId" id="customerId" value="${customerId}" >
<input type="hidden" name="counselState" id="counselState" value="01" >
<input type="hidden" name="groupId" id="groupId" value="${groupId}" >
<!-- container -->
  <div id="container" class="comunity" >
    <div id="m_content" >
      <div class="clm_order_detail">
        <!-- 타이틀 -->
        <div class="clm_acdo_tit">
          <h1>문의접수하기</h1>
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
              <p class="tx2"><textarea style='height:102px;ime-mode:active;' row="4" class="form-control" id="counsel" maxlength="1000" name="counsel"  value=""  placeholder="문의"/></p>
            </dd>
          </dl>
           <hr class="odr_line_ty1">
          <dl class="clm_ip2">
            <dt><span class="tit">이미지파일</span></dt>
            <dd>
              <p class="tx1"><input type="file" id="files" name="files" /></p>
            </dd>
          </dl>
        </div>
         <div class="clm_detail_btn">
          <div class="clm_btn">
            <a href="javascript:fcCunsel_multiRegist();" class="btn_ty2">접수</a>
          </div>
        </div>
      </div>
    </div>
  </div>
  <!-- //container -->
  </form:form>
