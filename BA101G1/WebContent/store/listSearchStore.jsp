<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ page import="com.store.model.*"%>
<%@ page import="com.store_class.model.*"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%-- �����m�߱ĥ� Script ���g�k���� --%>
<%--
	ProductService proSvc1=new ProductService();
	String pro_name=(String)request.getAttribute("pro_name");
	List<ProductVO> list=proSvc1.getName(pro_name);
--%>
<%-- ���X Concroller EmpServlet.java�w�s�Jrequest��EmpVO����--%>
<%--  <%List<ProductVO> productVO = (List) request.getAttribute("productlist");%>--%>
<jsp:useBean id="storeSvc" scope="page" class="com.store.model.StoreService" />
<jsp:useBean id="storeclassSvc" scope="page" class="com.store_class.model.StoreClassService" />

<html>
<head>
<title>�Ӯa�d�ߵ��G - listSearchStore.jsp</title>
</head>
<body bgcolor='white'>
<b><font color=red>�����m�߱ĥ� Script ���g�k����:</font></b>
<table border='1' cellpadding='5' cellspacing='0' width='800'>
	<tr bgcolor='#CCCCFF' align='center' valign='middle' height='20'>
		<td>
		<h3>�Ӯa�d�ߵ��G - listSearchStore.jsp</h3>
		<a href="<%=request.getContextPath()%>/index.jsp"><img src="images/back1.gif" width="100" height="32" border="0">�^����</a>
		</td>
	</tr>
</table>

<table border='1' bordercolor='#CCCCFF' width='800'>
	<tr>
		<th>�Ӯa�Ϥ�</th>
		<th>�Ӯa�W��</th>
		<th>�Ӯa����</th>
		<th>�Ӯa�����W��</th>
	</tr>
	
	<c:forEach var="storeVO" items="${storelist}">
		<tr align='center' valign='middle'>
			<td><IMG src="<%=request.getContextPath()%>/StoreClassReader?store_id=${storeVO.store_id}"></td>
			<td>${storeVO.store_name}</td>
			<td>${storeVO.sc_id}</td>
			<td><c:forEach var="storeclasslistVO" items="${storeclassSvc.all}">
                    <c:if test="${storeVO.sc_id==storeclasslistVO.sc_id}">
	                    ${storeclasslistVO.sc_name}
                    </c:if>
                </c:forEach>
			</td>
		<tr>
	</c:forEach>
	
</table>

</body>
</html>
