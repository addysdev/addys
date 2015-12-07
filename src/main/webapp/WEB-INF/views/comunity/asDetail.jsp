<%@ include file="/WEB-INF/views/addys/base.jsp" %>
<!DOCTYPE html>
<html>
 <head>
  <style type='text/css'> 
		        <!--
				table {
				    border-collapse: collapse;
				}

				table, th, td {
				    border: 1px solid black;
				}
				.style1 {
			    	font-size: 15px;
					font-family: '돋움체', '굴림체', Seoul;
		        }
				body {color : #000000; background : #FFFFFF; font-family : 굴림,"Times New Roman"; font-size : 12pt;}
				
				@page{  size:auto; margin : 10mm;  }
				
				h1 {page-break-before: always;}

				-->
				</style>
				
	<script>

	  function fcAs_StateProcess(asNo,asState,asSubState,asHistory){
			  
			  if (confirm('A/S 제품을 정상적으로 수령하셨습니까?')){
					
					$.ajax({
				        type: "POST",
				        async:false,
				           url:  "<%= request.getContextPath() %>/comunity/asstateprocess?asNo="+asNo+"&asState="+asState+"&asSubState="+asSubState+"&asHistory="+encodeURIComponent(asHistory),			  
				           success: function(result) {
	
								if(result=='1'){
									 alert('A/S 제품을 정상거으로 수령 완료하셨습니다.');
								} else{
									 alert('A/S 처리상태 변경을 실패했습니다.');
								}
								
								$('#asDetail').dialog('close');
								fcAs_listSearch();
								
				           },
				           error:function(){
				        	   
				        	   alert('A/S 처리상태 변경을 실패했습니다.');
				        	   $('#asDetail').dialog('close');
				           }
				    });
					
				}
			  
			  
		  }
		
	</script>
  </head>
  <body>
	<div class="container-fluid">
	<form:form commandName="asVO" id="asDetailForm"  name="asDetailForm" method="post" action="" >
	<table align='center' class='style1' >
		<tr > 
		<td colspan='6' align='center'>접 수 증</td>
		</tr>
		<tr >
		<td align='center' >접수일</td>
		<td align='left'>&nbsp;${asVO.asStartDateTime}</td>
		<td align='center' >접수지점</td>
		<td align='left'>&nbsp;${asVO.groupName}</td>
		<td align='center' >담당자</td>
		<td align='left'>&nbsp;${asVO.asStartUserName}</td>
		</tr>
		<tr >
		<td rowspan='5' align='center' >고객정보</td>
		<td align='center' >의로인</td>
		<td colspan='4' align='left'>&nbsp;${asVO.customerName}</td>
		</tr>
		<tr >
		<td align='center' >의뢰인연락처</td>
		<td colspan='4' align='left'>&nbsp;${asVO.customerKey}</td>
		</tr>
		<tr >
		<td align='center' >수령인</td>
		<td colspan='4' align='left'>&nbsp;${asVO.receiveName}</td>
		</tr>
		<tr >
		<td align='center' >수령인연락처</td>
		<td colspan='4' align='left'>&nbsp;${asVO.receiveTelNo}</td>
		</tr>
		<tr >
		<td align='center' >배송주소</td>
		<td colspan='4' align='left'>&nbsp;${asVO.receiveAddress} ${asVO.receiveAddressDetail}</td>
		</tr>
		<tr >
		<td rowspan='6' align='center' >상품정보</td>
		<td align='center' >브랜드명</td>
		<td colspan='4' align='left'>&nbsp;${asVO.productName}</td>
		</tr>
		<tr >
		<td align='center' >A/S정책</td>
		<td colspan='4' align='left'>&nbsp;${asVO.asPolicy}</td>
		</tr>
		<tr >
		<td align='center' >모델명</td>
		<td colspan='4' align='left'>&nbsp;${asVO.productName}</td>
		</tr>
		<tr >
		<td align='center' >증상</td>
		<td colspan='4' align='left'>&nbsp;<a href="javascript:AutoResize('${asVO.asImage}')"><img src='${asVO.asImage}' width="30" height="30" /></a>${asVO.asDetail}</td>
		</tr>
		<tr >
		<td align='center' >의뢰인 요청사항</td>
		<td colspan='4' align='left'>&nbsp;${asVO.customerRequest}</td>
		</tr>
		<tr >
		<td align='center' >구입일</td>
		<td colspan='4' align='left'>&nbsp;${asVO.purchaseDate}</td>
		</tr>
		<tr >
		<td align='center' >왼료예정일</td>
		<td align='left' colspan='5' >&nbsp;${asVO.asTargetDate}</td>
		</tr>
		<tr >
		<td align='center' >메모</td>
		<td align='left' colspan='5' >&nbsp;${asVO.memo}</td>
		</tr>
		</table>
		<br>
		처리이력
		<c:if test="${asVO.asSubState=='08'}">
       		<button type="button" class="btn btn-success" onClick="fcAs_StateProcess('${asVO.asNo}','09','10','고객직접 수령확인')">고객수령확인</button>
       	</c:if>
		<table  align='center' class='style1' >
		 <c:if test="${!empty asList}">
	        <c:forEach items="${asList}" var="asListVO" varStatus="status">
				<tr >
					<td align='center' height='27' width="100">${asListVO.asHistoryDateTime}</td>
					<td align='center' height='27'  width="100">${asListVO.userName}</td>
					<td align='center' height='27'  width="100">${asListVO.asStateTrans}</td>
                    <td align='center' height='27'  width="100">${asListVO.centerAsNo}</td>

					<c:if test="${AsVO.centerImage!=null}">
	                 <a href="javascript:AutoResize('${AsVO.centerImage}')"><img src='${AsVO.centerImage}' width="20" height="20" /></a>
					 </c:if>
				</tr>
		 	</c:forEach>
	   	</c:if>
	   </table>
	  </form:form>
	</div>
  </body>
</html>