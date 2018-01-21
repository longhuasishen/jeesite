<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>生产通知单管理</title>
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
	<li class="active"><a href="${ctx}/produces/produceDesign/listNotice">生产通知单列表</a></li>
	<shiro:hasPermission name="produces:produceNotice:edit"><li><a href="${ctx}/produces/produceDesign/formNotice">生产通知单添加</a></li></shiro:hasPermission>
</ul>
<form:form id="searchForm" modelAttribute="produceDesign" action="${ctx}/produces/produceDesign/listNotice" method="post" class="breadcrumb form-search">
	<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
	<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
	<ul class="ul-form">
		<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
		<li class="clearfix"></li>
	</ul>
</form:form>
<sys:message content="${message}"/>
<table id="contentTable" class="table table-striped table-bordered table-condensed">
	<thead>
	<tr>
		<th>通知单号</th>
		<th>要货日期</th>
		<shiro:hasPermission name="produces:produceNotice:edit"><th>操作</th></shiro:hasPermission>
	</tr>
	</thead>
	<tbody>
	<c:forEach items="${page.list}" var="produceDesign">
		<tr>
			<td> ${fns:abbr(produceDesign.noticeNo,16)}</td>
			<td> ${fns:abbr(produceDesign.goodsDate,16)}</td>
			<shiro:hasPermission name="produces:produceNotice:edit"><td>
				<a href="${ctx}/produces/produceDesign/formNotice?id=${produceDesign.id}">修改</a>
				<a href="${ctx}/produces/produceDesign/deleteNotice?id=${produceDesign.id}" onclick="return confirmx('确认要删除该生产通知单吗？', this.href)">删除</a>
			</td></shiro:hasPermission>
		</tr>
	</c:forEach>
	</tbody>
</table>
<div class="pagination">${page}</div>
</body>
</html>