<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<%-- <%@ taglib uri="/struts-tags" prefix="s"%> --%>

<div id="userList" class="wrapper">
	<div class="panel panel-default">
		<div class="panel-body">
			<form id="userList-form" class="form-inline" action="" method="post">
				<div class="form-group">
					<label for="form-username">用户名</label>
					<input type="text" class="form-control" id="userList-form-username" 
						   name="username" value="${user.username }">
				</div>
				&nbsp;
				<div class="form-group">
					<label for="form-sex">性别</label>
					<select class="form-control" id="userList-form-sex" name="sex">
						<option value="" selected="selected">--请选择--</option>
						<option value="1" <c:if test="${user.sex == 1 }">selected</c:if> >男</option>
						<option value="0" <c:if test="${user.sex == 0 }">selected</c:if> >女</option>
					</select>
				</div>
				&nbsp;
				<div class="form-group">
					<label for="form-phone">手机</label>
					<input type="text" class="form-control" id="userList-form-phone" 
						   name="phone" value="${user.phone }" >
				</div>
				&nbsp;
				<div class="form-group">
					<label for="form-state">状态</label>
					<select class="form-control" id="userList-form-state" name="state">
						<option value="" selected="selected">--请选择--</option>
						<option value="1" <c:if test="${user.state == 1 }">selected</c:if> >正常</option>
						<option value="0" <c:if test="${user.state == 0 }">selected</c:if> >冻结</option>
					</select>
				</div>
				&nbsp;
				<button type="button" class="btn btn-primary" onclick="selectByCondition()">查询</button>
				<button type="reset" class="btn ">清空</button>
			</form>
		</div>
	</div>
	<div class="row" id="userList2">
		<jsp:include page="userList2.jsp"></jsp:include>
	</div>
	
</div>

<script type="text/javascript">
	var selectByCondition = function(){
		$.ajax({
			url: "user/selectByCondition.action",
			type: "POST",
			data: $("#userList-form").serialize(),
			success: function(msg){
				$("#userList2").html(msg);
			}
		});		
	};
</script>
