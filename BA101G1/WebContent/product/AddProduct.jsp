<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.product.model.*"%>
<%
	ProductVO productVO=(ProductVO)request.getAttribute("productVO");
	session.setAttribute("store_id", "STO-000001");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<script language="JavaScript" src="js/pic_preview.js"></script>
<title>AddProduct here</title>
</head>
<body bgcolor='white'>

	<table border='1' cellpadding='5' cellspacing='0' width='500'>
		<tr bgcolor='#CCCCFF' align='center' valign='middle' height='20'>
			<td><h3>�ӫ~�s�W - AddProduct.jsp</h3></td>
			<td><a href="product.jsp"><img src="images/tomcat.gif"	width="100" height="100" border="1"> �^���� </a></td></tr></table>

<h4>��~�B���:<font color=red><b>*</b></font>���������</h4>
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
		<td>�ӫ~�W��:<font color=red><b>*</b></font></td>
		<td><input type="TEXT" name="pro_name" size="45" 
			 value="<%= (productVO==null)? "����" :productVO.getPro_name() %>"></td>
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
		<td><input type="text" name="pro_price" size="45"
				value="<%=(productVO==null)? "70" :productVO.getPro_price()%>"></td>
	</tr><tr>
		<td>�ӫ~���A:<font color=red><b>*</b></font></td>
		<td><select size="1" name="pro_state">
						<option value="�W�[">�W�[
						<option value="�U�[">�U�[</option></select></td>
	</tr>
	<tr>
		<td>�ӫ~�Ӥ�:<font color=red><b>*</b></font></td>
		<td><input type="file" name="pro_image" id="upfile1" >
		 <p>
    	<img id="image"  style="max-width: 150px; max-height: 150px;">
			</p>
  		</td>
	</tr>
	<tr>
		<td>�ӫ~����:<font color=red><b>*</b></font></td>
		<td><input type="text" name="pro_content" size="45"
				value="<%=(productVO==null)? "���������֨ӦY" :productVO.getPro_content()%>"></td>
	</tr>
	</table>
<br>
<input type="hidden" name="action" value="insert">
<input type="hidden" name="requestURL" value="<%=request.getRequestURL()%>">
<input type="submit" value="�e�X�s�W"></FORM>
</body>
</html>