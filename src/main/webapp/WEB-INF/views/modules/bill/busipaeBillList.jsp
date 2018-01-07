<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>业务应收调账单管理</title>
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
		<li class="active"><a href="${ctx}/bill/busipaeBill/">业务应收调账单列表</a></li>
		<shiro:hasPermission name="bill:busipaeBill:edit"><li><a href="${ctx}/bill/busipaeBill/form">业务应收调账单添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="busipaeBill" action="${ctx}/bill/busipaeBill/" method="post" class="breadcrumb form-search">
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
				<shiro:hasPermission name="bill:busipaeBill:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="busipaeBill">
			<tr>
				<shiro:hasPermission name="bill:busipaeBill:edit"><td>
    				<a href="${ctx}/bill/busipaeBill/form?id=${busipaeBill.id}">修改</a>
					<a href="${ctx}/bill/busipaeBill/delete?id=${busipaeBill.id}" onclick="return confirmx('确认要删除该业务应收调账单吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>