<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>普通物资档案管理</title>
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
	<li class="active"><a href="${ctx}/doc/docNormaterial/">普通物资档案列表</a></li>
	<shiro:hasPermission name="doc:docNormaterial:edit"><li><a href="${ctx}/doc/docNormaterial/form">普通物资档案添加</a></li></shiro:hasPermission>
</ul>
<form:form id="searchForm" modelAttribute="docNormaterial" action="${ctx}/doc/docNormaterial/" method="post" class="breadcrumb form-search">
	<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
	<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
	<ul class="ul-form">
		<li><label>品种编码：</label>
			<form:input path="kindCode" htmlEscape="false" maxlength="200" class="input-medium"/>
		</li>
		<li><label>品种名称：</label>
			<form:input path="kindName" htmlEscape="false" maxlength="200" class="input-medium"/>
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
		<%--<th>标准名称</th>--%>
		<%--<th>所属分类</th>--%>
		<th>原材料类型</th>
		<th>主记量单位</th>
		<th>辅记量单位</th>
		<th>材质等级</th>
		<%--<th>换算率</th>--%>
		<%--<th>主要供应商</th>--%>
		<%--<th>计价方式</th>--%>
		<%--<th>品牌名称</th>--%>
		<%--<th>销售</th>--%>
		<%--<th>外购</th>--%>
		<%--<th>自制</th>--%>
		<%--<th>应税劳务</th>--%>
		<%--<th>成套件</th>--%>
		<%--<th>砂浆</th>--%>
		<%--<th>最低库存</th>--%>
		<th>成本参考核算单价</th>
		<%--<th>最高存库</th>--%>
		<th>配方上下限控制</th>
		<%--<th>安全库存</th>--%>
		<%--<th>安全库存</th>--%>
		<%--<th>ABC分类</th>--%>
		<%--<th>税率</th>--%>
		<%--<th>保质期管理</th>--%>
		<%--<th>批次管理</th>--%>
		<%--<th>委托代锁管理</th>--%>
		<%--<th>呆滞积压管理</th>--%>
		<shiro:hasPermission name="doc:docNormaterial:edit"><th>操作</th></shiro:hasPermission>
	</tr>
	</thead>
	<tbody>
	<c:forEach items="${page.list}" var="docNormaterial">
		<tr>
			<td> ${fns:abbr(docNormaterial.kindCode,16)}</td>
			<td> ${fns:abbr(docNormaterial.kindName,120)}</td>
			<%--<td> ${fns:abbr(docNormaterial.standName,120)}</td>--%>
			<%--<td> ${fns:abbr(docNormaterial.archiveMaterial.materialName,60)}</td>--%>
			<td> ${fns:abbr(docNormaterial.docConcretetyp.concretetypName,60)}</td>
			<td> ${fns:abbr(docNormaterial.firstUnit,60)}</td>
			<td> ${fns:abbr(docNormaterial.secUnit,20)}</td>
			<td> ${fns:abbr(docNormaterial.kindLevel,60)}</td>
			<%--<td> ${fns:abbr(docNormaterial.rate,12)}</td>--%>
			<%--<td> ${fns:abbr(docNormaterial.docSupplier.supName,240)}</td>--%>
			<%--<td> ${fns:getDictLabel(docNormaterial.pricingMode,"pricing_method","")}</td>--%>
			<%--<td> ${fns:abbr(docNormaterial.brandName,120)}</td>--%>
			<%--<td> ${fns:abbr(docNormaterial.sales,100)}</td>--%>
			<%--<td> ${fns:abbr(docNormaterial.outsourcing,100)}</td>--%>
			<%--<td> ${fns:abbr(docNormaterial.madSelf,100)}</td>--%>
			<%--<td> ${fns:abbr(docNormaterial.taxService,100)}</td>--%>
			<%--<td> ${fns:abbr(docNormaterial.compSet,100)}</td>--%>
			<%--<td> ${fns:abbr(docNormaterial.mortar,100)}</td>--%>
			<%--<td> ${fns:abbr(docNormaterial.minInventory,100)}</td>--%>
			<td> ${fns:abbr(docNormaterial.costPrices,100)}</td>
			<%--<td> ${fns:abbr(docNormaterial.maxInventory,100)}</td>--%>
			<td> ${fns:abbr(docNormaterial.sumControl,100)}</td>
			<%--<td> ${fns:abbr(docNormaterial.saveInventory,100)}</td>--%>
			<%--<td> ${fns:abbr(docNormaterial.stockStand,100)}</td>--%>
			<%--<td> ${fns:getDictLabel(docNormaterial.abcCategory,"abcCategory_list","")}</td>--%>
			<%--<td> ${fns:abbr(docNormaterial.taxRate,100)}</td>--%>
			<%--<td> ${fns:abbr(docNormaterial.qualityManage,100)}</td>--%>
			<%--<td> ${fns:abbr(docNormaterial.batManage,100)}</td>--%>
			<%--<td> ${fns:abbr(docNormaterial.entrustManage,100)}</td>--%>
			<%--<td> ${fns:abbr(docNormaterial.stockManage,100)}</td>--%>
			<shiro:hasPermission name="doc:docNormaterial:edit"><td>
				<a href="${ctx}/doc/docNormaterial/form?id=${docNormaterial.id}">修改</a>
				<a href="${ctx}/doc/docNormaterial/delete?id=${docNormaterial.id}" onclick="return confirmx('确认要删除该普通物资档案吗？', this.href)">删除</a>
			</td></shiro:hasPermission>
		</tr>
	</c:forEach>
	</tbody>
</table>
<div class="pagination">${page}</div>
</body>
</html>