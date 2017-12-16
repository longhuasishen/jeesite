<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>业务应付期初余额管理</title>
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
		<li class="active"><a href="${ctx}/financedoc/docBusinessInitpay/">业务应付期初余额列表</a></li>
		<shiro:hasPermission name="financedoc:docBusinessInitpay:edit"><li><a href="${ctx}/financedoc/docBusinessInitpay/form">业务应付期初余额添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="docBusinessInitpay" action="${ctx}/financedoc/docBusinessInitpay/" method="post" class="breadcrumb form-search">
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
				<th>供应商编码</th>
				<th>供应商名称</th>
				<th>供应商简称</th>
				<th>借方余额</th>
				<th>贷方余额</th>
				<th>摘要</th>
				<shiro:hasPermission name="financedoc:docBusinessInitpay:edit"><th>操作</th></shiro:hasPermission>
			</tr>
			</thead>
			<tbody>
			<c:forEach items="${page.list}" var="docBusinessInitpay">
			<tr>
				<td>
						${fns:abbr(docBusinessInitpay.docSupplier.supCode,50)}
				</td>
				<td>
						${fns:abbr(docBusinessInitpay.docSupplier.supName,50)}
				</td>
				<td>
						${fns:abbr(docBusinessInitpay.docSupplier.supShortName,50)}
				</td>
				<td>
						${fns:abbr(docBusinessInitpay.debitBalance,50)}
				</td>
				<td>
						${fns:abbr(docBusinessInitpay.creditBalance,50)}
				</td>
				<td>
						${fns:abbr(docBusinessInitpay.remark,50)}
				</td>
				<shiro:hasPermission name="financedoc:docBusinessInitpay:edit"><td>
    				<a href="${ctx}/financedoc/docBusinessInitpay/form?id=${docBusinessInitpay.id}">修改</a>
					<a href="${ctx}/financedoc/docBusinessInitpay/delete?id=${docBusinessInitpay.id}" onclick="return confirmx('确认要删除该业务应付期初余额吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>