<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.man.model.*"%>

<html>
<head>
<title>���u��Ʒs�W - addMan.jsp</title></head>


<body bgcolor='white'>

	<table border='1' cellpadding='5' cellspacing='0' width='500'>
		<tr bgcolor='#CCCCFF' align='center' valign='middle' height='20'>
			<td><h3>���u��Ʒs�W - addMan.jsp</h3></td>
			<td><a href="select_man.jsp"><img src="images/tomcat.gif"	width="100" height="100" border="1"> �^���� </a></td></tr></table>

<h4>���u���:<font color=red><b>*</b></font>���������</h4>
<%-- ���~��C --%>
<c:if test="${not empty errorMsgs}">
	<font color='red'>�Эץ��H�U���~:
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li>${message.value}</li>
		</c:forEach>
	</ul>
	</font>
</c:if>

<FORM METHOD="post" ACTION="man.do" name="form1">
<table border="0">

	<tr>
		<td>���u�m�W:<font color=red><b>*</b></font></td>
		<td><input type="TEXT" name="ename" size="45" 
			 value="${param.man_name}"/></td><td>${errorMsgs.man_name}</td>
	</tr>
	<tr>
		<td>�q��:<font color=red><b>*</b></font></td>
		<td><input type="TEXT" name="phone" size="45"
			 value="${param.man_phone}"/></td><td>${errorMsgs.man_phone}</td>
	</tr>
	<tr>
		<td>�K�X:<font color=red><b>*</b></font></td>
		<td><input type="TEXT" name="pw" size="45"
			 value="${param.man_pw}"/></td><td>${errorMsgs.man_pw}</td>
	</tr>
	<tr>
		<td>�H�c:<font color=red><b>*</b></font></td>
		<td><input type="TEXT" name="mail" size="45"
			 value="${param.man_mail}"/></td><td>${errorMsgs.man_mail}</td>
	</tr>


</table>
<br>
<input type="hidden" name="action" value="insert">
<input type="submit" value="�e�X�s�W"></FORM>
</body>

</html>
