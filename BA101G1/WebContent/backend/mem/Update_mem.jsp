<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.mem.model.*"%>
<%
	MemberVO memberVO=(MemberVO) request.getAttribute("memberVO");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<title>Update Mem here</title>
</head>
<body bgcolor='white'>
<table border='1' cellpadding='5' cellspacing='0' width='400'>
	<tr bgcolor='#CCCCFF' align='center' valign='middle' height='20'>
		<td>
		<h3>���u��ƭק� - update_emp_input.jsp</h3>
		<a href="select_mem.jsp"><img src="images/back1.gif" width="100" height="32" border="0">�^����</a></td>
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
<form action="mem.do" method='post' name='form1'>
<table border='0'>
	<tr>
		<td>�|���s��:<font color='red'><b>*</b></font></td>
		<td><%=memberVO.getMem_id() %></td>
	</tr>
	<tr>
		<td>�|���m�W:</td>
		<td><input type="TEXT" name="mem_name" size="45" value="<%=memberVO.getMem_name() %>"/></td>
	</tr>
	<tr>
		<td>�|���q��:</td>
		<td><input type="TEXT" name="mem_phone" size="45" value="<%=memberVO.getMem_phone() %>"/></td>
	</tr>
	<tr>
		<td>�|���K�X:</td>
		<td><input type="TEXT" name="mem_pw" size="45" value="<%=memberVO.getMem_pw() %>"/></td>
	</tr>
	<tr>
		<td>�|���H�c:</td>
		<td><input type="TEXT" name="mem_mail" size="45" value="<%=memberVO.getMem_mail() %>"/></td>
	</tr>
</table>
<br>
<input type="hidden" name="action" value="update">
<input type="hidden" name="mem_id" value="<%=memberVO.getMem_id()%>">
<input type="submit"  value="�e�X�ק�">

</form>

</body>
</html>