<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>供应商分类管理</title>
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
		<li class="active"><a href="${ctx}/archive/archiveSupplier/">供应商分类列表</a></li>
		<shiro:hasPermission name="archive:archiveSupplier:edit"><li><a href="${ctx}/archive/archiveSupplier/form">供应商分类添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="archiveSupplier" action="${ctx}/archive/archiveSupplier/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>分类编码：</label>
				<form:input path="supplierCode" htmlEscape="false" maxlength="200" class="input-medium"/>
			</li>
			<li><label>分类名称：</label>
				<form:input path="supplierName" htmlEscape="false" maxlength="200" class="input-medium"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>供应商分类编码</th>
				<th>供应商分类名称</th>
				<shiro:hasPermission name="archive:archiveSupplier:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="archiveSupplier">
			<tr>
				<td>
						${fns:abbr(archiveSupplier.supplierCode,50)}
				</td>
				<td>
						${fns:abbr(archiveSupplier.supplierName,50)}
				</td>
				<shiro:hasPermission name="archive:archiveSupplier:edit"><td>
    				<a href="${ctx}/archive/archiveSupplier/form?id=${archiveSupplier.id}">修改</a>
					<a href="${ctx}/archive/archiveSupplier/delete?id=${archiveSupplier.id}" onclick="return confirmx('确认要删除该供应商分类吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>