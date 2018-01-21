<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>配合比系列表管理</title>
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
		<li class="active"><a href="${ctx}/produces/coordinateRatio/">配合比系列表列表</a></li>
		<shiro:hasPermission name="produces:coordinateRatio:edit"><li><a href="${ctx}/produces/coordinateRatio/form">配合比系列表添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="coordinateRatio" action="${ctx}/produces/coordinateRatio/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<%--<li><label>配合比编号：</label>--%>
				<%--<form:input path="ratioCode" htmlEscape="false" maxlength="20" class="input-medium"/>--%>
			<%--</li>--%>
			<%--<li><label>品种名称：</label>--%>
				<%--<form:input path="kindName" htmlEscape="false" maxlength="120" class="input-medium"/>--%>
			<%--</li>--%>
			<li><label>试验日期：</label>
				<input name="testDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${coordinateRatio.testDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</li>
			<%--<li><label>水胶比：</label>--%>
				<%--<form:input path="waterRatio" htmlEscape="false" maxlength="10" class="input-medium"/>--%>
			<%--</li>--%>
			<%--<li><label>砂率：</label>--%>
				<%--<form:input path="sandRatio" htmlEscape="false" maxlength="10" class="input-medium"/>--%>
			<%--</li>--%>
			<%--<li><label>坍落度：</label>--%>
				<%--<form:input path="slumps" htmlEscape="false" maxlength="10" class="input-medium"/>--%>
			<%--</li>--%>
			<%--<li><label>起始容重：</label>--%>
				<%--<form:input path="startcapacity" htmlEscape="false" maxlength="10" class="input-medium"/>--%>
			<%--</li>--%>
			<%--<li><label>终止容重：</label>--%>
				<%--<form:input path="endCapacity" htmlEscape="false" maxlength="10" class="input-medium"/>--%>
			<%--</li>--%>
			<%--<li><label>材料品种水：</label>--%>
				<%--<form:input path="kindWater" htmlEscape="false" maxlength="50" class="input-medium"/>--%>
			<%--</li>--%>
			<%--<li><label>材料品种水泥：</label>--%>
				<%--<form:input path="kindCement" htmlEscape="false" maxlength="50" class="input-medium"/>--%>
			<%--</li>--%>
			<%--<li><label>材料品种骨料1：</label>--%>
				<%--<form:input path="kindAg1" htmlEscape="false" maxlength="50" class="input-medium"/>--%>
			<%--</li>--%>
			<%--<li><label>材料品种骨料2：</label>--%>
				<%--<form:input path="kindAg2" htmlEscape="false" maxlength="50" class="input-medium"/>--%>
			<%--</li>--%>
			<%--<li><label>材料品种骨料3：</label>--%>
				<%--<form:input path="kindAg3" htmlEscape="false" maxlength="50" class="input-medium"/>--%>
			<%--</li>--%>
			<%--<li><label>材料品种骨料4：</label>--%>
				<%--<form:input path="kindAg4" htmlEscape="false" maxlength="50" class="input-medium"/>--%>
			<%--</li>--%>
			<%--<li><label>材料品种粉煤灰：</label>--%>
				<%--<form:input path="kindFlyash" htmlEscape="false" maxlength="50" class="input-medium"/>--%>
			<%--</li>--%>
			<%--<li><label>材料品种矿粉：</label>--%>
				<%--<form:input path="kindBreeze" htmlEscape="false" maxlength="50" class="input-medium"/>--%>
			<%--</li>--%>
			<%--<li><label>材料品种外加剂1：</label>--%>
				<%--<form:input path="kindAdd1" htmlEscape="false" maxlength="50" class="input-medium"/>--%>
			<%--</li>--%>
			<%--<li><label>材料品种外加剂2：</label>--%>
				<%--<form:input path="kindAdd2" htmlEscape="false" maxlength="50" class="input-medium"/>--%>
			<%--</li>--%>
			<%--<li><label>材料品种备用一：</label>--%>
				<%--<form:input path="kindBackup1" htmlEscape="false" maxlength="50" class="input-medium"/>--%>
			<%--</li>--%>
			<%--<li><label>材料品种污水：</label>--%>
				<%--<form:input path="kindSlops" htmlEscape="false" maxlength="50" class="input-medium"/>--%>
			<%--</li>--%>
			<%--<li><label>用量水：</label>--%>
				<%--<form:input path="dosageWater" htmlEscape="false" maxlength="15" class="input-medium"/>--%>
			<%--</li>--%>
			<%--<li><label>用量水泥：</label>--%>
				<%--<form:input path="dosageCement" htmlEscape="false" maxlength="15" class="input-medium"/>--%>
			<%--</li>--%>
			<%--<li><label>用量骨料1：</label>--%>
				<%--<form:input path="dosageAg1" htmlEscape="false" maxlength="15" class="input-medium"/>--%>
			<%--</li>--%>
			<%--<li><label>用量骨料2：</label>--%>
				<%--<form:input path="dosageAg2" htmlEscape="false" maxlength="15" class="input-medium"/>--%>
			<%--</li>--%>
			<%--<li><label>用量骨料3：</label>--%>
				<%--<form:input path="dosageAg3" htmlEscape="false" maxlength="15" class="input-medium"/>--%>
			<%--</li>--%>
			<%--<li><label>用量骨料4：</label>--%>
				<%--<form:input path="dosageAg4" htmlEscape="false" maxlength="15" class="input-medium"/>--%>
			<%--</li>--%>
			<%--<li><label>用量粉煤灰：</label>--%>
				<%--<form:input path="dosageFlyash" htmlEscape="false" maxlength="15" class="input-medium"/>--%>
			<%--</li>--%>
			<%--<li><label>用量矿粉：</label>--%>
				<%--<form:input path="dosageBreeze" htmlEscape="false" maxlength="15" class="input-medium"/>--%>
			<%--</li>--%>
			<%--<li><label>用量外加剂1：</label>--%>
				<%--<form:input path="dosageAdd1" htmlEscape="false" maxlength="15" class="input-medium"/>--%>
			<%--</li>--%>
			<%--<li><label>用量外加剂2：</label>--%>
				<%--<form:input path="dosageAdd2" htmlEscape="false" maxlength="15" class="input-medium"/>--%>
			<%--</li>--%>
			<%--<li><label>用量备用一：</label>--%>
				<%--<form:input path="dosageBackup1" htmlEscape="false" maxlength="15" class="input-medium"/>--%>
			<%--</li>--%>
			<%--<li><label>用量污水：</label>--%>
				<%--<form:input path="dosageSlops" htmlEscape="false" maxlength="15" class="input-medium"/>--%>
			<%--</li>--%>
			<%--<li><label>掺量水：</label>--%>
				<%--<form:input path="propWater" htmlEscape="false" maxlength="15" class="input-medium"/>--%>
			<%--</li>--%>
			<%--<li><label>掺量水泥：</label>--%>
				<%--<form:input path="propCement" htmlEscape="false" maxlength="15" class="input-medium"/>--%>
			<%--</li>--%>
			<%--<li><label>掺量骨料1：</label>--%>
				<%--<form:input path="propAg1" htmlEscape="false" maxlength="15" class="input-medium"/>--%>
			<%--</li>--%>
			<%--<li><label>掺量骨料2：</label>--%>
				<%--<form:input path="propAg2" htmlEscape="false" maxlength="15" class="input-medium"/>--%>
			<%--</li>--%>
			<%--<li><label>掺量骨料3：</label>--%>
				<%--<form:input path="propAg3" htmlEscape="false" maxlength="15" class="input-medium"/>--%>
			<%--</li>--%>
			<%--<li><label>掺量骨料4：</label>--%>
				<%--<form:input path="propAg4" htmlEscape="false" maxlength="15" class="input-medium"/>--%>
			<%--</li>--%>
			<%--<li><label>掺量粉煤灰：</label>--%>
				<%--<form:input path="propFlyash" htmlEscape="false" maxlength="15" class="input-medium"/>--%>
			<%--</li>--%>
			<%--<li><label>掺量矿粉：</label>--%>
				<%--<form:input path="propBreeze" htmlEscape="false" maxlength="15" class="input-medium"/>--%>
			<%--</li>--%>
			<%--<li><label>掺量外加剂1：</label>--%>
				<%--<form:input path="propAdd1" htmlEscape="false" maxlength="15" class="input-medium"/>--%>
			<%--</li>--%>
			<%--<li><label>掺量外加剂2：</label>--%>
				<%--<form:input path="propAdd2" htmlEscape="false" maxlength="15" class="input-medium"/>--%>
			<%--</li>--%>
			<%--<li><label>掺量备用一：</label>--%>
				<%--<form:input path="propBackup1" htmlEscape="false" maxlength="15" class="input-medium"/>--%>
			<%--</li>--%>
			<%--<li><label>掺量污水：</label>--%>
				<%--<form:input path="propSlops" htmlEscape="false" maxlength="15" class="input-medium"/>--%>
			<%--</li>--%>
			<%--<li><label>单价水：</label>--%>
				<%--<form:input path="priceWater" htmlEscape="false" maxlength="15" class="input-medium"/>--%>
			<%--</li>--%>
			<%--<li><label>单价水泥：</label>--%>
				<%--<form:input path="priceCement" htmlEscape="false" maxlength="15" class="input-medium"/>--%>
			<%--</li>--%>
			<%--<li><label>单价骨料1：</label>--%>
				<%--<form:input path="priceAg1" htmlEscape="false" maxlength="15" class="input-medium"/>--%>
			<%--</li>--%>
			<%--<li><label>单价骨料2：</label>--%>
				<%--<form:input path="priceAg2" htmlEscape="false" maxlength="15" class="input-medium"/>--%>
			<%--</li>--%>
			<%--<li><label>单价骨料3：</label>--%>
				<%--<form:input path="priceAg3" htmlEscape="false" maxlength="15" class="input-medium"/>--%>
			<%--</li>--%>
			<%--<li><label>单价骨料4：</label>--%>
				<%--<form:input path="priceAg4" htmlEscape="false" maxlength="15" class="input-medium"/>--%>
			<%--</li>--%>
			<%--<li><label>单价粉煤灰：</label>--%>
				<%--<form:input path="priceFlyash" htmlEscape="false" maxlength="15" class="input-medium"/>--%>
			<%--</li>--%>
			<%--<li><label>单价矿粉：</label>--%>
				<%--<form:input path="priceBreeze" htmlEscape="false" maxlength="15" class="input-medium"/>--%>
			<%--</li>--%>
			<%--<li><label>单价外加剂1：</label>--%>
				<%--<form:input path="priceAdd1" htmlEscape="false" maxlength="15" class="input-medium"/>--%>
			<%--</li>--%>
			<%--<li><label>单价外加剂2：</label>--%>
				<%--<form:input path="priceAdd2" htmlEscape="false" maxlength="15" class="input-medium"/>--%>
			<%--</li>--%>
			<%--<li><label>单价备用一：</label>--%>
				<%--<form:input path="priceBackup1" htmlEscape="false" maxlength="15" class="input-medium"/>--%>
			<%--</li>--%>
			<%--<li><label>单价污水：</label>--%>
				<%--<form:input path="priceSlops" htmlEscape="false" maxlength="15" class="input-medium"/>--%>
			<%--</li>--%>
			<%--<li><label>金额水：</label>--%>
				<%--<form:input path="amountWater" htmlEscape="false" maxlength="15" class="input-medium"/>--%>
			<%--</li>--%>
			<%--<li><label>金额水泥：</label>--%>
				<%--<form:input path="amountCement" htmlEscape="false" maxlength="15" class="input-medium"/>--%>
			<%--</li>--%>
			<%--<li><label>金额骨料1：</label>--%>
				<%--<form:input path="amountAg1" htmlEscape="false" maxlength="15" class="input-medium"/>--%>
			<%--</li>--%>
			<%--<li><label>金额骨料2：</label>--%>
				<%--<form:input path="amountAg2" htmlEscape="false" maxlength="15" class="input-medium"/>--%>
			<%--</li>--%>
			<%--<li><label>金额骨料3：</label>--%>
				<%--<form:input path="amountAg3" htmlEscape="false" maxlength="15" class="input-medium"/>--%>
			<%--</li>--%>
			<%--<li><label>金额骨料4：</label>--%>
				<%--<form:input path="amountAg4" htmlEscape="false" maxlength="15" class="input-medium"/>--%>
			<%--</li>--%>
			<%--<li><label>金额粉煤灰：</label>--%>
				<%--<form:input path="amountFlyash" htmlEscape="false" maxlength="15" class="input-medium"/>--%>
			<%--</li>--%>
			<%--<li><label>金额矿粉：</label>--%>
				<%--<form:input path="amountBreeze" htmlEscape="false" maxlength="15" class="input-medium"/>--%>
			<%--</li>--%>
			<%--<li><label>金额外加剂1：</label>--%>
				<%--<form:input path="amountAdd1" htmlEscape="false" maxlength="15" class="input-medium"/>--%>
			<%--</li>--%>
			<%--<li><label>金额外加剂2：</label>--%>
				<%--<form:input path="amountAdd2" htmlEscape="false" maxlength="15" class="input-medium"/>--%>
			<%--</li>--%>
			<%--<li><label>金额备用一：</label>--%>
				<%--<form:input path="amountBackup1" htmlEscape="false" maxlength="15" class="input-medium"/>--%>
			<%--</li>--%>
			<%--<li><label>金额污水：</label>--%>
				<%--<form:input path="amountSlops" htmlEscape="false" maxlength="15" class="input-medium"/>--%>
			<%--</li>--%>
			<%--<li><label>制单人：</label>--%>
				<%--<form:input path="createPerson" htmlEscape="false" maxlength="60" class="input-medium"/>--%>
			<%--</li>--%>
			<%--<li><label>审核人：</label>--%>
				<%--<form:input path="checkPerson" htmlEscape="false" maxlength="60" class="input-medium"/>--%>
			<%--</li>--%>
			<%--<li><label>制单日期：</label>--%>
				<%--<input name="makeDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"--%>
					<%--value="<fmt:formatDate value="${coordinateRatio.makeDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"--%>
					<%--onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>--%>
			<%--</li>--%>
			<%--<li><label>审核日期：</label>--%>
				<%--<input name="checkDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"--%>
					<%--value="<fmt:formatDate value="${coordinateRatio.checkDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"--%>
					<%--onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>--%>
			<%--</li>--%>
			<%--<li><label>成本：</label>--%>
				<%--<form:input path="ratioCost" htmlEscape="false" maxlength="15" class="input-medium"/>--%>
			<%--</li>--%>
			<%--<li><label>负责人：</label>--%>
				<%--<form:input path="ratioOwner" htmlEscape="false" maxlength="60" class="input-medium"/>--%>
			<%--</li>--%>
			<%--<li><label>备注：</label>--%>
				<%--<form:input path="ratioRemark" htmlEscape="false" maxlength="200" class="input-medium"/>--%>
			<%--</li>--%>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>配合比编号</th>
				<th>品种名称</th>
				<th>试验日期</th>
				<th>水胶比</th>
				<th>砂率</th>
				<th>坍落度</th>
				<th>起始容重</th>
				<th>终止容重</th>
				<th>材料品种水</th>
				<th>材料品种水泥</th>
				<th>材料品种骨料1</th>
				<th>材料品种骨料2</th>
				<th>材料品种骨料3</th>
				<th>材料品种骨料4</th>
				<th>材料品种粉煤灰</th>
				<th>材料品种矿粉</th>
				<th>材料品种外加剂1</th>
				<th>材料品种外加剂2</th>
				<th>材料品种备用一</th>
				<th>材料品种污水</th>
				<th>用量水</th>
				<th>用量水泥</th>
				<th>用量骨料1</th>
				<th>用量骨料2</th>
				<th>用量骨料3</th>
				<th>用量骨料4</th>
				<th>用量粉煤灰</th>
				<th>用量矿粉</th>
				<th>用量外加剂1</th>
				<th>用量外加剂2</th>
				<th>用量备用一</th>
				<th>用量污水</th>
				<th>掺量水</th>
				<th>掺量水泥</th>
				<th>掺量骨料1</th>
				<th>掺量骨料2</th>
				<th>掺量骨料3</th>
				<th>掺量骨料4</th>
				<th>掺量粉煤灰</th>
				<th>掺量矿粉</th>
				<th>掺量外加剂1</th>
				<th>掺量外加剂2</th>
				<th>掺量备用一</th>
				<th>掺量污水</th>
				<th>单价水</th>
				<th>单价水泥</th>
				<th>单价骨料1</th>
				<th>单价骨料2</th>
				<th>单价骨料3</th>
				<th>单价骨料4</th>
				<th>单价粉煤灰</th>
				<th>单价矿粉</th>
				<th>单价外加剂1</th>
				<th>单价外加剂2</th>
				<th>单价备用一</th>
				<th>单价污水</th>
				<th>金额水</th>
				<th>金额水泥</th>
				<th>金额骨料1</th>
				<th>金额骨料2</th>
				<th>金额骨料3</th>
				<th>金额骨料4</th>
				<th>金额粉煤灰</th>
				<th>金额矿粉</th>
				<th>金额外加剂1</th>
				<th>金额外加剂2</th>
				<th>金额备用一</th>
				<th>金额污水</th>
				<th>制单人</th>
				<th>审核人</th>
				<th>制单日期</th>
				<th>审核日期</th>
				<th>成本</th>
				<th>负责人</th>
				<th>备注</th>
				<shiro:hasPermission name="produces:coordinateRatio:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="coordinateRatio">
			<tr>
				<td><a href="${ctx}/produces/coordinateRatio/form?id=${coordinateRatio.id}">
					${coordinateRatio.ratioCode}
				</a></td>
				<td>
					${coordinateRatio.kindName}
				</td>
				<td>
					${coordinateRatio.testDate}
				</td>
				<td>
					${coordinateRatio.waterRatio}
				</td>
				<td>
					${coordinateRatio.sandRatio}
				</td>
				<td>
					${coordinateRatio.slumps}
				</td>
				<td>
					${coordinateRatio.startcapacity}
				</td>
				<td>
					${coordinateRatio.endCapacity}
				</td>
				<td>
					${coordinateRatio.kindWater}
				</td>
				<td>
					${coordinateRatio.kindCement}
				</td>
				<td>
					${coordinateRatio.kindAg1}
				</td>
				<td>
					${coordinateRatio.kindAg2}
				</td>
				<td>
					${coordinateRatio.kindAg3}
				</td>
				<td>
					${coordinateRatio.kindAg4}
				</td>
				<td>
					${coordinateRatio.kindFlyash}
				</td>
				<td>
					${coordinateRatio.kindBreeze}
				</td>
				<td>
					${coordinateRatio.kindAdd1}
				</td>
				<td>
					${coordinateRatio.kindAdd2}
				</td>
				<td>
					${coordinateRatio.kindBackup1}
				</td>
				<td>
					${coordinateRatio.kindSlops}
				</td>
				<td>
					${coordinateRatio.dosageWater}
				</td>
				<td>
					${coordinateRatio.dosageCement}
				</td>
				<td>
					${coordinateRatio.dosageAg1}
				</td>
				<td>
					${coordinateRatio.dosageAg2}
				</td>
				<td>
					${coordinateRatio.dosageAg3}
				</td>
				<td>
					${coordinateRatio.dosageAg4}
				</td>
				<td>
					${coordinateRatio.dosageFlyash}
				</td>
				<td>
					${coordinateRatio.dosageBreeze}
				</td>
				<td>
					${coordinateRatio.dosageAdd1}
				</td>
				<td>
					${coordinateRatio.dosageAdd2}
				</td>
				<td>
					${coordinateRatio.dosageBackup1}
				</td>
				<td>
					${coordinateRatio.dosageSlops}
				</td>
				<td>
					${coordinateRatio.propWater}
				</td>
				<td>
					${coordinateRatio.propCement}
				</td>
				<td>
					${coordinateRatio.propAg1}
				</td>
				<td>
					${coordinateRatio.propAg2}
				</td>
				<td>
					${coordinateRatio.propAg3}
				</td>
				<td>
					${coordinateRatio.propAg4}
				</td>
				<td>
					${coordinateRatio.propFlyash}
				</td>
				<td>
					${coordinateRatio.propBreeze}
				</td>
				<td>
					${coordinateRatio.propAdd1}
				</td>
				<td>
					${coordinateRatio.propAdd2}
				</td>
				<td>
					${coordinateRatio.propBackup1}
				</td>
				<td>
					${coordinateRatio.propSlops}
				</td>
				<td>
					${coordinateRatio.priceWater}
				</td>
				<td>
					${coordinateRatio.priceCement}
				</td>
				<td>
					${coordinateRatio.priceAg1}
				</td>
				<td>
					${coordinateRatio.priceAg2}
				</td>
				<td>
					${coordinateRatio.priceAg3}
				</td>
				<td>
					${coordinateRatio.priceAg4}
				</td>
				<td>
					${coordinateRatio.priceFlyash}
				</td>
				<td>
					${coordinateRatio.priceBreeze}
				</td>
				<td>
					${coordinateRatio.priceAdd1}
				</td>
				<td>
					${coordinateRatio.priceAdd2}
				</td>
				<td>
					${coordinateRatio.priceBackup1}
				</td>
				<td>
					${coordinateRatio.priceSlops}
				</td>
				<td>
					${coordinateRatio.amountWater}
				</td>
				<td>
					${coordinateRatio.amountCement}
				</td>
				<td>
					${coordinateRatio.amountAg1}
				</td>
				<td>
					${coordinateRatio.amountAg2}
				</td>
				<td>
					${coordinateRatio.amountAg3}
				</td>
				<td>
					${coordinateRatio.amountAg4}
				</td>
				<td>
					${coordinateRatio.amountFlyash}
				</td>
				<td>
					${coordinateRatio.amountBreeze}
				</td>
				<td>
					${coordinateRatio.amountAdd1}
				</td>
				<td>
					${coordinateRatio.amountAdd2}
				</td>
				<td>
					${coordinateRatio.amountBackup1}
				</td>
				<td>
					${coordinateRatio.amountSlops}
				</td>
				<td>
					${coordinateRatio.createPerson}
				</td>
				<td>
					${coordinateRatio.checkPerson}
				</td>
				<td>
					${coordinateRatio.makeDate}
				</td>
				<td>
					${coordinateRatio.checkDate}
				</td>
				<td>
					${coordinateRatio.ratioCost}
				</td>
				<td>
					${coordinateRatio.docOfficework.officeworkName}
				</td>
				<td>
					${coordinateRatio.ratioRemark}
				</td>
				<shiro:hasPermission name="produces:coordinateRatio:edit"><td>
    				<a href="${ctx}/produces/coordinateRatio/form?id=${coordinateRatio.id}">修改</a>
					<a href="${ctx}/produces/coordinateRatio/delete?id=${coordinateRatio.id}" onclick="return confirmx('确认要删除该配合比系列表吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>