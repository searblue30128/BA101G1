<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ page import="com.push.model.*"%>
<%-- �����m�߱ĥ� Script ���g�k���� --%>

<%-- ���X Concroller PushServlet.java�w�s�Jrequest��pushVO����--%>
<%PushVO pushVO = (PushVO) request.getAttribute("pushVO");%>


<html>
<head>
<title>��@������� - listOnePush.jsp</title>
</head>
<body bgcolor='white'>
<b><font color=red>�����m�߱ĥ� Script ���g�k����:</font></b>
<table border='1' cellpadding='5' cellspacing='0' width='800'>
	<tr bgcolor='#CCCCFF' align='center' valign='middle' height='20'>
		<td>
		<h3>��@������� - ListOnePush.jsp</h3>
		<a href="<%=request.getContextPath()%>/backend/push/select_page.jsp"><img src="/BA101G1/backend/man/images/back1.gif" width="100" height="32" border="0">�^����</a>
		</td>
	</tr>
</table>

<table border='1' bordercolor='#CCCCFF' width='800'>
	<tr>
		<th>�����s��</th>
		<th>�޲z���s��</th>
		<th>�������e</th>
		<th>�����ɶ�</th>
		<th>�̷s�����s��</th>
		<th>�s�i�s��</th>
	</tr>
	<tr align='center' valign='middle'>
		<td><%=pushVO.getPush_id()%></td>
		<td><%=pushVO.getMan_id()%></td>
		<td><%=pushVO.getPush_content()%></td>
		<td><%=pushVO.getPush_time()%></td>
		<td><%=pushVO.getNews_id()%></td>
		<td><%=pushVO.getAd_id()%></td>
	</tr>
</table>

</body>
</html>
