<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>用户注册</title>
	<link type="text/css" href="../common/easyui/themes/default/easyui.css" rel="stylesheet">
	<link type="text/css" href="../common/easyui/themes/icon.css" rel="stylesheet">
	<link type="text/css" href="../css/bootstrap.min.css" rel="stylesheet">
	<link type="text/css" href="../css/dataTables.bootstrap.css" rel="stylesheet">
	<script type="text/javascript" src="../common/jquery.min.js"></script>
	<script type="text/javascript" src="../common/easyui/jquery.min.js"></script>
	<script type="text/javascript" src="../common/easyui/jquery.easyui.min.js"></script>
	<style type="text/css">
		body{
			background-image:url("/Tourism/images/bg/moli.jpg");
			background-position:center;
			background-repeat:repeat-y；
		}
	</style>
</head>
<body class="easyui-layout" fit="true" background="/Tourism/images/bg/moli.jpg">
    <div data-options="region:'north',title:'公告',split:true,maxHeight:150" style="height:110px;overflow: hidden;padding: 0 0 0 0">
    	<div class="col-lg-12" style="height: 110px;width: 100%;margin-top: 30px;">
			<div class="col-sm-4" style="font-size: 20px;">我的旅行我做主</div>
			<div class="col-sm-4">
				<marquee style="color: #F70909;" behavior="scroll"> 
					<!-- <div style="font-size: 20px;">我的旅行我做主，拥有不一样的体验</div> -->
				</marquee>
			</div>
			<div class="col-sm-4">
				<div style="float: right;">
					<div style="font-size: 20px;">
						<a>${userId }</a>
						<a href="#">欢迎来到砚园旅游</a>&nbsp;&nbsp; 
						<a href="http://localhost:8080/Tourism/" style="color:#FF0000;">登录</a>&nbsp;&nbsp;
					</div> 
				</div>
			</div>
		</div>
	</div>
	
    <!-- <div data-options="region:'south',title:'版权',split:true,maxHeight:100" style="height:100px;"></div> -->   
    
    <div data-options="region:'west',title:'  ',split:true,minWidth:150,maxWidth:180" style="width:180px;">
    </div>   
    <div data-options="region:'center' " style="padding: 0;">
    	<div class="row" id="userInput" style="margin-top: 100px;">
			<div class="col-lg-12" style="width: 100%;">
				<form action="" id="userInput-form" class="form-horizontal" style="width: 30%;height: 100%; margin-left: 30%;">
					<div class="form-group" hidden="true">
						<label for="userId" class="col-sm-4 control-label">用户ID</label>
						<div class="col-sm-8">
							<input type="text" class="form-control" id="userId" 
								   name="userId" placeholder="用户ID" value="<c:if test="${user!=null }">${user.userId }</c:if>" >
						</div>
					</div>
					<div class="form-group">
						<label for="username" class="col-sm-4 control-label">用户名</label>
						<div class="col-sm-8">
							<input type="text" class="form-control" id="username" 
								   name="username" placeholder="请输入用户名" value="<c:if test="${user!=null }">${user.username }</c:if>" >
						</div>
					</div>
					<div class="form-group">
						<label for="password" class="col-sm-4 control-label">密码</label>
						<div class="col-sm-8">
							<input type="password" class="form-control" id="password"
								   name="password" value='<c:if test="${user!=null }">${user.password }</c:if>' placeholder="请输入密码">
						</div>
					</div>
					<div class="form-group">
						<label for="repassword" class="col-sm-4 control-label">确认密码</label>
						<div class="col-sm-8">
							<input type="password" class="form-control" id="repassword" 
							       name="repassword" value="<c:if test="${user!=null }">${user.password }</c:if>" placeholder="请确认密码">
						</div>
					</div>
					<div class="form-group">
						<label for="sex" class="col-sm-4 control-label">性别</label>
						<div class="col-sm-8">
							<input type="radio" name="sex" value="1" checked >男&nbsp;&nbsp;
							<input type="radio" name="sex" value="0" <c:if test="${user!=null && user.sex==0 }">checked</c:if>>女
						</div>
					</div>
					<div class="form-group">
						<label for="phone" class="col-sm-4 control-label">手机号码</label>
						<div class="col-sm-8">
							<input type="text" class="form-control" id="phone" 
							       name="phone" value="<c:if test="${user!=null }">${user.phone }</c:if>" placeholder="请确认手机号码">
						</div>
					</div>
					<div class="form-group">
						<button type="button" class="btn btn-primary" style="margin-left: 30%;" onclick="register()">确定</button>
						<a type="button" class="btn btn-danger" href="http://localhost:8080/Tourism/" style="margin-left: 20%;">取消</a>
					</div>
				</form>
			</div>
		</div>
    </div>
	
	<script type="text/javascript">
	var register = function(){
		var data = $("form").serialize();
		$.ajax({
			url: "../front/register.action",
			data: data,
			success: function(msg){
				/* $.messager.show({
					title:"注册",
					msg:"注册成功",
					timeout:2000,
					showType:"slide"
				}); */
				/* setTimeout(function(){
					window.location.href="../frontIndex.action";
				}, 2000); */
				$.messager.confirm('注册', '恭喜注册成功，是否前往登录', function(r){
					if (r){
						window.location.href="../frontIndex.action";
					}
				});
			},
			error: function(msg){
				$.messager.show({
					title:"注册",
					msg:"注册失败",
					timeout:2000,
					showType:"slide"
				});
			}
		});
	};
	</script>
</body>
</html>