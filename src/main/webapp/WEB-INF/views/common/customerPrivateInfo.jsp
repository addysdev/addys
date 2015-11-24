<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/views/addys/base.jsp" %>
<!DOCTYPE html>
<html>
  <head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Latest compiled and minified CSS -->
	<link href="<%= request.getContextPath() %>/css/reset.css" rel="stylesheet">
	<link href="<%= request.getContextPath() %>/css/common.css" rel="stylesheet">
	<link href="<%= request.getContextPath() %>/css/style.css" rel="stylesheet">
	
	<script type="text/javascript" src="<%= request.getContextPath() %>/js/jquery-1.11.2.js"></script>
	<script type="text/javascript" src="<%= request.getContextPath() %>/jquery-ui-1.11.4.custom/jquery-ui.js"></script>
	<script type="text/javascript" src="<%= request.getContextPath() %>/bootstrap-3.3.4-dist/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="<%= request.getContextPath() %>/js/addys.js"></script>
	<script>

	function goRegistForm(){
		
		location.href="<%= request.getContextPath() %>/customerregistform";
	}

  </script>
  </head>
   <body>
  <form method="post" id="logoutForm" name="logoutForm"  role="form" >

    <div id="wrap" class="wrap" >
	  <!-- 헤더 -->
	  <header>
	    <div class="mb_top"  id="header">
	      <h1 class="head_logo"><img src="<%= request.getContextPath() %>/images/logo_addys_w.png" alt="addys"  /></h1>
	    </div>
	  </header>
	  <!--//헤더 -->    
	 <br><br><br><br>

	     <h5>1. 개인정보의 수집목적 및 이용목적
				1) 회사는 다음과 같은 목적을 위하여 개인정보를 수집하고 있습니다.
				① 성명, 아이디, 비밀번호: 회원제 서비스 이용에 따른 본인 식별 절차에 이용
				② 이메일주소(SMS 및 뉴스레터 수신여부), 전화번호: 고지사항 전달, 본인 의사 확인, 불만 처리 등 원활한 의사소통 경로의 확보, 새로운 서비스, 신상품이나 이벤트 정보 등 최신 정보의 안내
				③ 신용카드정보, 은행계좌정보 등 각종 결제관련 정보: 유료 정보 이용에 대한 요금 결제
				④ 주소, 전화번호: 경품 등의 배송에 대한 정확한 배송지의 확보
				⑤ 주소, 직업, 학력: 인구통계학적분석(이용자의 연령별, 성별, 지역별 통계분석 등)
				⑥ 그 외 선택항목: 요금감면 제공 대상 여부 판단, 개인맞춤 서비스를 제공하기 위한 자료
				2) 단, 이용자의 기본적 인권 침해의 우려가 있는 민감한 개인정보(인종 및 민족, 사상 및 신조, 출신지 및 본적지, 정치적 성향 및 범죄기록, 건강상태 및 성생활 등)는 수집하지 않습니다.
				3) 회사는 서비스를 보다 활성화하여 고객에게 최적화된 서비스를 제공하고, 신상품이나 이벤트 정보안내, 설문조사 등 고객 지향적인 마케팅을 수행하기 위하여 고객께서 제공한 정보 및 서비스 이용과 관련한 정보를 활용합니다 
		 </h5>
	 	<br>
	 	<button type="button" class="btn btn-primary" onClick="javascript:goRegistForm()">동의</button> 
    </div>
  </form>
  </body>
</html>
