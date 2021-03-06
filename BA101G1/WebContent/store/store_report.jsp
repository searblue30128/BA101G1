<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="com.mem.model.*"%>
<%@ page import="com.store.model.*"%>
<%@ page import="com.store_report.model.*"%>
<%@ page import="java.util.*"%>
<% 
StoreVO storeVO=(StoreVO)session.getAttribute("storeVO");
StoreReportService storereportSvc=new StoreReportService();
String store_id=storeVO.getStore_id();
List<StoreReportVO> storereportVO=new LinkedList<StoreReportVO>();
storereportVO=storereportSvc.getReportByStore_id(store_id);
 pageContext.setAttribute("storereportVO",storereportVO);
%>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
<title>吃訂我線上訂餐系統</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css" type="text/css">
</head>
<body>
	<div id="page">
		<div id="header">
			<jsp:include page="/header_store.jsp"></jsp:include>
		</div>

		<div class="container" style="margin-bottom:180px;">
			<div class="row">
				<div class="col-xs-12 col-sm-3">
					<div class="panel panel-info" style="width:200px;">
					    <a href="<%=request.getContextPath() %>/store/store_update.jsp" class="list-group-item">修改資料</a>
					</div>
					<div class="panel panel-info" style="width:200px;">
					    <a href="<%=request.getContextPath()%>/store/store_list_all_product.jsp " class="list-group-item">查詢所有商品</a>
					</div>
					<div class="panel panel-info" style="width:200px;">
					    <a href="<%=request.getContextPath()%>/store/store_order.jsp " class="list-group-item">查詢所有訂單</a>
					</div>
					<div class="panel panel-info" style="width:200px;">
					    <a href="<%=request.getContextPath()%>/store/store_order_notconfirm.jsp " class="list-group-item">查詢未確認訂單</a>
					</div>
					<div class="panel panel-info" style="width:200px;">
					    <a href="<%=request.getContextPath()%>/store/store_order_handleing.jsp " class="list-group-item">查詢進行中訂單</a>
					</div>
					<div class="panel panel-info" style="width:200px;">
					    <a href="<%=request.getContextPath()%>/store/store_order_finish.jsp " class="list-group-item">查詢已完成訂單</a>
					</div>
					<div class="panel panel-info" style="width:200px;">
					    <a href="<%=request.getContextPath()%>/store/store_report.jsp " class="list-group-item">查詢檢舉</a>
					</div>
					<div class="panel panel-info" style="width:200px;">
					    <a href="<%=request.getContextPath()%>/store/store_insert_product.jsp " class="list-group-item">商品新增</a>
					</div>
					
				</div>
				
				
				<div class="col-xs-12 col-sm-7" >

			
				<div class="page-header"> 
					  <h1>商家檢舉資訊</h1>
 				</div> 
				<table border='1' bordercolor='#CCCCFF' width='600'>
					<tr>
						<th>商家檢舉單號</th>
						<th>商家編號</th>
						<th>評論編號</th>
						<th>訂單編號</th>
						<th>管理員編號</th>
						<th>檢舉內容</th>
						<th>檢舉圖片</th>
						<th>檢舉時間</th>
						<th>檢舉審核狀態</th>
						<th>檢舉結果</th>
					</tr>
				 <c:forEach var="store_reportVO" items="${storereportVO}" >
					<tr align='center' valign='middle'>
						<td>${store_reportVO.sr_id }</td>
				 		<td>${store_reportVO.store_id }</td>
						<td>${store_reportVO.sc_id }</td>
						<td>${store_reportVO.order_id }</td>
						<td>${store_reportVO.man_id }</td>
						<td>${store_reportVO.sr_content}</td>
						
						<td>${store_reportVO.sr_image }</td>
						<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${store_reportVO.sr_time }"/></td>
						<td>${store_reportVO.sr_state }</td>
						<td>${store_reportVO.sr_result }</td>
					</tr>
					</c:forEach>
				
				</table>
					

				</div>
			</div>
		</div>
		<div id="footer">
			<jsp:include page="/footer.jsp"></jsp:include>
		</div>

	</div>
	<script src="https://code.jquery.com/jquery.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>
</html>
