<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="BIG5"%>
<%@ page import="java.util.*"%>
<%@ page import="com.ad.model.*" %>

<%
// AdVO adVO = (AdVO) request.getAttribute("adVO"); //Chatroom_MessageServlet.java(Concroller), �s�Jreq��empVO����
AdService adSvc=new AdService();
String ad_id=request.getParameter("ad_id");
AdVO adVO=adSvc.getOneAd(ad_id);
%>

<!DOCTYPE html>
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

		p{
			padding-left: 250px;
		}
		
		div#outside{
			width: 1200px;
			padding-left: 350px;
		}
		div#outside #title{
			height:50px;
		}
		div#outside h1{
			float:left;
		}
		div#outside h2{
			float:right;
		}
		div#title{
			font-size: 50px;
		}

		div#time{
			padding-top: 35px;
			padding-left: 550px;  
			font-size: 25px;
		}
		
		div#content{
			font-size: 25px;
		}
	</style>

	</head>

	<body>
	
	<div id="page">
		<div id="header">
				<a href="index.html"><img src="https://api.fnkr.net/testimg/350x200/00CED1/FFF/?text=img+placeholder">
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
		<b style ="display:inline-block;"><a href="?????"> �s�i </a>> ���e </b>
		</font></p>
		
		<br>
		
		<div id ="outside" align="center"">
			<!-- <div id = "title" style="border: solid red;"></div> -->
			<!-- <div id="time" style="border: solid;"></div> -->
				<h1>${adVO.ad_name}</h1>
				<h2>${adVO.ad_time}</h2>
			<hr style="border-color: red;">
			<div id="content">
			<img src="<%=request.getContextPath()%>/advertisement/DBGifReader.do?ad_id=${adVO.ad_id}"style="max-width: 150px; max-height: 150px;"></img>
			</div>
			${adVO.ad_content}
<!-- 			<img src="http://localhost:8081/BA101G1/advertisement/DBGifReader.do?ad_id=AD-000001"> -->
			
		</div>

		<script src="https://code.jquery.com/jquery.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>

	</body>
</html>
