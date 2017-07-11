<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.mem.model.*"%>
<%
	MemberVO memberVO = (MemberVO) request.getAttribute("memberVO");
	String tab2 = request.getParameter("tab2");
	String url = request.getServletPath();
	session.getAttribute("errorMsgs");
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
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/style.css" type="text/css">
<script src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
<script type="text/javascript">
	$(document)
			.ready(
					function() {
						if (window.location.hash != "") {
							$('a[href="' + window.location.hash + '"]').click()
						}

						var emailRule = /^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z]+$/;
						$("#mem_mail").blur(
								function() {
									console.log($(this).val());
									if (emailRule.test($(this).val())) {
										$('.error1_mail').text('�H�c�榡���T');
										$('.error1_mail').css("color", "blue");
										$("#error_img_mail").attr("src","<%=request.getContextPath()%>/frontend/mem/image/images.jpg");
									} else {
										$('.error1_mail').text('�H�c�榡�����T');
										$('.error1_mail').css("color", "red");
										$("#error_img_mail").attr("src","<%=request.getContextPath()%>/frontend/mem/image/error.png");
									}
								});
						var pwRule = /^(?!.*[^a-zA-Z0-9])(?=.*\d)(?=.*[a-zA-Z]).{6,10}$/;
						$("#mem_pw").blur(
								function() {
									console.log($(this).val());
									if (pwRule.test($(this).val())) {
										$('.error1_pw').text('�K�X�榡���T');
										$('.error1_pw')
												.css("color", "blue");
										$("#error_img_pw").attr("src","<%=request.getContextPath()%>/frontend/mem/image/images.jpg");
									} else {
										$('.error1_pw').text('�K�X�榡�����T');
										$('.error1_pw').css("color", "red");
										$("#error_img_pw").attr("src","<%=request.getContextPath()%>/frontend/mem/image/error.png");
									}
								});
						$("#mem_pw1").blur(
								function(){
									console.log($(this).val());
									if($(this).val()==$("#mem_pw").val()&&pwRule.test($(this).val())){
											$('.error1_pw1').text('�K�X���T');
											$('.error1_pw1')
													.css("color", "blue");
											$("#error_img_pw1").attr("src","<%=request.getContextPath()%>/frontend/mem/image/images.jpg");
									}else{
										$('.error1_pw1').text('�K�X�����T');
										$("#error_img_pw1").attr("src","<%=request.getContextPath()%>/frontend/mem/image/error.png");
										$('.error1_pw1').css("color", "red");
										}
									
								});
						var nameRule = /^[\u4e00-\u9fa5_a-zA-Z]{2,10}$/;
						$("#mem_name").blur(
								function() {
									console.log($(this).val());
									if (nameRule.test($(this).val())) {
										$('.error1_name').text('�m�W�榡���T');
										$('.error1_name')
												.css("color", "blue");
										$("#error_img_name").attr("src","<%=request.getContextPath()%>/frontend/mem/image/images.jpg");
									} else {
										$('.error1_name').text('�m�W�榡�����T');
										$('.error1_name').css("color", "red");
										$("#error_img_name").attr("src","<%=request.getContextPath()%>/frontend/mem/image/error.png");
									}
								});
						var phoneRule = /^09[0-9]{8}$/;
						$("#mem_phone").blur(
								function() {
									console.log($(this).val());
									if (phoneRule.test($(this).val())) {
										$('.error1_phone').text('����榡���T');
										$('.error1_phone')
												.css("color", "blue");
										$("#error_img_phone").attr("src","<%=request.getContextPath()%>/frontend/mem/image/images.jpg");
									} else {
										$('.error1_phone').text('����榡�����T');
										$('.error1_phone').css("color", "red");
										$("#error_img_phone").attr("src","<%=request.getContextPath()%>/frontend/mem/image/error.png");
									}
								});
					});
</script>
<style>
.aa {
	margin-top: 150px;
}
</style>

<body>


	<div class="col-xs-12 col-sm-4 ">
		<center>
			<a href="<%=request.getContextPath()%>/index.jsp"> <img
				src="/images/logo.png" width="150px" height="150px">
			</a> <br> <br> <br>
			<p font-size="100px">
				<b> <a href="<%=request.getContextPath()%>/index.jsp">
						�Y�w�ڽu�W�q�\</a> > LogIn
				</b>
			</p>
		</center>
	</div>

	<div class="col-xs-12 col-sm-8">
		<div class="col-xs-12 col-sm-5 aa">
			<div role="tabpanel" style="margin-left:-60px;">

				<ul class="nav nav-tabs" role="tablist" id="tabs">
					<li role="presentation" class="active"><a href="#tab1"
						aria-controls="tab1" role="tab" data-toggle="tab">�|���n�J</a></li>
					<li role="presentation"><a href="#tab2" aria-controls="tab2"
						role="tab" data-toggle="tab">���U</a></li>
				</ul>
				<div class="tab-content">
					<div role="tabpanel" class="tab-pane active" id="tab1">
						<div class="well" align="center"  style="width:600px;">
							<c:if test="${not empty errorMsgs_Login}">
								<font color='red'>�Эץ��H�U���~:
									<ul>
										<c:forEach var="message" items="${errorMsgs_Login}">
											<li>${message}</li>
										</c:forEach>
									</ul>
								</font>
							</c:if>
							<form METHOD="post"
								ACTION="<%=request.getContextPath()%>/MemberLoginHandler"
								name="form2">

								<label for="�b��">�b��</label> <input type="text" name="mem_mail"
									id="�b��" placeholder="�п�JE-MAIL" value="wang@abc.com"> <br> <br> <label
									for="�K�X">�K�X</label> <input type="password" name="mem_pw"
									id="�K�X" placeholder="�п�J�K�X" value="group1"> <br> <br> <a
									herf="">�ѰO�K�X?</a> <br> <br> <input type=submit
									value=" �n�J "><input type="hidden" name="requestURL"
									value="<%=request.getServletPath()%>">
							</form>
						</div>
					</div>
					<div role="tabpanel" class="tab-pane" id="tab2">
						<div class="well" align="center" style="width:600px;">
							<c:if test="${not empty errorMsgs}">
								<font color='red'>�Эץ��H�U���~:
									<ul>
										<c:forEach var="message" items="${errorMsgs}">
											<li>${message}</li>
										</c:forEach>
									</ul>
								</font>
							</c:if>
							<%
								session.removeAttribute("errorMsgs");
							%>
							<form METHOD="post" ACTION="<%=request.getContextPath()%>/backend/mem/mem.do">
							<div class="form-horizontal">
							<div class="form-group">
								<label for="mem_mail" class="col-xs-12 col-sm-3 control-label">�|���H�c</label>
								<div class="col-xs-12 col-sm-6"> <input type="text"
									name="mem_mail" id="mem_mail" placeholder="�п�JE-MAIL"
									value="<%=(memberVO == null) ? "sadqwe" : memberVO.getMem_mail()%>" >
								</div>
								<div class="col-xs-12 col-sm-3">
								<span class='error1_mail' style="margin-left:-100px;"></span> 
								<img src="" id="error_img_mail"> 
								</div>
							</div>
							<div class="form-group">
								<br> <label for="mem_pw" class="col-xs-12 col-sm-3 control-label">�|���K�X</label> 
								<div class="col-xs-12 col-sm-6">
								<input type="password" name="mem_pw" id="mem_pw"
									placeholder="�п�J�K�X6~10�X"
									value="<%=(memberVO == null) ? "1222212" : memberVO.getMem_pw()%>">
								</div>
								<div class="col-xs-12 col-sm-3">
									<span class='error1_pw' style="margin-left:-100px;"></span>
									<img src="" id="error_img_pw">
								</div>
								</div>
								<div class="form-group">
									<label	for="mem_pw1" class="col-xs-12 col-sm-3 control-label">�T�{�K�X</label> 
									<div class="col-xs-12 col-sm-6">
									<input type="password"
									name="mem_pw1" id="mem_pw1" placeholder="�A��J�@���K�X"
									value="<%=(memberVO == null) ? "1222212" : memberVO.getMem_pw()%>">
									</div>
									<div class="col-xs-12 col-sm-3">
										<span class='error1_pw1'style="margin-left:-100px;"></span>
										<img src="" id="error_img_pw1"> 
									</div>
								</div>
								<div class="form-group">
									<label for="mem_name" class="col-xs-12 col-sm-3 control-label"> &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp�m�W</label> 
									<div class="col-xs-12 col-sm-6">
									<input type="text" name="mem_name" id="mem_name" placeholder="�п�J�m�W2~10�Ӧr"
									value="<%=(memberVO == null) ? "�Ѥ�" : memberVO.getMem_name()%>">
									</div>
									<div class="col-xs-12 col-sm-3">
									<span class='error1_name'style="margin-left:-100px;" ></span> 
									<img src="" id="error_img_name"> 
									</div>
								</div>
								<div class="form-group">
									<label for="mem_phone" class="col-xs-12 col-sm-3 control-label"> &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp���</label>
									<div class="col-xs-12 col-sm-6">
										<input type="text" name="mem_phone" id="mem_phone"
												placeholder="�п�J������X" value="<%=(memberVO == null) ? "123" : memberVO.getMem_phone()%>">
									</div>
									<div class="col-xs-12 col-sm-3">
										<span class='error1_phone' style="margin-left:-100px;"></span> 
										<img src="" id="error_img_phone"> 
									</div>
								</div>
									<div class="form-group">
									<input type="hidden" name="requestURL"
									value="<%=request.getServletPath()%>"> <br> <br>
								    <input type="hidden" name="action" value="insert"> 
								    <input type="submit" value="�e�X�s�W" id="input"> 
								   </div>
								    </div>
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