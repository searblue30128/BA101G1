<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.rev.model.*" %>
<%@ page import="java.util.*" %>
<% 
	RevenueService revSvc=new RevenueService();
	List<RevenueVO> list=revSvc.getAll();
	pageContext.setAttribute("list1",list);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<title>�Ҧ����</title>
</head>
<body bgcolor='white'>
<table border='1' cellpadding='5' cellspacing='0' width='800'>
	<tr bgcolor='#CCCCFF' align='center' valign='middle' height='20'>
		<td>
		<h3>�Ҧ����u��� - ListAllMem.jsp</h3>
		<a href="Select_Rev.jsp"><img src="images/back1.gif" width="100" height="32" border="0">�^����</a>
		</td>
	</tr>
</table>
<c:if test="${not empty errorMsgs }">
	<font color='red'>�ץ��H�U���~
	<ul>
		<c:forEach var="message" items="${errorMsgs }">
			<li>${message }</li>
		</c:forEach>
	</ul>	
	</font>
</c:if>	

<table border='1' bordercolor='#ccf' width='600'>
	<tr>
		<th>�Ӯa�s��</th>
		<th>���</th>
		<th>�޲z���s��</th>
		<th>��~�B</th>
		<th>���A</th>
		<th>�ק�</th>
		<th>�R��</th>
	</tr>
	<%@ include file="page1.file" %>	
	<c:forEach var="RevenueVO" items="${list1}" begin="<%=pageIndex %>" end="<%=pageIndex+rowsPerPage-1 %>">
		<tr align='center' valign='middle'>
			<td>${RevenueVO.store_id } </td>
			<td>${RevenueVO.revenue_month }</td>
			<td>${RevenueVO.man_id }</td>
			<td>${RevenueVO.store_revenue }</td>
			<td>${RevenueVO.state }</td>
			<td>
				<form method="post" action="<%=request.getContextPath() %>/backend/rev/rev.do">
					<input type="submit" value="�ק�">
					<input type="hidden" name="store_id" value="${RevenueVO.store_id }">
					<input type="hidden" name="revenue_month" value="${RevenueVO.revenue_month }">
					<input type="hidden" name="action" value="getOne_For_Update">
				</form>
			</td>
			<td>
				<form method="post" action="<%=request.getContextPath() %>/backend/rev/rev.do">
					<input type="submit" value="�R��">
					<input type="hidden" name="store_id" value="${RevenueVO.store_id }">
					<input type="hidden" name="revenue_month" value="${RevenueVO.revenue_month }">
					<input type="hidden" name="action" value="delete">
				</form>
			</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/backend/rev/rev.do">
			    <input type="submit" value="�e�X�Ӯa�d��"> 
			    <input type="hidden" name="store_id" value="${RevenueVO.store_id}">
			    <input type="hidden" name="revenue_month" value="${RevenueVO.revenue_month }">
			    <input type="hidden" name="action" value="getOne_For_Display">
			</td>
			
	</tr>
	</c:forEach>
</table>
<%@ include file="page2.file" %>	


<%if (request.getAttribute("oneList")!=null){%>
       <jsp:include page="/backend/rev/ListOneRev.jsp" />
<%} %>

</body>
</html>