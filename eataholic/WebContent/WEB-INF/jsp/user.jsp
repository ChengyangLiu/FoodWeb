<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*" %>
<%@ page import="com.eataholic.model.Passage" %>
<%@ page import="com.eataholic.service.PassageOp" %>
<%@ page import="com.eataholic.service.impl.PassageOpImpl" %>
<%@ page import="com.eataholic.model.Users" %>
<%@ page import="com.eataholic.service.UserOp" %>
<%@ page import="com.eataholic.service.impl.UserOpImpl" %>
    
<!doctype html>
<html>
<head>
  <title>美食圈子</title>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="description" content="">
  <meta name="author" content="">
  <link rel="shortcut icon" href="/favicon.ico">
  <link rel="stylesheet" href="css/style_ye.css?v=2">
  <script src="js/libs/modernizr-1.7.min.js"></script>
</head>

<%
	Users user=new Users();
	user=(Users) request.getAttribute("information");
	//登录判断
    String username = "";
    if (session.getAttribute("connecte") == null
       || !((String) session.getAttribute("connecte"))
               .equals("true")) {
   	 System.out.println("Unlogin");
    } 
    else username=(String) session.getAttribute("login");
%>

<body class="home">
  <div class='wrapper '>
    <header>
      <div class="top-nav">
        <nav>
          <ul>
        <%if(username==""){ %>
           <li><a href="sign-in" id="login-btn">登录</a></li>
           <li><a href="sign-in#toregister" class="register-btn">注册</a></li>
           <%}
          else{%>
          <li><a href="UserServlet">欢迎<%=username%></a></li>
          <%} %>
           <li><a href="dongtai.html">上传文章</a></li>
			<li><a href="dongtai.html">关于</a></li>
          </ul>
        </nav> 
      </div>
          <nav class="main-menu">
			<ul>
				<li><a href="index.html">主页</a></li>
				<li><a href=" menu1.html">美食食谱</a></li>
				<li><a href="listing.html">美食分享</a></li>
				<li><a href="listing.html">美食趣事</a></li>
				<li><a href="dongtai.html">美食圈子</a></li>
				<li id="lava-elm"></li>
			</ul>
	</nav>
      <a href="index.jsp" class="logo"><img src="images/logo.png" alt="your logo" /></a>
      <div class="header-slider-canvas">
		<div class="parts part-1"></div>
		<div class="parts part-2"></div>
		<div class="parts part-3"></div>
	  </div>
	  <ul id="mycarousel" class="jcarousel-skin-header-slider">
		<li><img src="images/toystory.jpg" width="680px" height="464" alt="" /></li>
		<li><img src="images/up.jpg" width="680px"  height="464" alt="" /></li>
		<li><img src="images/walle.jpg" width="680px"  height="464" alt="" /></li>
		<li><img src="images/nemo.jpg" width="680px"  height="464" alt="" /></li>
	  </ul>
    </header>

    
    
   	
			
			
			
	<footer>
		<div class="footer-holder" >
			<a href="" class="logo">Cooker Logo</a>
				<div class="newsletter">
					<div class="quote">
						<h6>Newsletter</h6>
							<p>Sign-up for our newsletter and be always aware of the new offers and services:</p>
								<form method="post">
									<input type="text"><input type="submit" value="Submit" class="submit-button">
								</form>
							</div>
						</div>
						
						<div class="links">
							<h6>useful links</h6>
							<ul>
								<li><a href="#">联系我们</a></li>
								<li><a href="#">团队介绍</a></li>
								<li><a href="#">隐私政策</a></li>
								<li><a href="#">服务条款</a></li>
								<li><a href="#">广告合作</a></li>
								<li><a href="#">加入我们</a></li>
							</ul>
						</div>
						
			</div>
	</footer>
</body>

	
	<script type="text/javascript" src="js/libs/jquery-1.7.1.min.js"></script>
  <script src="js/libs/jquery.easing.1.3.js"></script>
  <script src="js/script.js"></script>
  <script src="js/libs/jquery.jcarousel.min.js"></script>
	
	<script type="text/javascript">
	// FRONT SLIDER STARTER
jQuery(document).ready(function() {
jQuery('#mycarousel').jcarousel({
auto: 3,
wrap: 'last',
scroll: 1,
animation: 'slow',
initCallback: mycarousel_initCallback,
});
}); 
	</script>

</html>