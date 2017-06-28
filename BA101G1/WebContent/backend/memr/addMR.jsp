<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="com.member_report.model.*"%>
<%
MemberReportVO mrVO = (MemberReportVO) request.getAttribute("mrVO");
%>

<html>
<head>
<title>�|�����|��Ʒs�W - addMR.jsp</title></head>
<link rel="stylesheet" type="text/css" href="js/calendar.css">
<script language="JavaScript" src="js/calendarcode.js"></script>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script>
  $( function() {
	  $('#datepicker').datepicker({
	      dateFormat: 'yy-mm-dd'
	});
	  } );
  </script>
<div id="popupcalendar" class="text"></div>

<body bgcolor='white'>

<table border='1' cellpadding='5' cellspacing='0' width='400'>
	<tr bgcolor='#CCCCFF' align='center' valign='middle' height='20'>
		<td>
		<h3>�|�����|��Ʒs�W - addMR.jsp</h3>
		</td>
		<td>
		   <a href="<%=request.getContextPath()%>/backend/memr/select_page.jsp"><img src="images/tomcat.gif" width="100" height="100" border="1">�^����</a>
	    </td>
	</tr>
</table>

<h3>�|�����|���:</h3>
<%-- ���~��C --%>
<c:if test="${not empty errorMsgs}">
	<font color='red'>�Эץ��H�U���~:
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li>${message}</li>
		</c:forEach>
	</ul>
	</font>
</c:if>

<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/member_report/member_report.do" name="form1">
<table border="0">

	<tr>
		<td>�|���s��:</td>
		<td><input type="TEXT" name="mem_id" size="45" 
			value="<%= (mrVO==null)? "MEM-000001" : mrVO.getMem_id()%>" /></td>
	</tr>
	<tr>
		<td>�q��s��:</td>
		<td><input type="TEXT" name="order_id" size="45"
			value="<%= (mrVO==null)? "20170627-000001" : mrVO.getOrder_id()%>" /></td>
	</tr>
	<tr>
		<td>���׽s��:</td>
		<td><input type="TEXT" name="sc_id" size="45"
			value="<%= (mrVO==null)? "" : mrVO.getSc_id()%>" /></td>
	</tr>
	<tr>
		<td>�޲z���s��:</td>
		<td><input type="TEXT" name="man_id" size="45"
			value="<%= (mrVO==null)? "MAN-000001" : mrVO.getMan_id()%>" /></td>
	</tr>
	<tr>
		<td>���|���e:</td>
		<td><input type="TEXT" name="mr_content" size="45"
			value="<%= (mrVO==null)? "���������ۤ�" : mrVO.getMr_content()%>" /></td>
	</tr>
	<tr>
		<td>���|�Ϥ�:</td>
		<td><input type="TEXT" name="mr_image" size="45"
			value="<%= (mrVO==null)? "PICTURE" : mrVO.getMr_image()%>" /></td>
	</tr>
	

	
	<tr>
		<%java.sql.Timestamp date_SQL = new java.sql.Timestamp(System.currentTimeMillis());%>
		<td>���|�ɶ�:</td>
		
		<td bgcolor="#CCCCFF">
			<input type="text" id="datepicker" name="mr_time" value="<%= (mrVO==null)? date_SQL : mrVO.getMr_time()%>">
			
		    
		</td>
	</tr>
	<tr>
		<td>�f�֪��A:</td>
		<td><input type="TEXT" name="mr_state" size="45"
			value="<%= (mrVO==null)? "0" : mrVO.getMr_state()%>" /></td>
	</tr>
	<tr>
		<td>���|���G:</td>
		<td><input type="TEXT" name="mr_result" size="45"
			value="<%= (mrVO==null)? "null" : mrVO.getMr_result()%>" /></td>
	</tr>

</table>
<br>
<input type="hidden" name="action" value="insert">
<input type="submit" value="�e�X�s�W"></FORM>
<script>
$('#datepicker').on('change',  function(){
	console.log(this.value);
});
</script>
</body>

</html>
