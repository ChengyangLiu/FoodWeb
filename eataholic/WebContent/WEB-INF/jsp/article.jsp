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
<%@ page import="com.eataholic.model.Comments" %>
<%@ page import="com.eataholic.service.CommentsOp" %>
<%@ page import="com.eataholic.service.impl.CommentsOpImpl" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link rel="stylesheet" href="css/commentstyle.css" type="text/css" media="all" />
<title>美食圈子</title>
<link rel="stylesheet" href="css/style_ye.css?v=2">
  <script src="js/libs/modernizr-1.7.min.js"></script>
  <script src="/eataholic/ueditor/ueditor.parse.js"></script>
  <script type="text/javascript" src="/eataholic/ueditor/ueditor.config.js"></script>
  <script type="text/javascript" src="/eataholic/ueditor/ueditor.all.js"></script>

<style type="text/css">
.user_profil img { border-radius:20px; width:80px; height:80px}
.remark_time {float:right}
.remark_content{float:center}
.left_pos{float:left}
.center_pos{float:center}
.right_pos{float:right}
</style>

</head>

<body>
<%//登录判断
     String username = "";
     if (session.getAttribute("connecte") == null
        || !((String) session.getAttribute("connecte"))
                .equals("true")) {
    	 System.out.println("Unlogin");
     } 
     else username=(String) session.getAttribute("login");
 %>
 
<%
String s=request.getParameter("id");
int id=Integer.parseInt(s);
//调用接口
PassageOp pasOp=new PassageOpImpl();
CommentsOp commentsOp=new CommentsOpImpl();
UserOp userOp=new UserOpImpl();
//新建对象
Passage passage=new Passage();
Comments comment=new Comments();
Users user=new Users();

passage=pasOp.getPassageById(id);
List<Comments> commentList=new ArrayList<Comments>();
commentList=commentsOp.getCommentsByPassageId(id);

request.setAttribute("id",s);

%>

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

    <a href="index.jsp" class="logo"><img src="images/logo.png" alt="your logo" /></a>
			
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
  </header>
  <div class="content clearfix">
	<div class="breadcrumbs">
		<ul>
			<li><a href="index.jsp">首页</a></li><!-- 需要替换成进入的页面 -->
			<li><%=passage.getTitle() %></li>
		</ul>
	</div>
	<div class="left-content"  style="padding-left: 80px;">
	
	<!-- ***************************需要前端部分 ********START******************-->
	
	<div class="article_title"><%=passage.getTitle()%></div>
	<div class="article_author"><%=passage.getAuthor()%></div>
	<div class="article_publish_time"><%=passage.getPassageTime()%></div>
	<div class="article_click"><%=passage.getClick()%></div>
	<div class="article_remark_num"><%=passage.getCommentNum()%></div>
	<div class="article_like"><%=passage.getLikeNum()%></div>
	
	<div class="article_content"><%=passage.getContent()%></div>
	
    <div class="article_click"><%=passage.getClick()%></div>
	<div class="article_remark_num"><%=passage.getCommentNum()%></div>
	<div class="article_like"><%=passage.getLikeNum()%></div>
	
	<div class="article_remark">
	  <div class="each_remark">
	    <% for(Comments n:commentList){
		    user=userOp.getUsersInfo(n.getBelong_User());
		%>
		<div>
			<div class="left_pos">
				<div class="user_profil"><img src="<%=user.getProfil()%>"></img>
					
				</div>
				<div class="user_name"><span>用户名：</span><%=user.getUserName()%></div>
				<div class="user_gender"><span>性别：</span><%=user.getGender()%></div>
				<div class="user_des"><span>个人简介：</span><%=user.getDescription()%></div>			
			</div>
			<div class="center_pos">
				<div class="remark_content"><%=n.getContent()%></div>
			</div>
			<div class="right_pos">
				<div class="remark_time"><%=n.getRemarkTime()%></div>
			</div>
		</div>
		<% }%>
	  </div>
	</div>
	   <form name="comment" action="/eataholic/RemarkServlet?id=<%=s%>" method="post" onSubmit="return myCheck()">
 		<p class="text"><textarea name="text"></textarea></p>
 		 <%if(username!=""){ %>
  		<p class="submit"><input type="submit" value="留言" /></p>
  		<%}
  		else{ 
 		 %>
 		<p class="submit"><a href="sign-in">登录</a>后可以留言</p>
 		<%} %>
	</form>
  	</div>
  </div>		
</div>

         <!-- ***************************需要前端部分 ********END******************-->
 
<footer>
	<div class="footer-holder">
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

<script type="text/javascript">  
    function myCheck()  
    {  
    	for(var i=0;i<document.comment.elements.length-1;i++)  
    	{  
    		if(document.comment.elements[i].value=="")  
    		{  
    			alert("留言不能为空!");  
    			document.comment.elements[i].focus();  
    			return false; 
    			}
    		}  
    	return true;  
    }  
</script>  

</body>

<script type="text/javascript" src="js/libs/jquery-1.7.1.min.js"></script>
<script src="js/libs/jquery.easing.1.3.js"></script>
<script src="js/script.js"></script>
<script src="js/libs/jquery.jcarousel.min.js"></script>

</html>