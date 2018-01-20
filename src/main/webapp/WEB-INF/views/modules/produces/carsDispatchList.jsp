<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>车辆调度管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			
		});
		function page(n,s){
			$("#pageNo").val(n);
			$("#pageSize").val(s);
			$("#searchForm").submit();
        	return false;
        }
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/produces/carsDispatch/">车辆调度列表</a></li>
		<shiro:hasPermission name="produces:carsDispatch:edit"><li><a href="${ctx}/produces/carsDispatch/form">车辆调度添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="carsDispatch" action="${ctx}/produces/carsDispatch/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>车号：</label>
				<form:input path="carNo" htmlEscape="false" maxlength="32" class="input-medium"/>
			</li>
			<li><label>名称：</label>
				<form:input path="carName" htmlEscape="false" maxlength="60" class="input-medium"/>
			</li>
			<li><label>回厂时间：</label>
				<input name="backTime" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${carsDispatch.backTime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</li>
			<li><label>安排生产时间：</label>
				<input name="produceTime" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${carsDispatch.produceTime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</li>
			<li><label>出厂时间：</label>
				<input name="outTime" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${carsDispatch.outTime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</li>
			<li><label>维修时间：</label>
				<input name="fixTime" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${carsDispatch.fixTime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</li>
			<li><label>可用状态：</label>
				<form:select path="carState" class="input-medium">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</li>
			<li><label>车辆性质：</label>
				<form:select path="carType" class="input-medium">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</li>
			<li><label>车辆归属：</label>
				<form:select path="carOwner" class="input-medium">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</li>
			<li><label>回厂排序：</label>
				<form:input path="backSort" htmlEscape="false" maxlength="5" class="input-medium"/>
			</li>
			<li><label>生产排序：</label>
				<form:input path="produceSort" htmlEscape="false" maxlength="5" class="input-medium"/>
			</li>
			<li><label>出厂排序：</label>
				<form:input path="outSort" htmlEscape="false" maxlength="5" class="input-medium"/>
			</li>
			<li><label>维修排序：</label>
				<form:input path="fixSort" htmlEscape="false" maxlength="5" class="input-medium"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>车号</th>
				<th>名称</th>
				<th>回厂时间</th>
				<th>安排生产时间</th>
				<th>出厂时间</th>
				<th>维修时间</th>
				<th>可用状态</th>
				<th>车辆性质</th>
				<th>车辆归属</th>
				<th>回厂排序</th>
				<th>生产排序</th>
				<th>出厂排序</th>
				<th>维修排序</th>
				<shiro:hasPermission name="produces:carsDispatch:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="carsDispatch">
			<tr>
				<td><a href="${ctx}/produces/carsDispatch/form?id=${carsDispatch.id}">
					${carsDispatch.carNo}
				</a></td>
				<td>
					${carsDispatch.carName}
				</td>
				<td>
					${carsDispatch.backTime}
				</td>
				<td>
					${carsDispatch.produceTime}
				</td>
				<td>
					${carsDispatch.outTime}
				</td>
				<td>
					${carsDispatch.fixTime}
				</td>
				<td>
					${fns:getDictLabel(carsDispatch.carState, '', '')}
				</td>
				<td>
					${fns:getDictLabel(carsDispatch.carType, '', '')}
				</td>
				<td>
					${fns:getDictLabel(carsDispatch.carOwner, '', '')}
				</td>
				<td>
					${carsDispatch.backSort}
				</td>
				<td>
					${carsDispatch.produceSort}
				</td>
				<td>
					${carsDispatch.outSort}
				</td>
				<td>
					${carsDispatch.fixSort}
				</td>
				<shiro:hasPermission name="produces:carsDispatch:edit"><td>
    				<a href="${ctx}/produces/carsDispatch/form?id=${carsDispatch.id}">修改</a>
					<a href="${ctx}/produces/carsDispatch/delete?id=${carsDispatch.id}" onclick="return confirmx('确认要删除该车辆调度吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>