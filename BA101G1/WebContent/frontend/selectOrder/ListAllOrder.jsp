<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.order.model.*" %>
<%@ page import="java.util.*" %>
<% 
	Store_OrderService store_orderSvc=new Store_OrderService();
	List<Store_OrderVO> list=store_orderSvc.getAll();
	pageContext.setAttribute("list",list);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<title>List order state here</title>
</head>
<body bgcolor='white'>
<table border='1' cellpadding='5' cellspacing='0' width='600'>
	<tr bgcolor='#CCCCFF' align='center' valign='middle' height='20'>
		<td>
		<h3>已確認訂單 - ListOrderState_Confirm.jsp</h3>
		<a href="selectOrder.jsp"><img src="images/back1.gif" width="100" height="32" border="0">回首頁</a>
		</td>
	</tr>
</table>

<table border='1' bordercolor='#ccf' width='800'>
	<tr>
		<th>訂單編號</th>
		<th>會員編號</th>
		<th>店家編號</th>
		<th>總金額</th>
		<th>訂餐時間</th>
		<th>取餐方式</th>
		<th>外送店址</th>
		<th>點餐備註</th>
		<th>取餐時間</th>
		<th>訂單狀態</th>
		
	</tr>
	<%@ include file="page1.file" %>	
	<c:forEach var="Store_OrderVO" items="${list}" begin="<%=pageIndex %>" end="<%=pageIndex+rowsPerPage-1 %>">
		<tr align='center' valign='middle'${(Store_OrderVO.order_id==param.order_id) ? 'bgcolor=#CCCCFF':''}>
			<td>${Store_OrderVO.order_id } </td>
			<td>${Store_OrderVO.mem_id }</td>
			<td>${Store_OrderVO.store_id }</td>
			<td>${Store_OrderVO.totalprice }</td>
			<td>${Store_OrderVO.order_time }</td>
			<td>${Store_OrderVO.order_way } </td>
			<td>${Store_OrderVO.receive_address }</td>
			<td>${Store_OrderVO.order_note }</td>
			<td>${Store_OrderVO.order_taketime }</td>
			<td>${Store_OrderVO.order_state }</td>
			
	</tr>
	</c:forEach>
</table>
<%@ include file="page2.file" %>
</body>
</html>