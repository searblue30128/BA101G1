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

<%--   <jsp:useBean id="empSvc" scope="page" class="com.emp.model.EmpService" /> --%>
   
<!--   <li> -->
<%--      <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/emp/emp.do" > --%>
<!--        <b>��ܭ��u�s��:</b> -->
<!--        <select size="1" name="empno"> -->
<%--          <c:forEach var="empVO" items="${empSvc.all}" >  --%>
<%--           <option value="${empVO.empno}">${empVO.empno} --%>
<%--          </c:forEach>    --%>
<!--        </select> -->
<!--        <input type="submit" value="�e�X"> -->
<!--        <input type="hidden" name="action" value="getOne_For_Display"> -->
<!--     </FORM> -->
<!--   </li> -->
  
<!--   <li> -->
<%--      <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/emp/emp.do" > --%>
<!--        <b>��ܭ��u�m�W:</b> -->
<!--        <select size="1" name="empno"> -->
<%--          <c:forEach var="empVO" items="${empSvc.all}" >  --%>
<%--           <option value="${empVO.empno}">${empVO.ename} --%>
<%--          </c:forEach>    --%>
<!--        </select> -->
<!--        <input type="submit" value="�e�X"> -->
<!--        <input type="hidden" name="action" value="getOne_For_Display"> -->
<!--      </FORM> -->
<!--   </li> -->
  
  
<%--    <jsp:useBean id="deptSvc" scope="page" class="com.dept.model.DeptService" /> --%>
  
<!--   <li> -->
<%--      <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/dept/dept.do" > --%>
<!--        <b><font color=orange>��ܳ���:</font></b> -->
<!--        <select size="1" name="deptno"> -->
<%--          <c:forEach var="deptVO" items="${deptSvc.all}" >  --%>
<%--           <option value="${deptVO.deptno}">${deptVO.dname} --%>
<%--          </c:forEach>    --%>
<!--        </select> -->
<!--        <input type="submit" value="�e�X"> -->
<!--        <input type="hidden" name="action" value="listEmps_ByDeptno_A"> -->
<!--      </FORM> -->
<!--   </li> -->
<!-- </ul> -->


<!-- <h3>���u�޲z</h3> -->

<!-- <ul> -->
<%--   <li><a href='<%=request.getContextPath()%>/emp/addEmp.jsp'>Add</a> a new Emp.</li> --%>
<!-- </ul> -->

<!-- <h3><font color=orange>�����޲z</font></h3> -->

<!-- <ul> -->
<%--   <li><a href='<%=request.getContextPath()%>/dept/listAllDept.jsp'>List</a> all Depts. </li> --%>
<!-- </ul> -->

</body>

</html>
