<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>形态转换管理</title>
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
		<li class="active"><a href="${ctx}/stock/inverseKind/">形态转换列表</a></li>
		<shiro:hasPermission name="stock:inverseKind:edit"><li><a href="${ctx}/stock/inverseKind/form">形态转换添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="inverseKind" action="${ctx}/stock/inverseKind/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>转换日期：</label>
				<input name="inverseDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${inverseKind.inverseDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</li>
			<li><label>仓库名称：</label>
				<form:input path="repoName" htmlEscape="false" maxlength="60" class="input-medium"/>
			</li>
			<li><label>原品种名称：</label>
				<form:input path="orgiName" htmlEscape="false" maxlength="60" class="input-medium"/>
			</li>
			<li><label>原出厂编号：</label>
				<form:input path="orgiNo" htmlEscape="false" maxlength="32" class="input-medium"/>
			</li>
			<li><label>转换数量：</label>
				<form:input path="inverseNum" htmlEscape="false" maxlength="10" class="input-medium"/>
			</li>
			<li><label>原单价：</label>
				<form:input path="orgiPrice" htmlEscape="false" maxlength="15" class="input-medium"/>
			</li>
			<li><label>原金额：</label>
				<form:input path="orgiAmount" htmlEscape="false" maxlength="15" class="input-medium"/>
			</li>
			<li><label>新品种名称：</label>
				<form:input path="newName" htmlEscape="false" maxlength="60" class="input-medium"/>
			</li>
			<li><label>新出厂编号：</label>
				<form:input path="newNo" htmlEscape="false" maxlength="32" class="input-medium"/>
			</li>
			<li><label>新数量：</label>
				<form:input path="newNum" htmlEscape="false" maxlength="10" class="input-medium"/>
			</li>
			<li><label>新单价：</label>
				<form:input path="newPrice" htmlEscape="false" maxlength="15" class="input-medium"/>
			</li>
			<li><label>新金额：</label>
				<form:input path="newAmount" htmlEscape="false" maxlength="15" class="input-medium"/>
			</li>
			<li><label>制单人：</label>
				<form:input path="createPerson" htmlEscape="false" maxlength="60" class="input-medium"/>
			</li>
			<li><label>审核人：</label>
				<form:input path="checkPerson" htmlEscape="false" maxlength="60" class="input-medium"/>
			</li>
			<li><label>制单日期：</label>
				<input name="makeDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${inverseKind.makeDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</li>
			<li><label>审核日期：</label>
				<input name="checkDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${inverseKind.checkDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</li>
			<li><label>审核状态：</label>
				<form:select path="checkStatus" class="input-medium">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</li>
			<li><label>备注：</label>
				<form:input path="checkRemark" htmlEscape="false" maxlength="200" class="input-medium"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>转换日期</th>
				<th>仓库名称</th>
				<th>原品种名称</th>
				<th>原出厂编号</th>
				<th>转换数量</th>
				<th>原单价</th>
				<th>原金额</th>
				<th>新品种名称</th>
				<th>新出厂编号</th>
				<th>新数量</th>
				<th>新单价</th>
				<th>新金额</th>
				<th>制单人</th>
				<th>审核人</th>
				<th>制单日期</th>
				<th>审核日期</th>
				<th>审核状态</th>
				<th>备注</th>
				<shiro:hasPermission name="stock:inverseKind:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="inverseKind">
			<tr>
				<td><a href="${ctx}/stock/inverseKind/form?id=${inverseKind.id}">
					${inverseKind.inverseDate}
				</a></td>
				<td>
					${inverseKind.repoName}
				</td>
				<td>
					${inverseKind.orgiName}
				</td>
				<td>
					${inverseKind.orgiNo}
				</td>
				<td>
					${inverseKind.inverseNum}
				</td>
				<td>
					${inverseKind.orgiPrice}
				</td>
				<td>
					${inverseKind.orgiAmount}
				</td>
				<td>
					${inverseKind.newName}
				</td>
				<td>
					${inverseKind.newNo}
				</td>
				<td>
					${inverseKind.newNum}
				</td>
				<td>
					${inverseKind.newPrice}
				</td>
				<td>
					${inverseKind.newAmount}
				</td>
				<td>
					${inverseKind.createPerson}
				</td>
				<td>
					${inverseKind.checkPerson}
				</td>
				<td>
					${inverseKind.makeDate}
				</td>
				<td>
					${inverseKind.checkDate}
				</td>
				<td>
					${fns:getDictLabel(inverseKind.checkStatus, '', '')}
				</td>
				<td>
					${inverseKind.checkRemark}
				</td>
				<shiro:hasPermission name="stock:inverseKind:edit"><td>
    				<a href="${ctx}/stock/inverseKind/form?id=${inverseKind.id}">修改</a>
					<a href="${ctx}/stock/inverseKind/delete?id=${inverseKind.id}" onclick="return confirmx('确认要删除该形态转换吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>