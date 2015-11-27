<%@ include file="/WEB-INF/views/addys/base.jsp" %>
      <form:form commandName="CounselVO" name="counselListForm" method="post" action="" >
	  <table class="table table-striped">
	    <tbody>
	    	<c:if test="${!empty counselList}">
             <c:forEach items="${counselList}" var="CounselVO" varStatus="status">
              <tr id="selectRequest_${CounselVO.idx}">
                <c:choose>
        			<c:when test="${CounselVO.counselResult!=''}">
						<td class='text-left'>
						<a href="javascript:resultView('${CounselVO.idx}','${CounselVO.counselResult}','${CounselVO.userName}','${CounselVO.customerKey}','${CounselVO.counsel}','${CounselVO.counselImage}')">
						${CounselVO.counselDateTime} ${CounselVO.counsel}
						<c:if test="${CounselVO.counselImage!=null}">
						<img src='${CounselVO.counselImage}' width="20" height="20" />
						</c:if>
						<font style="color:red">[답변완료]</font>
						</a>
						</td>
					</c:when>
					<c:otherwise>
						<td class='text-left'>
						<a href="javascript:resultView('${CounselVO.idx}','${CounselVO.counselResult}','${CounselVO.userName}','${CounselVO.customerKey}','${CounselVO.counsel}','${CounselVO.counselImage}')">
						<c:out value="${CounselVO.counselDateTime} ${CounselVO.counsel}"></c:out>
						<c:if test="${CounselVO.counselImage!=null}">
						<img src='${CounselVO.counselImage}' width="20" height="20" />
						</c:if>
						</a>
						</td>
					</c:otherwise>
				</c:choose>
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
	  <button id="deferbtn" type="button" class="btn btn-danger btn-sm" onClick="fcReg_counsel()" >문의하기</button>
	 </form:form>

