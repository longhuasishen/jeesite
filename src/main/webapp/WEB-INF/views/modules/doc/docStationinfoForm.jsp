<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>搅拌站点信息管理</title>
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
        function stationCodeTreeselectCallBack(v,h,f){
            if("ok" == v){
                //获取指定客户信息
				alert($("#stationCodeId").val());
                $("#stationName").val($("#stationCodeName").val().substring(0,$("#stationCodeName").val().indexOf("[")));
            }
        }
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li><a href="${ctx}/doc/docStationinfo/">搅拌站点信息列表</a></li>
		<li class="active"><a href="${ctx}/doc/docStationinfo/form?id=${docStationinfo.id}">搅拌站点信息<shiro:hasPermission name="doc:docStationinfo:edit">${not empty docStationinfo.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="doc:docStationinfo:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="docStationinfo" action="${ctx}/doc/docStationinfo/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>		
		<div class="control-group">
			<label class="control-label">搅拌站编码：</label>
			<div class="controls">
				<sys:treeselect id="stationCode" name="docStation.stationCode" value="${docStationinfo.docStation.stationCode}" labelName="docStation.id" labelValue="${docStationinfo.docStation.stationCode}"
								title="搅拌站点" url="/doc/docStation/treeData" cssClass="required"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">搅拌站名称：</label>
			<div class="controls">
				<form:input path="docStation.stationName" id="stationName" htmlEscape="false" maxlength="50" class="input-xlarge " readonly="true"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">数据库类型：</label>
			<div class="controls">
				<form:select path="stationDbType" class="input-xlarge">
					<form:option value="" label="请选择"/>
					<form:options items="${fns:getDictList('station_db_type')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">数据库名称：</label>
			<div class="controls">
				<form:input path="stationDbName" htmlEscape="false" maxlength="20" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">数据库ip：</label>
			<div class="controls">
				<form:input path="stationDbIp" htmlEscape="false" maxlength="20" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">任务数据库路径：</label>
			<div class="controls">
				<form:input path="stationDbTask" htmlEscape="false" maxlength="120" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">配方数据库路径：</label>
			<div class="controls">
				<form:input path="stationDbPrescription" htmlEscape="false" maxlength="120" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">用户名：</label>
			<div class="controls">
				<form:input path="stationUser" htmlEscape="false" maxlength="50" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">密码：</label>
			<div class="controls">
				<form:input path="stationPasswd" htmlEscape="false" maxlength="50" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">配方主键：</label>
			<div class="controls">
				<form:input path="prescriptionId" htmlEscape="false" maxlength="50" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">任务主键：</label>
			<div class="controls">
				<form:input path="taskId" htmlEscape="false" maxlength="50" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">配方sql：</label>
			<div class="controls">
				<form:input path="prescriptionSql" htmlEscape="false" maxlength="120" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">工地任务sql：</label>
			<div class="controls">
				<form:input path="taskSql" htmlEscape="false" maxlength="120" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">erp配方sql：</label>
			<div class="controls">
				<form:input path="prescriptionSqlErp" htmlEscape="false" maxlength="120" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">erp任务sql：</label>
			<div class="controls">
				<form:input path="taskSqlErp" htmlEscape="false" maxlength="120" class="input-xlarge "/>
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
			<shiro:hasPermission name="doc:docStationinfo:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>