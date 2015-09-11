<%@ include file="/WEB-INF/views/addys/base.jsp" %>
      <form:form commandName="ComunityVO" name="comunityListForm" method="post" action="" >
	  <table class="table table-striped">
	    <tbody>
	    	<c:if test="${!empty comunityList}">
             <c:forEach items="${comunityList}" var="ComunityVO" varStatus="status">
              <tr id="select_tr_${ComunityVO.customerKey}">
               <c:choose>
        			<c:when test="${ComunityVO.replyCnt>0}">
						<td class='text-left'>
						<a href="javascript:replyView(${ComunityVO.idx})">[${ComunityVO.commentDateTime}]  ${ComunityVO.comment} (${ComunityVO.replyCnt})</a></td>
					</c:when>
					<c:otherwise>
						<td class='text-left'><c:out value="[${ComunityVO.commentDateTime}] ${ComunityVO.comment}"></c:out></td>
					</c:otherwise>
				</c:choose>
              </tr>
             </c:forEach>
            </c:if>
           <c:if test="${empty comunityList}">
           <tr>
           	<td class='text-center'>등록된 글이 없습니다.</td>
           </tr>
          </c:if>
	    </tbody>
	  </table>
	  <button id="deferbtn" type="button" class="btn btn-primary btn-sm" onClick="fcReg_comment()" >글올리기</button>
	 </form:form>

