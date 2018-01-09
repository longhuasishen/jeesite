<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>外购加油登记管理</title>
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
		<li><a href="${ctx}/stock/outsourceOiling/">外购加油登记列表</a></li>
		<li class="active"><a href="${ctx}/stock/outsourceOiling/form?id=${outsourceOiling.id}">外购加油登记<shiro:hasPermission name="stock:outsourceOiling:edit">${not empty outsourceOiling.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="stock:outsourceOiling:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="outsourceOiling" action="${ctx}/stock/outsourceOiling/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>		
		<div class="control-group">
			<label class="control-label">日期：</label>
			<div class="controls">
				<input id="oilingDate"  name="oilingDate"  type="text" readonly="readonly" maxlength="20" class="Wdate required" style="width:163px;"
					   value="${outsourceOiling.oilingDate}"
					   onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">样品名称：</label>
			<div class="controls">
				<form:input path="sampleName" htmlEscape="false" maxlength="60" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">供应商名称：</label>
			<div class="controls">
				<%--<form:input path="supplierName" htmlEscape="false" maxlength="120" class="input-xlarge "/>--%>
				<sys:treeselect id="supplierName" name="docSupplier.id" value="${outsourceOiling.docSupplier.id}" labelName="docSupplier.supName" labelValue="${outsourceOiling.docSupplier.supName}"
								title="供应商" url="/doc/docSupplier/treeData" cssClass="required"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">数量：</label>
			<div class="controls">
				<form:input path="oilingCount" htmlEscape="false" maxlength="10" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">单价：</label>
			<div class="controls">
				<form:input path="oilingPrice" htmlEscape="false" maxlength="15" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">金额：</label>
			<div class="controls">
				<form:input path="oilingAmount" htmlEscape="false" maxlength="15" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">结算人：</label>
			<div class="controls">
				<%--<form:input path="oilingPerson" htmlEscape="false" maxlength="60" class="input-xlarge "/>--%>
				<sys:treeselect id="oilingPerson" name="docOfficework.id" value="${outsourceOiling.docOfficework.id}" labelName="docOfficework.officeworkName" labelValue="${outsourceOiling.docOfficework.officeworkName}"
								title="职员档案" url="/doc/docOfficework/treeData" cssClass="required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">车号：</label>
			<div class="controls">
				<%--<form:input path="carNo" htmlEscape="false" maxlength="32" class="input-xlarge "/>--%>
				<sys:treeselect id="carNo" name="docCar.id" value="${outsourceOiling.docCar.id}" labelName="docCar.carNo" labelValue="${outsourceOiling.docCar.carNo}"
								title="车辆档案" url="/doc/docCar/treeData" cssClass="required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">备注：</label>
			<div class="controls">
				<form:input path="oilingRemark" htmlEscape="false" maxlength="200" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">制单人：</label>
			<div class="controls">
				<form:input path="createPerson" htmlEscape="false" maxlength="60"   readonly="true" value="${user.name}"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">审核人：</label>
			<div class="controls">
				<form:input path="checkPerson" htmlEscape="false" maxlength="60"   readonly="true" value="${user.name}"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">制单日期：</label>
			<div class="controls">
				<input id="makeDate"  name="makeDate"  type="text" readonly="readonly" maxlength="20" class="Wdate required" style="width:163px;"
					   value="${outsourceOiling.makeDate}"
					   onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">审核日期：</label>
			<div class="controls">
				<input id="checkDate"  name="checkDate"  type="text" readonly="readonly" maxlength="20" class="Wdate required" style="width:163px;"
					   value="${outsourceOiling.checkDate}"
					   onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">审核状态：</label>
			<div class="controls">
				<form:select path="checkStatus" class="input-xlarge ">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('check_state1')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
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
			<shiro:hasPermission name="stock:outsourceOiling:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>