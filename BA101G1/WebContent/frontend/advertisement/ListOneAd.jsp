<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.ad.model.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<title>List One Ad here</title>
</head>
<body bgcolor='white'>
<table border='1' cellpadding='5' cellspacing='0' width='600'>
	<tr bgcolor='#CCCCFF' align='center' valign='middle' height='20'>
		<td>
		<h3>���u��� - ListOneEmp.jsp</h3>
		<a href="ListAllAd.jsp"><img src="images/back1.gif" width="100" height="32" border="0">�^����</a>
		</td>
	</tr>
</table>
<table border='1' bordercolor='#ccf' width='600'>
	<tr>
		<th>�s�i�s��</th>
		<th>�Ӯa�s��</th>
		<th>�s�i�W��</th>
		<th>�s�i���e</th>
		<th>�s�i�ɶ�</th>
		<th>�s�i���A</th>
		<th>�s�i����</th>
	</tr>
	<c:forEach var="AdVO" items="${list }">
		<tr align='center' valign='middle'>
			
	
	
	
	</c:forEach>
</body>
</html>