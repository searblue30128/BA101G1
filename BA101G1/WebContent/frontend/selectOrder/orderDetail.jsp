<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.order.model.*"%>
<%@ page import="com.store.model.*"%>
<%@ page import="com.orderlist.model.*" %> 
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
		<th>�ӫ~�Ϥ�</th>
		<th>�ӫ~�W��</th>
		<th>���</th>
		<th>�ƶq</th>
		<th>�p�p</th>
	</tr>
	<c:forEach var="orderlistVO" items="${orderlistVO}" >
	<tr align='center' valign='middle'>
		<td>${param["order_id"]}</td>
		
		<td>${orderlistVO.order_id}</td>
		
		<td>${orderlistVO.pro_name}</td>
 		<td>${orderlistVO.price}</td>
		<td>${orderlistVO.order_amount}</td>
		<td></td>
	</tr>
	</c:forEach>
</table>

</body>
</html>