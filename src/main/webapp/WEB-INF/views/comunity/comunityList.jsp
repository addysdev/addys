<%@ include file="/WEB-INF/views/addys/base.jsp" %>
      <form:form commandName="ComunityVO" name="comunityListForm" method="post" action="" >
	  <table class="table table-striped">
	    <tbody>
	    	<c:if test="${!empty comunityList}">
             <c:forEach items="${comunityList}" var="ComunityVO" varStatus="status">
              <tr id="select_tr_${ComunityVO.customerKey}">
				<td class='text-left'><c:out value="${ComunityVO.comment}"></c:out></td>
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

