<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ page import="com.product.model.*"%>
<%@ page import="com.store.model.*"%>
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

<%-- <%StoreVO storeVO = (StoreVO) request.getAttribute("storeVO");%> --%>




<jsp:useBean id="storeSvc" scope="page" class="com.store.model.StoreService" />
<html>
<head>
<title>�ӫ~�d�ߵ��G - listProductByStore.jsp</title>
</head>
<body bgcolor='white'>
<b><font color=red>�����m�߱ĥ� Script ���g�k����:</font></b>
<table border='1' cellpadding='5' cellspacing='0' width='800'>
	<tr bgcolor='#CCCCFF' align='center' valign='middle' height='20'>
		<td>
		<h3>�ӫ~�d�ߵ��G - listProductByStore.jsp</h3>
		<h1>${storeVO.store_name}</h1>
		<a href="<%=request.getContextPath()%>/index.jsp"><img src="images/back1.gif" width="100" height="32" border="0">�^����</a>
		</td>
	</tr>
</table>

<table border='1' bordercolor='#CCCCFF' width='800'>
	<tr>
		<th>�ӫ~�Ϥ�</th>
		<th>�Ӯa�W��</th>
		<th>�ӫ~����</th>
		<th>�ӫ~�s��</th>
		<th>�ӫ~����</th>
		<th>�ӫ~�ƶq</th>
		<th>�[�J�ʪ���</th>
	</tr>
	
	<c:forEach var="product" items="${productlist}">
		<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/product/product.do">
		<tr align='center' valign='middle'>
			<td><IMG src="<%=request.getContextPath()%>/ProDBGifReader?pro_id=${product.pro_id}"></td>
			<td>${product.pro_name}</td>
			<td>${product.pro_price}</td>
			<td>${product.pro_id}</td>
			<td>${product.pro_content}</td>
			<td>
				<div>�ƶq�G <input type="text" name="quantity" size="3" value=1></div>
			</td>
			<td>
				
			     <input type="submit" value="�[�J�ʪ���"> 
			     <input type="hidden" name="pro_name" value="${product.pro_name}">
			     <input type="hidden" name="pro_price" value="${product.pro_price}">
			     <input type="hidden" name="pro_id" value="${product.pro_id}">
			     <input type="hidden" name="store_id" value="${storeVO.store_id}"> 
			     <input type="hidden" name="pro_content" value="${product.pro_content}">       
			     <input type="hidden" name="action"	value="getOne_In_ShoppingCart"></FORM>
			</td>
		<tr>
	</c:forEach>
	
</table>
	<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/product/product.do">
	<input type="submit" value="�e���ʪ���" >
	<input type="hidden" name="action"	value="goto_ShoppingCart"></FORM>

</body>
</html>
