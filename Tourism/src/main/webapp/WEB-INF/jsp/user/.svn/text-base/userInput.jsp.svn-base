<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="row" id="userInput">
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
				<label for="state" class="col-sm-4 control-label">状态</label>
				<div class="col-sm-8">
					<select class="form-control" id="state" name="state">
						<option value="1" selected="selected">正常</option>
						<option value="0" <c:if test="${user!=null && user.state==0 }">selected</c:if> >冻结</option>
					</select>
				</div>
			</div>
			<div class="form-group">
				<button type="button" class="btn btn-primary" style="margin-left: 30%;" onclick="addOrUpdate()">确定</button>
				<button type="button" class="btn " style="margin-left: 20%;" onclick="cancel()">取消</button>
			</div>
		</form>
	</div>
	
	<script type="text/javascript">
		var addOrUpdate = function(){
			var data = $("form").serialize();
			$.ajax({
				url: "user/addOrUpdate.action",
				data: data,
				success: function(msg){
					if(msg == "1"){
						$.messager.show({
							title:"添加",
							msg:"添加成功",
							timeout:2000,
							showType:"slide"
						});
						$("form")[0].reset();						
					}
					else{
						$.messager.show({
							title:"更新",
							msg:"更新成功",
							timeout:2000,
							showType:"slide"
						});
						$('#index-tabs').tabs('getTab',"用户列表").panel('refresh','user/list.action');
					}
				},
				error: function(msg){
					$.messager.show({
						title:"",
						msg:"操作失败",
						timeout:2000,
						showType:"slide"
					});
				}
			});
		};
		
		var cancel = function(){
			if($('#index-tabs').tabs("getTab", "用户添加") != null)
				$('#index-tabs').tabs("close", "用户添加");
			
			var listTab = $('#index-tabs').tabs("getTab", "用户列表");
			if(listTab != null){
				listTab.panel("refresh");
				$('#index-tabs').tabs("select", "用户列表");		
			}
		};
	</script>
</div>