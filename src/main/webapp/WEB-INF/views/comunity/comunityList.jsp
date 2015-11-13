<%@ include file="/WEB-INF/views/addys/base.jsp" %>	
<!-- container -->
			<button id="deferbtn" type="button" class="btn btn-primary btn-sm" onClick="fcReg_comment()" >talk하기</button>
            <br><br>
		    <div class="talk_board" >
		      <table class="tbl_base" >
			    <c:if test="${!empty comunityList}">
	             <c:forEach items="${comunityList}" var="ComunityVO" varStatus="status">
					<c:choose>
			        <c:when test="${ComunityVO.commentType=='Y'}">
			        <!-- you -->
				        <tr>
				          <td class="you"><div class="msg_box" >
				          <div class="id">애디스[${ComunityVO.groupName}]</div>
				            <div class="talk">${ComunityVO.comment}</div><p class="time"><span>${ComunityVO.commentDateTime}</span></p></div></td>
				        </tr>
				 	<!--//you -->
					</c:when>
					<c:otherwise>
					<!-- me -->
			        <tr>
			          <td class="me">
			          <div class="msg_box" >
			              <div class="id">
			                
			              </div>
			              <div class="talk">${ComunityVO.comment}</div>
			              <div class="time" ><span>${ComunityVO.commentDateTime}</span></div>
			            </div></td>
					</tr>
		 			<!--//me -->
					</c:otherwise>
				  </c:choose>
	             </c:forEach>
	            </c:if>
		      </table>
		    </div>
	<!-- //container -->