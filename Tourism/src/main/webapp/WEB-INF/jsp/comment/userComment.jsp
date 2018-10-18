<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<%-- <%@ taglib uri="/struts-tags" prefix="s"%> --%>

<div id="userComment" class="wrapper">
	<div class="panel panel-default">
		<div class="panel-body">
			<form id="userComment-form" class="form-inline" action="" method="post">
				<div class="form-group">
					<label for="userComment-form-username">用户名</label>
					<input type="text" class="form-control" id="userComment-form-username" 
						   name="username" value="">
				</div>
				&nbsp;
				<div class="form-group">
					<label for="userComment-form-username">日期</label>
					<input type="date" class="form-control" id="userComment-form-datetime" name="datetime" value="">
				</div>
				&nbsp;
				<button type="button" class="btn btn-primary" onclick="selectByCondition()">查询</button>
				<button type="reset" class="btn ">清空</button>
			</form>
		</div>
	</div>
	<div class="row" >
		<div class="col-lg-12">
			<div class="panel panel-default">
				<table class="table table-bordered table-striped">
					<thead>
						<tr style="text-align: center;">
							<td width="40px"><a class="btn btn-primary btn-xs">全选</a></td>
							<td>用户名</td>
							<td>景点名称</td>
							<td>评论</td>
							<td>时间</td>
							<td>主要操作</td>
						</tr>
					</thead>
					<tbody>
						<c:choose>
							<c:when test="${pager.rows!=null && fn:length(pager.rows)>0 }">
								<c:forEach var="userCommSce" items="${pager.rows }" varStatus="status">
									<tr style="text-align: center;">
										<td width="40px"><input type="checkbox" >${status.index + 1 }</td>
										<td>${userCommSce.username }</td>
										<td>${userCommSce.scenicName }</td>
										<td>${userCommSce.content }</td>
										<td>${userCommSce.createTime }</td>
										<td><a href="#" class="btn btn-primary btn-xs" onClick="toUpdate(${user.userid })">详情</a>
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
			$.messager.confirm("删除", "您确认删除此评论 吗？", function(r){
				if (r){
					$.ajax({
						/* url: "user/del.action?delId=" + delId, */
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
	</div>
	
</div>

<script type="text/javascript">
	var selectByCondition = function(){
		$.ajax({
			url: "user/selectByCondition.action",
			type: "POST",
			data: $("#userComment-form").serialize(),
			success: function(msg){
				$("#userComment2").html(msg);
			}
		});		
	};
</script>
