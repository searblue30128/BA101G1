<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.order.model.*"%>
<%@ page import="com.store.model.*"%>
<%@ page import="java.util.*"%>




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
		<th>�q��s��</th>
		<th>���</th>
		<th>�ө�</th>
		<th>�q����B</th>
		<th>���\�覡</th>
		<th>�q�檬�A</th>
		<th>�����q��</th>
		<th>�����Ӯa</th>
		<th>���|�Ӯa</th>
	</tr>
	<c:forEach var="store_orderVO" items="${store_orderVO}" >
	<tr align='center' valign='middle'>
		<td>${store_orderVO.order_id }</td>
		<td>${store_orderVO.order_time }</td>
 		<td>${store_orderVO.store_name }</td>
		<td>${store_orderVO.totalprice }</td>
		<td>${store_orderVO.order_way }</td>
		<td>${store_orderVO.order_state }</td>
		<td>����</td>
		<td>����</td>
		<td>���|</td>
	</tr>
	</c:forEach>
</table>

</body>
</html>