<%@ page contentType="text/html; charset=UTF-8" pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.ad.model.*" %>

<%
	AdService adSvc = new AdService();
	List<AdVO> list = adSvc.getAll();
	pageContext.setAttribute("list", list);
%>

<html>
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
    

		<p><font size = "500px">
		<b> �s�i�s�� </b>
		</font></p>
		<%@ include file="pages/page1.file" %> 
		<c:forEach var="adVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1 %>">
		
		<div class="col-xs-12 col-sm-3 aa" align="center">
		<a href="ad.do?action=getOne_For_Display&ad_id=${adVO.ad_id }">
		<img src="<%=request.getContextPath()%>/advertisement/DBGifReader.do?ad_id=${adVO.ad_id}" style="max-width: 150px; max-height: 150px;">
		<br>
		<p>
		${adVO.ad_name}<br>
		${adVO.ad_time}     
		
		</p>
		</a>
		</div>
	   </c:forEach>
	   
		<script src="https://code.jquery.com/jquery.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
	</body>
	<%@ include file="pages/page2.file" %>
</html>