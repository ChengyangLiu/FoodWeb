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
  
  <link rel="stylesheet" href="css/style_ye.css?v=2">
  <script src="js/libs/modernizr-1.7.min.js"></script>
  
  <style type="text/css">
	body, p { margin:0; padding:0;}
	* {font-family: Microsoft YaHei, Tahoma, sans-serif;}

	.itemBox { width:950px; height:500px;}
	.item { width:146px; height:200px; overflow:hidden; background-color:#FFFACD; 
			padding:10px; float:left; margin:10px; border-radius:15px;}
	.item h6 { padding:0; margin:4px 0; font-weight:normal; font-size:12px; color:#666; line-height:18px;}
	.item p {}
	.item p span { display:block; float:left; padding:3px 7px 3px 3px;background-color:#8c242d; font-size:12px; color:#fff;}
	.item p a { display:block; float:right; background-color:#e6e6e6; color:#666; font-size:12px; text-decoration:none; padding:3px 6px; text-align:center;}
	.photoinfo { border-radius:10px;}
	.photo { border-radius:10px; width:146px; height:146px;}
	.author{}
	.article_info{}
	.title{}
	.right_position{float:right;}

	.clear {content:".";display:block;clear:both;height:0;visibility:hidden;}
</style>

</head>

<%
	PassageOp pa=new PassageOpImpl();
	List<Passage> paShare = pa.queryPassageByType_TimeRecent("美食分享");
	List<Passage> paRecipe = pa.queryPassageByType_TimeRecent("美食食谱");
	List<Passage> paAnecdote = pa.queryPassageByType_TimeRecent("美食趣事");
	//登录判断
    String username = "";
    if (session.getAttribute("connecte") == null || !((String) session.getAttribute("connecte")).equals("true")) {
   	 	System.out.println("Unlogin");
    } 
    else username=(String) session.getAttribute("login");
%>

<body class="home">
  <div class='wrapper_ye'>
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
           <li><a href="publish">上传文章</a></li>
			<li><a href="about.jsp">关于</a></li>
          </ul>
        </nav> 
               <form class="search-form" method="post">
          <input type="text" class="search">
          <input type="submit" class="search-submit" value="">
        </form>
      </div>

          <nav class="main-menu">
			<ul>
				<li><a href="index.jsp">主页</a></li>
				<li><a href="">美食食谱</a></li>
				<li><a href="">美食分享</a></li>
				<li><a href="">美食趣事</a></li>
				<li><a href="">美食圈子</a></li>
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
    <div class="content clearfix">
	
 	    <div class="product-menu-header"><h2>美食食谱</h2><a href="#" class="right_position">阅读更多</a></div>
    
	
		<div class="itemBox">
    		<ul data-am-widget="gallery" class="am-gallery am-avg-sm-2
  					am-avg-md-3 am-avg-lg-6 am-gallery-default">
       <% int i=0;
        for(Passage n : paRecipe)
		{
			if(n==null||i>=10)break;
			Users user=new Users();
			UserOp uo=new UserOpImpl();
			user=uo.getUsersInfo(n.getAuthor());
        %>
        	<div class="item">
                <a href="article?id=<%=n.getId()%>" >
                    <img class="photo" src="img/a1.jpg" alt="<%=n.getTitle()%>"/>
                </a>
                <div class="title"><b><span><%=n.getTitle()%></span></b></div>
                <div class="article_info">
                	<span>点击 <%=n.getClick()%>  </span>
                	<span>评论 <%=n.getCommentNum()%>  </span>
                	<span>喜爱 <%=n.getLikeNum()%></span>
                </div>
            
            <a class="author" >
           		<span><img class="photoinfo" width="20" height="20" src="<%=user.getProfil()%>" alt=""></span>
          		<span><%=n.getAuthor()%></span>
          	</a>
          	</div>
        <%
        i++;}
        %>
   			</ul>
		</div>
    
    <div class="product-menu-header"><h2>美食分享</h2><a href="#" class="right_position">阅读更多</a></div>
    
	
		<div class="itemBox">
    		<ul data-am-widget="gallery" class="am-gallery am-avg-sm-2
  					am-avg-md-3 am-avg-lg-6 am-gallery-default">
       <% i=0;
        for(Passage n : paShare)
		{
			if(n==null||i>=10)break;
			Users user=new Users();
			UserOp uo=new UserOpImpl();
			user=uo.getUsersInfo(n.getAuthor());
        %>
        	<div class="item">
                <a href="article?id=<%=n.getId()%>" >
                    <img class="photo" src="img/a1.jpg" alt="<%=n.getTitle()%>"/>
                </a>
                <div class="title"><b><span><%=n.getTitle()%></span></b></div>
                <div class="article_info">
                	<span>点击 <%=n.getClick()%>  </span>
                	<span>评论 <%=n.getCommentNum()%>  </span>
                	<span>喜爱 <%=n.getLikeNum()%></span>
                </div>
            
            <a class="author" >
           		<span><img class="photoinfo" width="20" height="20" src="<%=user.getProfil()%>" alt=""></span>
          		<span><%=n.getAuthor()%></span>
          	</a>
          	</div>
        <%
        i++;}
        %>
   			</ul>
		</div>
    
    
    <div class="product-menu-header"><h2>美食趣事</h2><a href="#" class="right_position">阅读更多</a></div>
    
	
		<div class="itemBox">
    		<ul data-am-widget="gallery" class="am-gallery am-avg-sm-2
  					am-avg-md-3 am-avg-lg-6 am-gallery-default">
       <%  i=0;
        for(Passage n : paAnecdote)
		{
			if(n==null||i>=10)break;
			Users user=new Users();
			UserOp uo=new UserOpImpl();
			user=uo.getUsersInfo(n.getAuthor());
        %>
        	<div class="item">
                <a href="article?id=<%=n.getId()%>" >
                    <img class="photo" src="img/a1.jpg" alt="<%=n.getTitle()%>"/>
                </a>
                <div class="title"><b><span><%=n.getTitle()%></span></b></div>
                <div class="article_info">
                	<span>点击 <%=n.getClick()%>  </span>
                	<span>评论 <%=n.getCommentNum()%>  </span>
                	<span>喜爱 <%=n.getLikeNum()%></span>
                </div>
            
            <a class="author" >
           		<span><img class="photoinfo" width="20" height="20" src="<%=user.getProfil()%>" alt=""></span>
          		<span><%=n.getAuthor()%></span>
          	</a>
          	</div>
        <%
        i++;}
        %>
   			</ul>
		</div>
    
			
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