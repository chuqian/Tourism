<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<%-- <%@ taglib uri="/struts-tags" prefix="s"%> --%>

<div class="col-lg-12">
	<div class="panel panel-default">
		<table class="table table-bordered table-striped">
			<thead>
				<tr style="text-align: center;">
					<td width="40px"><a class="btn btn-primary btn-xs">全选</a></td>
					<td width="50px">序号</td>
					<td>用户名</td>
					<td>密码</td>
					<td>性别</td>
					<td>手机号</td>
					<td>状态</td>
					<td>主要操作</td>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${userList!=null && fn:length(userList)>0 }">
						<c:forEach var="user" items="${userList }" varStatus="status">
							<tr style="text-align: center;">
								<td width="40px"><input type="checkbox" ></td>
								<td width="50px">${status.index + 1 }</td>
								<td>${user.username }</td>
								<td>${user.password }</td>
								<td><c:if test="${user.sex == 1}">男</c:if>
									<c:if test="${user.sex == 0}">女</c:if></td>
								<td>${user.phone }</td>
								<td><c:if test="${user.state == 1}">正常</c:if>
									<c:if test="${user.state == 0}">冻结</c:if></td>
								<td><a href="#" class="btn btn-primary btn-xs" onClick="toUpdate(${user.userid })">修改</a>
									<a href="#" class="btn btn-warning btn-xs" onClick="userDel('${user.userid }', '${user.username }')">删除</a>
								</td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr><td colspan="7" style="text-align: center;">暂无相关数据</td></tr>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
		<div class="col-md-12 text-center">
			<ul class="pagination ul-group from-horizontal">
			    <li><a href="#" onclick="pageTurn('user/selectByCondition.action?page=1')">首页</a></li>
			    <li><a href="#" onclick="pageTurn('user/selectByCondition.action?page=${currentPage-1<=0? 1:currentPage - 1}')">上一页</a></li>
				<li><span>${currentPage } / ${pageCount<=0?1:pageCount}</span></li>
			    <li><a href="#" onclick="pageTurn('user/selectByCondition.action?page=${currentPage+1>pageCount? currentPage:currentPage+1}')">下一页</a></li>
			    <li><a href="#" onclick="pageTurn('user/selectByCondition.action?page=${pageCount<=0? 1:pageCount}')">尾页</a></li>
			</ul>
		</div>
	</div>
	
	<script type="text/javascript">
		var toUpdate = function(userid){
			$.ajax({
				url: "user/toInput.action?userid=" + userid,
				type: "POST",
				success: function(msg){
					$("#userList").html(msg);
					/* console.log($("#index-tabs").tabs("getTab","用户列表"));
					$("#index-tabs").tabs("getTab","用户列表").panel("setTitle","用户信息"); */
				}
			});
		}
		var userDel = function(delId, delName){
			var data = $("#userList-form").serialize();
			$.messager.confirm("删除", "您确认删除用户\' "+delName+"\' 吗？", function(r){
				if (r){
					$.ajax({
						url: "user/del.action?delId=" + delId,
						type: "POST",
						success: function(msg){
							$.ajax({
								url: "user/selectByCondition.action",
								data: data,
								success: function(msg){
									$("#userList2").html(msg);
									$.messager.show({
										title:'删除',
										msg:'删除成功',
										timeout:2000,
										showType:'slide'
									});
								}
							});
						}
					});
				}
			});
		};
		var pageTurn = function(url){
			var data = $("#userList-form").serialize();
			$.ajax({
				url: url,
				data: data,
				type: "POST",
				success: function(msg){
					$("#userList2").html(msg);
				}
			});
		};
	</script>
</div>