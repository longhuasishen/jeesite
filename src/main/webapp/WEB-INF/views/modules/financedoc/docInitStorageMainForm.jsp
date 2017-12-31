<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>期初入库管理</title>
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
		<li><a href="${ctx}/financedoc/docInitStorageMain/">期初入库列表</a></li>
		<li class="active"><a href="${ctx}/financedoc/docInitStorageMain/form?id=${docInitStorageMain.id}">期初入库<shiro:hasPermission name="financedoc:docInitStorageMain:edit">${not empty docInitStorageMain.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="financedoc:docInitStorageMain:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="docInitStorageMain" action="${ctx}/financedoc/docInitStorageMain/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>		
		<div class="control-group">
			<label class="control-label">单据编号：</label>
			<div class="controls">
				<form:input path="docCode" htmlEscape="false" maxlength="12" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">入库单号：</label>
			<div class="controls">
				<form:input path="storageCode" htmlEscape="false" maxlength="50" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">入库日期时间：</label>
			<div class="controls">
				<input id="storageDate" name="storageDate" type="text" readonly="readonly" maxlength="20" class="Wdate required" readonly="readonly"
					   value="${docInitStorageMain.storageDate}"
					   onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">入库部门：</label>
			<div class="controls">
				<sys:treeselect id="storageDepartment" name="docDepartment.id" value="${docInitStorageMain.docDepartment.departmentCode}" labelName="docDepartment.departmentCode" labelValue="${docInitStorageMain.docDepartment.departmentCode}"
								title="部门" url="/doc/docDepartment/treeData" cssClass="required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">入库仓库：</label>
			<div class="controls">
				<sys:treeselect id="storageRepertory" name="docRepertory.id" value="${docInitStorageMain.docRepertory.repertoryCode}" labelName="docRepertory.repertoryCode" labelValue="${docInitStorageMain.docRepertory.repertoryCode}"
								title="仓库" url="/doc/docRepertory/treeData" cssClass="required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">红蓝标志：</label>
			<div class="controls">
				<form:radiobuttons path="storageFlag" items="${fns:getDictList('red_blue_flag')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">入库类型：</label>
			<div class="controls">
				<form:input path="storageType" htmlEscape="false" maxlength="20" class="input-xlarge required" value="期初入库" readonly="true"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">制单人：</label>
			<div class="controls">
				<form:input path="storageCreate" htmlEscape="false" maxlength="20" class="input-xlarge required"  readonly="true" value="${user.name}"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>

		<div class="form-actions">
			<shiro:hasPermission name="financedoc:docInitStorageMain:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<shiro:hasPermission name="financedoc:docInitStorageMain:edit"><input id="btnAduit" class="btn btn-primary" type="onclick" value="审 核"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>