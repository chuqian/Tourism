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
									<c:forEach var="ticket" items="${scenic.ticketListByUser }" varStatus="status">
										<c:if test="${status.index<4 }">
											<div style="font-size: 15px;">
												${status.index+1 }、
												票数:<button class="bt btn-xs">${ticket.count }</button>&nbsp;
												---> <fmt:formatDate value="${ticket.createTime }" pattern="yyyy年MM月dd日" /> &nbsp;
												
												<!-- 日期比较用于显示门票是否过期 -->
												<jsp:useBean id="now" class="java.util.Date" />
												<fmt:formatDate value="${now}" pattern="yyyy年MM月dd日" var="today"/>
												<fmt:formatDate value="${ticket.createTime }" pattern="yyyy年MM月dd日" var="create"/>
												<%-- <fmt:formatDate value="<%=new Date()%>" pattern="yyyy-MM-dd " /> --%>  
												<c:if test="${create >= today }"><span style="color: #3CB371;">未出行</span></c:if>
												<c:if test="${create < today}"><span style="color: #FF0000;">已过期</span></c:if>
												&nbsp;
												
												<button class="btn btn-primary btn-xs" onclick="delTicket('${ticket.userId }', '${ticket.scenicId }', '${ticket.createTime }')">
													删除
												</button>
											</div>
										</c:if>
									</c:forEach>
								</td>
								<td class="col-lg-1">
									<button class="btn btn-danger" style="margin-bottom: 15px;" onclick="delAllTicket('${userId }', '${scenic.scenicId }')">
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
			    <li><a href="#" onclick="pageTurn('../front/getCollByUserId.action?page=1')">首页</a></li>
			    <li><a href="#" onclick="pageTurn('../front/getCollByUserId.action?page=${pager.currentPage-1<=0? 1:pager.currentPage - 1}')">上一页</a></li>
				<li><span>${pager.currentPage } / ${pager.pageCount<=0?1:pager.pageCount}</span></li>
			    <li><a href="#" onclick="pageTurn('../front/getCollByUserId.action?page=${pager.currentPage+1>pager.pageCount? pager.currentPage:pager.currentPage+1}')">下一页</a></li>
			    <li><a href="#" onclick="pageTurn('../front/getCollByUserId.action?page=${pager.pageCount<=0? 1:pager.pageCount}')">尾页</a></li>
			</ul>
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
						您需要购买多少张门票？<input type="number" value="1" min="1" max="10" style="width: 50px;">
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
		
		/* 页面跳转 */
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
		
		/* 取消收藏  */		
		var collectCancel = function(userId, scenicId){
			$.messager.confirm('', '您确定要取消收藏吗？', function(r){
				if (r){
				    $.ajax({
				    	url: "../front/collectCancel.action",
				    	data: {
				    		userId: userId,
				    		scenicId: scenicId
				    	},
				    	success: function(msg){
				    		$.ajax({
						    	url: "../front/getCollByUserId.action?userId="+"${userId }",
						    	success: function(msg){
						    		$("#index-list").html(msg);
						    	}
						    });
				    	}
				    });
				}
			});
		};
		
		var buyTicket = function(){
			$("#list-buy-dialog").modal("hide");
		};
		
		var delTicket = function(userId, scenicId, createTime){
			$.messager.confirm("删除", "您确认删除吗？", function(r){
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
		}
		
	</script>
</div>