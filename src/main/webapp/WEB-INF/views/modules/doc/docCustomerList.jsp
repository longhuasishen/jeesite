<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>客户档案管理</title>
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
		<li class="active"><a href="${ctx}/doc/docCustomer/">客户档案列表</a></li>
		<shiro:hasPermission name="doc:docCustomer:edit"><li><a href="${ctx}/doc/docCustomer/form">客户档案添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="docCustomer" action="${ctx}/doc/docCustomer/" method="post" class="breadcrumb form-search">
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
				<th>客户编码</th>
				<th>客户名称</th>
				<th>建设单位</th>
				<th>工程名称</th>
				<th>客户简称</th>
				<th>客户分类</th>
				<shiro:hasPermission name="doc:docCustomer:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="docCustomer">
			<tr>
				<td>
						${fns:abbr(docCustomer.cusCode,50)}
				</td>
				<td>
						${fns:abbr(docCustomer.cusName,50)}
				</td>
				<td>
						${fns:abbr(docCustomer.cusOrg,50)}
				</td>
				<td>
						${fns:abbr(docCustomer.cusProject,50)}
				</td>
				<td>
						${fns:abbr(docCustomer.cusShortName,50)}
				</td>
				<td>
						${fns:abbr(docCustomer.archiveCustom.customName,50)}
				</td>
				<shiro:hasPermission name="doc:docCustomer:edit"><td>
    				<a href="${ctx}/doc/docCustomer/form?id=${docCustomer.id}">修改</a>
					<a href="${ctx}/doc/docCustomer/delete?id=${docCustomer.id}" onclick="return confirmx('确认要删除该客户档案吗？', this.href)">删除</a>
					<a href="${ctx}/doc/docCustomer/formDetail?id=${docCustomer.id}">详情</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>