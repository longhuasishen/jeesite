<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>职员档案管理</title>
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
		<li class="active"><a href="${ctx}/doc/docOfficework/">职员档案列表</a></li>
		<shiro:hasPermission name="doc:docOfficework:edit"><li><a href="${ctx}/doc/docOfficework/form">职员档案添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="docOfficework" action="${ctx}/doc/docOfficework/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>职员编码：</label>
				<form:input path="officeworkCode" htmlEscape="false" maxlength="200" class="input-medium"/>
			</li>
			<li><label>职员名称：</label>
				<form:input path="officeworkName" htmlEscape="false" maxlength="200" class="input-medium"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>职员编码</th>
				<th>职员名称</th>
				<th>所属部门</th>
				<th>职务</th>
				<th>最高学历</th>
				<th>婚姻状况</th>
				<th>政治面貌</th>
				<th>性别</th>
				<th>电话</th>
				<th>出生日期</th>
				<th>身份证号码</th>
				<th>入司日期</th>
				<th>档案地点</th>
				<th>档案号</th>
				<th>毕业院校</th>
				<th>所属公司</th>
				<th>入司前单位</th>
				<th>毕业时间</th>
				<th>专业</th>
				<th>录入时间</th>
				<th>级别</th>
				<th>家庭地址</th>
				<th>在职状态</th>
				<th>技术职称</th>
				<th>民族</th>
				<th>岗位</th>
				<th>业务员</th>
				<th>合同签否</th>
				<th>标志</th>
				<th>注销</th>
				<shiro:hasPermission name="doc:docOfficework:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="docOfficework">
			<tr>
				<td>
						${fns:abbr(docOfficework.officeworkCode,50)}
				</td>
				<td>
						${fns:abbr(docOfficework.officeworkName,50)}
				</td>
				<td>
						${fns:abbr(docOfficework.docDepartment.departmentName,50)}
				</td>
				<td>
						${fns:abbr(docOfficework.officeworkPost,50)}
				</td>
				<td>
						${fns:abbr(docOfficework.officeworkEdu,50)}
				</td>
				<td>
						${fns:abbr(docOfficework.officeworkMarry,50)}
				</td>
				<td>
						${fns:abbr(docOfficework.officeworkPol,50)}
				</td>
				<td>
						${fns:abbr(docOfficework.officeworkSex,50)}
				</td>
				<td>
						${fns:abbr(docOfficework.officeworkPhone,50)}
				</td>
				<td>
						${fns:abbr(docOfficework.officeworkBirth,50)}
				</td>
				<td>
						${fns:abbr(docOfficework.officeworkIdcard,50)}
				</td>
				<td>
						${fns:abbr(docOfficework.joinDate,50)}
				</td>
				<td>
						${fns:abbr(docOfficework.docSite,50)}
				</td>
				<td>
						${fns:abbr(docOfficework.docNo,50)}
				</td>
				<td>
						${fns:abbr(docOfficework.fromUni,50)}
				</td>
				<td>
						${fns:abbr(docOfficework.officeworkComp,50)}
				</td>
				<td>
						${fns:abbr(docOfficework.lastComp,50)}
				</td>
				<td>
						${fns:abbr(docOfficework.overuniTime,50)}
				</td>
				<td>
						${fns:abbr(docOfficework.officeworkMajor,50)}
				</td>
				<td>
						${fns:abbr(docOfficework.inputTime,50)}
				</td>
				<td>
						${fns:abbr(docOfficework.officeworkLevel,50)}
				</td>
				<td>
						${fns:abbr(docOfficework.officeworkAddr,50)}
				</td>
				<td>
						${fns:abbr(docOfficework.workStatus,50)}
				</td>
				<td>
						${fns:abbr(docOfficework.postLevel,50)}
				</td>
				<td>
						${fns:abbr(docOfficework.officeworkNation,50)}
				</td>
				<td>
						${fns:abbr(docOfficework.officeworkPost,50)}
				</td>
				<td>
						${fns:abbr(docOfficework.officeworkSales,50)}
				</td>
				<td>
						${fns:abbr(docOfficework.contractFlg,50)}
				</td>
				<td>
						${fns:abbr(docOfficework.officeworkFlg,50)}
				</td>
				<td>
						${fns:abbr(docOfficework.officeworkCancel,50)}
				</td>
				<shiro:hasPermission name="doc:docOfficework:edit"><td>
    				<a href="${ctx}/doc/docOfficework/form?id=${docOfficework.id}">修改</a>
					<a href="${ctx}/doc/docOfficework/delete?id=${docOfficework.id}" onclick="return confirmx('确认要删除该职员档案吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>