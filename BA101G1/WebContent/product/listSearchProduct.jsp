<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ page import="com.product.model.*"%>
<%@ page import="com.product_class.model.*"%>
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
<jsp:useBean id="pcSvc" scope="page" class="com.product_class.model.ProductClassService" />

<html>
<head>
<title>�ӫ~�d�ߵ��G - listSearchProduct.jsp</title>
</head>
<body bgcolor='white'>
<b><font color=red>�����m�߱ĥ� Script ���g�k����:</font></b>
<table border='1' cellpadding='5' cellspacing='0' width='800'>
	<tr bgcolor='#CCCCFF' align='center' valign='middle' height='20'>
		<td>
		<h3>�ӫ~�d�ߵ��G - listSearchProduct.jsp</h3>
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
	
	<c:forEach var="productVO" items="${productlist}">
		<tr align='center' valign='middle'>
			<td>${productVO.pro_id}</td>
			<td>${productVO.store_id}</td>
			<td>${productVO.pro_name}</td>
			<td>${productVO.pro_price}</td>
			<td><IMG src="<%=request.getContextPath()%>/ProductClassReader?pro_id=${productVO.pro_id}"></td>
			<td><c:forEach var="productclasslistVO" items="${pcSvc.all}">
                    <c:if test="${productVO.pc_id==productclasslistVO.pc_id}">
	                    ${productclasslistVO.pc_name}
                    </c:if>
                </c:forEach>
			</td>
			<td>${productVO.pro_content}</td>
		<tr>
	</c:forEach>
	
</table>

</body>
</html>
