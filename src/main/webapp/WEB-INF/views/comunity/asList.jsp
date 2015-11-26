<%@ include file="/WEB-INF/views/addys/base.jsp" %>
      <form:form commandName="AsVO" name="asListForm" method="post" action="" >
	  <table class="table table-striped">
	    <tbody>
	    	<c:if test="${!empty asList}">
             <c:forEach items="${asList}" var="AsVO" varStatus="status">
              <tr id="selectRequest_${AsVO.idx}">
				<td class='text-left'>
					<c:out value="${AsVO.asStartDateTime}"></c:out>
					<c:out value="${AsVO.productName}"></c:out>
				</td>
              </tr>
             </c:forEach>
            </c:if>
           <c:if test="${empty asList}">
           <tr>
           	<td class='text-center'>등록된 AS가 없습니다.</td>
           </tr>
          </c:if>
	    </tbody>
	  </table>
	 </form:form>

