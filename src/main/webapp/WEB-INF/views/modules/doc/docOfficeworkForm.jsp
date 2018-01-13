<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>职员档案管理</title>
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
		<li><a href="${ctx}/doc/docOfficework/">职员档案列表</a></li>
		<li class="active"><a href="${ctx}/doc/docOfficework/form?id=${docOfficework.id}">职员档案<shiro:hasPermission name="doc:docOfficework:edit">${not empty docOfficework.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="doc:docOfficework:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="docOfficework" action="${ctx}/doc/docOfficework/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>		
		<div class="control-group">
			<label class="control-label">职员编码：</label>
			<div class="controls">
				<form:input path="officeworkCode" htmlEscape="false" maxlength="16" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">职员名称：</label>
			<div class="controls">
				<form:input path="officeworkName" htmlEscape="false" maxlength="120" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">所属部门：</label>
			<div class="controls">
				<sys:treeselect id="officeworkDep" name="docDepartment.id" value="${docOfficework.docDepartment.id}" labelName="docDepartment.departmentName" labelValue="${docOfficework.docDepartment.departmentName}"
								title="部门档案" url="/doc/docDepartment/treeData" cssClass="required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">职务：</label>
			<div class="controls">
				<form:input path="officeworkPost" htmlEscape="false" maxlength="20" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">最高学历：</label>
			<div class="controls">
				<form:input path="officeworkEdu" htmlEscape="false" maxlength="10" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">婚姻状况：</label>
			<div class="controls">
				<form:input path="officeworkMarry" htmlEscape="false" maxlength="10" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">政治面貌：</label>
			<div class="controls">
				<form:input path="officeworkPol" htmlEscape="false" maxlength="10" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">性别：</label>
			<div class="controls">
				<form:input path="officeworkSex" htmlEscape="false" maxlength="10" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">电话：</label>
			<div class="controls">
				<form:input path="officeworkPhone" htmlEscape="false" maxlength="20" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">出生日期：</label>
			<div class="controls">
				<%--<form:input path="officeworkBirth" htmlEscape="false" maxlength="20" class="input-xlarge required"/>--%>
				<input id="officeworkBirth"  name="officeworkBirth"  type="text" readonly="readonly" maxlength="20" class="Wdate required" style="width:163px;"
					   value="${docOfficework.officeworkBirth}"
					   onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});" class="required"/>
					<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">身份证号码：</label>
			<div class="controls">
				<form:input path="officeworkIdcard" htmlEscape="false" maxlength="20" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">入司日期：</label>
			<div class="controls">
				<%--<form:input path="joinDate" htmlEscape="false" maxlength="20" class="input-xlarge required"/>--%>
				<input id="joinDate"  name="joinDate"  type="text" readonly="readonly" maxlength="20" class="Wdate required" style="width:163px;"
					   value="${docOfficework.joinDate}"
					   onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});" class="required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">档案地点：</label>
			<div class="controls">
				<form:input path="docSite" htmlEscape="false" maxlength="120" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">档案号：</label>
			<div class="controls">
				<form:input path="docNo" htmlEscape="false" maxlength="32" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">毕业院校：</label>
			<div class="controls">
				<form:input path="fromUni" htmlEscape="false" maxlength="120" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">所属公司：</label>
			<div class="controls">
				<form:input path="officeworkComp" htmlEscape="false" maxlength="60" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">入司前单位：</label>
			<div class="controls">
				<form:input path="lastComp" htmlEscape="false" maxlength="60" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">毕业时间：</label>
			<div class="controls">
				<%--<form:input path="overuniTime" htmlEscape="false" maxlength="20" class="input-xlarge "/>--%>
				<input id="overuniTime"  name="overuniTime"  type="text" readonly="readonly" maxlength="20" class="Wdate required" style="width:163px;"
					   value="${docOfficework.overuniTime}"
					   onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">专业：</label>
			<div class="controls">
				<form:input path="officeworkMajor" htmlEscape="false" maxlength="10" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">录入时间：</label>
			<div class="controls">
				<%--<form:input path="inputTime" htmlEscape="false" maxlength="20" class="input-xlarge required"/>--%>
				<input id="inputTime"  name="inputTime"  type="text" readonly="readonly" maxlength="20" class="Wdate required" style="width:163px;"
					   value="${docOfficework.inputTime}"
					   onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'});" class="required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">级别：</label>
			<div class="controls">
				<form:input path="officeworkLevel" htmlEscape="false" maxlength="10" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">家庭地址：</label>
			<div class="controls">
				<form:input path="officeworkAddr" htmlEscape="false" maxlength="120" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">在职状态：</label>
			<div class="controls">
				<form:input path="workStatus" htmlEscape="false" maxlength="10" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">技术职称：</label>
			<div class="controls">
				<form:input path="postLevel" htmlEscape="false" maxlength="10" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">民族：</label>
			<div class="controls">
				<form:input path="officeworkNation" htmlEscape="false" maxlength="20" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">岗位：</label>
			<div class="controls">
				<form:input path="officeworkQuarters" htmlEscape="false" maxlength="20" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">业务员：</label>
			<div class="controls">
				<%--<form:input path="officeworkSales" htmlEscape="false" maxlength="1" class="input-xlarge "/>--%>
				<form:select path="officeworkSales" class="input-xlarge ">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('yes_no')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">合同签否：</label>
			<div class="controls">
				<%--<form:input path="contractFlg" htmlEscape="false" maxlength="1" class="input-xlarge "/>--%>
				<form:select path="contractFlg" class="input-xlarge ">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('yes_no')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">标志：</label>
			<div class="controls">
				<%--<form:input path="officeworkFlg" htmlEscape="false" maxlength="1" class="input-xlarge "/>--%>
				<form:select path="officeworkFlg" class="input-xlarge ">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('yes_no')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">注销：</label>
			<div class="controls">
				<%--<form:input path="officeworkCancel" htmlEscape="false" maxlength="1" class="input-xlarge "/>--%>
				<form:select path="officeworkCancel" class="input-xlarge ">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('yes_no')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
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
			<shiro:hasPermission name="doc:docOfficework:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>