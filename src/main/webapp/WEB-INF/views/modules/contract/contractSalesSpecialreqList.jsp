<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>销售合同特殊方法单价管理</title>
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
		<li class="active"><a href="${ctx}/contract/contractSalesSpecialreq/">销售合同特殊方法单价列表</a></li>
		<shiro:hasPermission name="contract:contractSalesSpecialreq:edit"><li><a href="${ctx}/contract/contractSalesSpecialreq/form">销售合同特殊方法单价添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="contractSalesSpecialreq" action="${ctx}/contract/contractSalesSpecialreq/" method="post" class="breadcrumb form-search">
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
				<shiro:hasPermission name="contract:contractSalesSpecialreq:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="contractSalesSpecialreq">
			<tr>
				<shiro:hasPermission name="contract:contractSalesSpecialreq:edit"><td>
    				<a href="${ctx}/contract/contractSalesSpecialreq/form?id=${contractSalesSpecialreq.id}">修改</a>
					<a href="${ctx}/contract/contractSalesSpecialreq/delete?id=${contractSalesSpecialreq.id}" onclick="return confirmx('确认要删除该销售合同特殊方法单价吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>