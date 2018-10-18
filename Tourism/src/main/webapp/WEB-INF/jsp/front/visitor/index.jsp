<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
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
	<link type="text/css" href="../common/easyui/themes/default/easyui.css" rel="stylesheet">
	<link type="text/css" href="../common/easyui/themes/icon.css" rel="stylesheet">
	<link type="text/css" href="../css/bootstrap.min.css" rel="stylesheet">
	<link type="text/css" href="../css/dataTables.bootstrap.css" rel="stylesheet">
	<script type="text/javascript" src="../common/jquery.min.js"></script>
	<script type="text/javascript" src="../common/easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="../js/bootstrap.min.js"></script>
    <style type="text/css">
		body{
			background-image:url("/Tourism/images/bg/moli.jpg");
			background-position:center;
			background-repeat:repeat-y;
			z-index: 10;
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
						<a style="display:none;">${userId }</a>
						<a href="#">欢迎来到游咖旅游</a>&nbsp;&nbsp; 
						<a href="http://localhost:8080/Tourism/" style="color:#FF0000;">请登录</a>&nbsp;&nbsp;
					</div> 
				</div>
			</div>
		</div>
	</div>
	
    <!-- <div data-options="region:'south',title:'版权',split:true,maxHeight:100" style="height:100px;"></div> -->   
    
    <div data-options="region:'west',title:'  ',split:true,minWidth:150,maxWidth:180" style="width:180px;">
    	<ul style="font-size: 20px;">
    		<li style="margin-bottom: 15px;"><a href="#" type="button" class="btn btn-primary" onclick="getAllScenic()">景点攻略</a></li>
    	</ul>
    </div>   
    <div data-options="region:'center' " style="padding: 0;">
    	<div class="wrapper">
    		<div id="scenicList" class="panel panel-default">
				<div class="panel-body">
					<form id="scenicList-form" class="form-inline" action="" method="post">
						<div class="form-group">
							<label for="scenicList-form-scenicName">景点名称</label>
							<input type="text" class="form-control" id="scenicList-form-scenicName" 
								name="scenicName" placeholder="请输入景点名称">
						</div>
						&nbsp;
						<div class="form-group">
							<label for="scenicList-form-scenicProvince">地点</label>
							<select class="form-control" id="scenicList-form-scenicProvince" name="provinceId">
								<option value="" selected="selected">--请选择--</option>
								<c:forEach var="province" items="${provinceList }">
									<option value="${province.provinceId }">${province.provinceName }</option>
								</c:forEach>
							</select>
							-
							<select class="form-control" id="scenicList-form-scenicCity" name="cityId">
								<option value="" selected="selected">--请选择--</option>
								<%-- <c:forEach var="city" items="${provinceList }">
									<option value="${province.provinceId }">${province.provinceName }</option>
								</c:forEach> --%>
							</select>
						</div>
						&nbsp;
						<div class="form-group">
							<label for="scenicList-form-scenicTicketPrice">门票价格</label>
							<input type="number" class="form-control" style="width: 110px" 
								id="scenicList-form-scenicTicketPrice" name="scenicTicketPrice" placeholder="最高门票价">
						</div>
						&nbsp;
						<div class="form-group">
							<label for="scenicList-form-scenicType">景点分类</label>
							<select class="form-control" id="scenicList-form-scenicType" name="scenicType">
								<option value="" selected="selected">--请选择--</option>
								<c:forEach var="type" items="${scenicTypes }">
									<option value="${type.getName() }">${type.getName() }</option>
								</c:forEach>
							</select>
						</div>
						&nbsp;
						<button type="button" class="btn btn-primary" onclick="selectByCondition()">查询</button>
						<button type="reset" class="btn ">清空</button>
					</form>
				</div>
			</div>  <!-- class="panel panel-default" -->
	    	<div id="index-list">
	    		<%-- <jsp:include page="list.jsp"></jsp:include> --%>
	    		<script type="text/javascript">
	    			$(document).ready(function(){
	    				getAllScenic();
	    			});
	    		</script>
	    	</div>
    	</div>  <!-- class="wrapper" -->
    </div>  <!--  data-options="region:'center'" -->
   
    <script type="text/javascript">
    	var getAllScenic = function(){
    		$.ajax({
				url: "../front/getAllScenic.action",
				data: {
					username: "${username }",
					userId: "${userId}"
				},
				success: function(msg){
					$("#index-list").html(msg);
				}
			});	
    	};
		
	</script>
</body>
</html>