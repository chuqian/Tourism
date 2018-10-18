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
					<td>景点名称</td>
					<td>地理位置</td>
					<td>门票价格</td>
					<td>景点分类</td>
					<td>景点评分</td>
					<td>主要操作</td>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${pager.rows!=null && fn:length(pager.rows)>0 }">
						<c:forEach var="scenic" items="${pager.rows }" varStatus="status">
							<tr style="text-align: center;">
								<td width="40px"><input type="checkbox" >${status.index + 1 }</td>
								<td>${scenic.scenicName }</td>
								<td>${scenic.scenicPos }</td>
								<td>${scenic.scenicTicketPrice }</td>
								<td>${scenic.scenicType }</td>
								<td>${scenic.scenicScore }</td>
								<td><a href="#" class="btn btn-primary btn-xs" onClick="toUpdate(${scenic.scenicId })">修改</a>
									<a href="#" class="btn btn-warning btn-xs" onClick="scenicDel(${scenic.scenicId }, '${scenic.scenicName }')">删除</a>
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
			    <li><a href="#" onclick="pageTurn('scenic/list.action?page=1')">首页</a></li>
			    <li><a href="#" onclick="pageTurn('scenic/list.action?page=${currentPage-1<=0? 1:currentPage - 1}')">上一页</a></li>
				<li><span>${pager.currentPage } / ${pager.pageCount<=0?1:pager.pageCount}</span></li>
			    <li><a href="#" onclick="pageTurn('scenic/list.action?page=${currentPage+1>pageCount? currentPage:currentPage+1}')">下一页</a></li>
			    <li><a href="#" onclick="pageTurn('scenic/list.action?page=${pageCount<=0? 1:pageCount}')">尾页</a></li>
			</ul>
		</div>
	</div>
</div>
<script type="text/javascript">
	var toUpdate = function(scenicId){
		$.ajax({
			url: "scenic/toInput.action?scenicId=" + scenicId,
			type: "POST",
			success: function(msg){
				$("#scenicList").html(msg);
				/* console.log($("#index-tabs").tabs("getTab","景点列表"));
				$("#index-tabs").tabs("getTab","景点列表").panel("setTitle","景点信息"); */
			}
		});
	}
	var scenicDel = function(delId, delName){
		var data = $("#scenicList-form").serialize();
		$.messager.confirm("删除", "您确认删除景点\' "+delName+"\' 吗？", function(r){
			if (r){
				$.ajax({
					url: "scenic/del.action?delId=" + delId,
					type: "POST",
					success: function(msg){
						$.ajax({
							url: "scenic/selectByCondition.action",
							data: data,
							success: function(msg){
								$("#scenicList2").html(msg);
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
		var data = $("#scenicList-form").serialize();
		$.ajax({
			url: url,
			data: data,
			type: "POST",
			success: function(msg){
				$("#scenicList2").html(msg);
			}
		});
	};
</script>