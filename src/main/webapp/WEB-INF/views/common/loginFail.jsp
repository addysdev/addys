<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="/WEB-INF/tlds/taglib.tld" prefix="taglib"%>
<%@ page language="java" contentType="text/html;charset=utf-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Latest compiled and minified CSS-->
    <link rel="stylesheet" href="<%= request.getContextPath() %>/jquery-ui-1.11.4.custom/jquery-ui.css">
	<link rel="stylesheet" href="<%= request.getContextPath() %>/bootstrap-3.3.4-dist/css/bootstrap.css">
    <!-- Latest compiled JavaScript--> 
	<script type="text/javascript" src="<%= request.getContextPath() %>/js/jquery-1.11.2.js"></script>
	<script type="text/javascript" src="<%= request.getContextPath() %>/jquery-ui-1.11.4.custom/jquery-ui.js"></script>
	<script type="text/javascript" src="<%= request.getContextPath() %>/bootstrap-3.3.4-dist/js/bootstrap.js"></script>
  </head>

  <body>
  <div class="container">
      <h3><strong><font style="color:#428bca"> <span class="glyphicon glyphicon-plus-sign"></span>(주)애디스 다이랙트</font></strong></h3>
      <h1><strong><font style="color:#FF9900"> <span class="glyphicon glyphicon-exclamation-sign"></span> Login Fail</font></strong></h1>
      <h5><font style="color:#FF9900">(등록된 고객이 아닙니다.)</font></h5>   
	       <c:choose>
	    		<c:when test="${loginType=='survey'}">
					 <h5><strong><a href="<%= request.getContextPath() %>/surveyloginform" ><font style="color:#428bca"> <span class="glyphicon glyphicon-arrow-left"></span> 뒤로가기</font></a></strong></h5>
				</c:when>
				<c:otherwise>
					 <h5><strong><a href="<%= request.getContextPath() %>/customerloginform" ><font style="color:#428bca"> <span class="glyphicon glyphicon-arrow-left"></span> 뒤로가기</font></a></strong></h5>
				</c:otherwise>
			</c:choose>
  </div>
  </body>
</html>
