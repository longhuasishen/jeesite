<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>品种档案管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#contentTable tr").on("mouseenter",function () {
                $(this).css("cursor","pointer");
            })
		});
		function page(n,s){
			$("#pageNo").val(n);
			$("#pageSize").val(s);
			$("#searchForm").submit();
        	return false;
        }
        function getTableRowData(obj) {
			var tds = $(obj).find("td");
			$("#svalue").val($(tds[0]).text());
			$("#nvalue").val($(tds[1]).text());
			$("#lvalue").val($(tds[2]).text());
			$("#uvalue").val($(tds[4]).text());
//			alert(contractCode);
			$(obj).css("background","yellow");
			$(obj).parent().find("tr").each(function(){
			   if(parseInt(this.rowIndex,10) != parseInt(obj.rowIndex,10)){
                   $(this).css("background","");
			   }
			});
        }
	</script>
</head>
<body>
	<input type="text" value="" hidden="hidden" id="svalue" style="display: none;"/>
	<input type="text" value="" hidden="hidden" id="nvalue" style="display: none;"/>
	<input type="text" value="" hidden="hidden" id="lvalue" style="display: none;"/>
	<input type="text" value="" hidden="hidden" id="uvalue" style="display: none;"/>
	<table id="contentTable" class="table table-bordered table-condensed">
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