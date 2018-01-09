<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>仓库档案管理</title>
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
		<li class="active"><a href="${ctx}/doc/docRepertory/">仓库档案列表</a></li>
		<shiro:hasPermission name="doc:docRepertory:edit"><li><a href="${ctx}/doc/docRepertory/form">仓库档案添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="docRepertory" action="${ctx}/doc/docRepertory/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>仓库编码：</label>
				<form:input path="repertoryCode" htmlEscape="false" maxlength="200" class="input-medium"/>
			</li>
			<li><label>仓库名称：</label>
				<form:input path="repertoryName" htmlEscape="false" maxlength="200" class="input-medium"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>仓库编码</th>
				<th>仓库名称</th>
				<th>所属分类</th>
				<th>所属部门</th>
				<th>负责人</th>
				<th>电话</th>
				<th>最高存库</th>
				<th>计价方式</th>
				<th>地址</th>
				<th>搅拌站</th>
				<th>备注</th>
				<shiro:hasPermission name="doc:docRepertory:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="docRepertory">
			<tr>
				<td>${fns:abbr(docRepertory.repertoryCode,50)}</td>
				<td>${fns:abbr(docRepertory.repertoryName,50)}</td>
				<td>${fns:abbr(docRepertory.archiveRepertory.repertoryName,50)}</td>
				<td>${fns:abbr(docRepertory.docDepartment.departmentName,50)}</td>
				<td>${fns:abbr(docRepertory.managerPerson,50)}</td>
				<td>${fns:abbr(docRepertory.phoneNo,50)}</td>
				<td>${fns:abbr(docRepertory.maxStock,50)}</td>
				<td>${fns:getDictLabel(docRepertory.pricingMethod,"pricing_method","")}</td>
				<td>${fns:abbr(docRepertory.repertoryAddr,50)}</td>
				<td>${fns:abbr(docRepertory.docStation.stationName,50)}</td>
				<td>${fns:abbr(docRepertory.comment,50)}</td>
				<shiro:hasPermission name="doc:docRepertory:edit"><td>
    				<a href="${ctx}/doc/docRepertory/form?id=${docRepertory.id}">修改</a>
					<a href="${ctx}/doc/docRepertory/delete?id=${docRepertory.id}" onclick="return confirmx('确认要删除该仓库档案吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>