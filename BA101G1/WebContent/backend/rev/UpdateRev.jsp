<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="BIG5"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.rev.model.*"%>
<%
	RevenueVO revenueVO=(RevenueVO) request.getAttribute("revenueVO");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<title>Insert title here</title>
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
<form action="rev.do" method='post' name='form1'>
<table border='0'>
	<tr>
		<td>�Ӯa�s��:<font color='red'><b>*</b></font></td>
		<td><%=revenueVO.getStore_id() %></td>
	</tr>
	<tr>
		<td>���:<font color='red'><b>*</b></font></td>
		<td><%=revenueVO.getRevenue_month() %></td>
	</tr>
	<tr>
		<td> �޲z���s��:<font color='red'><b>*</b></font></td>
		<td><%=revenueVO.getMan_id() %></td>
	</tr>
	<tr>
		<td>��~�B:</td>
		<td><input type="TEXT" name="store_revenue" size="45" value="<%=revenueVO.getStore_revenue() %>"/></td>
	</tr>
	<tr>
		<td>���A:</td>
		<td><input type="TEXT" name="store_state" size="45" value="<%=revenueVO.getState() %>"/></td>
	</tr>	
</table>
<br>
<input type="hidden" name="action" value="update">
<input type="hidden" name="store_id" value="<%=revenueVO.getStore_id()%>">
<input type="hidden" name="revenue_month" value="<%=revenueVO.getRevenue_month()%>">
<input type="hidden" name="man_id" value="<%=revenueVO.getMan_id()%>">
<input type="submit"  value="�e�X�ק�">

</form>
</form>
</body>
</html>