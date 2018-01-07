<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>销售发票管理</title>
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
		<li class="active"><a href="${ctx}/bill/salesInvoice/">销售发票列表</a></li>
		<shiro:hasPermission name="bill:salesInvoice:edit"><li><a href="${ctx}/bill/salesInvoice/form">销售发票添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="salesInvoice" action="${ctx}/bill/salesInvoice/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>发票号码：</label>
				<form:input path="invoiceNo" htmlEscape="false" maxlength="32" class="input-medium"/>
			</li>
			<li><label>发票日期：</label>
				<input name="invoiceDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${salesInvoice.invoiceDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</li>
			<li><label>客户简称：</label>
				<form:input path="customAbbr" htmlEscape="false" maxlength="60" class="input-medium"/>
			</li>
			<li><label>税号：</label>
				<form:input path="taxNum" htmlEscape="false" maxlength="32" class="input-medium"/>
			</li>
			<li><label>客户账号：</label>
				<form:input path="customAcc" htmlEscape="false" maxlength="32" class="input-medium"/>
			</li>
			<li><label>银行名称：</label>
				<form:input path="bankName" htmlEscape="false" maxlength="60" class="input-medium"/>
			</li>
			<li><label>电话号码：</label>
				<form:input path="customPhone" htmlEscape="false" maxlength="20" class="input-medium"/>
			</li>
			<li><label>地址：</label>
				<form:input path="customAddr" htmlEscape="false" maxlength="120" class="input-medium"/>
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
					value="<fmt:formatDate value="${salesInvoice.makeDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</li>
			<li><label>审核日期：</label>
				<input name="checkDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${salesInvoice.checkDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</li>
			<li><label>备注：</label>
				<form:input path="invoiceRemark" htmlEscape="false" maxlength="200" class="input-medium"/>
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
				<th>发票号码</th>
				<th>发票日期</th>
				<th>客户简称</th>
				<th>税号</th>
				<th>客户账号</th>
				<th>银行名称</th>
				<th>电话号码</th>
				<th>地址</th>
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
				<shiro:hasPermission name="bill:salesInvoice:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="salesInvoice">
			<tr>
				<td><a href="${ctx}/bill/salesInvoice/form?id=${salesInvoice.id}">
					${salesInvoice.invoiceNo}
				</a></td>
				<td>
					${salesInvoice.invoiceDate}
				</td>
				<td>
					${salesInvoice.customAbbr}
				</td>
				<td>
					${salesInvoice.taxNum}
				</td>
				<td>
					${salesInvoice.customAcc}
				</td>
				<td>
					${salesInvoice.bankName}
				</td>
				<td>
					${salesInvoice.customPhone}
				</td>
				<td>
					${salesInvoice.customAddr}
				</td>
				<td>
					${fns:getDictLabel(salesInvoice.checkStatus, '', '')}
				</td>
				<td>
					${salesInvoice.createPerson}
				</td>
				<td>
					${salesInvoice.checkPerson}
				</td>
				<td>
					${salesInvoice.makeDate}
				</td>
				<td>
					${salesInvoice.checkDate}
				</td>
				<td>
					${salesInvoice.invoiceRemark}
				</td>
				<td>
					${salesInvoice.extField1}
				</td>
				<td>
					${salesInvoice.extField2}
				</td>
				<td>
					${salesInvoice.extField3}
				</td>
				<td>
					${salesInvoice.remark}
				</td>
				<shiro:hasPermission name="bill:salesInvoice:edit"><td>
    				<a href="${ctx}/bill/salesInvoice/form?id=${salesInvoice.id}">修改</a>
					<a href="${ctx}/bill/salesInvoice/delete?id=${salesInvoice.id}" onclick="return confirmx('确认要删除该销售发票吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>