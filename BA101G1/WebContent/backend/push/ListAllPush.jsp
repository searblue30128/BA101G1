<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.push.model.*"%>
<%-- �����m�߱ĥ� EL ���g�k���� --%>
	---${param.push_id}----
<%
	PushService pushSvc = new PushService();
	List<PushVO> list = pushSvc.getAll();
	pageContext.setAttribute("list",list);
%>
<jsp:useBean id="pushSvc1" scope="page" class="com.push.model.PushService" />

<html>
<head>
<title>�Ҧ�������� - listAllPush.jsp</title>
</head>
<body bgcolor='white'>
<b><font color=red>�����m�߱ĥ� EL ���g�k����:</font></b>
<table border='1' cellpadding='5' cellspacing='0' width='800'>
	<tr bgcolor='#CCCCFF' align='center' valign='middle' height='20'>
		<td>
		<h3>�Ҧ�������� - ListAllPush.jsp</h3>
		<a href="<%=request.getContextPath()%>/backend/push/select_page.jsp"><img src="/BA101G1/backend/man/images/back1.gif" width="100" height="32" border="0">�^����</a>
		</td>
	</tr>
</table>

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

<table border='1' bordercolor='#CCCCFF' width='800'>
	<tr>
		<th>�����s��</th>
		<th>�޲z���s��</th>
		<th>�������e</th>
		<th>�����ɶ�</th>
		<th>�̷s�����s��</th>
		<th>�s�i�s��</th>
		<th>�ק�</th>
		<th>�R��</th>
	</tr>
	<%@ include file="pages/page1.file" %> 
	<c:forEach var="empVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
		<tr align='center' valign='middle' ${(pushVO.push_id==param.push_id) ? 'bgcolor=#CCCCFF':''}><!--�N�ק諸���@���[�J����Ӥw-->
			<td>${pushVO.push_id}</td>
			<td>${pushVO.man_id}</td>
			<td>${pushVO.push_content}</td>
			<td>${pushVO.push_time}</td>
			<td>${pushVO.news_id}</td>
			<td>${pushVO.ad_id}</td>			

			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/push/push.do">
			     <input type="submit" value="�ק�"> 
			     <input type="hidden" name="push_id" value="${pushVO.push_id}">
			     <input type="hidden" name="requestURL"	value="<%=request.getServletPath()%>"><!--�e�X�����������|��Controller-->
			    <input type="hidden" name="whichPage"	value="<%=whichPage%>">               <!--�e�X��e�O�ĴX����Controller-->
			     <input type="hidden" name="action"	value="getOne_For_Update"></FORM>
			</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/push/push.do">
			    <input type="submit" value="�R��">
			    <input type="hidden" name="push_id" value="${pushVO.push_id}">
			    <input type="hidden" name="requestURL"	value="<%=request.getServletPath()%>"><!--�e�X�����������|��Controller-->
			    <input type="hidden" name="whichPage"	value="<%=whichPage%>">               <!--�e�X��e�O�ĴX����Controller-->
			    <input type="hidden" name="action"value="delete"></FORM>
			</td>
		</tr>
	</c:forEach>
</table>
<%@ include file="pages/page2.file" %>

<br>�����������|:<br><b>
   <font color=blue>request.getServletPath():</font> <%= request.getServletPath()%><br>
   <font color=blue>request.getRequestURI(): </font> <%= request.getRequestURI()%> </b>
</body>
</html>
