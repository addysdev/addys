<%@ include file="/WEB-INF/views/addys/base.jsp" %>
     <form:form commandName="ComunityVO" name="comunityListForm" method="post" action="" >
       <!-- container -->
		  <div id="container">
		    <div class="talk_board" >
		      <table class="tbl_base" >
			    <c:if test="${!empty comunityList}">
	             <c:forEach items="${comunityList}" var="ComunityVO" varStatus="status">
					<c:choose>
			        <c:when test="${ComunityVO.commentType=='Y'}">
				 	<!-- you -->
			        <tr>
			          <td class="you" colspan="2"><div class="msg_box" >
			          <div class="id">애디스[${ComunityVO.groupName}]</div>
			            <div class="talk">${ComunityVO.comment}</div><p class="time"><span>${ComunityVO.commentDateTime}</span></p></div></td>
			          <td class="profile"><div class="prof_icon">
			        	  <img src="${ComunityVO.customerKey1}" /></div></td>
			 		<!--//you -->
					</c:when>
					<c:otherwise>
	         		<!-- me -->
			        <tr>
			          <td class="profile" ><div class="prof_icon">
			        	    <img src="${ComunityVO.customerKey1}" />
			          <td class="me" colspan="2">
			          <div class="msg_box" >
			              <div class="id">${ComunityVO.customerKey}</div>
			              <c:choose>
			      		  	<c:when test="${ComunityVO.commentImage==''}">
			      		  		<div class="talk">${ComunityVO.comment}</div>
			              	</c:when>
							<c:otherwise>
								<div class="talk">${ComunityVO.comment}
								<br><img src='http://127.0.0.1:19001${ComunityVO.commentImage}' id='${ComunityVO.idx}' />
								<script>if(document.all('I${ComunityVO.idx}').width>300){document.all('I${ComunityVO.idx}').width=300};</script>
								</div>
							</c:otherwise>
				  		  </c:choose>
			              <div class="time" ><span>${ComunityVO.commentDateTime}</span></div>
			            </div></td>
			 		<!--//me -->
					</c:otherwise>
				  </c:choose>
	             </c:forEach>
	            </c:if>
		      </table>
		      <table id="fset" name="fset">
		      </table>
		    </div>
		  </div>
	<!-- //container -->
	</form:form>

