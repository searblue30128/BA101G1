<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.mem.model.*"%>
<%
	MemberVO memberVO=(MemberVO)request.getAttribute("memberVO");
%>
<html >
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
		<title>Title Page</title>
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
		<!--[if lt IE 9]>
			<script src="https://cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.3/html5shiv.min.js"></script>
			<script src="https://cdnjs.cloudflare.com/ajax/libs/respond.js/1.4.2/respond.min.js"></script>
		<![endif]-->
			<style>
		.aa{
			margin-top: 40px;
		}

		#header{
			height: 200px;
			background-color: #F5F5DC;
		}
		/*LOGO*/
		#page div#header a img{
			float:left;
			margin:50px 0 0 50px;
			width:160px;
		}
		/*HOME �̷s���� ��Ӯa....���s����r*/
		#page div#header ul{
			float:right;
			margin: 100px 320px;
			overflow: hidden;
			padding: 0;
			width: 900px;
			font-size: 25px;
		}
		/*HOME �̷s���� ��Ӯa....���Z*/
		#page div#header ul li {
			float: left;
			padding: 30px;
			overflow: hidden;
		}
		/*HOME �̷s���� ��Ӯa....��Ӹm�k*/
		.signin{
			float: right;
			margin: 30px;
		}
	</style>
	</head>
	<body>
	<c:if test="${not empty errorMsgs}">
	<font color='red'>�Эץ��H�U���~:
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li>${message}</li>
		</c:forEach>
	</ul>
	</font>
</c:if>
	<div id="page">
		<div id="header">
				<a href="index.html"><img src="images/logo.png">
				</a>
				<div class="signin">
					<input type="button" value="Sing in">
				</div>
				<ul>
					<li class="current">
						<a href="index.html">Home</a>
					</li>
					<li>
						<a href="menu.html">�̷s����</a>
					</li>
					<li>
						<a href="locations.html">�����Ӯa</a>
					</li>
					<li>
						<a href="blog.html">��Ӯa</a>
					</li>
					<li>
						<a href="about.html">��ӫ~</a>
					</li>
				</ul>
			</div>
	</div>

		<div class="container">
			<div class="row">
				<div class="col-xs-12 col-sm-6 col-sm-offset-3">

					<!-- 
					1.�bform-group�~�h�K�[�@�� .form-horizontal
					2.�blabel�K�[�@�Ӯ�u�H�Τ@��control-label��class
					3.��input��J���A�]�q�b�@�Ӯ�u�� 
					-->


					<form METHOD="post" ACTION="<%=request.getContextPath()%>/backend/mem/mem.do" name="form1">
						
						<div class="form-horizontal">
							<div class="form-group">
								<label for="mem_mail" class="col-xs-12 col-sm-3 control-label">
									�q�l�H�c-�b��
								</label>
								<div class="col-xs-12 col-sm-9">
									<input type="text" name="mem_mail" id="aa" placeholder="email " class="form-control"  value="<%= (memberVO==null)? "sadqwe" :memberVO.getMem_mail() %>">
								</div>
							</div>
							<div class="form-group">
								<label for="mem_pw" class="col-xs-12 col-sm-3 control-label">
									�K�X
								</label>
								<div class="col-xs-12 col-sm-9">
									<input type="text" name="mem_pw" id="bb" placeholder="password" class="form-control" value="<%= (memberVO==null)? "1222212" :memberVO.getMem_pw() %>">
								</div>
							</div>
							<div class="form-group">
								<label for="mem_name" class="col-xs-12 col-sm-3 control-label">
									�m�W
								</label>
								<div class="col-xs-12 col-sm-9">
									<input type="text" name="mem_name" id="cc" placeholder="name" class="form-control" value="<%= (memberVO==null)? "�Ѥ�" :memberVO.getMem_pw() %>">
								</div>
							</div>

							<div class="form-group">
								<label for="mem_phone" class="col-xs-12 col-sm-3 control-label">
									�q��
								</label>
								<div class="col-xs-12 col-sm-9">
									<input type="text" name="mem_phone" id="dd" placeholder="phone" class="form-control" value="<%= (memberVO==null)? "123" :memberVO.getMem_phone() %>">
								</div>
							</div>
						</div>


						
						<input type="hidden" name="action" value="insert">
						<input type="submit" value="�e�X�s�W"></FORM>
				
				</div>
			</div>
		</div>


		
		
		<script src="https://code.jquery.com/jquery.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
	</body>
</html>