<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head><title>STORE</title></head>
<body bgcolor='white'>

<table border='1' cellpadding='5' cellspacing='0' width='400'>
  <tr bgcolor='#CCCCFF' align='center' valign='middle' height='20'>
    <td><h3>IBM Emp: Home</h3><font color=red>( MVC )</font></td>
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
        <input type="hidden" name="action" value="get_store">
    </FORM>
  </li>
  
	<% String store_zone=(String)request.getAttribute("store_zone"); %>

  <li>
     <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/store/store.do" >
       <b>��ܦa�� :</b>
       <select size="1" name="store_zone">
          <option value="�򶩥�" <c:if test="${store_zone.equals('�򶩥�') }"> selected</c:if>>�򶩥�
          <option value="�O�_��" <c:if test="${store_zone.equals('�O�_��') }"> selected</c:if>>�O�_��
          <option value="�s�_��" <c:if test="${store_zone.equals('�s�_��') }"> selected</c:if>>�s�_��
          <option value="��饫" <c:if test="${store_zone.equals('��饫') }"> selected</c:if>>��饫
          <option value="�s�˥�" <c:if test="${store_zone.equals('�s�˥�') }"> selected</c:if>>�s�˥�
          <option value="�s�˿�" <c:if test="${store_zone.equals('�s�˿�') }"> selected</c:if>>�s�˿�
          <option value="�]�߿�" <c:if test="${store_zone.equals('�]�߿�') }"> selected</c:if>>�]�߿�
          <option value="�O����" <c:if test="${store_zone.equals('�O����') }"> selected</c:if>>�O����
          <option value="���ƿ�" <c:if test="${store_zone.equals('���ƿ�') }"> selected</c:if>>���ƿ�
          <option value="�n�뿤" <c:if test="${store_zone.equals('�n�뿤') }"> selected</c:if>>�n�뿤
          <option value="���L��" <c:if test="${store_zone.equals('���L��') }"> selected</c:if>>���L��
          <option value="�Ÿq��" <c:if test="${store_zone.equals('�Ÿq��') }"> selected</c:if>>�Ÿq��
          <option value="�Ÿq��" <c:if test="${store_zone.equals('�Ÿq��') }"> selected</c:if>>�Ÿq��
          <option value="�O�n��" <c:if test="${store_zone.equals('�O�n��') }"> selected</c:if>>�O�n��
          <option value="������" <c:if test="${store_zone.equals('������') }"> selected</c:if>>������
          <option value="�̪F��" <c:if test="${store_zone.equals('�̪F��') }"> selected</c:if>>�̪F��
          <option value="�O�F��" <c:if test="${store_zone.equals('�O�F��') }"> selected</c:if>>�O�F��
          <option value="�Ὤ��" <c:if test="${store_zone.equals('�Ὤ��') }"> selected</c:if>>�Ὤ��
          <option value="�y����" <c:if test="${store_zone.equals('�y����') }"> selected</c:if>>�y����
       </select>
       <input type="submit" value="�e�X">
       <input type="hidden" name="action" value="get_zone">
    </FORM>
  </li>
</ul>
 
<%if (request.getAttribute("storelist")!=null){%>
       <jsp:include page="/store/listSearchStore.jsp" />
<%} %>

</body>
</html>
