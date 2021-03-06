<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.store_report.model.*"%>
<%
StoreReportVO srVO = (StoreReportVO) request.getAttribute("srVO"); //EmpServlet.java (Concroller), 存入req的empVO物件 (包括幫忙取出的empVO, 也包括輸入資料錯誤時的empVO物件)
%>
<html>
<head>
<title>商家檢舉資料修改 - update_sr_input.jsp</title></head>
<link rel="stylesheet" type="text/css" href="js/calendar.css">
<script language="JavaScript" src="js/calendarcode.js"></script>
<div id="popupcalendar" class="text"></div>

<body bgcolor='white'>

<table border='1' cellpadding='5' cellspacing='0' width='400'>
	<tr bgcolor='#CCCCFF' align='center' valign='middle' height='20'>
		<td>
		<h3>商家檢舉資料修改 - update_sr_input.jsp</h3>
		<a href="<%=request.getContextPath()%>/backend/str/select_page.jsp"><img src="/BA101G1/backend/str/images/back1.gif" width="100" height="32" border="0">回首頁</a></td>
	</tr>
</table>

<h3>商家檢舉資料修改:</h3>
<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font color='red'>請修正以下錯誤:
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li>${message}</li>
		</c:forEach>
	</ul>
	</font>
</c:if>

<FORM METHOD="post" ACTION="/store_report/store_report.do" name="form1">
<table border="0">
	<tr>
		<td>商家檢舉單號:<font color=red><b>*</b></font></td>
		<td><%=srVO.getSr_id()%></td>
	</tr>
	<tr>
		<td>商家編號:</td>
		<td><input type="TEXT" name="store_id" size="45" value="<%=srVO.getStore_id()%>" /></td>
	</tr>
	<tr>
		<td>評論編號:</td>
		<td><input type="TEXT" name="sc_id" size="45"	value="<%=srVO.getSc_id()%>" /></td>
	</tr>
	<tr>
		<td>訂單編號:</td>
		<td><input type="TEXT" name="order_id" size="45"	value="<%=srVO.getOrder_id()%>" /></td>
	</tr>
	<tr>
		<td>管理員編號:</td>
		<td><input type="TEXT" name="man_id" size="45"	value="<%=srVO.getMan_id()%>" /></td>
	</tr>
	<tr>
		<td>檢舉內容:</td>
		<td><input type="TEXT" name="sr_content" size="45"	value="<%=srVO.getSr_content()%>" /></td>
	</tr>
	<tr>
		<td>檢舉圖片:</td>
		<td><input type="TEXT" name="sr_image" size="45"	value="<%=srVO.getSr_image()%>" /></td>
	</tr>
	<tr>
		<td>檢舉時間:</td>
		<td bgcolor="#CCCCFF">
		    <input class="cal-TextBox"
			onFocus="this.blur()" size="9" readonly type="text" name="sr_time" value="<%=srVO.getSr_time()%>">
			<a class="so-BtnLink"
			href="javascript:calClick();return false;"
			onmouseover="calSwapImg('BTN_date', 'img_Date_OVER',true);"
			onmouseout="calSwapImg('BTN_date', 'img_Date_UP',true);"
			onclick="calSwapImg('BTN_date', 'img_Date_DOWN');showCalendar('form1','sr_time','BTN_date');return false;">
		    <img align="middle" border="0" name="BTN_date"	src="images/btn_date_up.gif" width="22" height="17" alt="開始日期"></a>
		</td>
	</tr>
	<tr>
		<td>檢舉審核狀態:</td>
		<td><input type="TEXT" name="sr_state" size="45"	value="<%=srVO.getSr_state()%>" /></td>
	</tr>
	<tr>
		<td>檢舉結果:</td>
		<td><input type="TEXT" name="sr_result" size="45" value="<%=srVO.getSr_result()%>" /></td>
	</tr>

<%-- 	<jsp:useBean id="deptSvc" scope="page" class="com.dept.model.DeptService" /> --%>
<!-- 	<tr> -->
<!-- 		<td>部門:<font color=red><b>*</b></font></td> -->
<!-- 		<td><select size="1" name="deptno"> -->
<%-- 			<c:forEach var="deptVO" items="${deptSvc.all}"> --%>
<%-- 				<option value="${deptVO.deptno}" ${(empVO.deptno==deptVO.deptno)?'selected':'' } >${deptVO.dname} --%>
<%-- 			</c:forEach> --%>
<!-- 		</select></td> -->
<!-- 	</tr> -->

</table>
<br>
<input type="hidden" name="action" value="update">
<input type="hidden" name="sr_id" value="<%=srVO.getSr_id()%>">
<input type="hidden" name="requestURL" value="<%=request.getParameter("requestURL")%>"><!--接收原送出修改的來源網頁路徑後,再送給Controller準備轉交之用-->
<input type="hidden" name="whichPage" value="<%=request.getParameter("whichPage")%>">  <!--只用於:istAllSR.jsp-->
<input type="submit" value="送出修改"></FORM>

<br>送出修改的來源網頁路徑:<br><b>
   <font color=blue>request.getParameter("requestURL"):</font> <%= request.getParameter("requestURL")%><br>
   <font color=blue>request.getParameter("whichPage"):</font> <%= request.getParameter("whichPage")%> (此範例目前只用於:istAllSR.jsp))</b>
</body>
</html>
