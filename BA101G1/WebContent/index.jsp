<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head><title>Index</title></head>
<body bgcolor='white'>

<table border='1' cellpadding='5' cellspacing='0' width='400'>
  <tr bgcolor='#CCCCFF' align='center' valign='middle' height='20'>
    <td><h3>�Y�q�ڽu�W�q�\�t��</h3><font color=red>( MVC )</font></td>
  </tr>
</table>

<p>Index</p>


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

<IMG src="FakeInfo/LOGO.png" width="100px" height="100px">

<h3><font color=orange>Header</font></h3>

<ul>
  <li><a href='store/store.do?action=getStoreHot&store_star=80'>�����Ӯa</a></li>
  <li><a href='<%=request.getContextPath()%>/store/storeClass.jsp'>��Ӯa</a></li>
  <li><a href='<%=request.getContextPath()%>/product/productClass.jsp'>��ӫ~</a></li>
</ul>


<h3><font color=orange>�Ӯa�d��</font></h3>
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
       <b>��ܦa�� :</b>
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




<!--  
  <IMG src="<%=request.getContextPath()%>/StoreClassReader?store_id=STO-000004">
-->

</body>
</html>
