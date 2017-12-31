<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>采购合同管理</title>
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
		<li class="active"><a href="${ctx}/purchase/contractPurchase/">采购合同列表</a></li>
		<shiro:hasPermission name="purchase:contractPurchase:edit"><li><a href="${ctx}/purchase/contractPurchase/form">采购合同添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="contractPurchase" action="${ctx}/purchase/contractPurchase/" method="post" class="breadcrumb form-search">
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
				<th>合同编号</th>
				<th>供应商编号</th>
				<th>供应商名称</th>
				<th>合同分类</th>
				<th>签订日期</th>
				<th>结算方式</th>
				<th>签订部门</th>
				<th>业务员</th>
				<shiro:hasPermission name="purchase:contractPurchase:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="contractPurchase">
			<tr>
				<td>
						${fns:abbr(contractPurchase.contractCode,50)}
				</td>
				<td>
						${fns:abbr(contractPurchase.docSupplier.supCode,50)}
				</td>
				<td>
						${contractPurchase.docSupplier.supName}
				</td>
				<td>
						${fns:abbr(contractPurchase.archiveContract.contractName,50)}
				</td>
				<td>
						${fns:abbr(contractPurchase.signDate,50)}
				</td>
				<td>
						${fns:abbr(contractPurchase.docAccmeth.accmethName,50)}
				</td>
				<td>
						${fns:abbr(contractPurchase.docDepartment.departmentName,50)}
				</td>
				<td>
						${fns:abbr(contractPurchase.docOfficework.officeworkName,50)}
				</td>
				<shiro:hasPermission name="purchase:contractPurchase:edit"><td>
    				<a href="${ctx}/purchase/contractPurchase/form?id=${contractPurchase.id}">修改</a>
					<a href="${ctx}/purchase/contractPurchase/delete?id=${contractPurchase.id}" onclick="return confirmx('确认要删除该采购合同吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>