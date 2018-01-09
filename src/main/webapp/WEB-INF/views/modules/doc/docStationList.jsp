<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>搅拌站档案管理</title>
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
		<li class="active"><a href="${ctx}/doc/docStation/">搅拌站档案列表</a></li>
		<shiro:hasPermission name="doc:docStation:edit"><li><a href="${ctx}/doc/docStation/form">搅拌站档案添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="docStation" action="${ctx}/doc/docStation/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>搅拌站编码：</label>
				<form:input path="stationCode" htmlEscape="false" maxlength="200" class="input-medium"/>
			</li>
			<li><label>搅拌站名称：</label>
				<form:input path="stationName" htmlEscape="false" maxlength="200" class="input-medium"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>搅拌站编码</th>
				<th>搅拌站名称</th>
				<th>仓库名称</th>
				<shiro:hasPermission name="doc:docStation:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="docStation">
			<tr>
				<td>
						${fns:abbr(docStation.stationCode,50)}
				</td>
				<td>
						${fns:abbr(docStation.stationName,50)}
				</td>
				<td>
						${fns:abbr(docStation.docRepertory.repertoryName,50)}
				</td>
				<shiro:hasPermission name="doc:docStation:edit"><td>
    				<a href="${ctx}/doc/docStation/form?id=${docStation.id}">修改</a>
					<a href="${ctx}/doc/docStation/delete?id=${docStation.id}" onclick="return confirmx('确认要删除该搅拌站档案吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>