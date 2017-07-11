<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="com.order.model.*"%>
<%@ page import="com.store.model.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.mem.model.*"%>
<% 
	MemberVO memberVO=(MemberVO)session.getAttribute("memberVO");
	Store_OrderService orderSvc=new Store_OrderService();
	String mem_id=memberVO.getMem_id();
	List<Store_OrderVO> store_orderVO=new LinkedList<Store_OrderVO>();
	 store_orderVO=orderSvc.getOrderByMem_id(mem_id);
%>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
<title>�Y�q�ڽu�W�q�\�t��</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css" type="text/css">
</head>
<body>
	<div id="page">
		<div id="header">
			<div id="logo">
				<a href="<%=request.getContextPath()%>/index.jsp"><img src="<%=request.getContextPath()%>/images/logo.png" alt="LOGO"></a>
				<span id="login"><a href="<%=request.getContextPath()%>/frontend/mem/LoginAndAddMem.jsp">Login in</a></span>
				<% boolean flag=true; %>
				<ul>
					<li class="selected"><a href="<%=request.getContextPath()%>/index.jsp">Home</a></li>
					<li><a href='<%=request.getContextPath()%>/store/store.do?action=getStoreHot&store_star=80'>�����Ӯa</a></li>
					<li><a href='<%=request.getContextPath()%>/store/storeClass.jsp'>��Ӯa</a></li>
					<li><a href='<%=request.getContextPath()%>/product/productClass.jsp'>��ӫ~</a></li>
					<li><a href="<%=request.getContextPath()%>/backend/mem/ListOneMem.jsp">�̷s����</a></li>
					<li>
					<c:if test="${not empty memberVO }">
						<a href="<%=request.getContextPath()%>/backend/mem/mem.do?action=logout">�n�X</a>  
						<% flag=false;%>
					</c:if>
					<c:if test="${empty memberVO}">
					<a href="<%=request.getContextPath()%>/frontend/mem/LoginAndAddMem.jsp">login</a> 
					<% flag=true;%>
					</c:if>
					 </li>
				</ul>
			</div>
		</div>

		<div class="container" style="margin-bottom:180px;">
			<div class="row">
				<div class="col-xs-12 col-sm-3">
					<div class="panel panel-info" style="width:200px;">
					    <a href="<%=request.getContextPath() %>/frontend/mem/member_info_update.jsp" class="list-group-item">�ק���</a>
					</div>
					
					<div class="panel panel-info" style="width:200px;">
					    <a href="<%=request.getContextPath()%>/frontend/selectOrder/order.do?action=getOne_For_Display&mem_id=<%=memberVO.getMem_id() %> " class="list-group-item">�d�߭q��</a>
					</div>
				</div>
				<div class="col-xs-12 col-sm-7" >


				<div class="page-header"> 
					  <h1>�|���q�����</h1>
 				</div> 
				
				 <table border='1' bordercolor='#CCCCFF' width='600'>
	<tr>
		<th>�q��s��</th>
		<th>�q�\�ɶ�</th>
		<th>���a�W��</th>
		<th>�`���B</th>
		<th>���\�覡</th>
		<th>�q�檬�A</th>
		<th>�����q��</th>
		<th>���|�Ӯa</th>
	</tr>
	<c:forEach var="store_orderVO" items="${store_orderVO}" >
	<tr align='center' valign='middle'>
		<td>
			<a href="<%=request.getContextPath()%>/frontend/selectOrder/orderlist.do?action=getOneOrder_For_DetailDisplay&order_id=${store_orderVO.order_id}">${store_orderVO.order_id}</a>
		</td>

		<td><fmt:formatDate  pattern="yyyy-MM-dd HH:mm:ss" value="${store_orderVO.order_time }"/></td>
 		<td>${store_orderVO.store_name }</td>
		<td>${store_orderVO.totalprice }</td>
		<td>${store_orderVO.order_way }</td>
		<td>${store_orderVO.order_state }</td>
		<td>����</td>
		<td>���|</td>
	</tr>
	</c:forEach>

</table>
					


				</div>
			</div>
		</div>
		<div id="footer">
			<ul class="navigation">
				<li class="selected"><a href="<%=request.getContextPath()%>/index.jsp">Home</a></li>
				<li><a href='<%=request.getContextPath()%>/store/store.do?action=getStoreHot&store_star=80'>�����Ӯa</a></li>
				<li><a href='<%=request.getContextPath()%>/store/storeClass.jsp'>��Ӯa</a></li>
				<li><a href='<%=request.getContextPath()%>/product/productClass.jsp'>��ӫ~</a></li>
				<li><a href="news.html">�̷s����</a></li>
			</ul>
		</div>

	</div>
	<script src="https://code.jquery.com/jquery.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>
</html>
