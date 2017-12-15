<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>泵档案管理</title>
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
		<li class="active"><a href="${ctx}/doc/docPump/">泵档案列表</a></li>
		<shiro:hasPermission name="doc:docPump:edit"><li><a href="${ctx}/doc/docPump/form">泵档案添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="docPump" action="${ctx}/doc/docPump/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>泵编码：</label>
				<form:input path="pumpCode" htmlEscape="false" maxlength="200" class="input-medium"/>
			</li>
			<li><label>泵名称：</label>
				<form:input path="pumpName" htmlEscape="false" maxlength="200" class="input-medium"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>泵编码</th>
				<th>泵名称</th>
				<shiro:hasPermission name="doc:docPump:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="docPump">
			<tr>
				<td>
						${fns:abbr(docPump.pumpCode,50)}
				</td>
				<td>
						${fns:abbr(docPump.pumpName,50)}
				</td>
				<shiro:hasPermission name="doc:docPump:edit"><td>
    				<a href="${ctx}/doc/docPump/form?id=${docPump.id}">修改</a>
					<a href="${ctx}/doc/docPump/delete?id=${docPump.id}" onclick="return confirmx('确认要删除该泵档案吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>