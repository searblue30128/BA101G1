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
	 pageContext.setAttribute("store_orderVO",store_orderVO);
%>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
<script src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
<title>�Y�q�ڽu�W�q�\�t��</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css" type="text/css">
<script type="text/javascript">
$(document).ready(
		function() {
		});


</script>

</head>
<body>
	<div id="page">
		<div id="header">
			<jsp:include page="/header_member.jsp"></jsp:include>
		</div>

		<div class="container" style="margin-bottom:180px;">
			<div class="row">
				<div class="col-xs-12 col-sm-3">
					<div class="panel panel-info" style="width:200px;">
					    <a href="<%=request.getContextPath() %>/frontend/mem/member_info_update.jsp" class="list-group-item">�ק���</a>
					</div>
					
					<div class="panel panel-info" style="width:200px;">
					    <a href="<%=request.getContextPath()%>/frontend/mem/member_info_order.jsp " class="list-group-item">�d�߭q��</a>
					</div>
					<div class="panel panel-info" style="width:200px;">
					    <a href="<%=request.getContextPath()%>/frontend/mem/member_report.jsp " class="list-group-item">�d�����|</a>
					</div>
				</div>
				<div class="col-xs-12 col-sm-7" >


				<div class="page-header"> 
					  <h1>�|���q�����</h1>
 				</div> 
				
				 <table border='1' bordercolor='#CCCCFF' width='600'>
					<tr>
						<th width="10%">�q��s��</th>
						<th width="10%">�q�\�ɶ�</th>
						<th width="10%">���\�ɶ�</th>
						<th width="10%">���a�W��</th>
						<th width="10%">�`���B</th>
						<th width="10%">���\�覡</th>
						<th width="10%">�q�檬�A</th>
						<th width="10%">�����q��</th>
						<th width="10%">���|�Ӯa</th>
						<th width="10%">���</th>
					</tr>
					</table>
	<c:forEach var="store_orderVO1" items="${store_orderVO}" >
	<table border='1' bordercolor='#CCCCFF' width='600'>
	<tr align='center' valign='middle' ${(store_orderVO1.order_id==param.order_id) ? 'bgcolor=#CCCCFF':''}>
		<td width="10%">
			<a href="<%=request.getContextPath()%>/frontend/selectOrder/orderlist.do?action=getOneOrder_For_DetailDisplay&order_id=${store_orderVO1.order_id}">${store_orderVO1.order_id}</a>
		</td>

		<td width="10%"><fmt:formatDate  pattern="yyyy-MM-dd HH:mm:ss" value="${store_orderVO1.order_time }"/></td>
		<td width="10%"><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${store_orderVO1.order_taketime }"/></td>
 		<td width="10%">${store_orderVO1.store_name }</td>
		<td width="10%">${store_orderVO1.totalprice }</td>
		<td width="10%">${store_orderVO1.order_way }</td>
		<td width="10%">${store_orderVO1.order_state }</td>
		<td width="10%"><c:if test="${store_orderVO1.order_state eq '���T�{'}">
			<form method="post" action="<%=request.getContextPath()%>/frontend/selectOrder/order.do">
							<input type="submit" value="�����q��">
							<input type="hidden" name="order_id" value="${store_orderVO1.order_id}">
							<input type="hidden" name="store_id" value="${store_orderVO1.store_id}">
							<input type="hidden" name="action" value="Cancel">
						</form>
			</c:if>
<%-- 			<c:if test="${store_orderVO1.order_state != '���T�{'}">�L�k����</c:if> --%>
		</td>
		<td width="10%"><c:if test="${store_orderVO1.order_state eq '�w����' || store_orderVO1.order_state eq '�w���\'}">
			<form method="post" action="<%=request.getContextPath()%>/frontend/mem/member_addMR.jsp">
							<input type="submit" value="���|">
							<input type="hidden" name="order_id" value="${store_orderVO1.order_id}">
						</form>
		</c:if>
<%-- 			<c:if test="${store_orderVO1.order_state != '�w����' &&store_orderVO1.order_state != '�w���\'}">�L�k���|</c:if> --%>
		</td>
		<td width="10%">
			<input type="button" value="���" class="abc" >
		</td>
	</tr>
		<jsp:useBean id="orderlistSvc" scope="page" class="com.orderlist.model.OrderlistService"></jsp:useBean>
		<jsp:useBean id="productSvc" scope="page" class="com.product.model.ProductService"></jsp:useBean>
		<c:forEach var="orderlistVO" items="${orderlistSvc.getOrderlist(store_orderVO1.order_id)}" >
			<tr style="display: none;">
				<td>${productSvc.getOnePro(orderlistVO.pro_id).pro_name}</td>		
				<td>${orderlistVO.order_amount}</td>
				<td>${orderlistVO.price}</td>
			</tr>
		</c:forEach>
</table>
	</c:forEach>
				</div>
			</div>
		</div>
		<div id="footer">
			<jsp:include page="/footer.jsp"/>
		</div>

	</div>
	<script src="https://code.jquery.com/jquery.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>
</html>
<script type="text/javascript">
$(".abc").on('click',function(){
	console.log($(".abc").index(this))
	var father=$(".abc").eq($(".abc").index(this)).parent().parent().siblings();
	father.toggle();
})
 
</script>