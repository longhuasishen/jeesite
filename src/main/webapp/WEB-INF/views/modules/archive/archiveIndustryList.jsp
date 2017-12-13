<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>行业分类管理</title>
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
		<li class="active"><a href="${ctx}/archive/archiveIndustry/">行业分类列表</a></li>
		<shiro:hasPermission name="archive:archiveIndustry:edit"><li><a href="${ctx}/archive/archiveIndustry/form">行业分类添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="archiveIndustry" action="${ctx}/archive/archiveIndustry/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>分类编码：</label>
				<form:input path="industryCode" htmlEscape="false" maxlength="200" class="input-medium"/>
			</li>
			<li><label>分类名称：</label>
				<form:input path="industryName" htmlEscape="false" maxlength="200" class="input-medium"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>行业分类编码</th>
				<th>行业分类名称</th>
				<shiro:hasPermission name="archive:archiveIndustry:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="archiveIndustry">
			<tr>
				<td>
						${fns:abbr(archiveIndustry.industryCode,50)}
				</td>
				<td>
						${fns:abbr(archiveIndustry.industryName,50)}
				</td>
				<shiro:hasPermission name="archive:archiveIndustry:edit"><td>
    				<a href="${ctx}/archive/archiveIndustry/form?id=${archiveIndustry.id}">修改</a>
					<a href="${ctx}/archive/archiveIndustry/delete?id=${archiveIndustry.id}" onclick="return confirmx('确认要删除该行业分类吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>