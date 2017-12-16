<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>财务应收期初余额管理</title>
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
        function cus_codeTreeselectCallBack(v,h,f){
            if("ok" == v){
                //获取指定客户信息
                $.get("${ctx}/doc/docCustomer/get?id=" + $("#cus_codeId").val(), function(data){
                    //设置input值
                    $("#cusName").val(data.cusName);
                    $("#cusShortName").val(data.cusShortName);
                    $("#cusProject").val(data.cusProject);
                });
            }
        }
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li><a href="${ctx}/financedoc/docFinanceInitbalance/">财务应收期初余额列表</a></li>
		<li class="active"><a href="${ctx}/financedoc/docFinanceInitbalance/form?id=${docFinanceInitbalance.id}">财务应收期初余额<shiro:hasPermission name="financedoc:docFinanceInitbalance:edit">${not empty docFinanceInitbalance.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="financedoc:docFinanceInitbalance:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="docFinanceInitbalance" action="${ctx}/financedoc/docFinanceInitbalance/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>
		<div class="control-group">
			<label class="control-label">客户编码：</label>
			<div class="controls">
				<sys:treeselect id="cus_code" name="docCustomer.id" value="${docFinanceInitbalance.docCustomer.id}" labelName="docCustomer.cusCode" labelValue="${docFinanceInitbalance.docCustomer.cusCode}"
								title="客户" url="/doc/docCustomer/treeData" cssClass="required"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">客户名称：</label>
			<div class="controls">
				<form:input path="docCustomer.cusName" id="cusName" htmlEscape="false" maxlength="50" class="input-xlarge " readonly="true"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">工程名称：</label>
			<div class="controls">
				<form:input path="docCustomer.cusProject" id="cusProject" htmlEscape="false" maxlength="120" class="input-xlarge required" readonly="true"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">客户简称：</label>
			<div class="controls">
				<form:input path="docCustomer.cusShortName" id="cusShortName" htmlEscape="false" maxlength="20" class="input-xlarge required" readonly="true"/>
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
			<shiro:hasPermission name="financedoc:docFinanceInitbalance:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>