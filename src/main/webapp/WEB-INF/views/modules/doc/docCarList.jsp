<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>车辆档案管理</title>
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
		<li class="active"><a href="${ctx}/doc/docCar/">车辆档案列表</a></li>
		<shiro:hasPermission name="doc:docCar:edit"><li><a href="${ctx}/doc/docCar/form">车辆档案添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="docCar" action="${ctx}/doc/docCar/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>车辆编码：</label>
				<form:input path="carCode" htmlEscape="false" maxlength="200" class="input-medium"/>
			</li>
			<li><label>车牌号码：</label>
				<form:input path="carNo" htmlEscape="false" maxlength="200" class="input-medium"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>车辆编码</th>
				<th>车牌号码</th>
				<th>司机姓名1</th>
				<th>司机姓名2</th>
				<th>司机姓名3</th>
			<%--<th>行驶执照</th>--%>
				<th>搅拌车</th>
				<th>泵车</th>
				<th>其它设备</th>
				<th>卡号</th>
				<th>空重</th>
				<th>装载方量</th>
			<%--<th>联系电话</th>--%>
				<th>是否可用</th>
				<th>行驶记录</th>
				<shiro:hasPermission name="doc:docCar:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="docCar">
			<tr>
				<td>
						${fns:abbr(docCar.carCode,50)}
				</td>
				<td>
						${fns:abbr(docCar.carNo,50)}
				</td>
				<td>
						${fns:abbr(docCar.driverName,50)}
				</td>
				<td>
						${fns:abbr(docCar.carOwner,50)}
				</td>
				<td>
						${fns:abbr(docCar.carTypename,50)}
				</td>
			<%--<td>--%>
			<%--${fns:abbr(docCar.carLicence,50)}--%>
			<%--</td>--%>
				<td>
						${fns:abbr(docCar.isMixing,50)}
				</td>
				<td>
						${fns:abbr(docCar.isPump,50)}
				</td>
				<td>
						${fns:abbr(docCar.isOther,50)}
				</td>
				<td>
			${fns:abbr(docCar.cardNo,50)}
				</td>
				<td>
			${fns:abbr(docCar.emptyWeight,50)}
				</td>
				<td>
			${fns:abbr(docCar.driveCube,50)}
				</td>
			<%--<td>--%>
			<%--${fns:abbr(docCar.carPhone,50)}--%>
			<%--</td>--%>
				<td>
						${fns:abbr(docCar.isAvalable,50)}
				</td>
				<td>
						${fns:abbr(docCar.driveRecord,50)}
				</td>
				<shiro:hasPermission name="doc:docCar:edit"><td>
    				<a href="${ctx}/doc/docCar/form?id=${docCar.id}">修改</a>
					<a href="${ctx}/doc/docCar/delete?id=${docCar.id}" onclick="return confirmx('确认要删除该车辆档案吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>