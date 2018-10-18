<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + 
					  request.getServerPort() + path + "/";
%>
<!DOCTYPE HTML>
<html lang="en" class="no-js">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>login</title>
<link rel="stylesheet" type="text/css" href="css/normalize.css" />
<link rel="stylesheet" type="text/css" href="css/demo.css" />
<!--必要样式-->
<link rel="stylesheet" type="text/css" href="css/component.css" />

</head>
<body>
	<div class="container demo-1">
		<div class="content">
			<div id="large-header" class="large-header">
				<canvas id="demo-canvas"></canvas>
				<div class="logo_box">
					<p id="p01" style="font-size: 30px; font-family:'微软雅黑';margin-left: 30px">后台管理</p>
					<form action="login.action" method="post">
						<div class="input_outer">
							<span class="u_user"></span> 
							<input name="roleName" class="text"	style="color: #FFFFFF !important; font-size:20px; "
								   type="text" placeholder="请输入账户">
						</div>
						<div class="input_outer">
							<span class="us_uer"></span>
							 <input name="rolePassword" class="text"
								    style="color: #FFFFFF !important; font-size:20px; position:absolute; z-index:100;"
									value="" type="password" placeholder="请输入密码">
						</div>
						<div class="mb2">
							<button class="act-but submit" style="color: #FFFFFF; width: 325px; height: 50px;" >登录</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<div style="text-align:center;">
		<!-- /container -->
		<script src="js/login/TweenLite.min.js"></script>
		<script src="js/login/EasePack.min.js"></script>
		<script src="js/login/rAF.js"></script>
		<script src="js/login/demo-1.js"></script>
	</div>
</body>
</html>