<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*" %>
 <!doctype html>
<html>
<head>
  <meta charset="utf-8">

  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

  <title>美食圈子</title>
  <meta name="description" content="">
  <meta name="author" content="">

  <link rel="shortcut icon" href="/favicon.ico">

  <link rel="stylesheet" href="css/style_ye.css?v=2">
  <link rel="stylesheet" href="../css/jcarousel.css">
  <!-- All JavaScript at the bottom, except for Modernizr which enables HTML5 elements & feature detects -->
  <script src="js/libs/modernizr-1.7.min.js"></script>
</head>

<body>
 <%
	//登录判断
    String username = "";
    if (session.getAttribute("connecte") == null || !((String) session.getAttribute("connecte")).equals("true")) {
   	 	System.out.println("Unlogin");
    } 
    else username=(String) session.getAttribute("login");
%>

<body>
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
			<li><a href="eataholic/about.html">关于</a></li>
          </ul>
        </nav> 
               <form class="search-form" method="post">
          <input type="text" class="search">
          <input type="submit" class="search-submit" value="">
        </form>
      </div>

       <a href="index.html" class="logo"><img src="images/logo.png" alt="your logo" /></a>
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
    
		<div class="content full-content clearfix">
			<div class="breadcrumbs">
				<ul>
					<li><a href="index.jsp">首页</a></li>
					<li>关于我们</li>
				</ul>
			</div>
						
			<p><img src="images/111.png" alt="" style="float: left" class="img-canvas mar-r-10">东北大学主校区位于辽宁省沈阳市，校园南滨浑河，北畔南湖；学校占地总面积203万平方米，建筑面积100万平方米。现有场地设施包括：标准田径场2块；（其中一块容纳15000人的看台）80×100足球场2块；3800m²体育馆一座（内设篮球、乒乓球和体操馆）；192m²健身房1座；100m²武术房1座；70×30轮滑场地1块；篮球场地20块；排球场地12块；游泳馆一座（总建筑面积6774m²）。另有教学场馆多座：何世礼教学馆，逸夫楼，机电馆，建筑馆，采矿馆，冶金馆，大成教学馆，大学城等。

在2013年以前，大部分大一新生入学后将在原黄金学院旧址的基础学院校区学习一年。2012级开始，由于新教学楼、宿舍楼的陆续投入使用，部分新生直接在主校区学习，在2014年浑南校区投入使用后，东北大学主校区改称东北大学南湖校区，原基础学院不再作为教学场所，但仍保留实验室供学生做基础性的实验。

</p>

			<p>目前在浑南建有新校区，位于沈阳市浑南区航天南路，总规划面积93.54万平方米，规划一期建筑面积28.66万平方米，一期建设项目包括图书馆、信息科学大楼、生命科学大楼、文科1楼、文科2楼、风雨操场、学生生活服务中心、学生宿舍等，预计2014年将有第一批新生入住。东北大学浑南校区功能分区合理，组织有序，体现教学、科研、生活有机结合的理念。2014年10月份起正式投入使用并入住。一期共有六个学院学生入住，分别是东北大学文法学院、马克思主义学院、工商管理学院、中荷生物医学与信息工程学院、生命科学与健康学院、江河建筑学院。四座教学楼文科1楼、文科2楼、生命科学大楼、信息科学大楼现已更名为文管学馆、建筑学馆、生命学馆、信息学馆。</p>

			<p><img src="images/111.png" alt="" style="float: right" class="img-canvas  mar-l-10"></p>

			<p>东北大学主校区位于辽宁省沈阳市，校园南滨浑河，北畔南湖；学校占地总面积203万平方米，建筑面积100万平方米。现有场地设施包括：标准田径场2块；（其中一块容纳15000人的看台）80×100足球场2块；3800m²体育馆一座（内设篮球、乒乓球和体操馆）；192m²健身房1座；100m²武术房1座；70×30轮滑场地1块；篮球场地20块；排球场地12块；游泳馆一座（总建筑面积6774m²）。另有教学场馆多座：何世礼教学馆，逸夫楼，机电馆，建筑馆，采矿馆，冶金馆，大成教学馆，大学城等。</p>

			<hr>

			<h1>成员1</h4>
			<p>卡瓦伊·莱昂纳德（英语：Kawhi Leonard，1991年6月29日－）绰号“The Klaw”、“Sugar K”、“可爱”，来自于圣迭戈大学，为美国NBA联盟的职业篮球运动员，为一名锋卫摇摆人。他在2011年NBA选秀中第1轮第15顺位被印第安纳步行者选中，随即被交易到圣安东尼奥马刺。[1]

2014年，雷纳德获得总决赛MVP，他是在1999年蒂姆·邓肯获得FMVP以后最年轻的FMVP。 在2014年NBA季后赛总冠军赛中，马刺对热火的第四场比赛里，他一个人独拿20分、14篮板、3抢断、3盖帽，上一个在总冠军赛达到如此标竿的是2003年的蒂姆·邓肯。</p>

			<h1>成员1</h4>
			<p>卡瓦伊·莱昂纳德（英语：Kawhi Leonard，1991年6月29日－）绰号“The Klaw”、“Sugar K”、“可爱”，来自于圣迭戈大学，为美国NBA联盟的职业篮球运动员，为一名锋卫摇摆人。他在2011年NBA选秀中第1轮第15顺位被印第安纳步行者选中，随即被交易到圣安东尼奥马刺。[1]

2014年，雷纳德获得总决赛MVP，他是在1999年蒂姆·邓肯获得FMVP以后最年轻的FMVP。 在2014年NBA季后赛总冠军赛中，马刺对热火的第四场比赛里，他一个人独拿20分、14篮板、3抢断、3盖帽，上一个在总冠军赛达到如此标竿的是2003年的蒂姆·邓肯。</p>
<h1>成员1</h4>
			<p>卡瓦伊·莱昂纳德（英语：Kawhi Leonard，1991年6月29日－）绰号“The Klaw”、“Sugar K”、“可爱”，来自于圣迭戈大学，为美国NBA联盟的职业篮球运动员，为一名锋卫摇摆人。他在2011年NBA选秀中第1轮第15顺位被印第安纳步行者选中，随即被交易到圣安东尼奥马刺。[1]

2014年，雷纳德获得总决赛MVP，他是在1999年蒂姆·邓肯获得FMVP以后最年轻的FMVP。 在2014年NBA季后赛总冠军赛中，马刺对热火的第四场比赛里，他一个人独拿20分、14篮板、3抢断、3盖帽，上一个在总冠军赛达到如此标竿的是2003年的蒂姆·邓肯。</p>
<h1>成员1</h4>
			<p>卡瓦伊·莱昂纳德（英语：Kawhi Leonard，1991年6月29日－）绰号“The Klaw”、“Sugar K”、“可爱”，来自于圣迭戈大学，为美国NBA联盟的职业篮球运动员，为一名锋卫摇摆人。他在2011年NBA选秀中第1轮第15顺位被印第安纳步行者选中，随即被交易到圣安东尼奥马刺。[1]

2014年，雷纳德获得总决赛MVP，他是在1999年蒂姆·邓肯获得FMVP以后最年轻的FMVP。 在2014年NBA季后赛总冠军赛中，马刺对热火的第四场比赛里，他一个人独拿20分、14篮板、3抢断、3盖帽，上一个在总冠军赛达到如此标竿的是2003年的蒂姆·邓肯。</p>
<h1>成员1</h4>
			<p>卡瓦伊·莱昂纳德（英语：Kawhi Leonard，1991年6月29日－）绰号“The Klaw”、“Sugar K”、“可爱”，来自于圣迭戈大学，为美国NBA联盟的职业篮球运动员，为一名锋卫摇摆人。他在2011年NBA选秀中第1轮第15顺位被印第安纳步行者选中，随即被交易到圣安东尼奥马刺。[1]

2014年，雷纳德获得总决赛MVP，他是在1999年蒂姆·邓肯获得FMVP以后最年轻的FMVP。 在2014年NBA季后赛总冠军赛中，马刺对热火的第四场比赛里，他一个人独拿20分、14篮板、3抢断、3盖帽，上一个在总冠军赛达到如此标竿的是2003年的蒂姆·邓肯。</p>
<h1>成员1</h4>
			<p>卡瓦伊·莱昂纳德（英语：Kawhi Leonard，1991年6月29日－）绰号“The Klaw”、“Sugar K”、“可爱”，来自于圣迭戈大学，为美国NBA联盟的职业篮球运动员，为一名锋卫摇摆人。他在2011年NBA选秀中第1轮第15顺位被印第安纳步行者选中，随即被交易到圣安东尼奥马刺。[1]

2014年，雷纳德获得总决赛MVP，他是在1999年蒂姆·邓肯获得FMVP以后最年轻的FMVP。 在2014年NBA季后赛总冠军赛中，马刺对热火的第四场比赛里，他一个人独拿20分、14篮板、3抢断、3盖帽，上一个在总冠军赛达到如此标竿的是2003年的蒂姆·邓肯。</p>

			<hr>

		
	</div>
	

		</div>
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
	<script type="text/javascript" src="js/libs/jquery-1.7.1.min.js"></script>
  <script src="js/libs/jquery.easing.1.3.js"></script>
  <script src="js/script.js"></script>
  <script src="js/libs/jquery.jcarousel.min.js"></script>	
</body>

</html>