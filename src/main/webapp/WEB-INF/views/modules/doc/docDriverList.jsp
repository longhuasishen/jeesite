<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>司机档案管理</title>
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
		<li class="active"><a href="${ctx}/doc/docDriver/">司机档案列表</a></li>
		<shiro:hasPermission name="doc:docDriver:edit"><li><a href="${ctx}/doc/docDriver/form">司机档案添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="docDriver" action="${ctx}/doc/docDriver/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>司机编码：</label>
				<form:input path="driverCode" htmlEscape="false" maxlength="200" class="input-medium"/>
			</li>
			<li><label>司机名称：</label>
				<form:input path="driverName" htmlEscape="false" maxlength="200" class="input-medium"/>
			</li>
			<li><label>车牌号码：</label>
				<form:input path="carNo" htmlEscape="false" maxlength="200" class="input-medium"/>
			</li>
			<li><label>驾驶证号码：</label>
				<form:input path="licenceNo" htmlEscape="false" maxlength="200" class="input-medium"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>司机编码</th>
				<th>司机名称</th>
				<th>车牌号码</th>
				<th>驾驶证号码</th>
				<shiro:hasPermission name="doc:docDriver:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="docDriver">
			<tr>
				<td>
						${fns:abbr(docDriver.docOfficework.officeworkCode,50)}
				</td>
				<td>
						${fns:abbr(docDriver.driverName,50)}
				</td>
				<td>
						${fns:abbr(docDriver.docCar.carNo,50)}
				</td>
				<td>
						${fns:abbr(docDriver.licenceNo,50)}
				</td>
				<shiro:hasPermission name="doc:docDriver:edit"><td>
    				<a href="${ctx}/doc/docDriver/form?id=${docDriver.id}">修改</a>
					<a href="${ctx}/doc/docDriver/delete?id=${docDriver.id}" onclick="return confirmx('确认要删除该司机档案吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>