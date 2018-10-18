<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 

<div class="col-lg-12">
	<div class="panel panel-default">
		<table class="table table-bordered table-striped">
			<tbody>
				<c:choose>
					<c:when test="${pager!=null }">
						<c:forEach var="scenic" items="${pager.rows }">
							<tr style="text-align: left;">
								<td class="col-lg-2">
									<img alt="" src="${scenic.scenicImg }" width="200px" height="100px">
								</td>
								<td class="col-lg-3">
									<div style="margin-bottom: 2px;">${scenic.scenicName }</div>
									<div style="margin-bottom: 2px;">${scenic.scenicPos }</div>
									<div style="margin-bottom: 2px;color: #FFD700;">${scenic.scenicType }</div>
									<div style="margin-bottom: 2px;color: #FF0000;">${scenic.scenicScore } 分</div>
								</td>
								<td class="col-lg-6">
									<div style="margin-bottom: 3px;">有关评论:</div>
									<c:forEach var="comment" items="${scenic.commentListByUser }" varStatus="status">
										<c:if test="${status.index<3 }">
											<div style="font-size: 15px;">
												<button class="btn btn-primary btn-xs" onclick="delComment('${userId }', '${scenic.scenicId }')">
													删除
												</button>
												${comment.content }
											</div>
										</c:if>
									</c:forEach>
								</td>
								<td class="col-lg-1">
									<button data-target="#" class="btn btn-danger" data-toggle="modal" 
											style="margin-bottom: 15px;" onclick="delAll('${scenic.scenicId }')">
										全部删除
									</button>
								</td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr><td class="col-lg-12" style="text-align: center;">暂无相关数据</td></tr>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
		<div class="col-md-12 text-center">
			<ul class="pagination ul-group from-horizontal">
			    <li><a href="#" onclick="pageTurn('../front/getAllScenic.action?page=1')">首页</a></li>
			    <li><a href="#" onclick="pageTurn('../front/getAllScenic.action?page=${pager.currentPage-1<=0? 1:pager.currentPage - 1}')">上一页</a></li>
				<li><span>${pager.currentPage } / ${pager.pageCount<=0?1:pager.pageCount}</span></li>
			    <li><a href="#" onclick="pageTurn('../front/getAllScenic.action?page=${pager.currentPage+1>pager.pageCount? pager.currentPage:pager.currentPage+1}')">下一页</a></li>
			    <li><a href="#" onclick="pageTurn('../front/getAllScenic.action?page=${pager.pageCount<=0? 1:pager.pageCount}')">尾页</a></li>
			</ul>
		</div>
	</div>
	
	<!-- 评论模态框(modal) -->
	<div id="list-comment-dialog" class="modal fade" tabindex="-1" role="modal" aria-labelledby="list-modalTitle" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					<div id="list-modalTitle" class="modal-title">来自 ${username } 的评论</div>
				</div>
				<div class="modal-body">
					<textarea id="list-dialog-content" rows="5" cols="90" placeholder="您觉得此景点怎么样呢？"></textarea>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" onclick="commentPublish()">发表</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 收藏模态框(modal) -->
	<div id="list-collect-dialog" class="modal fade" tabindex="-1" role="modal" aria-labelledby="collect-modalTitle" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					<div id="collect-modalTitle" class="modal-title">景点收藏</div>
				</div>
				<div class="modal-body">
					收藏成功！！感谢 ${username } 的收藏
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-danger" onclick="collectCancel()">取消收藏</button>
				</div>
			</div>
		</div>
	</div>
	
	
	<script type="text/javascript">
		var userId = "${userId }";
		var scenicId = null;
		
		var pageTurn = function(url){
			$.ajax({
				url: url,
				data: {
					userId: "${userId }",
					username: "${username }"
				},
				type: "POST",
				success: function(msg){
					$("#index-list").html(msg);
				}
			});
		};
		
		var setScenicId = function(id){
			scenicId = id;
		};
		
		
		var collectScenic = function(userId, scenicId){
			if("${userId }" == null)
				toLogin();
			this.scenicId = scenicId;
			$.ajax({
				url: '../front/collectScenic.action',
				data: {
					userId: userId,
					scenicId: scenicId
				},
				success: function(){
					$("#list-collect-dialog").modal("show");
				},
				error: function(){
					$.messager.show({
						title:'美景收藏',
						msg:'收藏失败，请重新操作',
						timeout:2500,
						showType:'slide'
					});
				}
			});
		};
		
		var collectCancel = function(){
			$.messager.confirm('', '您确定要取消收藏吗？', function(r){
				if (r){
				    $.ajax({
				    	url: "../front/collectCancel.action",
				    	data: {
				    		userId: userId,
				    		scenicId: scenicId
				    	},
				    	success: function(msg){
				    		$("#list-collect-dialog").modal("hide");
				    	}
				    });
				}
			});
		};
		
		var delComment = function(){
			$.messager.confirm("删除", "您确认删除此评论 吗？", function(r){
				if (r){
					$.ajax({
						/* url: "user/del.action?delId=" + delId, */
						type: "POST",
						success: function(msg){
							$.ajax({
								/* url: "user/selectByCondition.action", */
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
		}
	</script>
</div>