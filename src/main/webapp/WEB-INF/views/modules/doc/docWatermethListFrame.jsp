<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>浇灌方式档案</title>
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
	<form:form id="searchForm" modelAttribute="docWatermeth" action="${ctx}/doc/docWatermeth/listFrame" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<%--<ul class="ul-form">
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>--%>
	</form:form>
	<table id="contentTable" class="table table-bordered table-condensed">
		<thead>
		<tr>
			<th>浇灌方式编码</th>
			<th>浇灌方式名称</th>
			<shiro:hasPermission name="doc:docWatermeth:edit"><th>操作</th></shiro:hasPermission>
		</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="docWatermeth">
			<tr onclick="getTableRowData(this)">
				<td>${docWatermeth.watermethCode}</td>
				<td>${docWatermeth.watermethName}</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>