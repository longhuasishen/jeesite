<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>原材料类型档案管理</title>
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
		<li class="active"><a href="${ctx}/doc/docConcretetyp/">原材料类型档案列表</a></li>
		<shiro:hasPermission name="doc:docConcretetyp:edit"><li><a href="${ctx}/doc/docConcretetyp/form">原材料类型档案添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="docConcretetyp" action="${ctx}/doc/docConcretetyp/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>原材料编码：</label>
				<form:input path="concretetypCode" htmlEscape="false" maxlength="200" class="input-medium"/>
			</li>
			<li><label>原材料名称：</label>
				<form:input path="concretetypName" htmlEscape="false" maxlength="200" class="input-medium"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>原材料编码</th>
				<th>原材料名称</th>
				<%--<th>存货名称</th>--%>
				<shiro:hasPermission name="doc:docConcretetyp:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="docConcretetyp">
			<tr>
				<td>
						${fns:abbr(docConcretetyp.concretetypCode,50)}
				</td>
				<td>
						${fns:abbr(docConcretetyp.concretetypName,50)}
				</td>
				<%--<td>--%>
						<%--${fns:abbr(docConcretetyp.archiveMaterial.materialName,50)}--%>
				<%--</td>--%>
				<shiro:hasPermission name="doc:docConcretetyp:edit"><td>
    				<a href="${ctx}/doc/docConcretetyp/form?id=${docConcretetyp.id}">修改</a>
					<a href="${ctx}/doc/docConcretetyp/delete?id=${docConcretetyp.id}" onclick="return confirmx('确认要删除该原材料类型档案吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>