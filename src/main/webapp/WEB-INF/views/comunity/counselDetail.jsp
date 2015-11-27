<%@ include file="/WEB-INF/views/addys/base.jsp" %>
<SCRIPT>

</SCRIPT>

<body>
<div class="container-fluid">

<p>
<textarea style='width:210px;height:110px;ime-mode:active;' row="6" class="form-control" id="counselResult" maxlength="200" name="counselResult"  value="[문의내용] ${counsel}" disabled >[문의내용] ${counsel}</textarea>
</p>
<c:if test="${counselImage!=null && counselImage!=''}">
이미지 : <img src='${counselImage}' />
</c:if>
<c:if test="${counselResult!=null && counselResult!=''}">
<br>
<p>
<textarea style='width:210px;height:110px;ime-mode:active;' row="6" class="form-control" id="counselResult" maxlength="200" name="counselResult"  value="[답변내용-${userName}] ${counselResult}" disabled >[답변내용-${userName}] ${counselResult}</textarea>
</p>
</c:if>
</div>
</body>
