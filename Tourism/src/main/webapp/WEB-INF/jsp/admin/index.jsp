<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + 
					  request.getServerPort() + path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>首页</title>
	<link type="text/css" href="common/easyui/themes/default/easyui.css" rel="stylesheet">
	<link type="text/css" href="common/easyui/themes/icon.css" rel="stylesheet">
	<link type="text/css" href="css/bootstrap.min.css" rel="stylesheet">
	<link type="text/css" href="css/dataTables.bootstrap.css" rel="stylesheet">
    <style type="text/css">
		body{
			background-image:url("/Tourism/images/index/index.png");
			background-position:center;
			background-repeat:repeat-y；
		}
	</style>
</head>

<body class="easyui-layout" fit="true" background="/Tourism/images/index/index.png">
    <div data-options="region:'north',title:'公告',split:true,maxHeight:150" style="height:110px;overflow: hidden;padding: 0 0 0 0">
    	<div class="col-lg-12" style="height: 110px;width: 100%;margin-top: 30px;">
			<div class="col-sm-4" style="font-size: 20px;">我的旅行我做主</div>
			<div class="col-sm-4">
				<marquee style="color: #F70909;" behavior="scroll"> 
					<div style="font-size: 20px;">我的旅行我做主，拥有不一样的体验</div>
				</marquee>
			</div>
			<div class="col-sm-4">
				<div style="float: right;">
					<div style="font-size: 20px;"><a href="#">当前用户:admin</a>&nbsp;&nbsp; <a href="http://localhost:8080/Tourism/login.action">退出</a>&nbsp;&nbsp;</div> 
				</div>
			</div>
		</div>
	</div>
	
    <div data-options="region:'south',title:'版权',split:true,maxHeight:100" style="height:100px;"></div>   
    
    <div data-options="region:'west',title:'  ',split:true,minWidth:150,maxWidth:180" style="width:180px;">
    	<ul class="easyui-tree">
    		<li>
    			<span><a href="javascript:void(0)" onClick="$('#index-tabs').tabs('select', '主页');">我的主页</a></span>
    		</li>
			<li>
				<span style="font-size: 18">用户管理</span>
				<ul>
					<li><a href="javascript:void(0)" class="active" onClick="toPage('user/list.action','用户列表')">用户列表</a></li>
					<li><a href="javascript:void(0)" onClick="toPage('user/toInput.action','用户添加')">用户添加</a></li>
				</ul>
			</li>

			<li><span>景点管理</span>
				<ul>
					<li><a href="javascript:void(0)" onClick="toPage('scenic/list.action','景点列表')">景点列表</a></li>
					<li><a href="javascript:void(0)" onClick="toPage('scenic/toInput.action','景点添加')">景点添加</a></li>
				</ul>
			</li>

			<li>
				<span>评论管理</span>
				<ul>
					<li><a href="javascript:void(0)" onClick="toPage('comment/userComment.action','用户评论')">用户评论</a></li>
					<!-- <li><a href="javascript:void(0)" onClick="toPage('comment/scenicComment.jspp','景点评论')">景点评论</a></li> -->
				</ul>
			</li>
			
		</ul>
    </div>   
    <div data-options="region:'center' " style="padding: 0;">
    	<div class="easyui-tabs" id="index-tabs" style="width: 100%;height: 100%; padding-top: 0 0 0 0; margin: 0 0 0 0" >
			<div title="主页" data-options="iconCls:'icon-reload', closable:false" >
				<h3 >&nbsp;&nbsp;&nbsp;暑假最好玩盛事「台湾热气球嘉年华」今年延长活动时间，从原本38天延长为45天，届时将有39颗巨型热气球在鹿野高台升空，
					包括卡通动画电影《神偷奶爸》里的小小兵「Minion」、奥斯卡金像奖《天外奇迹》热气球「Up」，
					还有去年创造无数视觉焦点的诺亚方舟「Arky」，也都即将在本次活动中与大家见面。
				</h3>
				<h3>&nbsp;&nbsp;&nbsp;今年适逢狗年，当然也少不了全球首度亮相的英国斗牛犬「Buster」与大家共享欢乐，台旅会也将派出台湾观光大使「喔熊」共襄盛举。
					依循往年惯例，今年台湾热气球嘉年华也会前往台东各重要景点举办热气球光雕音乐会，
					除了大家熟悉的鹿野高台、三仙台、池上大坡池、太麻里曙光园区外，被列为「世界8美图书馆」之首的台东大学校本部图书馆，也将在今年首次与热气球共舞，
					每场的热气球光雕音乐会将带旅客体验不一样的视觉及听觉的完美享受。
				</h3>
			</div>
		</div>
    </div>
    
   
    <script type="text/javascript" src="common/jquery.min.js"></script>
	<script type="text/javascript" src="common/easyui/jquery.min.js"></script>
	<script type="text/javascript" src="common/easyui/jquery.easyui.min.js"></script>
	
    <script type="text/javascript">
	var toPage = function(pageUrl, title){
		/* var reqUrl = 'index.action?pageUrl=' + pageUrl; */
		var reqUrl = pageUrl;
		var hasTab = $('#index-tabs').tabs('getTab',title);
		
		if(hasTab === null){
			if(pageUrl === undefined || pageUrl === '')
				return false;
			$('#index-tabs').tabs('add', {
				title: title,
				tools:[{
					iconCls: 'icon-mini-refresh',
					handler: function(){
						$('#index-tabs').tabs('getTab', title).panel('refresh',reqUrl);
					}
				}],
				href: reqUrl,
				closable: true
			});
		}
		else{
			$('#index-tabs').tabs('select',title);
			$('#index-tabs').tabs('getTab',title).panel('refresh',reqUrl);
		}
	}
	</script>
</body>
</html>