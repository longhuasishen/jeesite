<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>财务应付调账单管理</title>
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
		<li class="active"><a href="${ctx}/bill/finpayBill/">财务应付调账单列表</a></li>
		<shiro:hasPermission name="bill:finpayBill:edit"><li><a href="${ctx}/bill/finpayBill/form">财务应付调账单添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="finpayBill" action="${ctx}/bill/finpayBill/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>日期：</label>
				<input id="billDate"  name="billDate"  type="text" readonly="readonly" maxlength="20" class="Wdate required" style="width:163px;"
					   value="${finpayBill.billDate}"
					   onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});"/>
			</li>
			<li><label>供应商：</label>
				<sys:treeselect id="billSupplier" name="billSupplier"  value="${finpayBill.docSupplier.id}" labelName="docSupplier.supName" labelValue="${finpayBill.docSupplier.supName}"
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
				<shiro:hasPermission name="bill:finpayBill:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="finpayBill">
			<tr>
				<td>${fns:abbr(finpayBill.billNo,50)}</td>
				<td>${fns:abbr(finpayBill.billDate,50)}</td>
				<td>${fns:abbr(finpayBill.docSupplier.supName,50)}</td>
				<td>${fns:getDictLabel(finpayBill.billDirection,"billdc_flag","")}</td>
				<td>${fns:abbr(finpayBill.billAmt,50)}</td>
				<td>${fns:abbr(finpayBill.createPerson,50)}</td>
				<td>${fns:abbr(finpayBill.checkPerson,50)}</td>
				<td>${fns:abbr(finpayBill.makeDate,50)}</td>
				<td>${fns:abbr(finpayBill.checkDate,50)}</td>
				<shiro:hasPermission name="bill:finpayBill:edit"><td>
    				<a href="${ctx}/bill/finpayBill/form?id=${finpayBill.id}">修改</a>
					<a href="${ctx}/bill/finpayBill/delete?id=${finpayBill.id}" onclick="return confirmx('确认要删除该财务应付调账单吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>