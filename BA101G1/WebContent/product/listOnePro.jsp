<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ page import="com.product.model.*"%>
<%-- �����m�߱ĥ� Script ���g�k���� --%>

<%-- ���X Concroller EmpServlet.java�w�s�Jrequest��EmpVO����--%>
<%ProductVO productVO = (ProductVO) request.getAttribute("productVO");%>


<html>
<head>
<title>���u��� - listOneEmp.jsp</title>
</head>
<body bgcolor='white'>
<b><font color=red>�����m�߱ĥ� Script ���g�k����:</font></b>
<table border='1' cellpadding='5' cellspacing='0' width='800'>
	<tr bgcolor='#CCCCFF' align='center' valign='middle' height='20'>
		<td>
		<h3>���u��� - ListOneEmp.jsp</h3>
		<a href="<%=request.getContextPath()%>/select_page.jsp"><img src="images/back1.gif" width="100" height="32" border="0">�^����</a>
		</td>
	</tr>
</table>

<table border='1' bordercolor='#CCCCFF' width='800'>
	<tr>
		<th>�ӫ~�s��</th>
		<th>�Ӯa�s��</th>
		<th>�ӫ~�W��</th>
		<th>����</th>
		<th>�Ϥ�</th>
		<th>�ӫ~����</th>
		<th>����</th>
	</tr>
	<tr align='center' valign='middle'>
		<td><%=productVO.getPro_id()%></td>
		<td><%=productVO.getStore_id()%></td>
		<td><%=productVO.getPro_name()%></td>
		<td><%=productVO.getPro_price()%></td>
		<td><%=productVO.getPro_image()%></td>
		<td><%=productVO.getPro_type()%></td>
		<td><%=productVO.getPro_content()%></td>
	</tr>
</table>

</body>
</html>
