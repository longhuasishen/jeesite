<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>品种档案管理</title>
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
        function getTableRowData(obj) {
			var contractCode = $(obj).find("td:first").text();
			$("#svalue").val(contractCode);
			alert(contractCode);
			$(obj).css("background","yellow");
        }
	</script>
</head>
<body>
	<input type="text" value="" hidden="hidden" id="svalue" style="display: none;"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
		<tr>
			<th>品种编码</th>
			<th>品种名称</th>
			<th>规格型号</th>
			<th>标准名称</th>
			<th>主计量单位</th>
			<shiro:hasPermission name="doc:docKind:edit"><th>操作</th></shiro:hasPermission>
		</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="docKind">
			<tr onclick="getTableRowData(this)">
				<td>${docKind.kindCode}</td>
				<td>${docKind.kindName}</td>
				<td>${docKind.kindLevel}</td>
				<td>${docKind.standName}</td>
				<td>${docKind.firstUnit}</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>