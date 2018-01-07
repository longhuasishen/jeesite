<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>外购加油登记管理</title>
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
		<li class="active"><a href="${ctx}/stock/outsourceOiling/">外购加油登记列表</a></li>
		<shiro:hasPermission name="stock:outsourceOiling:edit"><li><a href="${ctx}/stock/outsourceOiling/form">外购加油登记添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="outsourceOiling" action="${ctx}/stock/outsourceOiling/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>日期：</label>
				<input name="oilingDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${outsourceOiling.oilingDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</li>
			<li><label>样品名称：</label>
				<form:input path="sampleName" htmlEscape="false" maxlength="60" class="input-medium"/>
			</li>
			<li><label>供应商名称：</label>
				<form:input path="supplierName" htmlEscape="false" maxlength="120" class="input-medium"/>
			</li>
			<li><label>数量：</label>
				<form:input path="oilingCount" htmlEscape="false" maxlength="10" class="input-medium"/>
			</li>
			<li><label>单价：</label>
				<form:input path="oilingPrice" htmlEscape="false" maxlength="15" class="input-medium"/>
			</li>
			<li><label>金额：</label>
				<form:input path="oilingAmount" htmlEscape="false" maxlength="15" class="input-medium"/>
			</li>
			<li><label>结算人：</label>
				<form:input path="oilingPerson" htmlEscape="false" maxlength="60" class="input-medium"/>
			</li>
			<li><label>车号：</label>
				<form:input path="carNo" htmlEscape="false" maxlength="32" class="input-medium"/>
			</li>
			<li><label>备注：</label>
				<form:input path="oilingRemark" htmlEscape="false" maxlength="200" class="input-medium"/>
			</li>
			<li><label>制单人：</label>
				<form:input path="createPerson" htmlEscape="false" maxlength="60" class="input-medium"/>
			</li>
			<li><label>审核人：</label>
				<form:input path="checkPerson" htmlEscape="false" maxlength="60" class="input-medium"/>
			</li>
			<li><label>制单日期：</label>
				<input name="makeDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${outsourceOiling.makeDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</li>
			<li><label>审核日期：</label>
				<input name="checkDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${outsourceOiling.checkDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</li>
			<li><label>审核状态：</label>
				<form:select path="checkStatus" class="input-medium">
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
				<th>日期</th>
				<th>样品名称</th>
				<th>供应商名称</th>
				<th>数量</th>
				<th>单价</th>
				<th>金额</th>
				<th>结算人</th>
				<th>车号</th>
				<th>备注</th>
				<th>制单人</th>
				<th>审核人</th>
				<th>制单日期</th>
				<th>审核日期</th>
				<th>审核状态</th>
				<shiro:hasPermission name="stock:outsourceOiling:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="outsourceOiling">
			<tr>
				<td><a href="${ctx}/stock/outsourceOiling/form?id=${outsourceOiling.id}">
					${outsourceOiling.oilingDate}
				</a></td>
				<td>
					${outsourceOiling.sampleName}
				</td>
				<td>
					${outsourceOiling.supplierName}
				</td>
				<td>
					${outsourceOiling.oilingCount}
				</td>
				<td>
					${outsourceOiling.oilingPrice}
				</td>
				<td>
					${outsourceOiling.oilingAmount}
				</td>
				<td>
					${outsourceOiling.oilingPerson}
				</td>
				<td>
					${outsourceOiling.carNo}
				</td>
				<td>
					${outsourceOiling.oilingRemark}
				</td>
				<td>
					${outsourceOiling.createPerson}
				</td>
				<td>
					${outsourceOiling.checkPerson}
				</td>
				<td>
					${outsourceOiling.makeDate}
				</td>
				<td>
					${outsourceOiling.checkDate}
				</td>
				<td>
					${fns:getDictLabel(outsourceOiling.checkStatus, '', '')}
				</td>
				<shiro:hasPermission name="stock:outsourceOiling:edit"><td>
    				<a href="${ctx}/stock/outsourceOiling/form?id=${outsourceOiling.id}">修改</a>
					<a href="${ctx}/stock/outsourceOiling/delete?id=${outsourceOiling.id}" onclick="return confirmx('确认要删除该外购加油登记吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>