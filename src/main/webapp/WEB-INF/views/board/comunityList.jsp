<%@ include file="/WEB-INF/views/addys/base.jsp" %>
<SCRIPT>
    
</SCRIPT>
     <form:form commandName="orderVO" name="orderPageListForm" method="post" action="" >
	  <table class="table table-bordered">
	    <tbody>
	    	<c:if test="${!empty comunityList}">
             <c:forEach items="${comunityList}" var="ComunityVO" varStatus="status">
             <tr id="select_tr_${ComunityVO.customerKey}">
              <c:choose>
		        <c:when test="${ComunityVO.commentType=='Y'}">
		             <th></th>
					 <th><input disabled type="text" class="form-control"  value="[${ComunityVO.customerKey}]&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${ComunityVO.comment}" placeholder="수신" /></th>
				</c:when>
				<c:otherwise>
 					 <th class='text-left'><input disabled type="text" class="form-control"  value="[${ComunityVO.customerKey}]&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${ComunityVO.comment}" placeholder="수신" /></th>
				     <th></th>
				</c:otherwise>
			  </c:choose>
              </tr>
             </c:forEach>
            </c:if>
           <c:if test="${empty comunityList}">
           <tr>
           	<td colspan='2' class='text-center'>등록된 글이 없습니다.</td>
           </tr>
          </c:if>
	    </tbody>
	  </table>
	 </form:form>

