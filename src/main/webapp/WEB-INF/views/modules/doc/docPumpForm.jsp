<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>泵档案管理</title>
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

        function pumpCodeTreeselectCallBack(v,h,f){
            if("ok" == v){
                $("#pumpName").val($("#pumpCodeName").val().substring($("#pumpCodeName").val().indexOf("[")+1,$("#pumpCodeName").val().indexOf("]")));
            }
        }
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li><a href="${ctx}/doc/docPump/">泵档案列表</a></li>
		<li class="active"><a href="${ctx}/doc/docPump/form?id=${docPump.id}">泵档案<shiro:hasPermission name="doc:docPump:edit">${not empty docPump.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="doc:docPump:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="docPump" action="${ctx}/doc/docPump/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>		
		<div class="control-group">
			<label class="control-label">泵编码：</label>
			<div class="controls">
				<sys:treeselect id="pumpCode" name="docCar.id" value="${docPump.docCar.id}" labelName="docCar.carTypename" labelValue="${docPump.docCar.carTypename}"
								title="车辆档案" url="/doc/docCar/treeDataPump" cssClass="required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">泵名称：</label>
			<div class="controls">
				<form:input path="pumpName" htmlEscape="false" maxlength="120" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">备注：</label>
			<div class="controls">
				<form:input path="comment" htmlEscape="false" maxlength="12" class="input-xlarge "/>
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
			<shiro:hasPermission name="doc:docPump:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>