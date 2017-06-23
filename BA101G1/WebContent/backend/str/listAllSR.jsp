<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.store_report.model.*"%>
<%-- �����m�߱ĥ� EL ���g�k���� --%>
	---${param.empno}----
<%
	StoreReportService srSvc = new StoreReportService();
	List<StoreReportVO> list = srSvc.getAll();
	pageContext.setAttribute("list",list);
%>
<%-- <jsp:useBean id="deptSvc" scope="page" class="com.dept.model.DeptService" /> --%>

<html>
<head>
<title>�Ҧ��Ӯa���|��� - listAllSR.jsp</title>
</head>
<body bgcolor='white'>
<b><font color=red>�����m�߱ĥ� EL ���g�k����:</font></b>
<table border='1' cellpadding='5' cellspacing='0' width='800'>
	<tr bgcolor='#CCCCFF' align='center' valign='middle' height='20'>
		<td>
		<h3>�Ҧ��Ӯa���|��� - ListAllSR.jsp</h3>
		<a href="<%=request.getContextPath()%>/backend/str/select_page.jsp"><img src="/BA101G1/backend/str/images/back1.gif" width="100" height="32" border="0">�^����</a>
		</td>
	</tr>
</table>

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

<table border='1' bordercolor='#CCCCFF' width='800'>
	<tr>
		<th>�Ӯa���|�渹</th>
		<th>�Ӯa�s��</th>
		<th>���׽s��</th>
		<th>�q��s��</th>
		<th>�޲z���s��</th>
		<th>���|���e</th>
		<th>���|�Ϥ�</th>
		<th>���|�ɶ�</th>
		<th>���|�f�֪��A</th>
		<th>���|���G</th>
		<th>�ק�</th>
		<th>�R��</th>
	</tr>
	<%@ include file="pages/page1.file" %> 
	<c:forEach var="srVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
		<tr align='center' valign='middle' ${(srVO.sr_id==param.sr_id) ? 'bgcolor=#CCCCFF':''}><!--�N�ק諸���@���[�J����Ӥw-->
			<td>${srVO.sr_id}</td>
			<td>${srVO.store_id}</td>
			<td>${srVO.sc_id}</td>
			<td>${srVO.order_id}</td>
			<td>${srVO.man_id}</td>
			<td>${srVO.sr_content}</td>			
			<td>${srVO.sr_image}</td>			
			<td>${srVO.sr_time}</td>			
			<td>${srVO.sr_state}</td>			
			<td>${srVO.sr_result}</td>			

			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/store_report/store_report.do">
			     <input type="submit" value="�ק�"> 
			     <input type="hidden" name="sr_id" value="${srVO.sr_id}">
			     <input type="hidden" name="requestURL"	value="<%=request.getServletPath()%>"><!--�e�X�����������|��Controller-->
			    <input type="hidden" name="whichPage"	value="<%=whichPage%>">               <!--�e�X��e�O�ĴX����Controller-->
			     <input type="hidden" name="action"	value="getOne_For_Update"></FORM>
			</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/store_report/store_report.do">
			    <input type="submit" value="�R��">
			    <input type="hidden" name="sr_id" value="${srVO.sr_id}">
			    <input type="hidden" name="requestURL"	value="<%=request.getServletPath()%>"><!--�e�X�����������|��Controller-->
			    <input type="hidden" name="whichPage"	value="<%=whichPage%>">               <!--�e�X��e�O�ĴX����Controller-->
			    <input type="hidden" name="action"value="delete"></FORM>
			</td>
		</tr>
	</c:forEach>
</table>
<%@ include file="pages/page2.file" %>

<br>�����������|:<br><b>
   <font color=blue>request.getServletPath():</font> <%= request.getServletPath()%><br>
   <font color=blue>request.getRequestURI(): </font> <%= request.getRequestURI()%> </b>
</body>
</html>
