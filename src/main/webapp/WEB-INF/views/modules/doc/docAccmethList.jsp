<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>结算方式档案管理</title>
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
		<li class="active"><a href="${ctx}/doc/docAccmeth/">结算方式档案列表</a></li>
		<shiro:hasPermission name="doc:docAccmeth:edit"><li><a href="${ctx}/doc/docAccmeth/form">结算方式档案添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="docAccmeth" action="${ctx}/doc/docAccmeth/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>结算方式编码：</label>
				<form:input path="accmethCode" htmlEscape="false" maxlength="200" class="input-medium"/>
			</li>
			<li><label>结算方式名称：</label>
				<form:input path="accmethName" htmlEscape="false" maxlength="200" class="input-medium"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>结算方式编码</th>
				<th>结算方式名称</th>
				<shiro:hasPermission name="doc:docAccmeth:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="docAccmeth">
			<tr>
				<td>
						${fns:abbr(docAccmeth.accmethCode,50)}
				</td>
				<td>
						${fns:abbr(docAccmeth.accmethName,50)}
				</td>
				<shiro:hasPermission name="doc:docAccmeth:edit"><td>
    				<a href="${ctx}/doc/docAccmeth/form?id=${docAccmeth.id}">修改</a>
					<a href="${ctx}/doc/docAccmeth/delete?id=${docAccmeth.id}" onclick="return confirmx('确认要删除该结算方式档案吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>