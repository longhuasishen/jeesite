<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>销售合同管理</title>
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
		<li class="active"><a href="${ctx}/contract/contractSales/">销售合同列表</a></li>
		<shiro:hasPermission name="contract:contractSales:edit"><li><a href="${ctx}/contract/contractSales/form">销售合同添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="contractSales" action="${ctx}/contract/contractSales/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>工程名称：</label>
				<form:input path="projectName" htmlEscape="false" maxlength="200" class="input-medium"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>工程名称</th>
				<th>合同编号</th>
				<th>签定日期</th>
				<th>合同单位</th>
				<th>项目地址</th>
				<th>签定部门</th>
				<th>业务员</th>
				<th>客户分类</th>
				<th>砼结算方式</th>
				<th>签定地点</th>
				<shiro:hasPermission name="contract:contractSales:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="contractSales">
			<tr>
				<td> ${fns:abbr(contractSales.docCustomer.cusProject,16)}</td>
				<td> ${fns:abbr(contractSales.contractId,120)}</td>
				<td> ${fns:abbr(contractSales.contractDate,60)}</td>
				<td> ${fns:abbr(contractSales.contractComp,120)}</td>
				<td> ${fns:abbr(contractSales.projectAddr,60)}</td>
				<td> ${fns:abbr(contractSales.docDepartment.departmentName,60)}</td>
				<td> ${fns:abbr(contractSales.docOfficework.officeworkName,16)}</td>
				<td> ${fns:abbr(contractSales.comstemType,120)}</td>
				<td> ${fns:abbr(contractSales.docAccmeth.accmethName,60)}</td>
				<td> ${fns:abbr(contractSales.contractAddr,120)}</td>
				<shiro:hasPermission name="contract:contractSales:edit"><td>
    				<a href="${ctx}/contract/contractSales/form?id=${contractSales.id}">修改</a>
					<a href="${ctx}/contract/contractSales/delete?id=${contractSales.id}" onclick="return confirmx('确认要删除该销售合同吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>