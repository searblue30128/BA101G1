<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
<title>�Y�q�ڽu�W�q�\�t��</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css" type="text/css">
</head>
<body>
	<div id="page">
		<div id="header">
			<div id="logo">
				<a href="<%=request.getContextPath()%>/index.jsp"><img src="<%=request.getContextPath()%>/images/logo.png" alt="LOGO"></a>
				<span id="login"><a href="news.html">Login in</a></span>

				<ul>
					<li class="selected"><a href="<%=request.getContextPath()%>/index.jsp">Home</a></li>
					<li><a href='<%=request.getContextPath()%>/store/store.do?action=getStoreHot&store_star=80'>�����Ӯa</a></li>
					<li><a href='<%=request.getContextPath()%>/store/storeClass.jsp'>��Ӯa</a></li>
					<li><a href='<%=request.getContextPath()%>/product/productClass.jsp'>��ӫ~</a></li>
					<li><a href="news.html">�̷s����</a></li>
				</ul>
			</div>
		</div>

		<div id="contents">

			<!-- �\�I����  -->
			<jsp:useBean id="pcSvc" scope="page" class="com.product_class.model.ProductClassService" />
			<div id="sidebar">
				<h1>�\�I����</h1>
				<ul class="menu2">
					<c:forEach var="pcVO" items="${pcSvc.all}" varStatus="loop">
						<li class="selected"><a href='<%=request.getContextPath()%>/product/product.do?action=getProductClass&pc_id=${pcVO.pc_id}'>${pcVO.pc_name}</a></li>
					</c:forEach>
				</ul>
			</div>

			<!-- �j�M�Ӯa&�a�� -->
			<div id="main">


				<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/product/product.do" >
			        <b>��J�\�I����r:</b>
			        <input type="text" name="pro_name">
			        <input type="submit" value="�e�X">
			        <input type="hidden" name="action" value="getproduct_b">
			    </FORM>


				<%-- ���~��C --%>
				<c:if test="${not empty errorMsgs}">
					<font color='red'>
						<ul>
							<c:forEach var="message" items="${errorMsgs}">
								<li>${message}</li>
							</c:forEach>
						</ul>
					</font>
				</c:if>

				<%if (request.getAttribute("productlist")!=null){%>
       				<jsp:include page="/product/listSearchProduct.jsp" />
				<%}%>

			</div>
		</div>

		<!-- footer -->
		<div id="footer">
			<ul class="navigation">
				<li class="selected"><a href="<%=request.getContextPath()%>/index.jsp">Home</a></li>
				<li><a href='<%=request.getContextPath()%>/store/store.do?action=getStoreHot&store_star=80'>�����Ӯa</a></li>
				<li><a href='<%=request.getContextPath()%>/store/storeClass.jsp'>��Ӯa</a></li>
				<li><a href='<%=request.getContextPath()%>/product/productClass.jsp'>��ӫ~</a></li>
				<li><a href="news.html">�̷s����</a></li>
			</ul>
			<p id="footnote">Eternal Beauty Essentials 2012. All Rights Reserved.</p>
		</div>

	</div>

</body>
</html>
