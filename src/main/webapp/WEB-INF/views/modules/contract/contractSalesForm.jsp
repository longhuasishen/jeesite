<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<body>
<ul class="nav nav-tabs">
	<li><a href="${ctx}/contract/contractSales/">销售合同列表</a></li>
	<li class="active"><a href="${ctx}/contract/contractSales/form?id=${contractSales.id}">销售合同<shiro:hasPermission name="contract:contractSales:edit">${not empty contractSales.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="contract:contractSales:edit">查看</shiro:lacksPermission></a></li>
</ul><br/>
<form:form id="inputForm" modelAttribute="contractSales" action="${ctx}/contract/contractSales/save" method="post" class="form-horizontal">
	<form:hidden path="id"/>
	<sys:message content="${message}"/>
	<div class="control-group">
		<label class="control-label">工程名称：</label>
		<div class="controls">
			<sys:treeselect id="projectName" name="docCustomer.id" value="${contractSales.docCustomer.id}" labelName="docCustomer.cusProject" labelValue="${contractSales.docCustomer.cusProject}"
							title="客户档案" url="/doc/docCustomer/treeDataCusProject" cssClass="required"/>
			<span class="help-inline"><font color="red">*</font> </span>
		</div>
	</div>
	<div class="control-group">
		<label class="control-label">合同编号：</label>
		<div class="controls">
			<form:input path="contractId"  htmlEscape="false" maxlength="32" class="input-xlarge "/>
		</div>
	</div>
	<div class="control-group">
		<label class="control-label">签定日期：</label>
		<div class="controls">
			<input id="contractDate"  name="contractDate"  type="text" readonly="readonly" maxlength="20" class="Wdate required" style="width:163px;"
				   value="${contractSales.contractDate}"
				   onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});"/>
		</div>
	</div>
	<div class="control-group">
		<label class="control-label">合同单位：</label>
		<div class="controls">
			<form:input path="contractComp" htmlEscape="false" maxlength="120" class="input-xlarge "/>
		</div>
	</div>
	<div class="control-group">
		<label class="control-label">项目地址：</label>
		<div class="controls">
			<form:input path="projectAddr" htmlEscape="false" maxlength="240" class="input-xlarge "/>
		</div>
	</div>
	<div class="control-group">
		<label class="control-label">签定部门：</label>
		<div class="controls">
			<sys:treeselect id="contractDepartment" name="docDepartment.id" value="${contractSales.docDepartment.id}" labelName="docDepartment.departmentName" labelValue="${contractSales.docDepartment.departmentName}"
							title="部门档案" url="/doc/docDepartment/treeData" cssClass="required"/>
		</div>
	</div>
	<div class="control-group">
		<label class="control-label">业务员：</label>
		<div class="controls">
			<sys:treeselect id="salesPerson" name="docOfficework.id" value="${contractSales.docOfficework.id}" labelName="docOfficework.officeworkName" labelValue="${contractSales.docOfficework.officeworkName}"
							title="职员档案" url="/doc/docOfficework/treeData" cssClass="required"/>
		</div>
	</div>
	<div class="control-group">
		<label class="control-label">客户分类：</label>
		<div class="controls">
			<sys:treeselect id="comstemType" name="comstemType" value="${contractSales.docOfficework.id}" labelName="docOfficework.officeworkName" labelValue="${contractSales.docOfficework.officeworkName}"
							title="职员档案" url="/doc/docOfficework/treeData" cssClass="required"/>
		</div>
	</div>
	<div class="control-group">
		<label class="control-label">砼结算方式：</label>
		<div class="controls">
			<sys:treeselect id="tongAccmeth" name="docAccmeth.id" value="${contractSales.docAccmeth.id}" labelName="docAccmeth.accmethName" labelValue="${contractSales.docAccmeth.accmethName}"
							title="结算方式档案" url="/doc/docAccmeth/treeData" cssClass="required"/>
		</div>
	</div>
	<div class="control-group">
		<label class="control-label">签定地点：</label>
		<div class="controls">
			<form:input path="contractAddr" htmlEscape="false" maxlength="240" class="input-xlarge "/>
		</div>
	</div>
	<div class="control-group">
		<label class="control-label">见证方：</label>
		<div class="controls">
			<form:input path="thirdPerson" htmlEscape="false" maxlength="60" class="input-xlarge "/>
		</div>
	</div>
	<div class="control-group">
		<label class="control-label">有效期限：</label>
		<div class="controls">
				<%--<form:input path="effTerm" htmlEscape="false" maxlength="1" class="input-xlarge "/>--%>
			<input id="effStart"  name="effStart"  type="text" readonly="readonly" maxlength="20" class="Wdate required" style="width:163px;"
				   value="${contractSales.contractDate}"
				   onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});"/>
			　--　
			<input id="effEnd" name="effEnd" type="text" readonly="readonly" maxlength="20" class="Wdate required" style="width:163px;"
				   value="${contractSales.contractDate}"
				   onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});"/>
		</div>
	</div>
	<div class="control-group">
		<label class="control-label">方量控制：</label>
		<div class="controls">
				<%--<form:input path="cubeControl" htmlEscape="false" maxlength="1" class="input-xlarge "/>--%>
			<form:input path="cubeStart" htmlEscape="false" maxlength="32" class="input-xlarge "/>
			--
			<form:input path="cubeEnd" htmlEscape="false" maxlength="32" class="input-xlarge "/>
		</div>
	</div>
	<div class="control-group">
		<label class="control-label">时间控制：</label>
		<div class="controls">
				<%--<form:input path="timeControl" htmlEscape="false" maxlength="1" class="input-xlarge "/>--%>
			<input id="timeStart"  name="timeStart"  type="text" readonly="readonly" maxlength="20" class="Wdate required" style="width:163px;"
				   value="${contractSales.contractDate}"
				   onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});"/>
			　--　
			<input id="timeEnd" name="timeEnd" type="text" readonly="readonly" maxlength="20" class="Wdate required" style="width:163px;"
				   value="${contractSales.contractDate}"
				   onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});"/>
		</div>
	</div>
	<div class="control-group">
		<table class="table-form">
			<tr class="align-center">
				<td class="tit">制单人</td>
				<td><form:input path="createPerson" htmlEscape="false" maxlength="50"   readonly="true" value="${user.name}"/></td>
				<td class="tit">审核人</td>
				<td><form:input path="checkPerson" htmlEscape="false" maxlength="50"   readonly="true" value="${user.name}"/></td>
				<td class="tit">作废人</td>
				<td><form:input path="canclePerson" htmlEscape="false" maxlength="50"   readonly="true" value="${user.name}"/></td>
			</tr>
			<tr class="align-center">
				<td class="tit">制单日期</td>
				<td><input id="makeDate"  name="makeDate"  type="text" readonly="readonly" maxlength="20" class="Wdate required" style="width:163px;"
						   value="${contractSales.contractDate}"
						   onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});"/>
				</td>
				<td class="tit">审核日期</td>
				<td><input id="checkDate"  name="checkDate"  type="text" readonly="readonly" maxlength="20" class="Wdate required" style="width:163px;"
						   value="${contractSales.contractDate}"
						   onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});"/>
				</td>
				<td class="tit">作废日期</td>
				<td><input id="cancelDate"  name="cancelDate"  type="text" readonly="readonly" maxlength="20" class="Wdate required" style="width:163px;"
						   value="${contractSales.contractDate}"
						   onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});"/>
				</td>
			</tr>
		</table>
	</div>
	<div class="control-group">
		<label class="control-label">备注：</label>
		<div class="controls">
				<%--<form:input path="contractRemark" htmlEscape="false" maxlength="256" class="input-xlarge "/>--%>
			<form:textarea path="contractRemark" htmlEscape="false" rows="1" maxlength="1000"/>
		</div>
	</div>
		<div class="control-group">
			<label class="control-label">混凝土单价：</label>
			<li class="btns"><input id="qry" class="btn btn-primary" value="查询" onclick="qryDocConcrete()"/></li>
			<div class="controls">
				<table id="concretePrice" class="table table-striped table-bordered table-condensed">
					<thead>
						<tr>
							<th class="hide"></th>
							<th>品种编码</th>
							<th>品种名称</th>
							<th>单价</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach items="${page.list}" var="docConcrete">
						<td>${fns:abbr(docConcrete.kindCode,50)}</td>
						<td>${fns:abbr(docConcrete.kindName,120)}</td>
					</c:forEach>
					</tbody>
				</table>
			</div>
		</div>

	<div class="control-group">
		<label class="control-label">浇灌方式单价：</label>
		<div class="controls">
			<table id="watermethPrice" class="table table-striped table-bordered table-condensed">
				<thead>
				<tr>
					<th class="hide"></th>
					<th>浇灌编码</th>
					<th>浇灌名称</th>
					<th>单价</th>
					<shiro:hasPermission name="test:testDataMain:edit"><th width="10">&nbsp;</th></shiro:hasPermission>
				</tr>
				</thead>
				<tbody id="testDataChildList">
				</tbody>
				<shiro:hasPermission name="test:testDataMain:edit"><tfoot>
				<tr><td colspan="4"><a href="javascript:" onclick="addRow('#testDataChildList', testDataChildRowIdx, testDataChildTpl);testDataChildRowIdx = testDataChildRowIdx + 1;" class="btn">新增</a></td></tr>
				</tfoot></shiro:hasPermission>
			</table>
	</div>
	<div class="control-group">
		<label class="control-label">特殊要求单价：</label>
		<div class="controls">
			<table id="specPrice" class="table table-striped table-bordered table-condensed">
				<thead>
				<tr>
					<th class="hide"></th>
					<th>浇灌编码</th>
					<th>浇灌名称</th>
					<th>单价</th>
					<shiro:hasPermission name="test:testDataMain:edit"><th width="10">&nbsp;</th></shiro:hasPermission>
				</tr>
				</thead>
				<tbody id="testDataChildList">
				</tbody>
				<shiro:hasPermission name="test:testDataMain:edit"><tfoot>
				<tr><td colspan="4"><a href="javascript:" onclick="addRow('#testDataChildList', testDataChildRowIdx, testDataChildTpl);testDataChildRowIdx = testDataChildRowIdx + 1;" class="btn">新增</a></td></tr>
				</tfoot></shiro:hasPermission>
			</table>
	</div>
	<div class="control-group">
		<label class="control-label">其它特殊要求：</label>
		<div class="controls">
			<form:textarea path="sumControl" htmlEscape="false" rows="6" maxlength="1000" />
		</div>
	</div>
	<div class="control-group">
		<label class="control-label">工程需用量：</label>
		<div class="controls">
			<form:textarea path="saveInventory" htmlEscape="false" rows="6" maxlength="1000" />
		</div>
	</div>
	<div class="control-group">
		<label class="control-label">验收方法及期限：</label>
		<div class="controls">
			<form:textarea path="stockStand" htmlEscape="false" rows="6" maxlength="1000" />
		</div>
	</div>
	<div class="control-group">
		<label class="control-label">交货时间及地点：</label>
		<div class="controls">
			<form:textarea path="abcCategory" htmlEscape="false" rows="6" maxlength="1000" />
		</div>
	</div>
	<div class="control-group">
		<label class="control-label">结算方式：</label>
		<div class="controls">
			<form:textarea path="taxRate" htmlEscape="false" rows="6" maxlength="1000" />
		</div>
	</div>
	<div class="control-group">
		<label class="control-label">付款方式：</label>
		<div class="controls">
			<form:textarea path="qualityManage" htmlEscape="false" rows="6" maxlength="1000" />
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
		<shiro:hasPermission name="contract:contractSales:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
		<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
	</div>
</form:form>
</body>
<head>
	<title>销售合同管理</title>
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
		}
		);

        function projectNameTreeselectCallBack(v,h,f){
            if("ok" == v){
                $("#contractId").val($("#projectNameName").val().substring($("#projectNameName").val().indexOf("[")+1,$("#projectNameName").val().indexOf("]")));
                //获取指定客户信息
                $.get("${ctx}/doc/docCustomer/get?id=" + $("#projectNameId").val(), function(data){
                    //设置input值
                    $("#contractComp").val(data.cusOrg);
                    $("#projectAddr").val(data.cusAddress);
                });

            }
        }

        function qryDocConcrete(){
                $.get("${ctx}/doc/docConcrete/get", function(data){
                    $("#concretePrice").val(data);
                    alert(data);
                });

        }

	</script>
</head>
</html>