<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>财务应付调账单管理</title>
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
		<li><a href="${ctx}/bill/finpayBill/">财务应付调账单列表</a></li>
		<li class="active"><a href="${ctx}/bill/finpayBill/form?id=${finpayBill.id}">财务应付调账单<shiro:hasPermission name="bill:finpayBill:edit">${not empty finpayBill.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="bill:finpayBill:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="finpayBill" action="${ctx}/bill/finpayBill/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>		
		<div class="control-group">
			<label class="control-label">单据编号：</label>
			<div class="controls">
				<form:input path="billNo" htmlEscape="false" maxlength="20" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">调帐日期：</label>
			<div class="controls">
				<input id="billDate"  name="billDate"  type="text" readonly="readonly" maxlength="20" class="Wdate required" style="width:163px;"
					   value="${contractSales.contractDate}"
					   onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">供应商名称：</label>
			<div class="controls">
				<sys:treeselect id="billSupplier" name="docSupplier.id"  value="${docConcrete.docSupplier.id}" labelName="docSupplier.supName" labelValue="${docConcrete.docSupplier.supName}"
								title="供应商名称" url="/doc/docSupplier/treeData?materialCode=*" cssClass="required"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">调账方向：</label>
			<div class="controls">
				<form:select path="billDirection" class="input-xlarge ">
					<form:options items="${fns:getDictList('billdc_flag')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">调帐金额：</label>
			<div class="controls">
				<form:input path="billAmt" htmlEscape="false" maxlength="30" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">制单人：</label>
			<div class="controls">
				<td><form:input path="createPerson" htmlEscape="false" maxlength="50"   readonly="true" value="${user.name}"/></td>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">审核人：</label>
			<div class="controls">
				<td><form:input path="checkPerson" htmlEscape="false" maxlength="50"   readonly="true" value="${user.name}"/></td>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">制单日期：</label>
			<div class="controls">
				<input id="makeDate"  name="makeDate"  type="text" readonly="readonly" maxlength="20" class="Wdate required" style="width:163px;"
					   value="${contractSales.contractDate}"
					   onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">审核日期：</label>
			<div class="controls">
				<td><input id="checkDate"  name="checkDate"  type="text" readonly="readonly" maxlength="20" class="Wdate required" style="width:163px;"
						   value="${contractSales.contractDate}"
						   onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});"/>
				</td>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">状态：</label>
			<div class="controls">
				<form:input path="billStatus" htmlEscape="false" maxlength="2" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">备注：</label>
			<div class="controls">
				<form:input path="finRemark" htmlEscape="false" maxlength="200" class="input-xlarge "/>
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
			<shiro:hasPermission name="bill:finpayBill:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>