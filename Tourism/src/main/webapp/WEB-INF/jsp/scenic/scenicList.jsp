<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<%-- <%@ taglib uri="/struts-tags" prefix="s"%> --%>

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
	</div>
	<div id="scenicList2" class="row">
		<jsp:include page="scenicList2.jsp"></jsp:include>
	</div>
	
</div>

<script type="text/javascript">
	var selectByCondition = function(){
		$.ajax({
			url: "scenic/selectByCondition.action",
			type: "POST",
			data: $("#scenicList-form").serialize(),
			success: function(msg){
				$("#scenicList2").html(msg);
			}
		});
	}
</script>
