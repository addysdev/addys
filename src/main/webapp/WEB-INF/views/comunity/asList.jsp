<%@ include file="/WEB-INF/views/addys/base.jsp" %>
      <form:form commandName="AsVO" name="asListForm" method="post" action="" >
	  <table class="table table-striped">
	    <tbody>
	    	<c:if test="${!empty asList}">
             <c:forEach items="${asList}" var="AsVO" varStatus="status">
              <tr id="selectRequest_${AsVO.asNo}">
				<td class='text-left'>
				    <a href="javascript:fcAs_Detail('${AsVO.asNo}')">
					<c:out value="${AsVO.asStartDateTime}"></c:out>
					<img src='${AsVO.asImage}' width="20" height="20" />
					<c:out value="[${AsVO.group1Name}]"></c:out>
					<c:out value="${AsVO.productName}"></c:out>
					</a>
					<button id="deferbtn" type="button" class="btn btn-success btn-sm"  >수령확인</button>
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

