<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="row" id="scenicInput">
	<div class="col-lg-12" style="width: 100%;">
		<form action="" id="scenicInput-form" class="form-horizontal" style="width: 30%;height: 100%; margin-left: 30%;">
			<div class="form-group" hidden="true">
				<label for="scenicId" class="col-sm-4 control-label">景点ID</label>
				<div class="col-sm-8">
					<input type="text" class="form-control" id="scenicInput-scenicId" name="scenicId"
						   required="required" placeholder="景点ID" value="<c:if test="${scenic!=null }">${scenic.scenicId }</c:if>" >
				</div>
			</div>
			<div class="form-group">
				<label for="scenicInput-scenicName" class="col-sm-4 control-label">景点名称</label>
				<div class="col-sm-8">
					<input type="text" class="form-control" id="scenicInput-scenicName" name="scenicName"
						   required="required" placeholder="请输入景点名称" value="<c:if test="${scenic!=null }">${scenic.scenicName }</c:if>" >
				</div>
			</div>
			<div class="form-group">
				<label for="provinceId" class="col-sm-4 control-label">地理位置</label>
				<div class="col-sm-8">
					<select class="form-control" id="scenicInput-provinceId" name="provinceId">
						<option value="" selected="selected">--请选择省份--</option>
						<c:forEach var="province" items="${provinceList }">
							<option value="${province.provinceId }" <c:if test="${scenic.provinceId } == ${province.provinceId }">selected</c:if> >
								${province.provinceName }
							</option>
						</c:forEach>
					</select>
					
					<select class="form-control" id="scenicInput-cityId" name="cityId">
						<option value="" selected="selected">--请选择城市--</option>
						<c:forEach var="city" items="${cityList }">
							<option value="${city.cityId }" <c:if test="${scenic.cityId } == ${city.cityId }">selected</c:if> >
								${province.provinceName }
							</option>
						</c:forEach>
					</select>
					
					<input type="text" class="form-control" id="scenicInput-scenicPos" name="scenicPos"
						    required="required" value='<c:if test="${scenic!=null }">${scenic.scenicPos }</c:if>' placeholder="请输入具体地址">
				</div>
			</div>
			<div class="form-group">
				<label for="password" class="col-sm-4 control-label">门票价格</label>
				<div class="col-sm-8">
					<input type="number" class="form-control" id="scenicInput-scenicTicketPrice"
						   name="scenicTicketPrice" value='<c:if test="${scenic!=null }">${scenic.scenicTicketPrice }</c:if>' placeholder="请输入门票价格">
				</div>
			</div>
			<div class="form-group">
				<label for="state" class="col-sm-4 control-label">景点分类</label>
				<div class="col-sm-8">
					<select class="form-control" id="scenicInput-scenicType" name="scenicType">
						<option value="" selected="selected">--请选择--</option>
						<c:forEach var="type" items="${scenicTypes }">
							<option value="${type.getName() }" <c:if test="${scenic.scenicType } == ${type.getName() }">selecked</c:if> >
								${type.getName() }
							</option>
						</c:forEach>
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
				url: "scenic/addOrUpdate.action",
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
					else if(msg == "0"){
						$.messager.show({
							title:"更新",
							msg:"更新成功",
							timeout:2000,
							showType:"slide"
						});
						$('#index-tabs').tabs('getTab',"景点列表").panel('refresh','scenic/list.action');
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
			if($('#index-tabs').tabs("getTab", "景点添加") != null)
				$('#index-tabs').tabs("close", "景点添加");
			
			var listTab = $('#index-tabs').tabs("getTab", "景点列表");
			if(listTab != null){
				listTab.panel("refresh");
				$('#index-tabs').tabs("select", "景点列表");		
			}
		};
	</script>
</div>