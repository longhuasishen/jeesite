<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>财务应收期初余额管理</title>
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
		<li class="active"><a href="${ctx}/financedoc/docFinanceInitbalance/">财务应收期初余额列表</a></li>
		<shiro:hasPermission name="financedoc:docFinanceInitbalance:edit"><li><a href="${ctx}/financedoc/docFinanceInitbalance/form">财务应收期初余额添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="docFinanceInitbalance" action="${ctx}/financedoc/docFinanceInitbalance/" method="post" class="breadcrumb form-search">
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
				<th>客户编码</th>
				<th>客户名称</th>
				<th>工程名称</th>
				<th>客户简称</th>
				<th>借方余额</th>
				<th>贷方余额</th>
				<th>摘要</th>
				<shiro:hasPermission name="financedoc:docFinanceInitbalance:edit"><th>操作</th></shiro:hasPermission>
			</tr>
			</thead>
			<tbody>
			<c:forEach items="${page.list}" var="docFinanceInitbalance">
			<tr>
				<td>
						${fns:abbr(docFinanceInitbalance.docCustomer.cusCode,50)}
				</td>
				<td>
						${fns:abbr(docFinanceInitbalance.docCustomer.cusName,50)}
				</td>
				<td>
						${fns:abbr(docFinanceInitbalance.docCustomer.cusProject,50)}
				</td>
				<td>
						${fns:abbr(docFinanceInitbalance.docCustomer.cusShortName,50)}
				</td>
				<td>
						${fns:abbr(docFinanceInitbalance.debitBalance,50)}
				</td>
				<td>
						${fns:abbr(docFinanceInitbalance.creditBalance,50)}
				</td>
				<td>
						${fns:abbr(docFinanceInitbalance.remark,50)}
				</td>
				<shiro:hasPermission name="financedoc:docFinanceInitbalance:edit"><td>
    				<a href="${ctx}/financedoc/docFinanceInitbalance/form?id=${docFinanceInitbalance.id}">修改</a>
					<a href="${ctx}/financedoc/docFinanceInitbalance/delete?id=${docFinanceInitbalance.id}" onclick="return confirmx('确认要删除该财务应收期初余额吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>