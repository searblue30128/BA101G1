<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.store_class.model.*"%>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
<title>�Y�q�ڽu�W�q�\�t��</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css" type="text/css">
</head>
<body bgcolor='white'>
	<div id="page">
		<div id="header">
			<div id="logo">
				<a href="<%=request.getContextPath()%>/index.jsp"><img src="<%=request.getContextPath()%>/images/logo.png" alt="LOGO"></a>
				<span id="login"><a href="<%=request.getContextPath()%>/backend/mem/AddMem.jsp">Login in</a></span>

				<ul>
					<li class="selected"><a href="<%=request.getContextPath()%>/index.jsp">Home</a></li>
					<li><a href='<%=request.getContextPath()%>/store/store.do?action=getStoreHot&store_star=80'>�����Ӯa</a></li>
					<li><a href='<%=request.getContextPath()%>/store/storeClass.jsp'>��Ӯa</a></li>
					<li><a href='<%=request.getContextPath()%>/product/productClass.jsp'>��ӫ~</a></li>
					<li><a href="news.html">�̷s����</a></li>
				</ul>
			</div>
		</div>
		<div id="classcontents">
			<!-- �j�M�Ӯa&�a�� -->
			<div id="main">

				<FORM METHOD="post"
					ACTION="<%=request.getContextPath()%>/store/store.do">
					<b>�j�M�Ӯa:</b> <input type="text" name="store_name"> <input
						type="submit" value="�e�X"> <input type="hidden"
						name="action" value="get_store_b">
				</FORM>

				<%-- ���~���C --%>
				<c:if test="${not empty errorMsgs}">
					<font color='red'>
						<ul>
							<c:forEach var="message" items="${errorMsgs}">
								<li>${message}</li>
							</c:forEach>
						</ul>
					</font>
				</c:if>

				<%
					String store_zone = (String) request.getAttribute("store_zone");
				%>


				<FORM METHOD="post"
					ACTION="<%=request.getContextPath()%>/store/store.do">
					<b>��ܦa�� :</b> <select size="1" name="store_zone">
						<option value="�򶩥�"<c:if test="${store_zone.equals('�򶩥�') }"> selected</c:if>>�򶩥�
						<option value="�O�_��"<c:if test="${store_zone.equals('�O�_��') }"> selected</c:if>>�O�_��
						<option value="�s�_��"<c:if test="${store_zone.equals('�s�_��') }"> selected</c:if>>�s�_��
						<option value="��饫"<c:if test="${store_zone.equals('��饫') }"> selected</c:if>>��饫
						<option value="�s�˥�"<c:if test="${store_zone.equals('�s�˥�') }"> selected</c:if>>�s�˥�
						<option value="�s�˿�"<c:if test="${store_zone.equals('�s�˿�') }"> selected</c:if>>�s�˿�
						<option value="�]�߿�"<c:if test="${store_zone.equals('�]�߿�') }"> selected</c:if>>�]�߿�
						<option value="�O����"<c:if test="${store_zone.equals('�O����') }"> selected</c:if>>�O����
						<option value="���ƿ�"<c:if test="${store_zone.equals('���ƿ�') }"> selected</c:if>>���ƿ�
						<option value="�n�뿤"<c:if test="${store_zone.equals('�n�뿤') }"> selected</c:if>>�n�뿤
						<option value="���L��"<c:if test="${store_zone.equals('���L��') }"> selected</c:if>>���L��
						<option value="�Ÿq��"<c:if test="${store_zone.equals('�Ÿq��') }"> selected</c:if>>�Ÿq��
						<option value="�Ÿq��"<c:if test="${store_zone.equals('�Ÿq��') }"> selected</c:if>>�Ÿq��
						<option value="�O�n��"<c:if test="${store_zone.equals('�O�n��') }"> selected</c:if>>�O�n��
						<option value="������"<c:if test="${store_zone.equals('������') }"> selected</c:if>>������
						<option value="�̪F��"<c:if test="${store_zone.equals('�̪F��') }"> selected</c:if>>�̪F��
						<option value="�O�F��"<c:if test="${store_zone.equals('�O�F��') }"> selected</c:if>>�O�F��
						<option value="�Ὤ��"<c:if test="${store_zone.equals('�Ὤ��') }"> selected</c:if>>�Ὤ��
						<option value="�y����"<c:if test="${store_zone.equals('�y����') }"> selected</c:if>>�y����
						
					</select> <input type="submit" value="�e�X"> <input type="hidden"
						name="action" value="get_zone">
				</FORM>

			</div>

			<div id="items">
				<jsp:useBean id="scSvc" scope="page" class="com.store_class.model.StoreClassService" />
					<ul>
						<c:forEach var="scVO" items="${scSvc.all}" varStatus="loop">
						<li>
							<h3><IMG src="<%=request.getContextPath()%>/StoreClassReader?sc_id=${scVO.sc_id}" height="200"></h3>						
							<h3>${scVO.sc_id}</h3>
							<h3>
								<a href='<%=request.getContextPath()%>/store/store.do?action=getStoreClass&sc_id=<c:out value="${loop.index}" />'>${scVO.sc_name}</a>
							</h3>
						</li>
						</c:forEach>
					</ul>
			</div>
			
			
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