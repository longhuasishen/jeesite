<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>分类规则管理</title>
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
		<li class="active"><a href="${ctx}/archive/archiveRule/">分类规则列表</a></li>
		<shiro:hasPermission name="archive:archiveRule:edit"><li><a href="${ctx}/archive/archiveRule/form">分类规则添加</a></li></shiro:hasPermission>
	</ul>
	<%--<form:form id="searchForm" modelAttribute="archiveRule" action="${ctx}/archive/archiveRule/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>--%>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>规则名称</th>
				<th>第1级</th>
				<th>第2级</th>
				<th>第3级</th>
				<th>第4级</th>
				<th>第5级</th>
				<th>第6级</th>
				<th>第7级</th>
				<th>第8级</th>
				<shiro:hasPermission name="archive:archiveRule:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="archiveRule">
			<tr>
				<td>
						${fns:abbr(archiveRule.ruleName,50)}
				</td>
				<td>
						${fn:substring(archiveRule.ruleLength,0,1)}
				</td>
				<td>
						${fn:substring(archiveRule.ruleLength,1,2)}
				</td>
				<td>
						${fn:substring(archiveRule.ruleLength,2,3)}
				</td>
				<td>
						${fn:substring(archiveRule.ruleLength,3,4)}
				</td>
				<td>
						${fn:substring(archiveRule.ruleLength,4,5)}
				</td>
				<td>
						${fn:substring(archiveRule.ruleLength,5,6)}
				</td>
				<td>
						${fn:substring(archiveRule.ruleLength,6,7)}
				</td>
				<td>
						${fn:substring(archiveRule.ruleLength,7,8)}
				</td>
				<shiro:hasPermission name="archive:archiveRule:edit"><td>
    				<a href="${ctx}/archive/archiveRule/form?id=${archiveRule.id}">修改</a>
					<a href="${ctx}/archive/archiveRule/delete?id=${archiveRule.id}" onclick="return confirmx('确认要删除该分类规则吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>