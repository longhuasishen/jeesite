<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>普通物资档案管理</title>
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
	<li><a href="${ctx}/doc/docNormaterial/">普通物资档案列表</a></li>
	<li class="active"><a href="${ctx}/doc/docNormaterial/form?id=${docNormaterial.id}">普通物资档案<shiro:hasPermission name="doc:docNormaterial:edit">${not empty docNormaterial.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="doc:docNormaterial:edit">查看</shiro:lacksPermission></a></li>
</ul><br/>
<form:form id="inputForm" modelAttribute="docNormaterial" action="${ctx}/doc/docNormaterial/save" method="post" class="form-horizontal">
	<form:hidden path="id"/>
	<sys:message content="${message}"/>
	<div class="control-group">
		<label class="control-label">品种编码：</label>
		<div class="controls">
			<form:input path="kindCode" htmlEscape="false" maxlength="16" class="input-xlarge required"/>
			<span class="help-inline"><font color="red">*</font> </span>
		</div>
	</div>
	<div class="control-group">
		<label class="control-label">品种名称：</label>
		<div class="controls">
			<form:input path="kindName" htmlEscape="false" maxlength="120" class="input-xlarge required"/>
			<span class="help-inline"><font color="red">*</font> </span>
		</div>
	</div>
	<div class="control-group">
		<label class="control-label">材质等级：</label>
		<div class="controls">
			<form:input path="kindLevel" htmlEscape="false" maxlength="60" class="input-xlarge required"/>
			<span class="help-inline"><font color="red">*</font> </span>
		</div>
	</div>
	<div class="control-group">
		<label class="control-label">标准名称：</label>
		<div class="controls">
			<form:input path="standName" htmlEscape="false" maxlength="120" class="input-xlarge required"/>
			<span class="help-inline"><font color="red">*</font> </span>
		</div>
	</div>
	<div class="control-group">
		<label class="control-label">所属分类：</label>
		<div class="controls">
			<sys:treeselect id="kindCategory" name="archiveMaterial.id" value="${docNormaterial.archiveMaterial.id}" labelName="archiveMaterial.materialName" labelValue="${docNormaterial.archiveMaterial.materialName}"
							title="物资" url="/archive/archiveMaterial/treeData?materialCode=01" cssClass="required"/>
			<span class="help-inline"><font color="red">*</font> </span>
		</div>
	</div>
	<div class="control-group">
		<label class="control-label">原材料类型：</label>
		<div class="controls">
			<sys:treeselect id="kindType" name="docConcretetyp.id" value="${docNormaterial.docConcretetyp.id}" labelName="docConcretetyp.concretetypName" labelValue="${docNormaterial.docConcretetyp.concretetypName}"
							title="原材料类型" url="/doc/docConcretetyp/treeData?materialCode=*" cssClass="required"/>
			<span class="help-inline"><font color="red">*</font> </span>
		</div>
	</div>
	<div class="control-group">
		<label class="control-label">辅记量单位：</label>
		<div class="controls">
			<form:input path="secUnit" htmlEscape="false" maxlength="20" class="input-xlarge required"/>
			<span class="help-inline"><font color="red">*</font> </span>
		</div>
	</div>
	<div class="control-group">
		<label class="control-label">主记量单位：</label>
		<div class="controls">
			<form:input path="firstUnit" htmlEscape="false" maxlength="60" class="input-xlarge required"/>
			<span class="help-inline"><font color="red">*</font> </span>
		</div>
	</div>
	<div class="control-group">
		<label class="control-label">换算率：</label>
		<div class="controls">
			<form:input path="rate" htmlEscape="false" maxlength="12" class="input-xlarge  number required"/>
			<span class="help-inline"><font color="red">*</font> </span>
		</div>
	</div>
	<div class="control-group">
		<label class="control-label">主要供应商：</label>
		<div class="controls">
			<sys:treeselect id="primaryProvider" name="docSupplier.id"  value="${docNormaterial.docSupplier.id}" labelName="docSupplier.supName" labelValue="${docNormaterial.docSupplier.supName}"
							title="原材料类型" url="/doc/docSupplier/treeData?materialCode=*" />
		</div>
	</div>
	<div class="control-group">
		<label class="control-label">计价方式：</label>
		<div class="controls">
			<form:select path="pricingMode" class="input-xlarge ">
				<form:option value="" label=""/>
				<form:options items="${fns:getDictList('pricing_method')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
			</form:select>
		</div>
	</div>
	<div class="control-group">
		<label class="control-label">品牌名称：</label>
		<div class="controls">
			<form:input path="brandName" htmlEscape="false" maxlength="120" class="input-xlarge "/>
		</div>
	</div>
	<div class="control-group">
		<label class="control-label">原材料勾选1:</label>
		<div class="controls">
			<form:checkboxes path="childNormaterialList1" items="${fns:getDictList('concrete_box1')}" itemLabel="label" itemValue="value" htmlEscape="false" class="required"/>
		</div>
	</div>
	<!-- <div class="control-group">
	<label class="control-label">销售：</label>
	<div class="controls">
	<form:checkboxes path="sales" items="${fns:getDictList('')}" itemLabel="label" itemValue="value" htmlEscape="false" class=""/>
	</div>
	</div>
	<div class="control-group">
	<label class="control-label">外购：</label>
	<div class="controls">
	<form:checkboxes path="outsourcing" items="${fns:getDictList('')}" itemLabel="label" itemValue="value" htmlEscape="false" class=""/>
	</div>
	</div>
	<div class="control-group">
	<label class="control-label">自制：</label>
	<div class="controls">
	<form:checkboxes path="madSelf" items="${fns:getDictList('')}" itemLabel="label" itemValue="value" htmlEscape="false" class=""/>
	</div>
	</div>
	<div class="control-group">
	<label class="control-label">应税劳务：</label>
	<div class="controls">
	<form:checkboxes path="taxService" items="${fns:getDictList('')}" itemLabel="label" itemValue="value" htmlEscape="false" class=""/>
	</div>
	</div>
	<div class="control-group">
	<label class="control-label">成套件：</label>
	<div class="controls">
	<form:checkboxes path="compSet" items="${fns:getDictList('')}" itemLabel="label" itemValue="value" htmlEscape="false" class=""/>
	</div>
	</div>
	<div class="control-group">
	<label class="control-label">砂浆：</label>
	<div class="controls">
	<form:checkboxes path="mortar" items="${fns:getDictList('')}" itemLabel="label" itemValue="value" htmlEscape="false" class=""/>
	</div>
	</div>-->
	<div class="control-group">
		<label class="control-label">最低库存：</label>
		<div class="controls">
			<form:input path="minInventory" htmlEscape="false" maxlength="50" class="input-xlarge  digits"/>
		</div>
	</div>
	<div class="control-group">
		<label class="control-label">成本参考核算单价：</label>
		<div class="controls">
			<form:input path="costPrices" htmlEscape="false" maxlength="50" class="input-xlarge  number"/>
		</div>
	</div>
	<div class="control-group">
		<label class="control-label">最高存库：</label>
		<div class="controls">
			<form:input path="maxInventory" htmlEscape="false" maxlength="50" class="input-xlarge  digits"/>
		</div>
	</div>
	<div class="control-group">
		<label class="control-label">配方上下限控制：</label>
		<div class="controls">
			<form:input path="sumControl" htmlEscape="false" maxlength="50" class="input-xlarge  digits"/>
		</div>
	</div>
	<div class="control-group">
		<label class="control-label">安全库存：</label>
		<div class="controls">
			<form:input path="saveInventory" htmlEscape="false" maxlength="50" class="input-xlarge  digits"/>
		</div>
	</div>
	<div class="control-group">
		<label class="control-label">积压标准：</label>
		<div class="controls">
			<form:input path="stockStand" htmlEscape="false" maxlength="50" class="input-xlarge  digits"/>
		</div>
	</div>
	<div class="control-group">
		<label class="control-label">ABC分类：</label>
		<div class="controls">
			<form:select path="abcCategory" class="input-xlarge ">
				<form:option value="" label=""/>
				<form:options items="${fns:getDictList('abcCategory_list')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
			</form:select>
		</div>
	</div>
	<div class="control-group">
		<label class="control-label">税率：</label>
		<div class="controls">
			<form:input path="taxRate" htmlEscape="false" maxlength="50" class="input-xlarge  number"/>
		</div>
	</div>
	<div class="control-group">
		<label class="control-label">原材料勾选2:</label>
		<div class="controls">
			<form:checkboxes path="childNormaterialList2" items="${fns:getDictList('concrete_box2')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
		</div>
	</div>
	<!--<div class="control-group">
	<label class="control-label">保质期管理：</label>
	<div class="controls">
	<form:checkboxes path="qualityManage" items="${fns:getDictList('')}" itemLabel="label" itemValue="value" htmlEscape="false" class=""/>
	</div>
	</div>
	<div class="control-group">
	<label class="control-label">批次管理：</label>
	<div class="controls">
	<form:checkboxes path="batManage" items="${fns:getDictList('')}" itemLabel="label" itemValue="value" htmlEscape="false" class=""/>
	</div>
	</div>
	<div class="control-group">
	<label class="control-label">委托代锁管理：</label>
	<div class="controls">
	<form:checkboxes path="entrustManage" items="${fns:getDictList('')}" itemLabel="label" itemValue="value" htmlEscape="false" class=""/>
	</div>
	</div>
	<div class="control-group">
	<label class="control-label">呆滞积压管理：</label>
	<div class="controls">
	<form:checkboxes path="stockManage" items="${fns:getDictList('')}" itemLabel="label" itemValue="value" htmlEscape="false" class=""/>
	</div>
	</div>-->
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
		<shiro:hasPermission name="doc:docNormaterial:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
		<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
	</div>
</form:form>
</body>
</html>