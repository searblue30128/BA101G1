<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.push.model.*"%>
<%
	PushVO pushVO = (PushVO) request.getAttribute("pushVO"); //PushServlet.java (Concroller), �s�Jreq��pushVO���� (�]�A�������X��pushVO, �]�]�A��J��ƿ��~�ɪ�pushVO����)
%>
<html>
<head>
<title>������ƭק� - update_push_input.jsp</title></head>
<link rel="stylesheet" type="text/css" href="js/calendar.css">
<script language="JavaScript" src="js/calendarcode.js"></script>
<div id="popupcalendar" class="text"></div>

<body bgcolor='white'>

<table border='1' cellpadding='5' cellspacing='0' width='400'>
	<tr bgcolor='#CCCCFF' align='center' valign='middle' height='20'>
		<td>
		<h3>������ƭק� - update_push_input.jsp</h3>
		<a href="<%=request.getContextPath()%>/backend/push/select_page.jsp"><img src="/BA101G1/backend/man/images/back1.gif" width="100" height="32" border="0">�^����</a></td>
	</tr>
</table>

<h3>������ƭק�:</h3>
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

<FORM METHOD="post" ACTION="/push/push.do" name="form1">
<table border="0">
	<tr>
		<td>�����s��:<font color=red><b>*</b></font></td>
		<td><%=pushVO.getPush_id()%></td>
	</tr>
	<tr>
		<td>�޲z���s��:</td>
		<td><input type="TEXT" name="man_id" size="45" value="<%=pushVO.getMan_id()%>" /></td>
	</tr>
	<tr>
		<td>�������e:</td>
		<td><input type="TEXT" name="push_content" size="45" value="<%=pushVO.getPush_content()%>" /></td>
	</tr>
	<tr>
		<td>�����ɶ�:</td>
		<td bgcolor="#CCCCFF">
		    <input class="cal-TextBox"
			onFocus="this.blur()" size="9" readonly type="text" name="push_time" value="<%=pushVO.getPush_time()%>">
			<a class="so-BtnLink"
			href="javascript:calClick();return false;"
			onmouseover="calSwapImg('BTN_date', 'img_Date_OVER',true);"
			onmouseout="calSwapImg('BTN_date', 'img_Date_UP',true);"
			onclick="calSwapImg('BTN_date', 'img_Date_DOWN');showCalendar('form1','push_time','BTN_date');return false;">
		    <img align="middle" border="0" name="BTN_date"	src="images/btn_date_up.gif" width="22" height="17" alt="�}�l���"></a>
		</td>
	</tr>
	<tr>
		<td>�̷s�����s��:</td>
		<td><input type="TEXT" name="news_id" size="45"	value="<%=pushVO.getNews_id()%>" /></td>
	</tr>
	<tr>
		<td>�s�i�s��:</td>
		<td><input type="TEXT" name="ad_id" size="45" value="<%=pushVO.getAd_id()%>" /></td>
	</tr>

</table>
<br>
<input type="hidden" name="action" value="update">
<input type="hidden" name="push_id" value="<%=pushVO.getPush_id()%>">
<input type="hidden" name="requestURL" value="<%=request.getParameter("requestURL")%>"><!--������e�X�ק諸�ӷ��������|��,�A�e��Controller�ǳ���椧��-->
<input type="hidden" name="whichPage" value="<%=request.getParameter("whichPage")%>">  <!--�u�Ω�:istAllEmp.jsp-->
<input type="submit" value="�e�X�ק�"></FORM>

<br>�e�X�ק諸�ӷ��������|:<br><b>
   <font color=blue>request.getParameter("requestURL"):</font> <%= request.getParameter("requestURL")%><br>
   <font color=blue>request.getParameter("whichPage"):</font> <%= request.getParameter("whichPage")%> (���d�ҥثe�u�Ω�:istAllEmp.jsp))</b>
</body>
</html>
