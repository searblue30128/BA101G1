<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ page import="com.member_report.model.*"%>
<%-- �����m�߱ĥ� Script ���g�k���� --%>

<%-- ���X Concroller EmpServlet.java�w�s�Jrequest��EmpVO����--%>
<%MemberReportVO mrVO = (MemberReportVO) request.getAttribute("mrVO");%>


<html>
<head>
<title>��@�|�����|��� - listOneMR.jsp</title>
</head>
<body bgcolor='white'>
<b><font color=red>�����m�߱ĥ� Script ���g�k����:</font></b>
<table border='1' cellpadding='5' cellspacing='0' width='800'>
	<tr bgcolor='#CCCCFF' align='center' valign='middle' height='20'>
		<td>
		<h3>��@�|�����|��� - ListOneMR.jsp</h3>
		<a href="<%=request.getContextPath()%>/backend/memr/select_page.jsp"><img src="images/back1.gif" width="100" height="32" border="0">�^����</a>
		</td>
	</tr>
</table>

<table border='1' bordercolor='#CCCCFF' width='800'>
	<tr>
		<th>�|�����|�渹</th>
		<th>�|���s��</th>
		<th>�q��s��</th>
		<th>���׽s��</th>
		<th>�޲z���s��</th>
		<th>���|���e</th>
		<th>���|�Ϥ�</th>
		<th>���|�ɶ�</th>
		<th>�f�֪��A</th>
		<th>���|���G</th>
	</tr>
	<tr align='center' valign='middle'>
		<td><%=mrVO.getMr_id()%></td>
		<td><%=mrVO.getMem_id()%></td>
		<td><%=mrVO.getOrder_id()%></td>
		<td><%=mrVO.getSc_id()%></td>
		<td><%=mrVO.getMan_id()%></td>
		<td><%=mrVO.getMr_content()%></td>
		<td><%=mrVO.getMr_image()%></td>
		<td><%=mrVO.getMr_time()%></td>
		<td><%=mrVO.getMr_state()%></td>
		<td><%=mrVO.getMr_result()%></td>
	</tr>
</table>

</body>
</html>
