<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.store.model.*"%>
<%-- <%
	StoreVO storeVO = (StoreVO) request.getAttribute("storeVO"); //EmpServlet.java (Concroller), �s�Jreq��empVO���� (�]�A�������X��empVO, �]�]�A��J��ƿ��~�ɪ�empVO����)
%>  --%>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<title>Update man here</title>
</head>
<body bgcolor='white'>

<table border='1' cellpadding='5' cellspacing='0' width='400'>
	<tr bgcolor='#CCCCFF' align='center' valign='middle' height='20'>
		<td>
		<h3>���u��ƭק� - update_emp_input.jsp</h3>
		<a href="select_man.jsp"><img src="images/back1.gif" width="100" height="32" border="0">�^����</a></td>
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

<FORM METHOD="post" ACTION="store.do" name="form1">
<table border="0">
	<tr>
		<td>�ө��s��:<font color=red><b>*</b></font></td>
		<td>${storeVO.store_id} </td>
	</tr>
	<tr>
		<td>�ө��W��:</td>
		<td><input type="TEXT" name="store_name" size="45" value="${storeVO.store_name}" /></td>
	</tr>
	<tr>
		<td>�ө��a�}:</td>
		<td><input type="TEXT" name="store_addr" size="45"	value="${storeVO.store_addr}" /></td>
	</tr>
	
	<tr>
		<td>�Ӯa�q��:</td>
		<td><input type="TEXT" name="store_phone" size="45"	value="${storeVO.store_phone }" /></td>
	</tr>
	<tr>
		<td>���A:</td>
		<td><select name="store_state" value="${storeVO.store_state}">
					<option value='�f�֤�'>�f�֤�</option>
					<option value='�}����'>�}����</option>
					<option value='���~'>���~</option>
			</select>
		</td>
	</tr>
</table>
<br>
<input type="hidden" name="action" value="update">
<input type="hidden" name="store_id" value="${storeVO.store_id}">
<input type="submit" value="�e�X�ק�"></FORM>


</body>
</html>