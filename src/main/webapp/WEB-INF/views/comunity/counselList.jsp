<%@ include file="/WEB-INF/views/addys/base.jsp" %>
      <form:form commandName="CounselVO" name="counselListForm" method="post" action="" >
	  <table class="table table-striped">
	    <tbody>
	    	<c:if test="${!empty counselList}">
             <c:forEach items="${counselList}" var="CounselVO" varStatus="status">
              <tr id="select_tr_${CounselVO.customerKey}">
                <c:choose>
        			<c:when test="${CounselVO.counselResult!=''}">
						<td class='text-left'>
						<img vertical-align="bottom" height="20px" width="20px" src="http://images.clipartlogo.com/files/ss/thumb/121/121536733/plus-button-icon_small.jpg">
						 <a href="javascript:resultView('#select_tr_${CounselVO.idx}')">[${CounselVO.counselDateTime}]  ${CounselVO.counsel}</a></td>
					</c:when>
					<c:otherwise>
						<td class='text-left'><c:out value="[${CounselVO.counselDateTime}]  ${CounselVO.counsel}"></c:out></td>
					</c:otherwise>
				</c:choose>
              </tr>
              
              <tr id="select_tr_${CounselVO.idx}" style="display:none">
				<td class='text-left'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<c:out value="[RE]${CounselVO.counselResult} (${CounselVO.userName})"></c:out></td>
              </tr>
              
             </c:forEach>
            </c:if>
           <c:if test="${empty counselList}">
           <tr>
           	<td class='text-center'>등록된 문의내용이 없습니다.</td>
           </tr>
          </c:if>
	    </tbody>
	  </table>
	  <button id="deferbtn" type="button" class="btn btn-danger btn-sm" onClick="fcReg_counsel()" >1:1문의</button>
	 </form:form>

