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
<jsp:useBean id="storeSvc" scope="page" class="com.store.model.StoreService" />

<html>
<head>
<title>�d�ߵ��G - listSearchStore.jsp</title>
</head>
<body bgcolor='white'>
<b><font color=red>�����m�߱ĥ� Script ���g�k����:</font></b>
<table border='1' cellpadding='5' cellspacing='0' width='800'>
	<tr bgcolor='#CCCCFF' align='center' valign='middle' height='20'>
		<td>
		<h3>�d�ߵ��G - listSearchStore.jsp</h3>
		<a href="<%=request.getContextPath()%>/select_page.jsp"><img src="images/back1.gif" width="100" height="32" border="0">�^����</a>
		</td>
	</tr>
</table>

<table border='1' bordercolor='#CCCCFF' width='800'>
	<tr>
		<th>�Ӯa�Ϥ�</th>
		<th>�Ӯa�W��</th>
		<th>�Ӯa����</th>
	</tr>
	
	<c:forEach var="store" items="${storelist}">
		<tr align='center' valign='middle'>
			<td>${store.store_image}</td>
			<td>${store.store_name}</td>
			<td>${store.sc_id}</td>
		<tr>
	</c:forEach>
	
</table>

</body>
</html>