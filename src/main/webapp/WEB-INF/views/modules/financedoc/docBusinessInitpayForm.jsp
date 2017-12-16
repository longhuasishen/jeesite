<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>业务应付期初余额管理</title>
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
        function sup_codeTreeselectCallBack(v,h,f){
            if("ok" == v){
                //获取指定客户信息
                $.get("${ctx}/doc/docSupplier/get?id=" + $("#sup_codeId").val(), function(data){
                    //设置input值
                    $("#supName").val(data.supName);
                    $("#supShortName").val(data.supShortName);
                });
            }
        }
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li><a href="${ctx}/financedoc/docBusinessInitpay/">业务应付期初余额列表</a></li>
		<li class="active"><a href="${ctx}/financedoc/docBusinessInitpay/form?id=${docBusinessInitpay.id}">业务应付期初余额<shiro:hasPermission name="financedoc:docBusinessInitpay:edit">${not empty docBusinessInitpay.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="financedoc:docBusinessInitpay:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="docBusinessInitpay" action="${ctx}/financedoc/docBusinessInitpay/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>
		<div class="control-group">
			<label class="control-label">供应商编码：</label>
			<div class="controls">
				<sys:treeselect id="sup_code" name="docSupplier.id" value="${docBusinessInitpay.docSupplier.id}" labelName="docSupplier.supCode" labelValue="${docBusinessInitpay.docSupplier.supCode}"
								title="供应商" url="/doc/docSupplier/treeData" cssClass="required"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">供应商名称：</label>
			<div class="controls">
				<form:input path="docSupplier.supName" id="supName" htmlEscape="false" maxlength="50" class="input-xlarge " readonly="true"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">供应商简称：</label>
			<div class="controls">
				<form:input path="docSupplier.supShortName" id="supShortName" htmlEscape="false" maxlength="20" class="input-xlarge required" readonly="true"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">借方余额：</label>
			<div class="controls">
				<form:input path="debitBalance" htmlEscape="false" maxlength="20" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">贷方余额：</label>
			<div class="controls">
				<form:input path="creditBalance" htmlEscape="false" maxlength="120" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">摘要：</label>
			<div class="controls">
				<form:input path="remark" htmlEscape="false" maxlength="1000" class="input-xlarge "/>
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
		<div class="form-actions">
			<shiro:hasPermission name="financedoc:docBusinessInitpay:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>