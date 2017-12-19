<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>期初入库管理</title>
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
		<li class="active"><a href="${ctx}/financedoc/docInitStorageMain/">期初入库列表</a></li>
		<shiro:hasPermission name="financedoc:docInitStorageMain:edit"><li><a href="${ctx}/financedoc/docInitStorageMain/form">期初入库添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="docInitStorageMain" action="${ctx}/financedoc/docInitStorageMain/" method="post" class="breadcrumb form-search">
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
			<th>单据编号</th>
			<th>入库单号</th>
			<th>入库日期</th>
			<th>入库部门</th>
			<th>入库仓库</th>
			<th>红蓝标志</th>
			<th>审核状态</th>
			<th>入库类型</th>
			<th>制单人</th>
			<th>审核人</th>
			<th>经手人</th>
			<th>制单日期</th>
			<th>审核日期</th>
			<shiro:hasPermission name="financedoc:docInitStorageMain:edit"><th>操作</th></shiro:hasPermission>
		</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="docInitStorageMain">
			<tr>
				<td>
						${fns:abbr(docInitStorageMain.docCode,50)}
				</td>
				<td>
						${fns:abbr(docInitStorageMain.storageCode,50)}
				</td>
				<td>
						${docInitStorageMain.storageDate}
				</td>
				<td>
						${fns:abbr(docInitStorageMain.docDepartment.departmentName,50)}
				</td>
				<td>
						${fns:abbr(docInitStorageMain.docRepertory.repertoryName,50)}
				</td>
				<td>
						${fns:getDictLabel(docInitStorageMain.storageFlag, 'red_blue_flag', '')}
				</td>
				<td>
						${fns:getDictLabel(docInitStorageMain.storageAuditFlag, 'init_aduit_status', '未审核')}
				</td>
				<td>
						${fns:abbr(docInitStorageMain.storageCreate,50)}
				</td>
				<td>
						${fns:abbr(docInitStorageMain.storageCreate,50)}
				</td>
				<td>
						${fns:abbr(docInitStorageMain.storageHandler,50)}
				</td>
				<td>
						${fns:abbr(docInitStorageMain.storageCreateDate,50)}
				</td>
				<td>
						${fns:abbr(docInitStorageMain.storageCreateDate,50)}
					    <%--<fmt:formatDate value="${docInitStorageMain.storageCreateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>--%>
				</td>
				<td>
						${fns:abbr(docInitStorageMain.storageAuditDate,50)}
				</td>
				<shiro:hasPermission name="financedoc:docInitStorageMain:edit"><td>
    				<a href="${ctx}/financedoc/docInitStorageMain/form?id=${docInitStorageMain.id}">修改</a>
					<a href="${ctx}/financedoc/docInitStorageMain/delete?id=${docInitStorageMain.id}" onclick="return confirmx('确认要删除该期初入库吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>