<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>供应商档案管理</title>
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
		<li class="active"><a href="${ctx}/doc/docSupplier/">供应商档案列表</a></li>
		<shiro:hasPermission name="doc:docSupplier:edit"><li><a href="${ctx}/doc/docSupplier/form">供应商档案添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="docSupplier" action="${ctx}/doc/docSupplier/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>供应商编码</th>
				<th>供应商名称</th>
				<th>供应商简称</th>
				<%--<th>供应商分类</th>--%>
				<shiro:hasPermission name="doc:docSupplier:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="docSupplier">
			<tr>
				<td>
						${fns:abbr(docSupplier.supCode,50)}
				</td>
				<td>
						${fns:abbr(docSupplier.supName,50)}
				</td>
				<td>
						${fns:abbr(docSupplier.supShortName,50)}
				</td>
				<%--<td>--%>
						<%--${fns:abbr(docSupplier.archiveSupplier.supplierName,50)}--%>
				<%--</td>--%>
				<shiro:hasPermission name="doc:docSupplier:edit"><td>
    				<a href="${ctx}/doc/docSupplier/form?id=${docSupplier.id}">修改</a>
					<a href="${ctx}/doc/docSupplier/delete?id=${docSupplier.id}" onclick="return confirmx('确认要删除该供应商档案吗？', this.href)">删除</a>
					<a href="${ctx}/doc/docSupplier/formDetail?id=${docSupplier.id}">详情</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>