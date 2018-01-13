<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>工程运距管理管理</title>
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
		<li class="active"><a href="${ctx}/produces/projectDistance/">工程运距管理列表</a></li>
		<shiro:hasPermission name="produces:projectDistance:edit"><li><a href="${ctx}/produces/projectDistance/form">工程运距管理添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="projectDistance" action="${ctx}/produces/projectDistance/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>客户编码：</label>
				<form:input path="customId" htmlEscape="false" maxlength="200" class="input-medium"/>
			</li>
			<li><label>客户名称：</label>
				<form:input path="customName" htmlEscape="false" maxlength="200" class="input-medium"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>客户编码</th>
				<th>客户名称</th>
				<th>客户简称</th>
				<th>客户地址</th>
				<th>指定签收人</th>
				<th>距离</th>
				<th>备注</th>
				<shiro:hasPermission name="produces:projectDistance:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="projectDistance">
			<tr>
				<td> ${fns:abbr(projectDistance.docCustomer.cusCode,50)}</td>
				<td> ${fns:abbr(projectDistance.docCustomer.cusName,50)}</td>
				<td> ${fns:abbr(projectDistance.docCustomer.cusShortName,50)}</td>
				<td> ${fns:abbr(projectDistance.docCustomer.cusAddr,60)}</td>
				<td> ${fns:abbr(projectDistance.docCustomer.receiver,16)}</td>
				<td> ${fns:abbr(projectDistance.docCustomer.distance,20)}</td>
				<td> ${fns:abbr(projectDistance.docCustomer.distanceRmk,200)}</td>
				<shiro:hasPermission name="produces:projectDistance:edit"><td>
    				<a href="${ctx}/produces/projectDistance/form?id=${projectDistance.docCustomer.id}">修改</a>
					<a href="${ctx}/produces/projectDistance/delete?id=${projectDistance.id}" onclick="return confirmx('确认要删除该工程运距管理吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>