<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ page import="com.store_report.model.*"%>
<%-- �����m�߱ĥ� Script ���g�k���� --%>

<%-- ���X Concroller EmpServlet.java�w�s�Jrequest��EmpVO����--%>
<%StoreReportVO srVO = (StoreReportVO) request.getAttribute("srVO");%>

<%-- ���X ������DeptVO����--%>
<%-- <% --%>
//   DeptService deptSvc = new DeptService();
//   DeptVO deptVO = deptSvc.getOneDept(empVO.getDeptno());
<%-- %> --%>
<html>
<head>
<title>�Ӯa���|��� - listOneSR.jsp</title>
</head>
<body bgcolor='white'>
<b><font color=red>�����m�߱ĥ� Script ���g�k����:</font></b>
<table border='1' cellpadding='5' cellspacing='0' width='800'>
	<tr bgcolor='#CCCCFF' align='center' valign='middle' height='20'>
		<td>
		<h3>�Ӯa���|��� - ListOneSR.jsp</h3>
		<a href="<%=request.getContextPath()%>/backend/str/select_page.jsp"><img src="/BA101G1/backend/str/images/back1.gif" width="100" height="32" border="0">�^����</a>
		</td>
	</tr>
</table>

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
	</tr>
	<tr align='center' valign='middle'>
		<td><%=srVO.getSr_id()%></td>
		<td><%=srVO.getStore_id()%></td>
		<td><%=srVO.getSc_id()%></td>
		<td><%=srVO.getOrder_id()%></td>
		<td><%=srVO.getMan_id()%></td>
		<td><%=srVO.getSr_content()%></td>
		<td><%=srVO.getSr_image()%></td>
		<td><%=srVO.getSr_time()%></td>
		<td><%=srVO.getSr_state()%></td>
		<td><%=srVO.getSr_result()%></td>
	</tr>
</table>

</body>
</html>
