<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head><title>IBM Order: Home</title></head>
<body bgcolor='white'>

<table border='1' cellpadding='5' cellspacing='0' width='400'>
  <tr bgcolor='#CCCCFF' align='center' valign='middle' height='20'>
    <td><h3>IBM Order: Home</h3><font color=red>( MVC )</font></td>
  </tr>
</table>

<p>This is the Home page for IBM Order: Home</p>

<h3>��Ƭd��:</h3>
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
    <FORM METHOD="post" ACTION="order.do" >
        <b>��J�|���s�� :</b>
        <input type="text" name="mem_id">
        <input type="submit" value="�e�X">
        <input type="hidden" name="action" value="getOne_For_Display">
    </FORM>
  </li>
   <li>
    <FORM METHOD="post" ACTION="order.do" >
        <b>�d�ߥ��T�{�q�� :</b>
        <input type="submit" value="�e�X">        
        <input type="hidden" name="order_state" value="���T�{">
        <input type="hidden" name="action" value="getOrder_State">
    </FORM>
  </li>
   <li>
    <FORM METHOD="post" ACTION="order.do" >
        <b>�d�ߤw�T�{�q�� :</b>
        <input type="submit" value="�e�X">        
        <input type="hidden" name="order_state" value="�w�T�{">
        <input type="hidden" name="action" value="getOrder_State">
    </FORM>
  </li>

</ul>

</body>

</html>
