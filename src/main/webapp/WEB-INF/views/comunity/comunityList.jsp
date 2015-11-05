<%@ include file="/WEB-INF/views/addys/base.jsp" %>
     <form:form commandName="ComunityVO" name="comunityListForm" method="post" action="" >
	  <table class="table">
	    <tbody>
	         <tr style="background-color:#D1D1D1" >
             <th><div class="form-inline text-center"><img vertical-align="bottom" height="50px" width="50px" src="http://icons.iconarchive.com/icons/hopstarter/sleek-xp-basic/256/User-Group-icon.png"></div> </th>
             <th><div class="form-inline text-center"><img vertical-align="bottom" height="50px" width="50px" src="http://cfile10.uf.tistory.com/image/1338853B4EF3328E14CCA7"></div> </th>
             </tr>
	    	<c:if test="${!empty comunityList}">
             <c:forEach items="${comunityList}" var="ComunityVO" varStatus="status">
             <tr id="select_tr_${ComunityVO.customerKey}">
              <c:choose>
		        <c:when test="${ComunityVO.commentType=='Y'}">
	             <th></th>
				 <th>
				 	<div class="form-inline text-center">
				 	<input style="width:150px"  disabled type="text" class="form-control"  value="${ComunityVO.comment}" placeholder="수신" />
			 		</div> 
				 </th>
				</c:when>
				<c:otherwise>
				 <th>
					 <div class="form-inline text-center">
					 <input style="width:150px" disabled type="text" class="form-control"  value="${ComunityVO.comment}" placeholder="수신" /></th>
				     </div> 
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
	  <button id="deferbtn" type="button" class="btn btn-primary btn-sm" onClick="fcReg_comment()" >talk하기</button>
	 </form:form>