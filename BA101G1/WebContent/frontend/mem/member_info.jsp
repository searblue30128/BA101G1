<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.mem.model.*"%>
<% 
	MemberVO memberVO=(MemberVO)session.getAttribute("memberVO");
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
					    <a href="#" class="list-group-item">�ק���</a>
					</div>
					<div class="panel panel-info" style="width:200px;">
					    <a href="#" class="list-group-item">�d���\�I���p</a>
					</div>
					<div class="panel panel-info" style="width:200px;">
					    <a href="#" class="list-group-item">�d�߭q��</a>
					</div>
				</div>
				<div class="col-xs-12 col-sm-7">


				<div class="page-header"> 
					  <h1>�|�����</h1>
 				</div> 
				
				 <jsp:include page="/backend/mem/ListOneMem.jsp" />
					


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