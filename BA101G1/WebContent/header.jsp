<%@ page contentType="text/html;charset=UTF-8"%>			
<div id="logo">
	<div id="login">
			<a href="<%=request.getContextPath()%>/index.jsp"><img src="<%=request.getContextPath()%>/images/logo.png" alt="LOGO"></a>
			<span class="login" onmouseover="switchMenu( this, 'SubMenu1', 'MouseOver' )" onmouseout="hideMenu()">Login
			<div style="margin-left: -20px;">
			<span style="font-size:9px;">&#9660;</span>
				<ul id="SubMenu1" class="sub-menu" style="display:none;">
				    <li><a href="http://www.vixual.net/" target="_blank">會員登入</a></li>
					<li><a href="http://www.google.com.tw/" target="_blank">商家登入</a></li>
				</ul>
			</span>
			
	</div>
</div>
		
<div id="option">
	<ul>
		<li class="selected"><a href="<%=request.getContextPath()%>/index.jsp">Home</a></li>
		<li><a href='<%=request.getContextPath()%>/store/store.do?action=getStoreHot&store_star=80'>熱門商家</a></li>
		<li><a href='<%=request.getContextPath()%>/store/storeClass.jsp'>找商家</a></li>
		<li><a href='<%=request.getContextPath()%>/product/productClass.jsp'>找商品</a></li>
		<li><a href='<%=request.getContextPath()%>/frontend/latestnews/browseLatestNews.jsp'>最新消息</a></li>
	</ul>
</div>