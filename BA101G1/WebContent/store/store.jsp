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
  
  <li>
     <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/store/store.do" >
       <b>��ܦa��
       :</b>
       <select size="1" name="store_zone">
          <option value="�򶩥�">�򶩥�
          <option value="�O�_��">�O�_��
          <option value="�s�_��">�s�_��
          <option value="��饫">��饫
          <option value="�s�˥�">�s�˥�
          <option value="�s�˿�">�s�˿�
          <option value="�]�߿�">�]�߿�
          <option value="�O����">�O����
          <option value="���ƿ�">���ƿ�
          <option value="�n�뿤">�n�뿤
          <option value="���L��">���L��
          <option value="�Ÿq��">�Ÿq��
          <option value="�Ÿq��">�Ÿq��
          <option value="�O�n��">�O�n��
          <option value="������">������
          <option value="�̪F��">�̪F��
          <option value="�O�F��">�O�F��
          <option value="�Ὤ��">�Ὤ��
          <option value="�y����">�y����
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
