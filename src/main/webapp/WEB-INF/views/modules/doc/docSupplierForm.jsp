<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>供应商档案管理</title>
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
		<li><a href="${ctx}/doc/docSupplier/">供应商档案列表</a></li>
		<li class="active"><a href="${ctx}/doc/docSupplier/form?id=${docSupplier.id}">供应商档案<shiro:hasPermission name="doc:docSupplier:edit">${not empty docSupplier.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="doc:docSupplier:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="docSupplier" action="${ctx}/doc/docSupplier/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>
		<ul id="myTab" class="nav nav-tabs">
			<li class="active">
				<a href="#home" data-toggle="tab">
					基本信息
				</a>
			</li>
			<li><a href="#persons" data-toggle="tab">人员</a></li>
			<li >
				<a href="#concat" data-toggle="tab">联系</a>
			</li>
			<li >
				<a href="#other" data-toggle="tab">其他</a>
			</li>
		</ul>
	<div id="myTabContent" class="tab-content">
		<div class="tab-pane fade in active" id="home">
			<p>
				<div class="control-group">
					<label class="control-label">供应商编码：</label>
					<div class="controls">
						<form:input path="supCode" htmlEscape="false" maxlength="16" class="input-xlarge required"/>
						<span class="help-inline"><font color="red">*</font> </span>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">供应商名称：</label>
					<div class="controls">
						<form:input path="supName" htmlEscape="false" maxlength="60" class="input-xlarge "/>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">供应商简称：</label>
					<div class="controls">
						<form:input path="supShortName" htmlEscape="false" maxlength="60" class="input-xlarge "/>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">供应商分类：</label>
					<div class="controls">
						<sys:treeselect id="archiveSupplier" name="archiveSupplier.id" value="${docSupplier.archiveSupplier.id}" labelName="archiveSupplier.supplierName" labelValue="${docSupplier.archiveSupplier.supplierName}"
										title="供应商分类" url="/archive/archiveSupplier/treeData" cssClass="required"/>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">所属地区：</label>
					<div class="controls">
						<form:input path="supArea" htmlEscape="false" maxlength="12" class="input-xlarge "/>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">所属行业：</label>
					<div class="controls">
						<sys:treeselect id="cusIndustry" name="archiveIndustry.id" value="${docSupplier.archiveIndustry.id}" labelName="archiveIndustry.industryName" labelValue="${docSupplier.archiveIndustry.industryName}"
										title="所属行业" url="/archive/archiveIndustry/treeData" cssClass="required"/>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">结算单位：</label>
					<div class="controls">
						<form:input path="supSettle" htmlEscape="false" maxlength="120" class="input-xlarge "/>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">营业执照：</label>
					<div class="controls">
						<form:input path="supLicence" htmlEscape="false" maxlength="60" class="input-xlarge "/>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">税号：</label>
					<div class="controls">
						<form:input path="supTaxno" htmlEscape="false" maxlength="32" class="input-xlarge "/>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">开户银行：</label>
					<div class="controls">
						<form:input path="supBank" htmlEscape="false" maxlength="120" class="input-xlarge "/>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">银行帐号：</label>
					<div class="controls">
						<form:input path="supAccount" htmlEscape="false" maxlength="60" class="input-xlarge "/>
					</div>
				</div>
			</p>
		</div>
		<div class="tab-pane fade" id="persons">
			<p>
				<div class="control-group">
					<label class="control-label">法人代表：</label>
					<div class="controls">
						<form:input path="supCorporate" htmlEscape="false" maxlength="60" class="input-xlarge "/>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">代理人：</label>
					<div class="controls">
						<form:input path="supAgent" htmlEscape="false" maxlength="60" class="input-xlarge "/>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">法人代表身份证：</label>
					<div class="controls">
						<form:input path="supCorporateIdno" htmlEscape="false" maxlength="20" class="input-xlarge "/>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">代理人身份证：</label>
					<div class="controls">
						<form:input path="supAgentIdno" htmlEscape="false" maxlength="20" class="input-xlarge "/>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">法人代表职务：</label>
					<div class="controls">
						<form:input path="supCorporateJob" htmlEscape="false" maxlength="20" class="input-xlarge "/>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">代理人职务：</label>
					<div class="controls">
						<form:input path="supAgentJob" htmlEscape="false" maxlength="20" class="input-xlarge "/>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">法人代表电话：</label>
					<div class="controls">
						<form:input path="supCorporateMobile" htmlEscape="false" maxlength="20" class="input-xlarge "/>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">代理人电话：</label>
					<div class="controls">
						<form:input path="supAgentMobile" htmlEscape="false" maxlength="20" class="input-xlarge "/>
					</div>
				</div>
			</p>
		</div>
		<div class="tab-pane fade" id="concat">
			<p>
				<div class="control-group">
					<label class="control-label">邮政编码：</label>
					<div class="controls">
						<form:input path="supPostCode" htmlEscape="false" maxlength="12" class="input-xlarge "/>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">联系人：</label>
					<div class="controls">
						<form:input path="supContact" htmlEscape="false" maxlength="20" class="input-xlarge "/>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">联系邮箱：</label>
					<div class="controls">
						<form:input path="supEmail" htmlEscape="false" maxlength="60" class="input-xlarge "/>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">联系地址：</label>
					<div class="controls">
						<form:input path="supAddress" htmlEscape="false" maxlength="60" class="input-xlarge "/>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">专管业务员：</label>
					<div class="controls">
						<form:input path="supSalesman" htmlEscape="false" maxlength="12" class="input-xlarge "/>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">工程状态：</label>
					<div class="controls">
						<form:input path="supProjectState" htmlEscape="false" maxlength="20" class="input-xlarge "/>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">选项：</label>
					<div class="controls">
						<form:checkbox path="isStopTrans" label="停止交易" value="1"/>
					</div>
				</div>
			</p>
		</div>
		<div class="tab-pane fade" id="other">
			<p>
				<div class="control-group">
					<label class="control-label">ext_field12：</label>
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
			</p>
		</div>


		<div class="form-actions">
			<shiro:hasPermission name="doc:docSupplier:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>