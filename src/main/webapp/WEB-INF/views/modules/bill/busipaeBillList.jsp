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
			<li><label>日期：</label>
				<input id="billDate"  name="billDate"  type="text" readonly="readonly" maxlength="20" class="Wdate required" style="width:163px;"
					   value="${busipaeBill.billDate}"
					   onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});"/>
			</li>
			<li><label>客户名称：</label>
				<sys:treeselect id="customName" name="customName" value="${busipaeBill.docCustomer.id}" labelName="docCustomer.cusName" labelValue="${busipaeBill.docCustomer.cusName}"
								title="客户档案" url="/doc/docCustomer/treeData" />
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
				<th>客户名称</th>
				<th>客户简称</th>
				<th>工程名称</th>
				<th>调帐方向</th>
				<th>调帐金额</th>
				<th>制单人</th>
				<th>审核人</th>
				<th>制单日期</th>
				<th>审核日期</th>
				<shiro:hasPermission name="bill:busipaeBill:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="busipaeBill">
			<tr>
				<td>${fns:abbr(busipaeBill.billNo,50)}</td>
				<td>${fns:abbr(busipaeBill.billDate,50)}</td>
				<td>${fns:abbr(busipaeBill.docCustomer.cusName,50)}</td>
				<td>${fns:abbr(busipaeBill.customAbbr,50)}</td>
				<td>${fns:abbr(busipaeBill.projectName,50)}</td>
				<td>${fns:getDictLabel(busipaeBill.billDirection,"billdc_flag","")}</td>
				<td>${fns:abbr(busipaeBill.billAmt,50)}</td>
				<td>${fns:abbr(busipaeBill.createPerson,50)}</td>
				<td>${fns:abbr(busipaeBill.checkPerson,50)}</td>
				<td>${fns:abbr(busipaeBill.makeDate,50)}</td>
				<td>${fns:abbr(busipaeBill.checkDate,50)}</td>
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