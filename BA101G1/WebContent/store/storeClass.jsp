<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.store_class.model.*"%>
<html>
<head><title>STORE</title></head>
<body bgcolor='white'>

<%! int i = 0 ; %>

<table border='1' cellpadding='5' cellspacing='0' width='400'>
  <tr bgcolor='#CCCCFF' align='center' valign='middle' height='20'>
    <td><h3>STORE CLASS</h3><font color=red>( MVC )</font></td>
  </tr>
</table>

<p>STORE</p>

<h3>�Ӯa�d��:</h3>
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

<ul>
  <li>
    <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/store/store.do" >
        <b>�j�M�Ӯa:</b>
        <input type="text" name="store_name">
        <input type="submit" value="�e�X">
        <input type="hidden" name="action" value="get_store_b">
    </FORM>
  </li>
  
  <li>
     <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/store/store.do" >
       <b>��ܦa��
       :</b>
       <select size="1" name="store_zone">
          <option value="0">�򶩥�
          <option value="1">�O�_��
          <option value="2">�s�_��
          <option value="3">��饫
          <option value="4">�s�˥�
          <option value="5">�s�˿�
          <option value="6">�]�߿�
          <option value="7">�O����
          <option value="8">���ƿ�
          <option value="9">�n�뿤
          <option value="10">���L��
          <option value="11">�Ÿq��
          <option value="12">�Ÿq��
          <option value="13">�O�n��
          <option value="14">������
          <option value="15">�̪F��
          <option value="16">�O�F��
          <option value="17">�Ὤ��
          <option value="18">�y����
       </select>
       <input type="submit" value="�e�X">
       <input type="hidden" name="action" value="get_zone">
    </FORM>
  </li>
</ul>


<jsp:useBean id="scSvc" scope="page" class="com.store_class.model.StoreClassService" />

<table border='1' bordercolor='#CCCCFF' width='800'>
	<tr>
		<th>�Ϥ�</th>
		<th>���O�s��</th>
		<th>�Ӯa���O</th>
	</tr>
	
	<c:forEach var="scVO" items="${scSvc.all}">
		<tr align='center' valign='middle'>
			<td></td>
			<td>${scVO.sc_id}</td>
			<td><a href='<%=request.getContextPath()%>/store/store.do?action=getStoreClass&sc_id=<%= i++ %>'>${scVO.sc_name}</a></td>
		</tr>
	</c:forEach>
</table>


</body>
</html>
