<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>采购入库管理</title>
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
		<li class="active"><a href="${ctx}/purchase/contractPurchaseStorageMain/">采购入库列表</a></li>
		<shiro:hasPermission name="purchase:contractPurchaseStorageMain:edit"><li><a href="${ctx}/purchase/contractPurchaseStorageMain/form">采购入库添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="contractPurchaseStorageMain" action="${ctx}/purchase/contractPurchaseStorageMain/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>单据编号：</label>
				<form:input path="docCode" htmlEscape="false" maxlength="12" class="input-medium"/>
			</li>
			<li><label>入库单号：</label>
				<form:input path="storageCode" htmlEscape="false" maxlength="50" class="input-medium"/>
			</li>
			<li><label>入库日期时间：</label>
				<input name="storageDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${contractPurchaseStorageMain.storageDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</li>
			<li><label>入库部门：</label>
			</li>
			<li><label>入库仓库：</label>
			</li>
			<li><label>红蓝标志：</label>
				<form:radiobuttons path="storageFlag" items="${fns:getDictList('')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
			</li>
			<li><label>审核状态：</label>
				<form:select path="storageAuditFlag" class="input-medium">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
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
				<th>入库单号</th>
				<th>入库日期</th>
				<th>入库部门</th>
				<th>入库仓库</th>
				<th>红蓝标志</th>
				<th>审核状态</th>
				<th>入库类型</th>
				<th>制单人</th>
				<th>审核人</th>
				<th>经手人</th>
				<th>制单日期</th>
				<th>审核日期</th>
				<shiro:hasPermission name="purchase:contractPurchaseStorageMain:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="contractPurchaseStorageMain">
			<tr>
				<td><a href="${ctx}/purchase/contractPurchaseStorageMain/form?id=${contractPurchaseStorageMain.id}">
					${contractPurchaseStorageMain.docCode}
				</a></td>
				<td>
					${contractPurchaseStorageMain.storageCode}
				</td>
				<td>
					${contractPurchaseStorageMain.storageDate}
				</td>
				<td>
					${contractPurchaseStorageMain.docDepartment.departmentName}
				</td>
				<td>
					${contractPurchaseStorageMain.docRepertory.repertoryName}
				</td>
				<td>
					${fns:getDictLabel(contractPurchaseStorageMain.storageFlag, 'red_blue_flag', '')}
				</td>
				<td>
					${fns:getDictLabel(contractPurchaseStorageMain.storageAuditFlag, 'init_aduit_status', '未审核')}
				</td>
				<td>
						${fns:abbr(docInitStorageMain.storageCreate,50)}
				</td>
				<td>
						${fns:abbr(docInitStorageMain.storageCreate,50)}
				</td>
				<td>
						${fns:abbr(docInitStorageMain.storageHandler,50)}
				</td>
				<td>
						${fns:abbr(docInitStorageMain.storageCreateDate,50)}
				</td>
				<td>
						${fns:abbr(docInitStorageMain.storageCreateDate,50)}
						<%--<fmt:formatDate value="${docInitStorageMain.storageCreateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>--%>
				</td>
				<td>
						${fns:abbr(docInitStorageMain.storageAuditDate,50)}
				</td>
				<shiro:hasPermission name="purchase:contractPurchaseStorageMain:edit"><td>
    				<a href="${ctx}/purchase/contractPurchaseStorageMain/form?id=${contractPurchaseStorageMain.id}">修改</a>
					<a href="${ctx}/purchase/contractPurchaseStorageMain/delete?id=${contractPurchaseStorageMain.id}" onclick="return confirmx('确认要删除该采购入库吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>