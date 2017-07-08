<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.product.model.*"%>
<%
	ProductVO productVO=(ProductVO)request.getAttribute("productVO");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<title>Update Product here</title>
<script language="JavaScript" src="js/pic_preview.js"></script>
</head>
<body bgcolor='white'>

<table border='1' cellpadding='5' cellspacing='0' width='400'>
	<tr bgcolor='#CCCCFF' align='center' valign='middle' height='20'>
		<td>
		<h3>�ӫ~�ק� - Update Product.jsp</h3>
		<a href="<%=request.getContextPath() %>/product/product.jsp"><img src="images/logo.png" width="100" height="32" border="0">�^����</a></td>
	</tr>
</table>

<h3>��ƭק�:</h3>
<%-- ���~��C --%>
<c:if test="${not empty errorMsgs}">
	<font color='red'>�Эץ��H�U���~:
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li>${message}</li>
		</c:forEach>
	</ul>
	</font>
</c:if>
<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/product/product.do" name="form1" enctype="multipart/form-data">
<table border="0">

	<tr>
		<td>�ӫ~�s��:<font color=red><b>*</b></font></td>
		<td><%=productVO.getPro_id() %></td>
	</tr>
	<tr>
		<td>�Ӯa�s��:<font color=red><b>*</b></font></td>
		<td><%=productVO.getStore_id() %></td>
	</tr>
	<tr>
		<td>�ӫ~�W��:<font color=red><b>*</b></font></td>
		<td><input type="text" name="pro_name" size="45" value="<%=productVO.getPro_name()%>" />
	</tr>
	<jsp:useBean id="productclassSvc" scope="page" class="com.product_class.model.ProductClassService" />
	<tr>
		<td>�ӫ~���O:<font color=red><b>*</b></font></td>
		<td><select size="1" name="pc_id">
			<c:forEach var="ProductClassVO" items="${productclassSvc.all}">
				<option value="${ProductClassVO.pc_id}" ${(productVO.pc_id==ProductClassVO.pc_id)? 'selected':'' } >${ProductClassVO.pc_name}
			</c:forEach>
		</select></td>
	</tr>
	<tr>
		<td>�ӫ~���:<font color=red><b>*</b></font></td>
		<td><input type="text" name="pro_price" size="45" value="<%=productVO.getPro_price()%>" />
	</tr>
	<tr>
		<td>�ӫ~���A:<font color=red><b>*</b></font></td>
		<td><select name="pro_state">
			<option value='�W�[' ${(productVO.pro_state=='�W�[') ? 'selected':''}>�W�[</option>
			<option value='�U�[' ${(productVO.pro_state=='�U�[') ? 'selected':''}>�U�[</option></select> </td>
	</tr>
	<tr>
		<td>�ӫ~�Ϥ�:<font color=red><b>*</b></font></td>
			<td>
			<input type="file" name="pro_image" id="upfile1">
			 <p>
    			<img src="<%=request.getContextPath()%>/ProDBGifReader?pro_id=${productVO.pro_id}" id="image" style="max-width: 150px; max-height: 150px;">
			</p>
			</td>
	</tr>
		<tr>
		<td>�ӫ~����:<font color=red><b>*</b></font></td>
		<td><input type="text" name="pro_content" size="45" value="<%=productVO.getPro_content()%>" />
	</tr>
	</table>
	<input type="hidden" name="action" value="update">
<input type="hidden" name="pro_id" value="<%=productVO.getPro_id() %>">
<input type="hidden" name="store_id" value="<%=productVO.getStore_id() %>">
<input type="submit" value="�e�X�ק�"></FORM>
</body>
</html>