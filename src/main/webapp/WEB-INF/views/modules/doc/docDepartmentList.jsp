<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>部门档案管理</title>
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
		<li class="active"><a href="${ctx}/doc/docDepartment/">部门档案列表</a></li>
		<shiro:hasPermission name="doc:docDepartment:edit"><li><a href="${ctx}/doc/docDepartment/form">部门档案添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="docDepartment" action="${ctx}/doc/docDepartment/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>部门编码：</label>
				<form:input path="departmentCode" htmlEscape="false" maxlength="200" class="input-medium"/>
			</li>
			<li><label>部门名称：</label>
				<form:input path="departmentName" htmlEscape="false" maxlength="200" class="input-medium"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>部门编码</th>
				<th>部门名称</th>
				<th>所属分类</th>
				<th>负责人</th>
				<th>联系电话</th>
				<th>地址</th>
				<th>备注</th>
				<shiro:hasPermission name="doc:docDepartment:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="docDepartment">
			<tr>
				<td>
						${fns:abbr(docDepartment.departmentCode,50)}
				</td>
				<td>
						${fns:abbr(docDepartment.departmentName,50)}
				</td>
				<td>
						${fns:abbr(docDepartment.archiveDepartment.departmentName,50)}
				</td>
				<td>
						${fns:abbr(docDepartment.managerPerson,50)}
				</td>
				<td>
						${fns:abbr(docDepartment.phoneNo,50)}
				</td>
				<td>
						${fns:abbr(docDepartment.firstUnit,50)}
				</td>
				<td>
						${fns:abbr(docDepartment.comment,50)}
				</td>
				<shiro:hasPermission name="doc:docDepartment:edit"><td>
    				<a href="${ctx}/doc/docDepartment/form?id=${docDepartment.id}">修改</a>
					<a href="${ctx}/doc/docDepartment/delete?id=${docDepartment.id}" onclick="return confirmx('确认要删除该部门档案吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>