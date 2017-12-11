<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>合同分类管理</title>
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
		<li class="active"><a href="${ctx}/archive/archiveContract/">合同分类列表</a></li>
		<shiro:hasPermission name="archive:archiveContract:edit"><li><a href="${ctx}/archive/archiveContract/form">合同分类添加</a></li></shiro:hasPermission>
	</ul>
	<%--<form:form id="searchForm" modelAttribute="archiveContract" action="${ctx}/archive/archiveContract/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>--%>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>合同分类编码</th>
				<th>合同分类名称</th>
				<shiro:hasPermission name="archive:archiveContract:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="archiveContract">
			<tr>
				<td>
						${fns:abbr(archiveContract.contractCode,50)}
				</td>
				<td>
						${fns:abbr(archiveContract.contractName,50)}
				</td>
				<shiro:hasPermission name="archive:archiveContract:edit"><td>
    				<a href="${ctx}/archive/archiveContract/form?id=${archiveContract.id}">修改</a>
					<a href="${ctx}/archive/archiveContract/delete?id=${archiveContract.id}" onclick="return confirmx('确认要删除该合同分类吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>