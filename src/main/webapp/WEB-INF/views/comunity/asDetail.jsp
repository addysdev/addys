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

	//
		
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
		<td rowspan='3' align='center' >고객정보</td>
		<td align='center' >고객명</td>
		<td colspan='4' align='left'>&nbsp;${asVO.customerName}</td>
		</tr>
		<tr >
		<td align='center' >연락처</td>
		<td colspan='4' align='left'>&nbsp;${asVO.customerKey}</td>
		</tr>
		<tr >
		<td align='center' >배송주소</td>
		<td colspan='4' align='left'>&nbsp;${asVO.receiveAddress} ${asVO.receiveAddressDetail}</td>
		</tr>
		<tr >
		<td rowspan='4' align='center' >상품정보</td>
		<td align='center' >상품명</td>
		<td colspan='4' align='left'>&nbsp;${asVO.productName}</td>
		</tr>
		<tr >
		<td align='center' >결제방법</td>
		<td colspan='4' align='left'>&nbsp;</td>
		</tr>
		<tr >
		<td align='center' >증상</td>
		<td colspan='4' align='left'>&nbsp;${asVO.asDetail}</td>
		</tr>
		<tr >
		<td align='center' >구입일</td>
		<td colspan='4' align='left'>&nbsp;${asVO.purchaseDate}</td>
		</tr>
		</table>
		<br>
		처리이력
		<table  align='center' class='style1' >
		<tr >
			<td align='center' height='27'>처리일시</td>
			<td colspan='5' align='center'>상태</td>
		</tr>
		
		<tr >
			<td align='center' height='27'>2015/11/27</td>
		    <td colspan='5' align='left'>&nbsp;접수완료</td>
		</tr>	
	   </table>
	  </form:form>
	</div>
  </body>
</html>