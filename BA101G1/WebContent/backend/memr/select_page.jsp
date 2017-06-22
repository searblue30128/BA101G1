<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head><title>IBM Member_Report: Home</title></head>
<body bgcolor='white'>

<table border='1' cellpadding='5' cellspacing='0' width='400'>
  <tr bgcolor='#CCCCFF' align='center' valign='middle' height='20'>
    <td><h3>IBM Member_Report: Home</h3><font color=red>( MVC )</font></td>
  </tr>
</table>

<p>This is the Home page for IBM Member_Report: Home</p>

<h3>�|�����|��Ƭd��:</h3>
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
  <li><a href='<%=request.getContextPath()%>/backend/memr/listAllMR.jsp'>List</a> all Member_Reports. </li> <br><br>
  
  <li>
    <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/member_report/member_report.do" >
        <b>��J�|�����|�渹 (�pMR-000001):</b>
        <input type="text" name="mr_id">
        <input type="submit" value="�e�X">
        <input type="hidden" name="action" value="getOne_For_Display">
    </FORM>
  </li>

  <jsp:useBean id="mrSvc" scope="page" class="com.member_report.model.MemberReportService" />
   
  <li>
     <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/member_report/member_report.do" >
       <b>��ܷ|���s��:</b>
       <select size="1" name="mr_id">
         <c:forEach var="mrVO" items="${mrSvc.all}" > 
          <option value="${mrVO.mr_id}">${mrVO.mr_id}
         </c:forEach>   
       </select>
       <input type="submit" value="�e�X">
       <input type="hidden" name="action" value="getOne_For_Display">
    </FORM>
  </li>
  
  <li>
     <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/member_report/member_report.do" >
       <b>��ܷ|�����|�渹:</b>
       <select size="1" name="mr_id">
         <c:forEach var="mrVO" items="${empSvc.all}" > 
          <option value="${mrVO.mr_id}">${mrVO.mr_id}
         </c:forEach>   
       </select>
       <input type="submit" value="�e�X">
       <input type="hidden" name="action" value="getOne_For_Display">
     </FORM>
  </li>
  
  
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
</ul>


<h3>�|�����|��ƺ޲z</h3>

<ul>
  <li><a href='<%=request.getContextPath()%>/backend/memr/addMR.jsp'>Add</a> a new MemberReport.</li>
</ul>

</body>

</html>
