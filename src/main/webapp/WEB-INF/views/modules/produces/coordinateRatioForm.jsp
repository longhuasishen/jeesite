<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>配合比系列表管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			//$("#name").focus();
			$("#inputForm").validate({
				submitHandler: function(form){
					loading('正在提交，请稍等...');
					form.submit();
				},
				errorContainer: "#messageBox",
				errorPlacement: function(error, element) {
					$("#messageBox").text("输入有误，请先更正。");
					if (element.is(":checkbox")||element.is(":radio")||element.parent().is(".input-append")){
						error.appendTo(element.parent().parent());
					} else {
						error.insertAfter(element);
					}
				}
			});
		});
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li><a href="${ctx}/produces/coordinateRatio/">配合比系列表列表</a></li>
		<li class="active"><a href="${ctx}/produces/coordinateRatio/form?id=${coordinateRatio.id}">配合比系列表<shiro:hasPermission name="produces:coordinateRatio:edit">${not empty coordinateRatio.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="produces:coordinateRatio:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="coordinateRatio" action="${ctx}/produces/coordinateRatio/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>
	<table class="table table-striped table-bordered table-condensed">
		<tr>
			<td>
				<div class="control-group">
					<label class="control-label">配合比编号：</label>
					<div class="controls">
						<form:input path="ratioCode" htmlEscape="false" maxlength="20" class="input-xlarge required"/>
						<span class="help-inline"><font color="red">*</font> </span>
					</div>
				</div>
			</td>
			<td>
				<div class="control-group">
					<label class="control-label">品种名称：</label>
					<div class="controls">
						<sys:treeselect id="kindName" name="docConcrete.kindCode" value="${coordinateRatio.docConcrete.kindCode}" labelName="kindName" labelValue="${coordinateRatio.kindName}"
											title="原材料档案" url="/doc/docConcrete/treeData" cssClass="required" />
					</div>
				</div>
			</td>
			<td>
				<div class="control-group">
					<label class="control-label">试验日期：</label>
					<div class="controls">
						<input id="testDate"  name="testDate"  type="text" readonly="readonly" maxlength="20" class="Wdate required" style="width:163px;"
							   value="${coordinateRatio.testDate}"
							   onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'});"/>
					</div>
				</div>
			</td>
		</tr>
		<tr>
			<td>
				<div class="control-group">
					<label class="control-label">水胶比：</label>
					<div class="controls">
						<form:input path="waterRatio" htmlEscape="false" maxlength="10" class="input-xlarge "/>
					</div>
				</div>
			</td>
			<td>
				<div class="control-group">
					<label class="control-label">砂率：</label>
					<div class="controls">
						<form:input path="sandRatio" htmlEscape="false" maxlength="10" class="input-xlarge "/>
					</div>
				</div>
			</td>
			<td>
				<div class="control-group">
					<label class="control-label">坍落度：</label>
					<div class="controls">
						<form:input path="slumps" htmlEscape="false" maxlength="10" class="input-xlarge "/>
					</div>
				</div>
			</td>
		</tr>
		<tr>
			<td>
				<div class="control-group">
					<label class="control-label">起始容重：</label>
					<div class="controls">
						<form:input path="startcapacity" htmlEscape="false" maxlength="10" class="input-xlarge "/>
					</div>
				</div>
			</td>
			<td>
				<div class="control-group">
					<label class="control-label">终止容重：</label>
					<div class="controls">
						<form:input path="endCapacity" htmlEscape="false" maxlength="10" class="input-xlarge "/>
					</div>
				</div>
			</td>
		</tr>
	</table>
	<table class="table table-striped table-bordered table-condensed">
		<tr>
			<td> </td>
			<td style="text-align:center">水</td>
			<td style="text-align:center">水泥</td>
			<td style="text-align:center">骨料1</td>
			<td style="text-align:center">骨料2</td>
			<td style="text-align:center">骨料3</td>
			<td style="text-align:center">骨料4</td>
			<td style="text-align:center">粉煤灰</td>
			<td style="text-align:center">矿粉</td>
			<td style="text-align:center">外加剂1</td>
			<td style="text-align:center">外加剂2</td>
			<td style="text-align:center">备用一</td>
			<td style="text-align:center">污水</td>
		</tr>
		<tr>
			<td style="text-align:center">材料品种</td>
			<td><sys:treeselect id="kindWater" name="docConcrete.kindCode" value="${coordinateRatio.docConcrete.kindCode}" labelName="kindWater" labelValue="${coordinateRatio.kindWater}"
								title="原材料档案" url="/doc/docConcrete/treeData" cssClass="required" cssStyle="width:60px"/>
			</td>
			<td><sys:treeselect id="kindCement" name="docConcrete.kindCode" value="${coordinateRatio.docConcrete.kindCode}" labelName="kindCement" labelValue="${coordinateRatio.kindCement}"
								title="原材料档案" url="/doc/docConcrete/treeData" cssClass="required" cssStyle="width:60px"/>
			</td>
			<td><sys:treeselect id="kindAg1" name="docConcrete.kindCode" value="${coordinateRatio.docConcrete.kindCode}" labelName="kindAg1" labelValue="${coordinateRatio.kindAg1}"
								title="原材料档案" url="/doc/docConcrete/treeData" cssClass="required" cssStyle="width:60px"/>
			</td>
			<td><sys:treeselect id="kindAg2" name="docConcrete.kindCode" value="${coordinateRatio.docConcrete.kindCode}" labelName="kindAg2" labelValue="${coordinateRatio.kindAg2}"
								title="原材料档案" url="/doc/docConcrete/treeData" cssClass="required" cssStyle="width:60px"/>
			</td>
			<td><sys:treeselect id="kindAg3" name="docConcrete.kindCode" value="${coordinateRatio.docConcrete.kindCode}" labelName="kindAg3" labelValue="${coordinateRatio.kindAg3}"
								title="原材料档案" url="/doc/docConcrete/treeData" cssClass="required" cssStyle="width:60px"/>
			</td>
			<td><sys:treeselect id="kindAg4" name="docConcrete.kindCode" value="${coordinateRatio.docConcrete.kindCode}" labelName="kindAg4" labelValue="${coordinateRatio.kindAg4}"
								title="原材料档案" url="/doc/docConcrete/treeData" cssClass="required" cssStyle="width:60px"/>
			</td>
			<td><sys:treeselect id="kindFlyash" name="docConcrete.kindCode" value="${coordinateRatio.docConcrete.kindCode}" labelName="kindFlyash" labelValue="${coordinateRatio.kindFlyash}"
								title="原材料档案" url="/doc/docConcrete/treeData" cssClass="required" cssStyle="width:60px"/>
			</td>
			<td><sys:treeselect id="kindBreeze" name="docConcrete.kindCode" value="${coordinateRatio.docConcrete.kindCode}" labelName="kindBreeze" labelValue="${coordinateRatio.kindBreeze}"
								title="原材料档案" url="/doc/docConcrete/treeData" cssClass="required" cssStyle="width:60px"/>
			</td>
			<td><sys:treeselect id="kindAdd1" name="docConcrete.kindCode" value="${coordinateRatio.docConcrete.kindCode}" labelName="kindAdd1" labelValue="${coordinateRatio.kindAdd1}"
								title="原材料档案" url="/doc/docConcrete/treeData" cssClass="required" cssStyle="width:60px"/>
			</td>
			<td><sys:treeselect id="kindAdd2" name="docConcrete.kindCode" value="${coordinateRatio.docConcrete.kindCode}" labelName="kindAdd2" labelValue="${coordinateRatio.kindAdd2}"
								title="原材料档案" url="/doc/docConcrete/treeData" cssClass="required" cssStyle="width:60px"/>
			</td>
			<td><sys:treeselect id="kindBackup1" name="docConcrete.kindCode" value="${coordinateRatio.docConcrete.kindCode}" labelName="kindBackup1" labelValue="${coordinateRatio.kindBackup1}"
								title="原材料档案" url="/doc/docConcrete/treeData" cssClass="required" cssStyle="width:60px"/>
			</td>
			<td><sys:treeselect id="kindSlops" name="docConcrete.kindCode" value="${coordinateRatio.docConcrete.kindCode}" labelName="kindSlops" labelValue="${coordinateRatio.kindSlops}"
								title="原材料档案" url="/doc/docConcrete/treeData" cssClass="required" cssStyle="width:60px"/>
			</td>
		</tr>
		<tr>
			<td style="text-align:center">用量（kg/m3）</td>
			<td><form:input path="dosageWater" htmlEscape="false" maxlength="15" style="width:50px"/></td>
			<td><form:input path="dosageCement" htmlEscape="false" maxlength="15" style="width:50px"/></td>
			<td><form:input path="dosageAg1" htmlEscape="false" maxlength="15" style="width:50px"/></td>
			<td><form:input path="dosageAg2" htmlEscape="false" maxlength="15" style="width:50px"/></td>
			<td><form:input path="dosageAg3" htmlEscape="false" maxlength="15" style="width:50px"/></td>
			<td><form:input path="dosageAg4" htmlEscape="false" maxlength="15" style="width:50px"/></td>
			<td><form:input path="dosageFlyash" htmlEscape="false" maxlength="15" style="width:50px"/></td>
			<td><form:input path="dosageBreeze" htmlEscape="false" maxlength="15" style="width:50px"/></td>
			<td><form:input path="dosageAdd1" htmlEscape="false" maxlength="15" style="width:50px"/></td>
			<td><form:input path="dosageAdd2" htmlEscape="false" maxlength="15" style="width:50px"/></td>
			<td><form:input path="dosageBackup1" htmlEscape="false" maxlength="15" style="width:50px"/></td>
			<td><form:input path="dosageSlops" htmlEscape="false" maxlength="15" style="width:50px"/></td>
		</tr>
		<tr>
			<td style="text-align:center">掺量（%）</td>
			<td><form:input path="propWater" htmlEscape="false" maxlength="15" style="width:50px"/></td>
			<td><form:input path="propCement" htmlEscape="false" maxlength="15" style="width:50px"/></td>
			<td><form:input path="propAg1" htmlEscape="false" maxlength="15" style="width:50px"/></td>
			<td><form:input path="propAg2" htmlEscape="false" maxlength="15" style="width:50px"/></td>
			<td><form:input path="propAg3" htmlEscape="false" maxlength="15" style="width:50px"/></td>
			<td><form:input path="propAg4" htmlEscape="false" maxlength="15" style="width:50px"/></td>
			<td><form:input path="propFlyash" htmlEscape="false" maxlength="15" style="width:50px"/></td>
			<td><form:input path="propBreeze" htmlEscape="false" maxlength="15" style="width:50px"/></td>
			<td><form:input path="propAdd1" htmlEscape="false" maxlength="15" style="width:50px"/></td>
			<td><form:input path="propAdd2" htmlEscape="false" maxlength="15" style="width:50px"/></td>
			<td><form:input path="propBackup1" htmlEscape="false" maxlength="15" style="width:50px"/></td>
			<td><form:input path="propSlops" htmlEscape="false" maxlength="15" style="width:50px"/></td>
		</tr>
		<tr>
			<td style="text-align:center">单价（元/吨）</td>
			<td><form:input path="priceWater" htmlEscape="false" maxlength="15" style="width:50px"/></td>
			<td><form:input path="priceCement" htmlEscape="false" maxlength="15" style="width:50px"/></td>
			<td><form:input path="priceAg1" htmlEscape="false" maxlength="15" style="width:50px"/></td>
			<td><form:input path="priceAg2" htmlEscape="false" maxlength="15" style="width:50px"/></td>
			<td><form:input path="priceAg3" htmlEscape="false" maxlength="15" style="width:50px"/></td>
			<td><form:input path="priceAg4" htmlEscape="false" maxlength="15" style="width:50px"/></td>
			<td><form:input path="priceFlyash" htmlEscape="false" maxlength="15" style="width:50px"/></td>
			<td><form:input path="priceBreeze" htmlEscape="false" maxlength="15" style="width:50px"/></td>
			<td><form:input path="priceAdd1" htmlEscape="false" maxlength="15" style="width:50px"/></td>
			<td><form:input path="priceAdd2" htmlEscape="false" maxlength="15" style="width:50px"/></td>
			<td><form:input path="priceBackup1" htmlEscape="false" maxlength="15" style="width:50px"/></td>
			<td><form:input path="priceSlops" htmlEscape="false" maxlength="15" style="width:50px"/></td>
		</tr>
		<tr>
			<td style="text-align:center">金额（元）</td>
			<td><form:input path="amountWater" htmlEscape="false" maxlength="15" style="width:50px"/></td>
			<td><form:input path="amountCement" htmlEscape="false" maxlength="15" style="width:50px"/></td>
			<td><form:input path="amountAg1" htmlEscape="false" maxlength="15" style="width:50px"/></td>
			<td><form:input path="amountAg2" htmlEscape="false" maxlength="15" style="width:50px"/></td>
			<td><form:input path="amountAg3" htmlEscape="false" maxlength="15" style="width:50px"/></td>
			<td><form:input path="amountAg4" htmlEscape="false" maxlength="15" style="width:50px"/></td>
			<td><form:input path="amountFlyash" htmlEscape="false" maxlength="15" style="width:50px"/></td>
			<td><form:input path="amountBreeze" htmlEscape="false" maxlength="15" style="width:50px"/></td>
			<td><form:input path="amountAdd1" htmlEscape="false" maxlength="15" style="width:50px"/></td>
			<td><form:input path="amountAdd2" htmlEscape="false" maxlength="15" style="width:50px"/></td>
			<td><form:input path="amountBackup1" htmlEscape="false" maxlength="15" style="width:50px"/></td>
			<td><form:input path="amountSlops" htmlEscape="false" maxlength="15" style="width:50px"/></td>
		</tr>
	</table>
	<table>
		<tr>
			<td>
				<div class="control-group">
					<label class="control-label">制单人：</label>
					<div class="controls">
						<form:input path="createPerson" htmlEscape="false" maxlength="60" class="input-xlarge "/>
					</div>
				</div>
			</td>
			<td>
				<div class="control-group">
					<label class="control-label">审核人：</label>
					<div class="controls">
						<form:input path="checkPerson" htmlEscape="false" maxlength="60" class="input-xlarge "/>
					</div>
				</div>
			</td>
			<td>
				<div class="control-group">
					<label class="control-label">成本：</label>
					<div class="controls">
						<form:input path="ratioCost" htmlEscape="false" maxlength="15" class="input-xlarge "/>
					</div>
				</div>
			</td>
		</tr>
		<tr>
			<td>
				<div class="control-group">
					<label class="control-label">制单日期：</label>
					<div class="controls">
						<input id="makeDate"  name="makeDate"  type="text" readonly="readonly" maxlength="20" class="Wdate required" style="width:163px;"
							   value="${coordinateRatio.makeDate}"
							   onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'});"/>
					</div>
				</div>
			</td>
			<td>
				<div class="control-group">
					<label class="control-label">审核日期：</label>
					<div class="controls">
						<input id="checkDate"  name="checkDate"  type="text" readonly="readonly" maxlength="20" class="Wdate required" style="width:163px;"
							   value="${coordinateRatio.checkDate}"
							   onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'});"/>
					</div>
				</div>
			</td>
			<td>
				<div class="control-group">
					<label class="control-label">负责人：</label>
					<div class="controls">
						<sys:treeselect id="ratioOwner" name="docOfficework.officeworkCode" value="${coordinateRatio.docOfficework.officeworkCode}" labelName="docOfficework.officeworkName" labelValue="${coordinateRatio.docOfficework.officeworkName}"
										title="职员档案" url="/doc/docOfficework/treeData" cssClass="required" cssStyle="width:120px"/>
					</div>
				</div>
			</td>
		</tr>
	</table>
		<div class="control-group">
			<label class="control-label">备注：</label>
			<div class="controls">
				<form:textarea path="ratioRemark" htmlEscape="false" rows="4" maxlength="200" class="input-xxlarge"/>
			</div>
		</div>
		<div class="control-group" style="display: none">
			<label class="control-label">ext_field1：</label>
			<div class="controls">
				<form:input path="extField1" htmlEscape="false" maxlength="60" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group" style="display: none">
			<label class="control-label">ext_field2：</label>
			<div class="controls">
				<form:input path="extField2" htmlEscape="false" maxlength="60" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group" style="display: none">
			<label class="control-label">ext_field3：</label>
			<div class="controls">
				<form:input path="extField3" htmlEscape="false" maxlength="120" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group" style="display: none">
			<label class="control-label">remark：</label>
			<div class="controls">
				<form:input path="remark" htmlEscape="false" maxlength="1000" class="input-xlarge "/>
			</div>
		</div>
		<div class="form-actions">
			<shiro:hasPermission name="produces:coordinateRatio:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>