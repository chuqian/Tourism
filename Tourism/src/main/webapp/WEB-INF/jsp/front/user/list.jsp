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
								<td class="col-lg-2" style="color: #FF0000;">
									<div>￥${scenic.scenicTicketPrice } 起</div>
									<div style="margin-bottom: 15px;">余票：${scenic.ticketRemainder }</div>
									<div style="margin-bottom: 15px;">
										<button data-target="#list-buy-dialog" class="btn btn-success" data-toggle="modal" 
														onclick="setScenicId('${scenic.scenicId }')">
											购买门票
										</button>
									</div>
								</td>
								<td class="col-lg-4">
									<div style="margin-bottom: 3px;">有关评论:</div>
									<c:choose>
										<c:when test="${scenic.commentList!=null && fn:length(scenic.commentList)>0 }">
											<c:forEach var="comment" items="${scenic.commentList }" varStatus="status">
												<c:if test="${status.index<3 }">
													<div>${status.index+1 }、${comment.content }</div>
												</c:if>
											</c:forEach>
										</c:when>
										<c:otherwise>
											<div style="color: #FF0000;">暂无相关评论,留个首发呗！！</div>
										</c:otherwise>
									</c:choose>
								</td>
								<td class="col-lg-1">
									<button data-target="#list-comment-dialog" class="btn btn-primary" data-toggle="modal" 
											style="margin-bottom: 15px;" onclick="setScenicId('${scenic.scenicId }')">
										留个评论
									</button>
									<button class="btn btn-primary" style="margin-bottom: 15px;" onclick="collectScenic('${userId }', '${scenic.scenicId }')">
										美景收藏
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
	
	<!-- 购买门票模态框(modal) -->
	<div id="list-buy-dialog" class="modal fade" tabindex="-1" role="modal" aria-labelledby="buy-modalTitle" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					<div id="buy-modalTitle" class="modal-title">门票购买</div>
				</div>
				<div class="modal-body" style="height: 100px;">
					<div style="font-size: 20px;">
						您需要购买多少张门票？<input id="list-count-buy" type="number" value="1" min="1" max="10" style="width: 50px;">
					</div>
					<div style="font-size: 20px;">
						出行时间:<input id="list-travel-time" type="date" >
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" onclick="buyTicket()">购买</button>
				</div>
			</div>
		</div>
	</div>
	
	<script type="text/javascript">
		var userId = "${userId }";
		var scenicId = null;
		
		var setScenicId = function(id){
			scenicId = id;
		};
		
		/* 分页跳转 */
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
		
		/* 发表评论 */
		var commentPublish = function(){
			$("#list-comment-dialog").modal("hide");
			$.ajax({
				url: "../front/commentPublish.action",
				data:{
					userId: "${userId }",
					scenicId: scenicId,
					content: $("#list-dialog-content").val()
				},
				success: function(msg){
					$.messager.show({
						title:'评论',
						msg:'评论成功',
						timeout:1500,
						showType:'slide'
					});
					setTimeout(function(){
						location.reload();
					},1500);
				}
			});
		};
		
		/* 景点收藏 */
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
		
		/* 取消收藏 */
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
		
		/* 购买门票 */
		var buyTicket = function(){
			$.ajax({
		    	url: "../front/buyTicker.action",
		    	data: {
		    		userId: userId,
		    		scenicId: scenicId,
		    		count: $("#list-count-buy").val()
		    	},
		    	success: function(msg){
		    		$.messager.show({
		    			title: "门票购买", 
		    			msg: msg,
		    			timeout: 2000,
		    			showType: "slide"
		    		});
		    	}
		    });
			$("#list-buy-dialog").modal("hide");
		};
		
		
		/* var toLogin = function(){
			$.message.confirm("登录", "您还没登录哦,是否前往登录", function(r){
				if(r){
					window.location.href="http://localhost:8080/Tourism/";
				}
			});
		}; */
	</script>
</div>