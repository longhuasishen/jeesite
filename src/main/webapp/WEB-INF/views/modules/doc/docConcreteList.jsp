<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>原材料档案管理</title>
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
		<li class="active"><a href="${ctx}/doc/docConcrete/">原材料档案列表</a></li>
		<shiro:hasPermission name="doc:docConcrete:edit"><li><a href="${ctx}/doc/docConcrete/form">原材料档案添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="docConcrete" action="${ctx}/doc/docConcrete/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>品种编码：</label>
				<form:input path="kindCode" htmlEscape="false" maxlength="200" class="input-medium"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>品种编码</th>
				<th>品种名称</th>
				<th>材质等级</th>
				<th>标准名称</th>
				<th>所属分类</th>
				<th>原材料类型</th>
				<th>辅记量单位</th>
				<th>主记量单位</th>
				<th>换算率</th>
				<th>主要供应商</th>
				<th>计价方式</th>
				<th>品牌名称</th>
				<th>销售</th>
				<th>外购</th>
				<th>自制</th>
				<th>应税劳务</th>
				<th>成套件</th>
				<th>砂浆</th>
				<th>最低库存</th>
				<th>成本参考核算单价</th>
				<th>最高存库</th>
				<th>配方上下限控制</th>
				<th>安全库存</th>
				<th>安全库存</th>
				<th>ABC分类</th>
				<th>税率</th>
				<th>保质期管理</th>
				<th>批次管理</th>
				<th>委托代锁管理</th>
				<th>呆滞积压管理</th>
				<shiro:hasPermission name="doc:docConcrete:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="docConcrete">
			<tr>
				<td> ${fns:abbr(docConcrete.kindCode,16)}</td>
				<td> ${fns:abbr(docConcrete.kindName,120)}</td>
				<td> ${fns:abbr(docConcrete.kindLevel,60)}</td>
				<td> ${fns:abbr(docConcrete.standName,120)}</td>
				<td> ${fns:abbr(docConcrete.kindCategory,60)}</td>
				<td> ${fns:abbr(docConcrete.kindType,60)}</td>
				<td> ${fns:abbr(docConcrete.secUnit,20)}</td>
				<td> ${fns:abbr(docConcrete.firstUnit,60)}</td>
				<td> ${fns:abbr(docConcrete.rate,12)}</td>
				<td> ${fns:abbr(docConcrete.primaryProvider,240)}</td>
				<td> ${fns:abbr(docConcrete.pricingMode,32)}</td>
				<td> ${fns:abbr(docConcrete.brandName,120)}</td>
				<td> ${fns:abbr(docConcrete.sales,1)}</td>
				<td> ${fns:abbr(docConcrete.outsourcing,1)}</td>
				<td> ${fns:abbr(docConcrete.madSelf,1)}</td>
				<td> ${fns:abbr(docConcrete.taxService,1)}</td>
				<td> ${fns:abbr(docConcrete.compSet,1)}</td>
				<td> ${fns:abbr(docConcrete.mortar,1)}</td>
				<td> ${fns:abbr(docConcrete.minInventory,1)}</td>
				<td> ${fns:abbr(docConcrete.costPrices,1)}</td>
				<td> ${fns:abbr(docConcrete.maxInventory,1)}</td>
				<td> ${fns:abbr(docConcrete.sumControl,1)}</td>
				<td> ${fns:abbr(docConcrete.saveInventory,1)}</td>
				<td> ${fns:abbr(docConcrete.stockStand,1)}</td>
				<td> ${fns:abbr(docConcrete.abcCategory,1)}</td>
				<td> ${fns:abbr(docConcrete.taxRate,1)}</td>
				<td> ${fns:abbr(docConcrete.qualityManage,1)}</td>
				<td> ${fns:abbr(docConcrete.batManage,1)}</td>
				<td> ${fns:abbr(docConcrete.entrustManage,1)}</td>
				<td> ${fns:abbr(docConcrete.stockManage,1)}</td>
				<shiro:hasPermission name="doc:docConcrete:edit"><td>
    				<a href="${ctx}/doc/docConcrete/form?id=${docConcrete.id}">修改</a>
					<a href="${ctx}/doc/docConcrete/delete?id=${docConcrete.id}" onclick="return confirmx('确认要删除该原材料档案吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>