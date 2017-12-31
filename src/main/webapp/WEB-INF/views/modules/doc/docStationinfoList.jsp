<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>搅拌站点信息管理</title>
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
		<li class="active"><a href="${ctx}/doc/docStationinfo/">搅拌站点信息列表</a></li>
		<shiro:hasPermission name="doc:docStationinfo:edit"><li><a href="${ctx}/doc/docStationinfo/form">搅拌站点信息添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="docStationinfo" action="${ctx}/doc/docStationinfo/" method="post" class="breadcrumb form-search">
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
			<th>搅拌站号</th>
			<th>搅拌站名称</th>
			<th>数据库类型</th>
			<th>数据库名称</th>
			<th>服务器</th>
			<th>数据库路径</th>
			<th>配方主键</th>
			<th>任务主键</th>
			<th>配方SQL</th>
			<th>工地任务SQL</th>
			<th>ERP配方SQL</th>
			<th>ERP任务SQL</th>
			<shiro:hasPermission name="doc:docStationinfo:edit"><th>操作</th></shiro:hasPermission>
		</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="docStationinfo">
			<tr>
				<td>
						${fns:abbr(docStationinfo.docStation.stationCode,50)}
				</td>
				<td>
						${fns:abbr(docStationinfo.docStation.stationName,50)}
				</td>
				<td>
						${fns:getDictLabel(docStationinfo.stationDbType,'station_db_type',"")}
				</td>
				<td>
						${fns:abbr(docStationinfo.stationDbName,50)}
				</td>
				<td>
						${fns:abbr(docStationinfo.stationDbIp,50)}
				</td>
				<td>
						${fns:abbr(docStationinfo.stationDbTask,50)}
				</td>
				<td>
						${fns:abbr(docStationinfo.prescriptionId,50)}
				</td>
				<td>
						${fns:abbr(docStationinfo.taskId,50)}
				</td>
				<td>
						${fns:abbr(docStationinfo.prescriptionSql,50)}
				</td>
				<td>
						${fns:abbr(docStationinfo.taskSql,50)}
				</td>
				<td>
						${fns:abbr(docStationinfo.prescriptionSqlErp,50)}
				</td>
				<td>
						${fns:abbr(docStationinfo.taskSqlErp,50)}
				</td>
				<shiro:hasPermission name="doc:docStationinfo:edit"><td>
    				<a href="${ctx}/doc/docStationinfo/form?id=${docStationinfo.id}">修改</a>
					<a href="${ctx}/doc/docStationinfo/delete?id=${docStationinfo.id}" onclick="return confirmx('确认要删除该搅拌站点信息吗？', this.href)">删除</a>
					<a href="${ctx}/doc/docStationinfo/formDetail?id=${docStationinfo.id}">连接</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>