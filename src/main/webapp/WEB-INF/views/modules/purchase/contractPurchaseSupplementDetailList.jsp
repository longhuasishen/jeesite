<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>采购合同补充协议明细管理</title>
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
		<li class="active"><a href="${ctx}/purchase/contractPurchaseSupplementDetail/">采购合同补充协议明细列表</a></li>
		<shiro:hasPermission name="purchase:contractPurchaseSupplementDetail:edit"><li><a href="${ctx}/purchase/contractPurchaseSupplementDetail/form">采购合同补充协议明细添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="contractPurchaseSupplementDetail" action="${ctx}/purchase/contractPurchaseSupplementDetail/" method="post" class="breadcrumb form-search">
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
				<th>品种编码</th>
				<th>品种名称</th>
				<th>材质等级</th>
				<th>主记量单位</th>
				<th>金额</th>
				<th>数量</th>
				<th>单价</th>
				<th>原始金额</th>
				<th>原始数量</th>
				<th>原始单价</th>
				<th>折算比</th>
				<th>扣称比例</th>
				<th>是否完成</th>
				<th>备注</th>
				<shiro:hasPermission name="purchase:contractPurchaseSupplementDetail:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="contractPurchaseSupplementDetail">
			<tr>
				<td><a href="${ctx}/purchase/contractPurchaseSupplementDetail/form?id=${contractPurchaseSupplementDetail.id}">
					${contractPurchaseSupplementDetail.contractCode}
				</a></td>
				<td>
					${contractPurchaseSupplementDetail.kindCode}
				</td>
				<td>
					${contractPurchaseSupplementDetail.kindName}
				</td>
				<td>
					${contractPurchaseSupplementDetail.kindLevel}
				</td>
				<td>
					${contractPurchaseSupplementDetail.firstUnit}
				</td>
				<td>
					${contractPurchaseSupplementDetail.itemAmount}
				</td>
				<td>
					${contractPurchaseSupplementDetail.itemNumber}
				</td>
				<td>
					${contractPurchaseSupplementDetail.itemPrice}
				</td>
				<td>
					${contractPurchaseSupplementDetail.originItemAmount}
				</td>
				<td>
					${contractPurchaseSupplementDetail.originItemNumber}
				</td>
				<td>
					${contractPurchaseSupplementDetail.originItemPrice}
				</td>
				<td>
					${contractPurchaseSupplementDetail.conversionRate}
				</td>
				<td>
					${contractPurchaseSupplementDetail.otherRate}
				</td>
				<td>
					${contractPurchaseSupplementDetail.isComplete}
				</td>
				<td>
					${contractPurchaseSupplementDetail.remark}
				</td>
				<shiro:hasPermission name="purchase:contractPurchaseSupplementDetail:edit"><td>
    				<a href="${ctx}/purchase/contractPurchaseSupplementDetail/form?id=${contractPurchaseSupplementDetail.id}">修改</a>
					<a href="${ctx}/purchase/contractPurchaseSupplementDetail/delete?id=${contractPurchaseSupplementDetail.id}" onclick="return confirmx('确认要删除该采购合同补充协议明细吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>