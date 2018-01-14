<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>客户档案管理</title>
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
		<li><a href="${ctx}/doc/docCustomer/">客户档案列表</a></li>
		<li class="active"><a href="${ctx}/doc/docCustomer/form?id=${docCustomer.id}">客户档案<shiro:hasPermission name="doc:docCustomer:edit">${not empty docCustomer.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="doc:docCustomer:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="docCustomer" action="${ctx}/doc/docCustomer/save" method="post" class="form-horizontal">
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
				<a href="#trust" data-toggle="tab">信用</a>
			</li>
			<li >
				<a href="#other" data-toggle="tab">其他</a>
			</li>
		</ul>
		<div id="myTabContent" class="tab-content">
			<div class="tab-pane fade in active" id="home">
				<p>
					<div class="control-group">
						<label class="control-label">客户编码：</label>
						<div class="controls">
							<form:input path="cusCode" htmlEscape="false" maxlength="16" class="input-xlarge required"/>
							<span class="help-inline"><font color="red">*</font> </span>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label">建设单位：</label>
						<div class="controls">
							<form:input path="cusOrg" htmlEscape="false" maxlength="120" class="input-xlarge "/>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label">客户名称：</label>
						<div class="controls">
							<form:input path="cusName" htmlEscape="false" maxlength="60" class="input-xlarge "/>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label">工程名称：</label>
						<div class="controls">
							<form:input path="cusProject" htmlEscape="false" maxlength="120" class="input-xlarge "/>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label">客户简称：</label>
						<div class="controls">
							<form:input path="cusShortName" htmlEscape="false" maxlength="60" class="input-xlarge "/>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label">客户分类：</label>
						<div class="controls">
							<%--<sys:treeselect id="archiveCustom" name="archiveCustom.id" value="${docCustomer.archiveCustom.id}" labelName="archiveCustom.customName" labelValue="${docCustomer.archiveCustom.customName}"--%>
											<%--title="客户" url="/archive/archiveCustom/treeData" cssClass="required"/>--%>
								<form:select path="cusType"  class="input-xlarge required">
									<form:option value="" label=""/>
									<form:options items="${fns:getDictList('cus_archivetype')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
								</form:select>
								<span class="help-inline"><font color="red">*</font> </span>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label">所属地区：</label>
						<div class="controls">
							<form:input path="cusArea" htmlEscape="false" maxlength="12" class="input-xlarge "/>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label">所属行业：</label>
						<div class="controls">
							<%--<sys:treeselect id="cusIndustry" name="archiveIndustry.id" value="${docCustomer.archiveIndustry.id}" labelName="archiveIndustry.industryName" labelValue="${docCustomer.archiveIndustry.industryName}"--%>
											<%--title="所属行业" url="/archive/archiveIndustry/treeData" cssClass="required"/>--%>
								<form:input path="cusIndustry" htmlEscape="false" maxlength="60" class="input-xlarge  required"/>
								<span class="help-inline"><font color="red">*</font> </span>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label">结算单位：</label>
						<div class="controls">
							<form:input path="cusSettle" htmlEscape="false" maxlength="120" class="input-xlarge "/>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label">营业执照：</label>
						<div class="controls">
							<form:input path="cusLicence" htmlEscape="false" maxlength="60" class="input-xlarge "/>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label">税号：</label>
						<div class="controls">
							<form:input path="cusTaxno" htmlEscape="false" maxlength="32" class="input-xlarge "/>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label">开户银行：</label>
						<div class="controls">
							<form:input path="cusBank" htmlEscape="false" maxlength="120" class="input-xlarge "/>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label">银行帐号：</label>
						<div class="controls">
							<form:input path="cusAccount" htmlEscape="false" maxlength="60" class="input-xlarge "/>
						</div>
					</div>
				</p>
			</div>
			<div class="tab-pane fade" id="persons">
				<p>
					<div class="control-group">
						<label class="control-label">法人代表：</label>
						<div class="controls">
							<form:input path="cusCorporate" htmlEscape="false" maxlength="60" class="input-xlarge "/>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label">代理人：</label>
						<div class="controls">
							<form:input path="cusAgent" htmlEscape="false" maxlength="60" class="input-xlarge "/>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label">法人代表身份证：</label>
						<div class="controls">
							<form:input path="cusCorporateIdno" htmlEscape="false" maxlength="20" class="input-xlarge "/>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label">代理人身份证：</label>
						<div class="controls">
							<form:input path="cusAgentIdno" htmlEscape="false" maxlength="20" class="input-xlarge "/>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label">法人代表职务：</label>
						<div class="controls">
							<form:input path="cusCorporateJob" htmlEscape="false" maxlength="20" class="input-xlarge "/>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label">代理人职务：</label>
						<div class="controls">
							<form:input path="cusAgentJob" htmlEscape="false" maxlength="20" class="input-xlarge "/>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label">法人代表电话：</label>
						<div class="controls">
							<form:input path="cusCorporateMobile" htmlEscape="false" maxlength="20" class="input-xlarge "/>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label">代理人电话：</label>
						<div class="controls">
							<form:input path="cusAgentMobile" htmlEscape="false" maxlength="20" class="input-xlarge "/>
						</div>
					</div>
				</p>
			</div>
			<div class="tab-pane fade" id="concat">
				<p>
					<div class="control-group">
						<label class="control-label">邮政编码：</label>
						<div class="controls">
							<form:input path="cusPostCode" htmlEscape="false" maxlength="12" class="input-xlarge "/>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label">联系人：</label>
						<div class="controls">
							<form:input path="cusContact" htmlEscape="false" maxlength="20" class="input-xlarge "/>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label">联系邮箱：</label>
						<div class="controls">
							<form:input path="cusEmail" htmlEscape="false" maxlength="60" class="input-xlarge "/>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label">联系地址：</label>
						<div class="controls">
							<form:input path="cusAddress" htmlEscape="false" maxlength="60" class="input-xlarge "/>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label">专管业务员：</label>
						<div class="controls">
							<form:input path="cusSalesman" htmlEscape="false" maxlength="12" class="input-xlarge "/>
						</div>
					</div>
				</p>
			</div>
			<div class="tab-pane fade" id="trust">
				<p>
					<div class="control-group">
						<label class="control-label">信用等级：</label>
						<div class="controls">
							<form:input path="cusCreditRate" htmlEscape="false" maxlength="12" class="input-xlarge "/>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label">信用额度：</label>
						<div class="controls">
							<form:input path="cusCreditLimit" htmlEscape="false" maxlength="12" class="input-xlarge "/>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label">信用天数：</label>
						<div class="controls">
							<form:input path="cusCreditDays" htmlEscape="false" maxlength="12" class="input-xlarge "/>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label">指定签收人：</label>
						<div class="controls">
							<form:input path="cusSigner" htmlEscape="false" maxlength="12" class="input-xlarge "/>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label">工程状态：</label>
						<div class="controls">
							<form:select path="cusProjectState" class="input-xlarge">
								<form:option value="" label="请选择"/>
								<form:options items="${fns:getDictList('project_state')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
							</form:select>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label">封顶日期：</label>
						<div class="controls">
							<form:input path="cusUpDate" htmlEscape="false" maxlength="20" class="input-xlarge "/>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label">选项：</label>
						<div class="controls">
							<form:checkbox path="isSaleCus" label="零售客户" value="1"/>
							<form:checkbox path="isRepayCus" label="预付款客户" value="1"/>
							<form:checkbox path="isStopTrans" label="停止交易" value="1"/>
							<form:checkbox path="isCusCode" label="客户编码" value="1"/>
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
		</div>
	</form:form>
</body>
</html>