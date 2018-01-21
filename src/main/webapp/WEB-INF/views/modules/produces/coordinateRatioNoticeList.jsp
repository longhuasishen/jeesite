<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>配合比通知单管理</title>
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
		<li class="active"><a href="${ctx}/produces/coordinateRatioNotice/">配合比通知单列表</a></li>
		<shiro:hasPermission name="produces:coordinateRatioNotice:edit"><li><a href="${ctx}/produces/coordinateRatioNotice/form">配合比通知单添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="coordinateRatioNotice" action="${ctx}/produces/coordinateRatioNotice/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<%--<li><label>生产通知单编号：</label>--%>
				<%--<form:input path="noticeNo" htmlEscape="false" maxlength="32" class="input-medium"/>--%>
			<%--</li>--%>
			<%--<li><label>配合比编号：</label>--%>
				<%--<form:input path="ratioCode" htmlEscape="false" maxlength="20" class="input-medium"/>--%>
			<%--</li>--%>
			<%--<li><label>配合比通知单编号：</label>--%>
				<%--<form:input path="ratioNoticeCode" htmlEscape="false" maxlength="20" class="input-medium"/>--%>
			<%--</li>--%>
			<li><label>施工日期：</label>
				<input id="goodsDate"  name="goodsDate"  type="text" readonly="readonly" maxlength="20" class="Wdate required" style="width:163px;"
					   value="${coordinateRatioNotice.goodsDate}"
					   onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});"/>
			</li>
			<li><label>状态：</label>
				<form:select path="noticeStatus" class="input-xlarge ">
					<form:options items="${fns:getDictList('notice_status')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</li>
			<li><label>搅拌站号：</label>
				<form:input path="mixingStation" htmlEscape="false" maxlength="200" class="input-medium"/>
			</li>
			<%--<li><label>配合比通知单编号：</label>--%>
				<%--<form:input path="noticeMixing" htmlEscape="false" maxlength="20" class="input-medium"/>--%>
			<%--</li>--%>
			<%--<li><label>泵名称：</label>--%>
				<%--<form:input path="bengName" htmlEscape="false" maxlength="20" class="input-medium"/>--%>
			<%--</li>--%>
			<%--<li><label>客户名称：</label>--%>
				<%--<form:input path="customName" htmlEscape="false" maxlength="60" class="input-medium"/>--%>
			<%--</li>--%>
			<%--<li><label>工程名称：</label>--%>
				<%--<form:input path="projectName" htmlEscape="false" maxlength="60" class="input-medium"/>--%>
			<%--</li>--%>
			<%--<li><label>强度等级：</label>--%>
				<%--<form:input path="concreteName" htmlEscape="false" maxlength="60" class="input-medium"/>--%>
			<%--</li>--%>
			<%--<li><label>要货数量：</label>--%>
				<%--<form:input path="goodsCount" htmlEscape="false" maxlength="20" class="input-medium"/>--%>
			<%--</li>--%>
			<%--<li><label>特殊要求：</label>--%>
				<%--<form:input path="specialRequire" htmlEscape="false" maxlength="60" class="input-medium"/>--%>
			<%--</li>--%>
			<%--<li><label>施工部位：</label>--%>
				<%--<form:input path="buildSite" htmlEscape="false" maxlength="30" class="input-medium"/>--%>
			<%--</li>--%>
			<%--<li><label>浇灌方法：</label>--%>
				<%--<form:input path="waterMeth" htmlEscape="false" maxlength="60" class="input-medium"/>--%>
			<%--</li>--%>
			<%--<li><label>备注：</label>--%>
				<%--<form:input path="noticeRemark" htmlEscape="false" maxlength="200" class="input-medium"/>--%>
			<%--</li>--%>
			<%--<li><label>搅拌时间：</label>--%>
				<%--<form:input path="mixingTime" htmlEscape="false" maxlength="20" class="input-medium"/>--%>
			<%--</li>--%>
			<%--<li><label>搅拌系统编号：</label>--%>
				<%--<form:input path="mixingNo" htmlEscape="false" maxlength="32" class="input-medium"/>--%>
			<%--</li>--%>
			<%--<li><label>抗渗等级：</label>--%>
				<%--<form:input path="imperviousLevel" htmlEscape="false" maxlength="20" class="input-medium"/>--%>
			<%--</li>--%>
			<%--<li><label>抗折强度：</label>--%>
				<%--<form:input path="flexuralLevel" htmlEscape="false" maxlength="20" class="input-medium"/>--%>
			<%--</li>--%>
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
			<%--<li><label>仓库水：</label>--%>
				<%--<form:input path="repeWater" htmlEscape="false" maxlength="50" class="input-medium"/>--%>
			<%--</li>--%>
			<%--<li><label>用量水：</label>--%>
				<%--<form:input path="dosageWater" htmlEscape="false" maxlength="15" class="input-medium"/>--%>
			<%--</li>--%>
			<%--<li><label>用量水泥：</label>--%>
				<%--<form:input path="dosageCement" htmlEscape="false" maxlength="15" class="input-medium"/>--%>
			<%--</li>--%>
			<%--<li><label>仓库水泥：</label>--%>
				<%--<form:input path="repeCement" htmlEscape="false" maxlength="50" class="input-medium"/>--%>
			<%--</li>--%>
			<%--<li><label>仓库骨料1：</label>--%>
				<%--<form:input path="repeAg1" htmlEscape="false" maxlength="50" class="input-medium"/>--%>
			<%--</li>--%>
			<%--<li><label>用量骨料1：</label>--%>
				<%--<form:input path="dosageAg1" htmlEscape="false" maxlength="15" class="input-medium"/>--%>
			<%--</li>--%>
			<%--<li><label>用量骨料2：</label>--%>
				<%--<form:input path="dosageAg2" htmlEscape="false" maxlength="15" class="input-medium"/>--%>
			<%--</li>--%>
			<%--<li><label>仓库骨料2：</label>--%>
				<%--<form:input path="repeAg2" htmlEscape="false" maxlength="50" class="input-medium"/>--%>
			<%--</li>--%>
			<%--<li><label>用量骨料3：</label>--%>
				<%--<form:input path="dosageAg3" htmlEscape="false" maxlength="15" class="input-medium"/>--%>
			<%--</li>--%>
			<%--<li><label>仓库骨料3：</label>--%>
				<%--<form:input path="repeAg3" htmlEscape="false" maxlength="50" class="input-medium"/>--%>
			<%--</li>--%>
			<%--<li><label>仓库骨料4：</label>--%>
				<%--<form:input path="repeAg4" htmlEscape="false" maxlength="50" class="input-medium"/>--%>
			<%--</li>--%>
			<%--<li><label>用量骨料4：</label>--%>
				<%--<form:input path="dosageAg4" htmlEscape="false" maxlength="15" class="input-medium"/>--%>
			<%--</li>--%>
			<%--<li><label>仓库粉煤灰：</label>--%>
				<%--<form:input path="repeFlyash" htmlEscape="false" maxlength="50" class="input-medium"/>--%>
			<%--</li>--%>
			<%--<li><label>用量粉煤灰：</label>--%>
				<%--<form:input path="dosageFlyash" htmlEscape="false" maxlength="15" class="input-medium"/>--%>
			<%--</li>--%>
			<%--<li><label>仓库矿粉：</label>--%>
				<%--<form:input path="repeBreeze" htmlEscape="false" maxlength="50" class="input-medium"/>--%>
			<%--</li>--%>
			<%--<li><label>用量矿粉：</label>--%>
				<%--<form:input path="dosageBreeze" htmlEscape="false" maxlength="15" class="input-medium"/>--%>
			<%--</li>--%>
			<%--<li><label>仓库外加剂1：</label>--%>
				<%--<form:input path="repeAdd1" htmlEscape="false" maxlength="50" class="input-medium"/>--%>
			<%--</li>--%>
			<%--<li><label>用量外加剂1：</label>--%>
				<%--<form:input path="dosageAdd1" htmlEscape="false" maxlength="15" class="input-medium"/>--%>
			<%--</li>--%>
			<%--<li><label>用量外加剂2：</label>--%>
				<%--<form:input path="dosageAdd2" htmlEscape="false" maxlength="15" class="input-medium"/>--%>
			<%--</li>--%>
			<%--<li><label>仓库外加剂2：</label>--%>
				<%--<form:input path="repeAdd2" htmlEscape="false" maxlength="50" class="input-medium"/>--%>
			<%--</li>--%>
			<%--<li><label>仓库备用一：</label>--%>
				<%--<form:input path="repeBackup1" htmlEscape="false" maxlength="50" class="input-medium"/>--%>
			<%--</li>--%>
			<%--<li><label>用量备用一：</label>--%>
				<%--<form:input path="dosageBackup1" htmlEscape="false" maxlength="15" class="input-medium"/>--%>
			<%--</li>--%>
			<%--<li><label>用量污水：</label>--%>
				<%--<form:input path="dosageSlops" htmlEscape="false" maxlength="15" class="input-medium"/>--%>
			<%--</li>--%>
			<%--<li><label>仓库污水：</label>--%>
				<%--<form:input path="repeSlops" htmlEscape="false" maxlength="50" class="input-medium"/>--%>
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
			<%--<li><label>含水率水：</label>--%>
				<%--<form:input path="primageWater" htmlEscape="false" maxlength="15" class="input-medium"/>--%>
			<%--</li>--%>
			<%--<li><label>含水率水泥：</label>--%>
				<%--<form:input path="primageCement" htmlEscape="false" maxlength="15" class="input-medium"/>--%>
			<%--</li>--%>
			<%--<li><label>含水率骨料1：</label>--%>
				<%--<form:input path="primageAg1" htmlEscape="false" maxlength="15" class="input-medium"/>--%>
			<%--</li>--%>
			<%--<li><label>含水率骨料2：</label>--%>
				<%--<form:input path="primageAg2" htmlEscape="false" maxlength="15" class="input-medium"/>--%>
			<%--</li>--%>
			<%--<li><label>含水率骨料3：</label>--%>
				<%--<form:input path="primageAg3" htmlEscape="false" maxlength="15" class="input-medium"/>--%>
			<%--</li>--%>
			<%--<li><label>含水率骨料4：</label>--%>
				<%--<form:input path="primageAg4" htmlEscape="false" maxlength="15" class="input-medium"/>--%>
			<%--</li>--%>
			<%--<li><label>含水率粉煤灰：</label>--%>
				<%--<form:input path="primageFlyash" htmlEscape="false" maxlength="15" class="input-medium"/>--%>
			<%--</li>--%>
			<%--<li><label>含水率矿粉：</label>--%>
				<%--<form:input path="primageBreeze" htmlEscape="false" maxlength="15" class="input-medium"/>--%>
			<%--</li>--%>
			<%--<li><label>含水率外加剂1：</label>--%>
				<%--<form:input path="primageAdd1" htmlEscape="false" maxlength="15" class="input-medium"/>--%>
			<%--</li>--%>
			<%--<li><label>含水率外加剂2：</label>--%>
				<%--<form:input path="primageAdd2" htmlEscape="false" maxlength="15" class="input-medium"/>--%>
			<%--</li>--%>
			<%--<li><label>含水率备用一：</label>--%>
				<%--<form:input path="primageBackup1" htmlEscape="false" maxlength="15" class="input-medium"/>--%>
			<%--</li>--%>
			<%--<li><label>含水率污水：</label>--%>
				<%--<form:input path="primageSlops" htmlEscape="false" maxlength="15" class="input-medium"/>--%>
			<%--</li>--%>
			<%--<li><label>水重水：</label>--%>
				<%--<form:input path="weightWater" htmlEscape="false" maxlength="15" class="input-medium"/>--%>
			<%--</li>--%>
			<%--<li><label>水重水泥：</label>--%>
				<%--<form:input path="weightCement" htmlEscape="false" maxlength="15" class="input-medium"/>--%>
			<%--</li>--%>
			<%--<li><label>水重骨料1：</label>--%>
				<%--<form:input path="weightAg1" htmlEscape="false" maxlength="15" class="input-medium"/>--%>
			<%--</li>--%>
			<%--<li><label>水重骨料2：</label>--%>
				<%--<form:input path="weightAg2" htmlEscape="false" maxlength="15" class="input-medium"/>--%>
			<%--</li>--%>
			<%--<li><label>水重骨料3：</label>--%>
				<%--<form:input path="weightAg3" htmlEscape="false" maxlength="15" class="input-medium"/>--%>
			<%--</li>--%>
			<%--<li><label>水重骨料4：</label>--%>
				<%--<form:input path="weightAg4" htmlEscape="false" maxlength="15" class="input-medium"/>--%>
			<%--</li>--%>
			<%--<li><label>水重粉煤灰：</label>--%>
				<%--<form:input path="weightFlyash" htmlEscape="false" maxlength="15" class="input-medium"/>--%>
			<%--</li>--%>
			<%--<li><label>水重矿粉：</label>--%>
				<%--<form:input path="weightBreeze" htmlEscape="false" maxlength="15" class="input-medium"/>--%>
			<%--</li>--%>
			<%--<li><label>水重外加剂1：</label>--%>
				<%--<form:input path="weightAdd1" htmlEscape="false" maxlength="15" class="input-medium"/>--%>
			<%--</li>--%>
			<%--<li><label>水重外加剂2：</label>--%>
				<%--<form:input path="weightAdd2" htmlEscape="false" maxlength="15" class="input-medium"/>--%>
			<%--</li>--%>
			<%--<li><label>水重备用一：</label>--%>
				<%--<form:input path="weightBackup1" htmlEscape="false" maxlength="15" class="input-medium"/>--%>
			<%--</li>--%>
			<%--<li><label>水重污水：</label>--%>
				<%--<form:input path="weightSlops" htmlEscape="false" maxlength="15" class="input-medium"/>--%>
			<%--</li>--%>
			<%--<li><label>湿量水：</label>--%>
				<%--<form:input path="wetweightWater" htmlEscape="false" maxlength="15" class="input-medium"/>--%>
			<%--</li>--%>
			<%--<li><label>湿量水泥：</label>--%>
				<%--<form:input path="wetweightCement" htmlEscape="false" maxlength="15" class="input-medium"/>--%>
			<%--</li>--%>
			<%--<li><label>湿量骨料1：</label>--%>
				<%--<form:input path="wetweightAg1" htmlEscape="false" maxlength="15" class="input-medium"/>--%>
			<%--</li>--%>
			<%--<li><label>湿量骨料2：</label>--%>
				<%--<form:input path="wetweightAg2" htmlEscape="false" maxlength="15" class="input-medium"/>--%>
			<%--</li>--%>
			<%--<li><label>湿量骨料3：</label>--%>
				<%--<form:input path="wetweightAg3" htmlEscape="false" maxlength="15" class="input-medium"/>--%>
			<%--</li>--%>
			<%--<li><label>湿量骨料4：</label>--%>
				<%--<form:input path="wetweightAg4" htmlEscape="false" maxlength="15" class="input-medium"/>--%>
			<%--</li>--%>
			<%--<li><label>湿量粉煤灰：</label>--%>
				<%--<form:input path="wetweightFlyash" htmlEscape="false" maxlength="15" class="input-medium"/>--%>
			<%--</li>--%>
			<%--<li><label>湿量矿粉：</label>--%>
				<%--<form:input path="wetweightBreeze" htmlEscape="false" maxlength="15" class="input-medium"/>--%>
			<%--</li>--%>
			<%--<li><label>湿量外加剂1：</label>--%>
				<%--<form:input path="wetweightAdd1" htmlEscape="false" maxlength="15" class="input-medium"/>--%>
			<%--</li>--%>
			<%--<li><label>湿量外加剂2：</label>--%>
				<%--<form:input path="wetweightAdd2" htmlEscape="false" maxlength="15" class="input-medium"/>--%>
			<%--</li>--%>
			<%--<li><label>湿量备用一：</label>--%>
				<%--<form:input path="wetweightBackup1" htmlEscape="false" maxlength="15" class="input-medium"/>--%>
			<%--</li>--%>
			<%--<li><label>湿量污水：</label>--%>
				<%--<form:input path="wetweightSlops" htmlEscape="false" maxlength="15" class="input-medium"/>--%>
			<%--</li>--%>
			<%--<li><label>抗压数量：</label>--%>
				<%--<form:input path="resistCount" htmlEscape="false" maxlength="10" class="input-medium"/>--%>
			<%--</li>--%>
			<%--<li><label>抗渗数量：</label>--%>
				<%--<form:input path="imperviousCount" htmlEscape="false" maxlength="10" class="input-medium"/>--%>
			<%--</li>--%>
			<%--<li><label>抗折数量：</label>--%>
				<%--<form:input path="flexuralCount" htmlEscape="false" maxlength="10" class="input-medium"/>--%>
			<%--</li>--%>
			<%--<li><label>制单人：</label>--%>
				<%--<form:input path="createPerson" htmlEscape="false" maxlength="60" class="input-medium"/>--%>
			<%--</li>--%>
			<%--<li><label>审核人：</label>--%>
				<%--<form:input path="checkPerson" htmlEscape="false" maxlength="60" class="input-medium"/>--%>
			<%--</li>--%>
			<%--<li><label>作废人：</label>--%>
				<%--<form:input path="cancelPerson" htmlEscape="false" maxlength="60" class="input-medium"/>--%>
			<%--</li>--%>
			<%--<li><label>制单日期：</label>--%>
				<%--<form:input path="makeDate" htmlEscape="false" maxlength="20" class="input-medium"/>--%>
			<%--</li>--%>
			<%--<li><label>审核日期：</label>--%>
				<%--<form:input path="checkDate" htmlEscape="false" maxlength="20" class="input-medium"/>--%>
			<%--</li>--%>
			<%--<li><label>作废日期：</label>--%>
				<%--<form:input path="cancelDate" htmlEscape="false" maxlength="20" class="input-medium"/>--%>
			<%--</li>--%>
			<%--<li><label>调整人：</label>--%>
				<%--<form:input path="modifyPerson" htmlEscape="false" maxlength="60" class="input-medium"/>--%>
			<%--</li>--%>
			<%--<li><label>负责人：</label>--%>
				<%--<form:input path="noticeOwner" htmlEscape="false" maxlength="60" class="input-medium"/>--%>
			<%--</li>--%>
			<%--<li><label>备注：</label>--%>
				<%--<form:input path="currRemark" htmlEscape="false" maxlength="200" class="input-medium"/>--%>
			<%--</li>--%>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>生产通知单编号</th>
				<th>配合比编号</th>
				<th>配合比通知单编号</th>
				<th>通知单状态</th>
				<th>配合比通知单编号</th>
				<th>泵名称</th>
				<th>客户名称</th>
				<th>工程名称</th>
				<th>强度等级</th>
				<th>要货数量</th>
				<th>特殊要求</th>
				<th>施工部位</th>
				<th>浇灌方法</th>
				<th>施工日期</th>
				<th>备注</th>
				<th>搅拌时间</th>
				<th>搅拌系统编号</th>
				<th>抗渗等级</th>
				<th>抗折强度</th>
				<th>搅拌站号</th>
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
				<th>仓库水</th>
				<th>用量水</th>
				<th>用量水泥</th>
				<th>仓库水泥</th>
				<th>仓库骨料1</th>
				<th>用量骨料1</th>
				<th>用量骨料2</th>
				<th>仓库骨料2</th>
				<th>用量骨料3</th>
				<th>仓库骨料3</th>
				<th>仓库骨料4</th>
				<th>用量骨料4</th>
				<th>仓库粉煤灰</th>
				<th>用量粉煤灰</th>
				<th>仓库矿粉</th>
				<th>用量矿粉</th>
				<th>仓库外加剂1</th>
				<th>用量外加剂1</th>
				<th>用量外加剂2</th>
				<th>仓库外加剂2</th>
				<th>仓库备用一</th>
				<th>用量备用一</th>
				<th>用量污水</th>
				<th>仓库污水</th>
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
				<th>含水率水</th>
				<th>含水率水泥</th>
				<th>含水率骨料1</th>
				<th>含水率骨料2</th>
				<th>含水率骨料3</th>
				<th>含水率骨料4</th>
				<th>含水率粉煤灰</th>
				<th>含水率矿粉</th>
				<th>含水率外加剂1</th>
				<th>含水率外加剂2</th>
				<th>含水率备用一</th>
				<th>含水率污水</th>
				<th>水重水</th>
				<th>水重水泥</th>
				<th>水重骨料1</th>
				<th>水重骨料2</th>
				<th>水重骨料3</th>
				<th>水重骨料4</th>
				<th>水重粉煤灰</th>
				<th>水重矿粉</th>
				<th>水重外加剂1</th>
				<th>水重外加剂2</th>
				<th>水重备用一</th>
				<th>水重污水</th>
				<th>湿量水</th>
				<th>湿量水泥</th>
				<th>湿量骨料1</th>
				<th>湿量骨料2</th>
				<th>湿量骨料3</th>
				<th>湿量骨料4</th>
				<th>湿量粉煤灰</th>
				<th>湿量矿粉</th>
				<th>湿量外加剂1</th>
				<th>湿量外加剂2</th>
				<th>湿量备用一</th>
				<th>湿量污水</th>
				<th>抗压数量</th>
				<th>抗渗数量</th>
				<th>抗折数量</th>
				<th>制单人</th>
				<th>审核人</th>
				<th>作废人</th>
				<th>制单日期</th>
				<th>审核日期</th>
				<th>作废日期</th>
				<th>调整人</th>
				<th>负责人</th>
				<th>备注</th>
				<shiro:hasPermission name="produces:coordinateRatioNotice:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="coordinateRatioNotice">
			<tr>
				<td><a href="${ctx}/produces/coordinateRatioNotice/form?id=${coordinateRatioNotice.id}">
					${coordinateRatioNotice.noticeNo}
				</a></td>
				<td>
					${coordinateRatioNotice.ratioCode}
				</td>
				<td>
					${coordinateRatioNotice.ratioNoticeCode}
				</td>
				<td>
					${coordinateRatioNotice.noticeStatus}
				</td>
				<td>
					${coordinateRatioNotice.noticeMixing}
				</td>
				<td>
					${coordinateRatioNotice.bengName}
				</td>
				<td>
					${coordinateRatioNotice.customName}
				</td>
				<td>
					${coordinateRatioNotice.projectName}
				</td>
				<td>
					${coordinateRatioNotice.concreteName}
				</td>
				<td>
					${coordinateRatioNotice.goodsCount}
				</td>
				<td>
					${coordinateRatioNotice.specialRequire}
				</td>
				<td>
					${coordinateRatioNotice.buildSite}
				</td>
				<td>
					${coordinateRatioNotice.waterMeth}
				</td>
				<td>
					${coordinateRatioNotice.goodsDate}
				</td>
				<td>
					${coordinateRatioNotice.noticeRemark}
				</td>
				<td>
					${coordinateRatioNotice.mixingTime}
				</td>
				<td>
					${coordinateRatioNotice.mixingNo}
				</td>
				<td>
					${coordinateRatioNotice.imperviousLevel}
				</td>
				<td>
					${coordinateRatioNotice.flexuralLevel}
				</td>
				<td>
					${coordinateRatioNotice.mixingStation}
				</td>
				<td>
					${coordinateRatioNotice.waterRatio}
				</td>
				<td>
					${coordinateRatioNotice.sandRatio}
				</td>
				<td>
					${coordinateRatioNotice.slumps}
				</td>
				<td>
					${coordinateRatioNotice.startcapacity}
				</td>
				<td>
					${coordinateRatioNotice.endCapacity}
				</td>
				<td>
					${coordinateRatioNotice.kindWater}
				</td>
				<td>
					${coordinateRatioNotice.kindCement}
				</td>
				<td>
					${coordinateRatioNotice.kindAg1}
				</td>
				<td>
					${coordinateRatioNotice.kindAg2}
				</td>
				<td>
					${coordinateRatioNotice.kindAg3}
				</td>
				<td>
					${coordinateRatioNotice.kindAg4}
				</td>
				<td>
					${coordinateRatioNotice.kindFlyash}
				</td>
				<td>
					${coordinateRatioNotice.kindBreeze}
				</td>
				<td>
					${coordinateRatioNotice.kindAdd1}
				</td>
				<td>
					${coordinateRatioNotice.kindAdd2}
				</td>
				<td>
					${coordinateRatioNotice.kindBackup1}
				</td>
				<td>
					${coordinateRatioNotice.kindSlops}
				</td>
				<td>
					${coordinateRatioNotice.repeWater}
				</td>
				<td>
					${coordinateRatioNotice.dosageWater}
				</td>
				<td>
					${coordinateRatioNotice.dosageCement}
				</td>
				<td>
					${coordinateRatioNotice.repeCement}
				</td>
				<td>
					${coordinateRatioNotice.repeAg1}
				</td>
				<td>
					${coordinateRatioNotice.dosageAg1}
				</td>
				<td>
					${coordinateRatioNotice.dosageAg2}
				</td>
				<td>
					${coordinateRatioNotice.repeAg2}
				</td>
				<td>
					${coordinateRatioNotice.dosageAg3}
				</td>
				<td>
					${coordinateRatioNotice.repeAg3}
				</td>
				<td>
					${coordinateRatioNotice.repeAg4}
				</td>
				<td>
					${coordinateRatioNotice.dosageAg4}
				</td>
				<td>
					${coordinateRatioNotice.repeFlyash}
				</td>
				<td>
					${coordinateRatioNotice.dosageFlyash}
				</td>
				<td>
					${coordinateRatioNotice.repeBreeze}
				</td>
				<td>
					${coordinateRatioNotice.dosageBreeze}
				</td>
				<td>
					${coordinateRatioNotice.repeAdd1}
				</td>
				<td>
					${coordinateRatioNotice.dosageAdd1}
				</td>
				<td>
					${coordinateRatioNotice.dosageAdd2}
				</td>
				<td>
					${coordinateRatioNotice.repeAdd2}
				</td>
				<td>
					${coordinateRatioNotice.repeBackup1}
				</td>
				<td>
					${coordinateRatioNotice.dosageBackup1}
				</td>
				<td>
					${coordinateRatioNotice.dosageSlops}
				</td>
				<td>
					${coordinateRatioNotice.repeSlops}
				</td>
				<td>
					${coordinateRatioNotice.propWater}
				</td>
				<td>
					${coordinateRatioNotice.propCement}
				</td>
				<td>
					${coordinateRatioNotice.propAg1}
				</td>
				<td>
					${coordinateRatioNotice.propAg2}
				</td>
				<td>
					${coordinateRatioNotice.propAg3}
				</td>
				<td>
					${coordinateRatioNotice.propAg4}
				</td>
				<td>
					${coordinateRatioNotice.propFlyash}
				</td>
				<td>
					${coordinateRatioNotice.propBreeze}
				</td>
				<td>
					${coordinateRatioNotice.propAdd1}
				</td>
				<td>
					${coordinateRatioNotice.propAdd2}
				</td>
				<td>
					${coordinateRatioNotice.propBackup1}
				</td>
				<td>
					${coordinateRatioNotice.propSlops}
				</td>
				<td>
					${coordinateRatioNotice.primageWater}
				</td>
				<td>
					${coordinateRatioNotice.primageCement}
				</td>
				<td>
					${coordinateRatioNotice.primageAg1}
				</td>
				<td>
					${coordinateRatioNotice.primageAg2}
				</td>
				<td>
					${coordinateRatioNotice.primageAg3}
				</td>
				<td>
					${coordinateRatioNotice.primageAg4}
				</td>
				<td>
					${coordinateRatioNotice.primageFlyash}
				</td>
				<td>
					${coordinateRatioNotice.primageBreeze}
				</td>
				<td>
					${coordinateRatioNotice.primageAdd1}
				</td>
				<td>
					${coordinateRatioNotice.primageAdd2}
				</td>
				<td>
					${coordinateRatioNotice.primageBackup1}
				</td>
				<td>
					${coordinateRatioNotice.primageSlops}
				</td>
				<td>
					${coordinateRatioNotice.weightWater}
				</td>
				<td>
					${coordinateRatioNotice.weightCement}
				</td>
				<td>
					${coordinateRatioNotice.weightAg1}
				</td>
				<td>
					${coordinateRatioNotice.weightAg2}
				</td>
				<td>
					${coordinateRatioNotice.weightAg3}
				</td>
				<td>
					${coordinateRatioNotice.weightAg4}
				</td>
				<td>
					${coordinateRatioNotice.weightFlyash}
				</td>
				<td>
					${coordinateRatioNotice.weightBreeze}
				</td>
				<td>
					${coordinateRatioNotice.weightAdd1}
				</td>
				<td>
					${coordinateRatioNotice.weightAdd2}
				</td>
				<td>
					${coordinateRatioNotice.weightBackup1}
				</td>
				<td>
					${coordinateRatioNotice.weightSlops}
				</td>
				<td>
					${coordinateRatioNotice.wetweightWater}
				</td>
				<td>
					${coordinateRatioNotice.wetweightCement}
				</td>
				<td>
					${coordinateRatioNotice.wetweightAg1}
				</td>
				<td>
					${coordinateRatioNotice.wetweightAg2}
				</td>
				<td>
					${coordinateRatioNotice.wetweightAg3}
				</td>
				<td>
					${coordinateRatioNotice.wetweightAg4}
				</td>
				<td>
					${coordinateRatioNotice.wetweightFlyash}
				</td>
				<td>
					${coordinateRatioNotice.wetweightBreeze}
				</td>
				<td>
					${coordinateRatioNotice.wetweightAdd1}
				</td>
				<td>
					${coordinateRatioNotice.wetweightAdd2}
				</td>
				<td>
					${coordinateRatioNotice.wetweightBackup1}
				</td>
				<td>
					${coordinateRatioNotice.wetweightSlops}
				</td>
				<td>
					${coordinateRatioNotice.resistCount}
				</td>
				<td>
					${coordinateRatioNotice.imperviousCount}
				</td>
				<td>
					${coordinateRatioNotice.flexuralCount}
				</td>
				<td>
					${coordinateRatioNotice.createPerson}
				</td>
				<td>
					${coordinateRatioNotice.checkPerson}
				</td>
				<td>
					${coordinateRatioNotice.cancelPerson}
				</td>
				<td>
					${coordinateRatioNotice.makeDate}
				</td>
				<td>
					${coordinateRatioNotice.checkDate}
				</td>
				<td>
					${coordinateRatioNotice.cancelDate}
				</td>
				<td>
					${coordinateRatioNotice.modifyPerson}
				</td>
				<td>
					${coordinateRatioNotice.noticeOwner}
				</td>
				<td>
					${coordinateRatioNotice.currRemark}
				</td>
				<shiro:hasPermission name="produces:coordinateRatioNotice:edit"><td>
    				<a href="${ctx}/produces/coordinateRatioNotice/form?id=${coordinateRatioNotice.id}">修改</a>
					<a href="${ctx}/produces/coordinateRatioNotice/delete?id=${coordinateRatioNotice.id}" onclick="return confirmx('确认要删除该配合比通知单吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>