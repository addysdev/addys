<%@ include file="/WEB-INF/views/addys/base.jsp" %>	
<!-- container -->
  <div id="container" class="comunity" >
    <div id="m_content" >
     <!-- 타이틀 -->
        <div class="clm_acdo_tit">
          <h1>매장톡</h1>
          <div class="clm_acdo_tit_left">
            <a href="javascript:fcReg_comment();" class="btn b_prev">talk</a>
          </div>
        </div>
        <!--// 타이틀 --> 
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
				            <c:choose>
				      		  	<c:when test="${ComunityVO.commentImage==null}">
				      		  		<div class="talk">${ComunityVO.comment}</div>
				              	</c:when>
								<c:otherwise>
									<div class="talk">
									<c:if test="${ComunityVO.comment!=''}">
										${ComunityVO.comment}
									</c:if>
									<a href="javascript:AutoResize('${ComunityVO.commentImage}')"><img src='${ComunityVO.commentImage}' width="30" height="30" /></a>
									</div>
								</c:otherwise>
					  		  </c:choose>
				            <p class="time"><span>${ComunityVO.commentDateTime}</span></p></div></td>
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
			              <c:choose>
			      		  	<c:when test="${ComunityVO.commentImage==null}">
			      		  		<div class="talk">${ComunityVO.comment}</div>
			              	</c:when>
							<c:otherwise>
								<div class="talk">
								<c:if test="${ComunityVO.comment!=''}">
									${ComunityVO.comment}
								</c:if>
								<a href="javascript:AutoResize('${ComunityVO.commentImage}')"><img src='${ComunityVO.commentImage}' width="30" height="30" /></a>
								</div>
							</c:otherwise>
				  		  </c:choose>
			              <div class="time" ><span>${ComunityVO.commentDateTime}</span></div>
			            </div></td>
					</tr>
		 			<!--//me -->
					</c:otherwise>
				  </c:choose>
	             </c:forEach>
	            </c:if>
		      </table>
		      
		      <table id="fset" name="fset">
		      </table>
		    </div>
		    <div id="chat_box">
        <div class="chat_box">
                  <div class="inpfiles">
						<label for="user_pic_add">첨부</label>
						<span class="file"><input type="file" ></span>
					</div>

          <div class="chat">
           이용방법을 알고 싶어요이용방법을 알고 싶어요이용방법을 알고 싶어요이용방법을 알고 싶어요이용방법을 알고 싶어요이용방법을 알고 싶어요이용방법을 알고 싶어요이용방법을 알고 싶어요이용방법을 알고 싶어요이용방법을 알고 싶어요이용방법을 알고 싶어요이용방법을 알고 싶어요이용방법을 알고 싶어요이용방법을 알고 싶어요이용방법을 알고 싶어요이용방법을 알고 싶어요이용방법을 알고 싶어요이용방법을 알고 싶어요이용방법을 알고 싶어요이용방법을 알고 싶어요이용방법을 알고 싶어요이용방법을 알고 싶어요이용방법을 알고 싶어요이용방법을 알고 싶어요이용방법을 알고 싶어요이용방법을 알고 싶어요이용방법을 알고 싶어요이용방법을 알고 싶어요이용방법을 알고 싶어요이용방법을 알고 싶어요이용방법을 알고 싶어요이용방법을 알고 싶어요
          </div>
          <a href="#" class="btn_chat">전송</a>
        </div>
      </div>
</div>
 </div>
	<!-- //container -->