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

<h3>�\�I�d��:</h3>
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
    <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/product/product.do" >
        <b>��J�\�I����r:</b>
        <input type="text" name="pro_name">
        <input type="submit" value="�e�X">
        <input type="hidden" name="action" value="get_product">
    </FORM>
  </li>
</ul>

<jsp:useBean id="proSvc" scope="page" class="com.product.model.ProductService" />
   
  <li>
     <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/product/product.do" >
       <b>��ܰӫ~����:</b>
       <select size="1" name="pro_type">
         <c:forEach var="proVO" items="${proSvc.all}" > 
          <option value="${proVO.pro_type}">${proVO.pro_type}
         </c:forEach>   
       </select>
       <input type="submit" value="�e�X">
       <input type="hidden" name="action" value="get_type">
    </FORM>
  </li>


<%if (request.getAttribute("productlist")!=null){%>
       <jsp:include page="/product/listOnePro.jsp" />
<%} %>

</body>
</html>
