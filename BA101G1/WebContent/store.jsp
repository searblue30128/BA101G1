<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head><title>IBM Emp: Home</title></head>
<body bgcolor='white'>

<table border='1' cellpadding='5' cellspacing='0' width='400'>
  <tr bgcolor='#CCCCFF' align='center' valign='middle' height='20'>
    <td><h3>IBM Emp: Home</h3><font color=red>( MVC )</font></td>
  </tr>
</table>

<p>This is the Home page for IBM Emp: Home</p>

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
</ul>

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


<%if (request.getAttribute("storelist")!=null){%>
       <jsp:include page="/store/listSearchStore.jsp" />
<%} %>

</body>
</html>
