<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>发货单管理</title>
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
		<li class="active"><a href="${ctx}/bill/goodsBill/">发货单列表</a></li>
		<shiro:hasPermission name="bill:goodsBill:edit"><li><a href="${ctx}/bill/goodsBill/form">发货单添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="goodsBill" action="${ctx}/bill/goodsBill/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>发货单号：</label>
				<form:input path="goodsNo" htmlEscape="false" maxlength="32" class="input-medium"/>
			</li>
			<li><label>出库日期：</label>
				<input name="outDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${goodsBill.outDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</li>
			<li><label>合同编号：</label>
				<form:input path="contractNo" htmlEscape="false" maxlength="20" class="input-medium"/>
			</li>
			<li><label>客户名称：</label>
				<form:input path="customName" htmlEscape="false" maxlength="60" class="input-medium"/>
			</li>
			<li><label>工程名称：</label>
				<form:input path="projectName" htmlEscape="false" maxlength="120" class="input-medium"/>
			</li>
			<li><label>运输车次：</label>
				<form:input path="carCount" htmlEscape="false" maxlength="15" class="input-medium"/>
			</li>
			<li><label>交货地点：</label>
				<form:input path="goodsAddr" htmlEscape="false" maxlength="240" class="input-medium"/>
			</li>
			<li><label>施工部位：</label>
				<form:input path="buildSite" htmlEscape="false" maxlength="120" class="input-medium"/>
			</li>
			<li><label>生产通知单：</label>
				<form:input path="noticeNo" htmlEscape="false" maxlength="20" class="input-medium"/>
			</li>
			<li><label>强度等级：</label>
				<form:input path="strengthGrade" htmlEscape="false" maxlength="20" class="input-medium"/>
			</li>
			<li><label>商品名称：</label>
				<form:input path="goodsName" htmlEscape="false" maxlength="60" class="input-medium"/>
			</li>
			<li><label>浇灌方法：</label>
				<form:input path="waterMeth" htmlEscape="false" maxlength="20" class="input-medium"/>
			</li>
			<li><label>起始坍落度：</label>
				<form:input path="slumpsStart" htmlEscape="false" maxlength="10" class="input-medium"/>
			</li>
			<li><label>终止坍落度：</label>
				<form:input path="slumpsEnd" htmlEscape="false" maxlength="10" class="input-medium"/>
			</li>
			<li><label>客户编码：</label>
				<form:input path="customNo" htmlEscape="false" maxlength="60" class="input-medium"/>
			</li>
			<li><label>搅拌站：</label>
				<form:input path="withStation" htmlEscape="false" maxlength="60" class="input-medium"/>
			</li>
			<li><label>特种材料：</label>
				<form:input path="specialMaterial" htmlEscape="false" maxlength="120" class="input-medium"/>
			</li>
			<li><label>仓库名称：</label>
				<form:input path="repertoryName" htmlEscape="false" maxlength="30" class="input-medium"/>
			</li>
			<li><label>本车数量：</label>
				<form:input path="curcarCount" htmlEscape="false" maxlength="15" class="input-medium"/>
			</li>
			<li><label>砂浆数量：</label>
				<form:input path="mortarCount" htmlEscape="false" maxlength="15" class="input-medium"/>
			</li>
			<li><label>同标号数量：</label>
				<form:input path="aboutNum" htmlEscape="false" maxlength="15" class="input-medium"/>
			</li>
			<li><label>司机：</label>
				<form:input path="goodsDriver" htmlEscape="false" maxlength="60" class="input-medium"/>
			</li>
			<li><label>运输车号：</label>
				<form:input path="carNo" htmlEscape="false" maxlength="15" class="input-medium"/>
			</li>
			<li><label>增量：</label>
				<form:input path="goodsIncrement" htmlEscape="false" maxlength="15" class="input-medium"/>
			</li>
			<li><label>发车时间：</label>
				<input name="departTime" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${goodsBill.departTime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</li>
			<li><label>到达时间：</label>
				<input name="reachTime" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${goodsBill.reachTime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</li>
			<li><label>卸料时间：</label>
				<input name="unloadTime" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${goodsBill.unloadTime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</li>
			<li><label>发货人：</label>
				<form:input path="departPerson" htmlEscape="false" maxlength="60" class="input-medium"/>
			</li>
			<li><label>质检员：</label>
				<form:input path="qualityPerson" htmlEscape="false" maxlength="60" class="input-medium"/>
			</li>
			<li><label>收货人：</label>
				<form:input path="goodsClerk" htmlEscape="false" maxlength="60" class="input-medium"/>
			</li>
			<li><label>制单人：</label>
				<form:input path="createPerson" htmlEscape="false" maxlength="60" class="input-medium"/>
			</li>
			<li><label>审核人：</label>
				<form:input path="checkPerson" htmlEscape="false" maxlength="60" class="input-medium"/>
			</li>
			<li><label>审核状态：</label>
				<form:select path="checkStatus" class="input-medium">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</li>
			<li><label>制单日期：</label>
				<input name="makeDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${goodsBill.makeDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</li>
			<li><label>审核日期：</label>
				<input name="checkDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${goodsBill.checkDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</li>
			<li><label>累计车数：</label>
				<form:input path="totalCars" htmlEscape="false" maxlength="10" class="input-medium"/>
			</li>
			<li><label>累计方量：</label>
				<form:input path="totalCube" htmlEscape="false" maxlength="10" class="input-medium"/>
			</li>
			<li><label>备注：</label>
				<form:input path="goodsRemark" htmlEscape="false" maxlength="200" class="input-medium"/>
			</li>
			<li><label>异常料处理：</label>
				<form:input path="exceptHandle" htmlEscape="false" maxlength="1000" class="input-medium"/>
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
				<th>发货单号</th>
				<th>出库日期</th>
				<th>合同编号</th>
				<th>客户名称</th>
				<th>工程名称</th>
				<th>运输车次</th>
				<th>交货地点</th>
				<th>施工部位</th>
				<th>生产通知单</th>
				<th>强度等级</th>
				<th>商品名称</th>
				<th>浇灌方法</th>
				<th>起始坍落度</th>
				<th>终止坍落度</th>
				<th>客户编码</th>
				<th>搅拌站</th>
				<th>特种材料</th>
				<th>仓库名称</th>
				<th>本车数量</th>
				<th>砂浆数量</th>
				<th>同标号数量</th>
				<th>司机</th>
				<th>运输车号</th>
				<th>增量</th>
				<th>发车时间</th>
				<th>到达时间</th>
				<th>卸料时间</th>
				<th>发货人</th>
				<th>质检员</th>
				<th>收货人</th>
				<th>制单人</th>
				<th>审核人</th>
				<th>审核状态</th>
				<th>制单日期</th>
				<th>审核日期</th>
				<th>累计车数</th>
				<th>累计方量</th>
				<th>备注</th>
				<th>异常料处理</th>
				<th>ext_field1</th>
				<th>ext_field2</th>
				<th>ext_field3</th>
				<th>remark</th>
				<shiro:hasPermission name="bill:goodsBill:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="goodsBill">
			<tr>
				<td><a href="${ctx}/bill/goodsBill/form?id=${goodsBill.id}">
					${goodsBill.goodsNo}
				</a></td>
				<td>
					${goodsBill.outDate}
				</td>
				<td>
					${goodsBill.contractNo}
				</td>
				<td>
					${goodsBill.customName}
				</td>
				<td>
					${goodsBill.projectName}
				</td>
				<td>
					${goodsBill.carCount}
				</td>
				<td>
					${goodsBill.goodsAddr}
				</td>
				<td>
					${goodsBill.buildSite}
				</td>
				<td>
					${goodsBill.noticeNo}
				</td>
				<td>
					${goodsBill.strengthGrade}
				</td>
				<td>
					${goodsBill.goodsName}
				</td>
				<td>
					${goodsBill.waterMeth}
				</td>
				<td>
					${goodsBill.slumpsStart}
				</td>
				<td>
					${goodsBill.slumpsEnd}
				</td>
				<td>
					${goodsBill.customNo}
				</td>
				<td>
					${goodsBill.withStation}
				</td>
				<td>
					${goodsBill.specialMaterial}
				</td>
				<td>
					${goodsBill.repertoryName}
				</td>
				<td>
					${goodsBill.curcarCount}
				</td>
				<td>
					${goodsBill.mortarCount}
				</td>
				<td>
					${goodsBill.aboutNum}
				</td>
				<td>
					${goodsBill.goodsDriver}
				</td>
				<td>
					${goodsBill.carNo}
				</td>
				<td>
					${goodsBill.goodsIncrement}
				</td>
				<td>
					${goodsBill.departTime}
				</td>
				<td>
					${goodsBill.reachTime}
				</td>
				<td>
					${goodsBill.unloadTime}
				</td>
				<td>
					${goodsBill.departPerson}
				</td>
				<td>
					${goodsBill.qualityPerson}
				</td>
				<td>
					${goodsBill.goodsClerk}
				</td>
				<td>
					${goodsBill.createPerson}
				</td>
				<td>
					${goodsBill.checkPerson}
				</td>
				<td>
					${fns:getDictLabel(goodsBill.checkStatus, '', '')}
				</td>
				<td>
					${goodsBill.makeDate}
				</td>
				<td>
					${goodsBill.checkDate}
				</td>
				<td>
					${goodsBill.totalCars}
				</td>
				<td>
					${goodsBill.totalCube}
				</td>
				<td>
					${goodsBill.goodsRemark}
				</td>
				<td>
					${goodsBill.exceptHandle}
				</td>
				<td>
					${goodsBill.extField1}
				</td>
				<td>
					${goodsBill.extField2}
				</td>
				<td>
					${goodsBill.extField3}
				</td>
				<td>
					${goodsBill.remark}
				</td>
				<shiro:hasPermission name="bill:goodsBill:edit"><td>
    				<a href="${ctx}/bill/goodsBill/form?id=${goodsBill.id}">修改</a>
					<a href="${ctx}/bill/goodsBill/delete?id=${goodsBill.id}" onclick="return confirmx('确认要删除该发货单吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>