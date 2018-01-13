<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>业务应付调账单管理</title>
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
		<li class="active"><a href="${ctx}/bill/busipayBill/">业务应付调账单列表</a></li>
		<shiro:hasPermission name="bill:busipayBill:edit"><li><a href="${ctx}/bill/busipayBill/form">业务应付调账单添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="busipayBill" action="${ctx}/bill/busipayBill/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>日期：</label>
				<input id="billDate"  name="billDate"  type="text" readonly="readonly" maxlength="20" class="Wdate required" style="width:163px;"
					   value="${busipayBill.billDate}"
					   onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});"/>
			</li>
			<li><label>供应商：</label>
				<sys:treeselect id="billSupplier" name="billSupplier"  value="${busipayBill.docSupplier.id}" labelName="docSupplier.supName" labelValue="${busipayBill.docSupplier.supName}"
								title="供应商名称" url="/doc/docSupplier/treeData?materialCode=*" cssClass="required"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>单据编号</th>
				<th>调帐日期</th>
				<th>供应商名称</th>
				<th>调帐方向</th>
				<th>调帐金额</th>
				<th>制单人</th>
				<th>审核人</th>
				<th>制单日期</th>
				<th>审核日期</th>
				<shiro:hasPermission name="bill:busipayBill:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="busipayBill">
			<tr>
				<td>${fns:abbr(busipayBill.billNo,50)}</td>
				<td>${fns:abbr(busipayBill.billDate,50)}</td>
				<td>${fns:abbr(busipayBill.docSupplier.supName,50)}</td>
				<td>${fns:getDictLabel(busipayBill.billDirection,"billdc_flag","")}</td>
				<td>${fns:abbr(busipayBill.billAmt,50)}</td>
				<td>${fns:abbr(busipayBill.createPerson,50)}</td>
				<td>${fns:abbr(busipayBill.checkPerson,50)}</td>
				<td>${fns:abbr(busipayBill.makeDate,50)}</td>
				<td>${fns:abbr(busipayBill.checkDate,50)}</td>
				<shiro:hasPermission name="bill:busipayBill:edit"><td>
    				<a href="${ctx}/bill/busipayBill/form?id=${busipayBill.id}">修改</a>
					<a href="${ctx}/bill/busipayBill/delete?id=${busipayBill.id}" onclick="return confirmx('确认要删除该业务应付调账单吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>