<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ page import="com.product.model.*"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%-- �����m�߱ĥ� Script ���g�k���� --%>
<%--
	ProductService proSvc1=new ProductService();
	String pro_name=(String)request.getAttribute("pro_name");
	List<ProductVO> list=proSvc1.getName(pro_name);
--%>
<%-- ���X Concroller EmpServlet.java�w�s�Jrequest��EmpVO����--%>
<%--  <%List<ProductVO> productVO = (List) request.getAttribute("productlist");%>--%>
<jsp:useBean id="proSvc" scope="page" class="com.product.model.ProductService" />

<html>
<head>
<title>�ӫ~�d�ߵ��G - listOnePro.jsp</title>
</head>
<body bgcolor='white'>
<b><font color=red>�����m�߱ĥ� Script ���g�k����:</font></b>
<table border='1' cellpadding='5' cellspacing='0' width='800'>
	<tr bgcolor='#CCCCFF' align='center' valign='middle' height='20'>
		<td>
		<h3>�ӫ~�d�ߵ��G - listOnePro.jsp</h3>
		<a href="<%=request.getContextPath()%>/index.jsp"><img src="images/back1.gif" width="100" height="32" border="0">�^����</a>
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
	
	<c:forEach var="product" items="${productlist}">
		<tr align='center' valign='middle'>
			<td>${product.pro_id}</td>
			<td>${product.store_id}</td>
			<td>${product.pro_name}</td>
			<td>${product.pro_price}</td>
			<td>${product.pro_image}</td>
			<td>${product.pro_type}</td>
			<td>${product.pro_content}</td>
		<tr>
	</c:forEach>
	
</table>

</body>
</html>
