<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>仓库档案管理</title>
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
		<li><a href="${ctx}/doc/docRepertory/">仓库档案列表</a></li>
		<li class="active"><a href="${ctx}/doc/docRepertory/form?id=${docRepertory.id}">仓库档案<shiro:hasPermission name="doc:docRepertory:edit">${not empty docRepertory.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="doc:docRepertory:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="docRepertory" action="${ctx}/doc/docRepertory/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>		
		<div class="control-group">
			<label class="control-label">仓库编码：</label>
			<div class="controls">
				<form:input path="repertoryCode" htmlEscape="false" maxlength="16" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">仓库名称：</label>
			<div class="controls">
				<form:input path="repertoryName" htmlEscape="false" maxlength="120" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">所属分类：</label>
			<div class="controls">
				<sys:treeselect id="kindCategory" name="archiveRepertory.id" value="${docRepertory.archiveRepertory.id}" labelName="archiveRepertory.repertoryName" labelValue="${docRepertory.archiveRepertory.repertoryName}"
								title="仓库分类" url="/archive/archiveRepertory/treeData" cssClass="required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">所属部门：</label>
			<div class="controls">
				<sys:treeselect id="repertoryDepartment" name="docDepartment.id" value="${docRepertory.docDepartment.id}" labelName="docDepartment.departmentName" labelValue="${docRepertory.docDepartment.departmentName}"
								title="部门档案" url="/doc/docDepartment/treeData" cssClass="required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">负责人：</label>
			<div class="controls">
				<form:input path="managerPerson" htmlEscape="false" maxlength="60" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">联系电话：</label>
			<div class="controls">
				<form:input path="phoneNo" htmlEscape="false" maxlength="20" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">最高库存：</label>
			<div class="controls">
				<form:input path="maxStock" htmlEscape="false" maxlength="20" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">计价方式：</label>
			<div class="controls">
				<form:select path="pricingMethod" class="input-xlarge ">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('pricing_method')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</div>

		</div>
		<div class="control-group">
			<label class="control-label">地址：</label>
			<div class="controls">
				<form:input path="repertoryAddr" htmlEscape="false" maxlength="120" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">搅拌站：</label>
			<div class="controls">
				<sys:treeselect id="repertoryStation" name="docStation.id" value="${docRepertory.docStation.id}" labelName="docStation.stationName" labelValue="${docRepertory.docStation.stationName}"
								title="搅拌站档案" url="/doc/docStation/treeData" />
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">备注：</label>
			<div class="controls">
				<form:input path="comment" htmlEscape="false" maxlength="120" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">ext_field1：</label>
			<div class="controls">
				<form:input path="extField1" htmlEscape="false" maxlength="60" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">ext_field2：</label>
			<div class="controls">
				<form:input path="extField2" htmlEscape="false" maxlength="60" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">ext_field3：</label>
			<div class="controls">
				<form:input path="extField3" htmlEscape="false" maxlength="120" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">remark：</label>
			<div class="controls">
				<form:input path="remark" htmlEscape="false" maxlength="1000" class="input-xlarge "/>
			</div>
		</div>
		<div class="form-actions">
			<shiro:hasPermission name="doc:docRepertory:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>