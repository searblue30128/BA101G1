<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.mem.model.*"%>
<%
	MemberVO memberVO = (MemberVO) request.getAttribute("memberVO");
%>

<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
<title>Title Page</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
<!--[if lt IE 9]>
			<script src="https://cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.3/html5shiv.min.js"></script>
			<script src="https://cdnjs.cloudflare.com/ajax/libs/respond.js/1.4.2/respond.min.js"></script>
		<![endif]-->
</head>
<style>
.aa {
	margin-top: 150px;
}
</style>

<body>


	<div class="col-xs-12 col-sm-4 ">
		<center>
			<a href="http://www.google.com"> <img src="images/logo.png"
				width="150px" height="150px">
			</a> <br>
			<br>
			<br>
			<p font-size="100px">
				<b> <a href="http://www.google.com"> �Y�w�ڽu�W�q�\</a> > �n�J
				</b>
			</p>
		</center>
	</div>

	<div class="col-xs-12 col-sm-8">
		<div class="col-xs-12 col-sm-5 aa">
			<div role="tabpanel">

				<ul class="nav nav-tabs" role="tablist">
					<li role="presentation" class="active"><a href="#tab1"
						aria-controls="tab1" role="tab" data-toggle="tab">�|���n�J</a></li>
					<li role="presentation"><a href="#tab2" aria-controls="tab2"
						role="tab" data-toggle="tab">���U</a></li>
				</ul>
				<div class="tab-content">
					<div role="tabpanel" class="tab-pane active" id="tab1">
						<p class="well" align="center">
							<label for="�b��">�b��</label> <input type="text" name="�b��" id="�b��"
								placeholder="�п�JE-MAIL"> <br>
							<br> <label for="�K�X">�K�X</label> <input type="password"
								name="�K�X" id="�K�X" placeholder="�п�J�K�X"> <br>
							<br> <a herf="">�ѰO�K�X?</a> <br>
							<br> <a href="#" class="btn btn-info"><i
								class="glyphicon glyphicon-ok"></i> �e�X</a>
						</p>
					</div>
					<div role="tabpanel" class="tab-pane" id="tab2">
						<div class="well" align="center">
						<form METHOD="post"
							ACTION="<%=request.getContextPath()%>/backend/mem/mem.do"
							name="form1">
							<label for="mem_mail">�|���H�c</label> <input type="text"
								name="mem_mail" id="mem_mail" placeholder="�п�JE-MAIL"
								value="<%=(memberVO == null) ? "sadqwe" : memberVO.getMem_mail()%>">
							<br>
							<br> <label for="mem_pw">�|���K�X</label> <input type="password"
								name="mem_pw" id="mem_pw" placeholder="�п�J�K�X"
								value="<%=(memberVO == null) ? "1222212" : memberVO.getMem_pw()%>">
							<br>
							<br> <label for="�T�{�K�X">�T�{�K�X</label> <input type="password"
								name="�K�X" id="�K�X" placeholder="�A��J�@���K�X"> <br>
							<br> <label for="mem_name"> �m�W</label> <input type="text"
								name="mem_name" id="mem_name" placeholder="�п�J�m�W"
								value="<%=(memberVO == null) ? "�Ѥ�" : memberVO.getMem_pw()%>">
							<br>
							<br> <label for="mem_phone"> ���</label> <input type="text"
								name="mem_phone" id="mem_phone" placeholder="�п�J������X"
								value="<%=(memberVO == null) ? "123" : memberVO.getMem_phone()%>">
							<br>
							<br> <input type="hidden" name="action" value="insert">
							<input type="submit" value="�e�X�s�W">
						</form>
					</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>
</html>
