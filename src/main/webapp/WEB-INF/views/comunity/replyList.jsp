
<%@ include file="/WEB-INF/views/addys/base.jsp" %>
      <form:form commandName="CounselVO" name="counselListForm" method="post" action="" >
	  <table class="table table-striped">
	    <tbody>
	    	<c:if test="${!empty comunityReply}">
	             <c:forEach items="${comunityReply}" var="comunityVO" varStatus="status">
	            	 <tr id="select_tr_${comunityVO.idx}">
	               	  <td class='text-left'><c:out value="[${comunityVO.commentDateTime}] ${comunityVO.comment}   (${comunityVO.userName})"></c:out></td>
	                 </tr>
	             </c:forEach>
	            </c:if>
	           <c:if test="${empty comunityReply}">
	              <tr>
	                  <td colspan='3' class='text-center'>조회된 데이터가 없습니다.</td>
	              </tr>
	          </c:if>
	    </tbody>
	  </table>
	 </form:form>    
