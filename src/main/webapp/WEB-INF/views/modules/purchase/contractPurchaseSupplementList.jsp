<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>采购合同补充协议表管理</title>
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
		<li class="active"><a href="${ctx}/purchase/contractPurchaseSupplement/">采购合同补充协议表列表</a></li>
		<shiro:hasPermission name="purchase:contractPurchaseSupplement:edit"><li><a href="${ctx}/purchase/contractPurchaseSupplement/form">采购合同补充协议表添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="contractPurchaseSupplement" action="${ctx}/purchase/contractPurchaseSupplement/" method="post" class="breadcrumb form-search">
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
				<th>供应商编码</th>
				<th>供应商名称</th>
				<th>签订日期</th>
				<th>签订地点</th>
				<th>有效期起始</th>
				<th>有效期结束</th>
				<th>结算方式名称</th>
				<th>制单人</th>
				<th>制单日期</th>
				<th>审核人</th>
				<th>审核日期</th>
				<th>作废人</th>
				<th>作废日期</th>
				<th>备注</th>
				<shiro:hasPermission name="purchase:contractPurchaseSupplement:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="contractPurchaseSupplement">
			<tr>
				<td><a href="${ctx}/purchase/contractPurchaseSupplement/form?id=${contractPurchaseSupplement.id}">
					${contractPurchaseSupplement.contractCode}
				</a></td>
				<td>
						${fns:abbr(contractPurchase.docSupplier.supCode,50)}
				</td>
				<td>
						${contractPurchase.docSupplier.supName}
				</td>
				<td>
					${contractPurchaseSupplement.signDate}
				</td>
				<td>
					${contractPurchaseSupplement.signPlace}
				</td>
				<td>
					${contractPurchaseSupplement.periodStart}
				</td>
				<td>
					${contractPurchaseSupplement.periodEnd}
				</td>

				<td>
					${contractPurchaseSupplement.docAccmeth.accmethName}
				</td>
				<td>
					${contractPurchaseSupplement.contraceCreate}
				</td>
				<td>
					${contractPurchaseSupplement.contractCreateDate}
				</td>
				<td>
					${contractPurchaseSupplement.contractAuditor}
				</td>
				<td>
					${contractPurchaseSupplement.contractAuditDate}
				</td>
				<td>
					${contractPurchaseSupplement.contractCancel}
				</td>
				<td>
					${contractPurchaseSupplement.contractCancelDate}
				</td>
				<td>
					${contractPurchaseSupplement.remark}
				</td>
				<shiro:hasPermission name="purchase:contractPurchaseSupplement:edit"><td>
    				<a href="${ctx}/purchase/contractPurchaseSupplement/form?id=${contractPurchaseSupplement.id}">修改</a>
					<a href="${ctx}/purchase/contractPurchaseSupplement/delete?id=${contractPurchaseSupplement.id}" onclick="return confirmx('确认要删除该采购合同补充协议表吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>