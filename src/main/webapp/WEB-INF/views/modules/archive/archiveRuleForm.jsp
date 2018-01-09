<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>分类规则管理</title>
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
		<li><a href="${ctx}/archive/archiveRule/">分类规则列表</a></li>
		<li class="active"><a href="${ctx}/archive/archiveRule/form?id=${archiveRule.id}">分类规则<shiro:hasPermission name="archive:archiveRule:edit">${not empty archiveRule.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="archive:archiveRule:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="archiveRule" action="${ctx}/archive/archiveRule/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>		
		<div class="control-group">
			<label class="control-label">规则名称：</label>
			<div class="controls">
				<form:input path="ruleName" htmlEscape="false" maxlength="50" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">规则长度：</label>
			<div class="controls">
				<form:input path="ruleLength" htmlEscape="false" maxlength="8" class="input-xlarge required"/>
				<label style="color: red">*连续8位数字代表8级编码规则长度</label>
			</div>
		</div>
		<div class="form-actions">
			<shiro:hasPermission name="archive:archiveRule:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>