<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.product.model.*"%>
<html>
<head><title>IBM Emp: Home</title></head>
<body bgcolor='white'>

<table border='1' cellpadding='5' cellspacing='0' width='400'>
  <tr bgcolor='#CCCCFF' align='center' valign='middle' height='20'>
    <td><h3>IBM Emp: Home</h3><font color=red>( MVC )</font></td>
  </tr>
</table>

<p>This is the Home page for IBM Emp: Home</p>

<h3>�\�I�d��:</h3>
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

<ul>
  <li>
    <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/product/product.do" >
        <b>��J�\�I����r:</b>
        <input type="text" name="pro_name">
        <input type="submit" value="�e�X">
        <input type="hidden" name="action" value="get_product">
    </FORM>
  </li>
</ul>

<jsp:useBean id="proSvc" scope="page" class="com.product.model.ProductService" />

<table border='1' bordercolor='#CCCCFF' width='800'>
	<tr>
		<th>�Ϥ�</th>
		<th>�ӫ~����</th>
	</tr>
	
	<c:forEach var="proVO" items="${proSvc.all}">
		<tr align='center' valign='middle'>
			<td></td>
			<td><a href='<%=request.getContextPath()%>/product/product.do?action=get_type&pro_type='>${proVO.pro_type}</a></td>
		</tr>
	</c:forEach>
</table>

</body>
</html>
