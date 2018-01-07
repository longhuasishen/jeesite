<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>收款单管理</title>
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
		<li class="active"><a href="${ctx}/bill/incomeBill/">收款单列表</a></li>
		<shiro:hasPermission name="bill:incomeBill:edit"><li><a href="${ctx}/bill/incomeBill/form">收款单添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="incomeBill" action="${ctx}/bill/incomeBill/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>单据编号：</label>
				<form:input path="billNo" htmlEscape="false" maxlength="20" class="input-medium"/>
			</li>
			<li><label>收款日期：</label>
				<input name="billDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${incomeBill.billDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</li>
			<li><label>客户名称：</label>
				<form:input path="customName" htmlEscape="false" maxlength="60" class="input-medium"/>
			</li>
			<li><label>工程名称：</label>
				<form:input path="projectName" htmlEscape="false" maxlength="120" class="input-medium"/>
			</li>
			<li><label>支付方式：</label>
				<form:select path="payWay" class="input-medium">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</li>
			<li><label>收款金额：</label>
				<form:input path="incomeAmount" htmlEscape="false" maxlength="20" class="input-medium"/>
			</li>
			<li><label>付款单主表单据编号：</label>
				<form:input path="withNo" htmlEscape="false" maxlength="32" class="input-medium"/>
			</li>
			<li><label>开户银行：</label>
				<form:input path="bankName" htmlEscape="false" maxlength="60" class="input-medium"/>
			</li>
			<li><label>银行帐号：</label>
				<form:input path="bankAcc" htmlEscape="false" maxlength="32" class="input-medium"/>
			</li>
			<li><label>审核状态：</label>
				<form:select path="checkStatus" class="input-medium">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</li>
			<li><label>制单人：</label>
				<form:input path="createPerson" htmlEscape="false" maxlength="60" class="input-medium"/>
			</li>
			<li><label>审核人：</label>
				<form:input path="checkPerson" htmlEscape="false" maxlength="60" class="input-medium"/>
			</li>
			<li><label>制单日期：</label>
				<input name="makeDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${incomeBill.makeDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</li>
			<li><label>审核日期：</label>
				<input name="checkDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${incomeBill.checkDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</li>
			<li><label>备注：</label>
				<form:input path="incomeRemark" htmlEscape="false" maxlength="200" class="input-medium"/>
			</li>
			<li><label>ext_field1：</label>
				<form:input path="extField1" htmlEscape="false" maxlength="60" class="input-medium"/>
			</li>
			<li><label>ext_field2：</label>
				<form:input path="extField2" htmlEscape="false" maxlength="60" class="input-medium"/>
			</li>
			<li><label>ext_field3：</label>
				<form:input path="extField3" htmlEscape="false" maxlength="120" class="input-medium"/>
			</li>
			<li><label>remark：</label>
				<form:input path="remark" htmlEscape="false" maxlength="1000" class="input-medium"/>
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
				<th>收款日期</th>
				<th>客户名称</th>
				<th>工程名称</th>
				<th>支付方式</th>
				<th>收款金额</th>
				<th>付款单主表单据编号</th>
				<th>开户银行</th>
				<th>银行帐号</th>
				<th>审核状态</th>
				<th>制单人</th>
				<th>审核人</th>
				<th>制单日期</th>
				<th>审核日期</th>
				<th>备注</th>
				<th>ext_field1</th>
				<th>ext_field2</th>
				<th>ext_field3</th>
				<th>remark</th>
				<shiro:hasPermission name="bill:incomeBill:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="incomeBill">
			<tr>
				<td><a href="${ctx}/bill/incomeBill/form?id=${incomeBill.id}">
					${incomeBill.billNo}
				</a></td>
				<td>
					${incomeBill.billDate}
				</td>
				<td>
					${incomeBill.customName}
				</td>
				<td>
					${incomeBill.projectName}
				</td>
				<td>
					${fns:getDictLabel(incomeBill.payWay, '', '')}
				</td>
				<td>
					${incomeBill.incomeAmount}
				</td>
				<td>
					${incomeBill.withNo}
				</td>
				<td>
					${incomeBill.bankName}
				</td>
				<td>
					${incomeBill.bankAcc}
				</td>
				<td>
					${fns:getDictLabel(incomeBill.checkStatus, '', '')}
				</td>
				<td>
					${incomeBill.createPerson}
				</td>
				<td>
					${incomeBill.checkPerson}
				</td>
				<td>
					${incomeBill.makeDate}
				</td>
				<td>
					${incomeBill.checkDate}
				</td>
				<td>
					${incomeBill.incomeRemark}
				</td>
				<td>
					${incomeBill.extField1}
				</td>
				<td>
					${incomeBill.extField2}
				</td>
				<td>
					${incomeBill.extField3}
				</td>
				<td>
					${incomeBill.remark}
				</td>
				<shiro:hasPermission name="bill:incomeBill:edit"><td>
    				<a href="${ctx}/bill/incomeBill/form?id=${incomeBill.id}">修改</a>
					<a href="${ctx}/bill/incomeBill/delete?id=${incomeBill.id}" onclick="return confirmx('确认要删除该收款单吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>