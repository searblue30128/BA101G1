<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ page import="java.util.* "%>
<%@ page import="com.product.model.* "%>
<html>
<head>
 <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <title>Mode II �d�ҵ{�� - Checkout.jsp</title>
</head>
<body bgcolor="#FFFFFF">
<img src="images/tomcat.gif"> <font size="+3">�����ѩ� - ���b </font>
<hr><p>

<table border="1" width="720">
	<tr bgcolor="#999999">
		<th width="200"></th>
		<th width="100">�ӫ~�W��</th>
		<th width="100">�ӫ~����</th>
		<th width="100">�ƶq</th>
		<th width="100">�p�p</th>
		<th width="120"></th>
	</tr>
	
	<%
		Vector<ProductVO> buylist = (Vector<ProductVO>) session.getAttribute("shoppingcart");
		String amount =  (String) request.getAttribute("amount");
	%>	
	<%	for (int i = 0; i < buylist.size(); i++) {
			ProductVO productVO = buylist.get(i);
			String name = productVO.getPro_name();
			int price = (int)productVO.getPro_price();
			int quantity = productVO.getQuantity();
	%>
	<tr>
		<td width="200"><div align="center"><b></b></div></td>
		<td width="100"><div align="center"><b><%=name%></b></div></td>
		<td width="100"><div align="center"><b><%=price%></b></div></td>
		<td width="100"><div align="center"><b><%=quantity%></b></div></td>
		<td width="100"><div align="center"><b></b></div></td>
		<td width="100"><div align="center"><b></b></div></td>
	</tr>
	<%
		}
	%>
	<tr>
		<td></td>
		<td></td>
		<td></td>
		<td><div align="center"><font color="red"><b>�`���B�G</b></font></div></td>
		<td></td>
		<td> <font color="red"><b>$<%=amount%></b></font> </td>
		<td></td>
	</tr>
</table>
<p><a href="EShop.jsp">�O�_�~���ʪ�</a>
</body>
</html>
