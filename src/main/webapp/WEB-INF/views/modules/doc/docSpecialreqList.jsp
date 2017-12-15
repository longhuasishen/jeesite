<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>特殊要求档案管理</title>
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
		<li class="active"><a href="${ctx}/doc/docSpecialreq/">特殊要求档案列表</a></li>
		<shiro:hasPermission name="doc:docSpecialreq:edit"><li><a href="${ctx}/doc/docSpecialreq/form">特殊要求档案添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="docSpecialreq" action="${ctx}/doc/docSpecialreq/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>特殊要求编码：</label>
				<form:input path="specialreqCode" htmlEscape="false" maxlength="200" class="input-medium"/>
			</li>
			<li><label>特殊要求名称：</label>
				<form:input path="specialreqName" htmlEscape="false" maxlength="200" class="input-medium"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>特殊要求编码</th>
				<th>特殊要求名称</th>
				<shiro:hasPermission name="doc:docSpecialreq:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="docSpecialreq">
			<tr>
				<td>
						${fns:abbr(docSpecialreq.specialreqCode,50)}
				</td>
				<td>
						${fns:abbr(docSpecialreq.specialreqName,50)}
				</td>
				<shiro:hasPermission name="doc:docSpecialreq:edit"><td>
    				<a href="${ctx}/doc/docSpecialreq/form?id=${docSpecialreq.id}">修改</a>
					<a href="${ctx}/doc/docSpecialreq/delete?id=${docSpecialreq.id}" onclick="return confirmx('确认要删除该特殊要求档案吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>