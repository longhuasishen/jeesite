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
		<li class="active"><a href="${ctx}/doc/docStationinfo/formDetail?id=${docStationinfo.id}">搅拌站点信息</a></li>
	</ul><br/>
	<form:form id="searchForm" method="post" class="breadcrumb form-search">
		<ul class="ul-form">
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="button" value="点击连接"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<form:form id="inputForm" modelAttribute="docStationinfo" action="${ctx}/doc/docStationinfo/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>
		<ul id="myTab" class="nav nav-tabs">
			<li class="active">
				<a href="#home" data-toggle="tab">
					连接参数
				</a>
			</li>
			<li><a href="#erp" data-toggle="tab">ERP字段说明</a></li>
			<li >
				<a href="#concat" data-toggle="tab">接口字段对应表</a>
			</li>
		</ul>
	<div id="myTabContent" class="tab-content">
		<div class="tab-pane fade in active" id="home">
			<p>
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
			</p>
		</div>
		<div class="tab-pane fade" id="erp">
			<p>
			<div class="control-group">
				<table id="contentTable" class="table table-striped table-bordered table-condensed">
					<thead><tr><th title="数据库字段名">列名</th><th title="默认读取数据库字段备注">说明</th><th title="数据库中设置的字段类型及长度">物理类型</th></tr></thead>
					<tbody>
					<c:forEach items="${genTable.columnList}" var="column" varStatus="vs">
						<tr${column.delFlag eq '1'?' class="error" title="已删除的列，保存之后消失！"':''}>
							<td nowrap>
								<input type="hidden" name="columnList[${vs.index}].id" value="${column.id}"/>
								<input type="hidden" name="columnList[${vs.index}].delFlag" value="${column.delFlag}"/>
								<input type="hidden" name="columnList[${vs.index}].genTable.id" value="${column.genTable.id}"/>
								<input type="hidden" name="columnList[${vs.index}].name" value="${column.name}"/>${column.name}
							</td>
							<td>
								<input type="text" name="columnList[${vs.index}].comments" value="${column.comments}" maxlength="200" class="required" style="width:100px;"/>
							</td>
							<td nowrap>
								<input type="hidden" name="columnList[${vs.index}].jdbcType" value="${column.jdbcType}"/>${column.jdbcType}
							</td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
			</div>
			</p>
		</div>
		<div class="tab-pane fade" id="concat">
			<p>
			</p>
		</div>
	</div>

	</form:form>
</body>
</html>