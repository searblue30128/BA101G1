<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.store.model.*"%>
<%
	StoreVO storeVO=(StoreVO)request.getAttribute("storeVO");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<title>Update Store here</title>
<script language="JavaScript" src="js/pic_preview.js"></script>

</head>
<body bgcolor='white'>

<table border='1' cellpadding='5' cellspacing='0' width='400'>
	<tr bgcolor='#CCCCFF' align='center' valign='middle' height='20'>
		<td>
		<h3>���a��ƭק� - update_store_input.jsp</h3>
		<a href="ListAllStore.jsp"><img src="images/logo.png" width="100" height="32" border="0">�^����</a></td>
	</tr>
</table>

<h3>��ƭק�:</h3>
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
<FORM METHOD="post" ACTION="store.do" name="form1" enctype="multipart/form-data">
<table border="0">
<tr>
		<td>�Ӯa�s��:<font color=red><b>*</b></font></td>
		<td><%=storeVO.getStore_id() %></td>
	</tr>
	<tr>
		<td>�Ӯa�W��:<font color=red><b>*</b></font></td>
		<td><input type="text" name="store_name" size="45" value="<%=storeVO.getStore_name()%>" />
	</tr>
	<jsp:useBean id="storeclassSvc" scope="page" class="com.store_class.model.StoreClassService" />
	<tr>
		<td>�Ӯa���O:<font color=red><b>*</b></font></td>
		<td><select size="1" name="sc_id">
			<c:forEach var="StoreClassVO" items="${storeclassSvc.all}">
				<option value="${StoreClassVO.sc_id}" ${(storeVO.sc_id==StoreClassVO.sc_id)? 'selected':'' } >${StoreClassVO.sc_name}
			</c:forEach>
		</select></td>
	</tr>
	
	<tr>
		<td>�Ӯa²��:<font color=red><b>*</b></font></td>
		<td><input type="text" name="store_content" size="45" value="<%=storeVO.getStore_content()%>" />
	</tr>
	<tr>
		<td>�Ӯa�q��:<font color=red><b>*</b></font></td>
		<td><input type="text" name="store_phone" size="45" value="<%=storeVO.getStore_phone()%>" />
	</tr>
	<tr>
		<td>�Ӯa�a�}:<font color=red><b>*</b></font></td>
		<td><input type="text" name="store_addr" size="45" value="<%=storeVO.getStore_addr()%>" />
	</tr>
	<tr>
		<td>���a�Ϥ�:<font color=red><b>*</b></font></td>
			<td>
			<input type="file" name="store_image" id="upfile1">
			 <p>
    			<img src="<%=request.getContextPath()%>/StoreReader?store_id=${storeVO.store_id}" id="image" style="max-width: 150px; max-height: 150px;">
			</p>
			</td>
	</tr>
	<tr>
		<td>�Ӯa�b��:<font color=red><b>*</b></font></td>
		<td><input type="text" name="store_acc" size="45" value="<%=storeVO.getStore_acc()%>" />
	</tr>
	<tr>
		<td>�Ӯa�K�X:<font color=red><b>*</b></font></td>
		<td><input type="text" name="store_pw" size="45" value="<%=storeVO.getStore_pw()%>" />
	</tr>
	<tr>
		<td>�Ӯa�O�_�~�e:<font color=red><b>*</b></font></td>
		<td><select name="store_out">
			<option value='���~�e' ${(storeVO.store_out=='���~�e') ? 'selected':''}>���~�e</option>
			<option value='�S���~�e' ${(storeVO.store_out=='�S���~�e') ? 'selected':''}>�S���~�e</option></select> </td>
	</tr>
	<tr>
		<td>�Ӯa�a�� :<font color=red><b>*</b></font></td>
		<td><select size="1" name="store_zone">
						<option value="�򶩥�" ${(storeVO.store_zone=='�򶩥�') ? 'selected':''}>�򶩥�
						<option value="�O�_��" ${(storeVO.store_zone=='�O�_��') ? 'selected':''}>�O�_��
						<option value="�s�_��" ${(storeVO.store_zone=='�s�_��') ? 'selected':''}>�s�_��
						<option value="��饫" ${(storeVO.store_zone=='��饫') ? 'selected':''}>��饫
						<option value="�s�˥�" ${(storeVO.store_zone=='�s�˥�') ? 'selected':''}>�s�˥�
						<option value="�s�˿�" ${(storeVO.store_zone=='�s�˿�') ? 'selected':''}>�s�˿�
						<option value="�]�߿�" ${(storeVO.store_zone=='�]�߿�') ? 'selected':''}>�]�߿�
						<option value="�O����" ${(storeVO.store_zone=='�O����') ? 'selected':''}>�O����
						<option value="���ƿ�" ${(storeVO.store_zone=='���ƿ�') ? 'selected':''}>���ƿ�
						<option value="�n�뿤" ${(storeVO.store_zone=='�n�뿤') ? 'selected':''}>�n�뿤
						<option value="���L��" ${(storeVO.store_zone=='���L��') ? 'selected':''}>���L��
						<option value="�Ÿq��" ${(storeVO.store_zone=='�Ÿq��') ? 'selected':''}>�Ÿq��
						<option value="�Ÿq��" ${(storeVO.store_zone=='�Ÿq��') ? 'selected':''}>�Ÿq��
						<option value="�O�n��" ${(storeVO.store_zone=='�O�n��') ? 'selected':''}>�O�n��
						<option value="������" ${(storeVO.store_zone=='������') ? 'selected':''}>������
						<option value="�̪F��" ${(storeVO.store_zone=='�̪F��') ? 'selected':''}>�̪F��
						<option value="�O�F��" ${(storeVO.store_zone=='�O�F��') ? 'selected':''}>�O�F��
						<option value="�Ὤ��" ${(storeVO.store_zone=='�Ὤ��') ? 'selected':''}>�Ὤ��
						<option value="�y����" ${(storeVO.store_zone=='�y����') ? 'selected':''}>�y����
						
					</select></td>
	</tr>
	<tr>
		<td>�Ӯa���A:<font color=red><b>*</b></font></td>
		<td><select name="store_state">
			<option value='�f�֤�' ${(storeVO.store_state=='�f�֤�') ? 'selected':''}>�f�֤�</option>
			<option value='�}����' ${(storeVO.store_state=='�}����') ? 'selected':''}>�}����</option>
			<option value='���~��' ${(storeVO.store_state=='���~��') ? 'selected':''}>���~��</option></select> </td>
	</tr>
	</table>
	<br>
<input type="hidden" name="action" value="update">
<input type="hidden" name="store_id" value="<%=storeVO.getStore_id() %>">
<input type="submit" value="�e�X�ק�"></FORM>
</body>
</html>