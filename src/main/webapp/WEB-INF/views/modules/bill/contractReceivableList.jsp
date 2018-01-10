<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>合同应收管理</title>
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
		<li class="active"><a href="${ctx}/bill/contractReceivable/">合同应收列表</a></li>
		<shiro:hasPermission name="bill:contractReceivable:edit"><li><a href="${ctx}/bill/contractReceivable/form">合同应收添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="contractReceivable" action="${ctx}/bill/contractReceivable/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>日期：</label>
				<input id="billDate"  name="billDate"  type="text" readonly="readonly" maxlength="20" class="Wdate required" style="width:163px;"
					   value="${contractReceivable.billDate}"
					   onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});"/>
			</li>
			<li><label>客户简称：</label>
				<sys:treeselect id="customAbbr" name="customAbbr" value="${contractReceivable.docCustomer.id}" labelName="docCustomer.cusShortName" labelValue="${contractReceivable.docCustomer.cusShortName}"
								title="客户档案" url="/doc/docCustomer/treeDataShortName" />
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
				<th>应收款日期</th>
				<th>客户简称</th>
				<th>本月应收总额</th>
				<th>合同应收金额</th>
				<th>审核状态</th>
				<th>制单人</th>
				<th>审核人</th>
				<th>制单日期</th>
				<th>审核日期</th>
				<th>备注</th>
				<%--<th>ext_field1</th>--%>
				<%--<th>ext_field2</th>--%>
				<%--<th>ext_field3</th>--%>
				<%--<th>remark</th>--%>
				<shiro:hasPermission name="bill:contractReceivable:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="contractReceivable">
			<tr>
				<td><a href="${ctx}/bill/contractReceivable/form?id=${contractReceivable.id}">
					${contractReceivable.billNo}
				</a></td>
				<td>
					${contractReceivable.billDate}
				</td>
				<td>
					${contractReceivable.docCustomer.cusShortName}
				</td>
				<td>
					${contractReceivable.monthAmount}
				</td>
				<td>
					${contractReceivable.contractAmount}
				</td>
				<td>
					${fns:getDictLabel(contractReceivable.checkStatus, 'check_state1', '')}
				</td>
				<td>
					${contractReceivable.createPerson}
				</td>
				<td>
					${contractReceivable.checkPerson}
				</td>
				<td>
					${contractReceivable.makeDate}
				</td>
				<td>
					${contractReceivable.checkDate}
				</td>
				<td>
					${contractReceivable.contractRemark}
				</td>
				<%--<td>--%>
					<%--${contractReceivable.extField1}--%>
				<%--</td>--%>
				<%--<td>--%>
					<%--${contractReceivable.extField2}--%>
				<%--</td>--%>
				<%--<td>--%>
					<%--${contractReceivable.extField3}--%>
				<%--</td>--%>
				<%--<td>--%>
					<%--${contractReceivable.remark}--%>
				<%--</td>--%>
				<shiro:hasPermission name="bill:contractReceivable:edit"><td>
    				<a href="${ctx}/bill/contractReceivable/form?id=${contractReceivable.id}">修改</a>
					<a href="${ctx}/bill/contractReceivable/delete?id=${contractReceivable.id}" onclick="return confirmx('确认要删除该合同应收吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>