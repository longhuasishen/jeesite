<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>采购合同管理</title>
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
		function sup_codeTreeselectCallBack(v,h,f){
            if("ok" == v){
                //获取指定客户信息
                $("#contractCode").val($("#sup_codeName").val().substring($("#sup_codeName").val().indexOf("[")+1,$("#sup_codeName").val().indexOf("]")));
//                $("#supName").val($("#sup_codeName").val().substring(0,$("#sup_codeName").val().indexOf("[")));
//                alert($("#supName").val());
//                alert($("#sup_codeName").val());
            }
		}
        /*function archive_contractTreeselectCallBack(v,h,f){
            if("ok" == v){
                $("#contractName").val($("#archive_contractName").val().substring(0,$("#archive_contractName").val().indexOf("[")));
            }
        }
        function storageDepartmentTreeselectCallBack(v,h,f){
            if("ok" == v){
                $("#departmentName").val($("#storageDepartmentName").val().substring(0,$("#storageDepartmentName").val().indexOf("[")));
            }
        }
        function docAccmethTreeselectCallBack(v,h,f){
            if("ok" == v){
                $("#accmethName").val($("#docAccmethName").val().substring(0,$("#docAccmethName").val().indexOf("[")));
            }
        }
        function docOfficeworkTreeselectCallBack(v,h,f){
            if("ok" == v){
                $("#officeworkName").val($("#docOfficeworkName").val().substring(0,$("#docOfficeworkName").val().indexOf("[")));
            }
        }*/


		function addDetail() {
			var datas =[];
			datas.push("PZBM001");
			datas.push($("#kindName").val());
			datas.push($("#kindLevel").val());
			datas.push($("#firstUnit").val());
			datas.push($("#itemNumber").val());
			datas.push($("#itemPrice").val());
			datas.push($("#itemAmount").val());
			datas.push($("#conversionRate").val());
			datas.push($("#ckRate").val());
			addRowByTable("addDetailTable",datas);
        }
        $(function () {
            $("#addDetailTable"+" tbody").find("tr").find('td:eq(0)').hide();
            /*$("#addRowBtn").click(function(){
                $.jBox($("#importBox").html(), {title:"导入数据", buttons:{"关闭":true},
                    bottomText:"导入文件不能超过5M，仅允许导入“xls”或“xlsx”格式文件！"});
            });*/

            $("#btnSubmit").click(function () {
//                getTableDatasById("addDetailTable")
            });
        })
	</script>
	<script src="/static/common.js"></script>
</head>
<body>

	<ul class="nav nav-tabs">
		<li><a href="${ctx}/purchase/contractPurchase/">采购合同列表</a></li>
		<li class="active"><a href="${ctx}/purchase/contractPurchase/form?id=${contractPurchase.id}">采购合同<shiro:hasPermission name="purchase:contractPurchase:edit">${not empty contractPurchase.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="purchase:contractPurchase:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="contractPurchase" action="${ctx}/purchase/contractPurchase/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>
		<ul id="myTab" class="nav nav-tabs">
			<li class="active">
				<a href="#home" data-toggle="tab">
					基本信息
				</a>
			</li>
			<li><a href="#persons" data-toggle="tab">详细信息</a></li>
		</ul>
	<div id="myTabContent" class="tab-content">
		<div class="tab-pane fade in active" id="home">
			<p>
			<div class="control-group">
				<label class="control-label">合同编号：</label>
				<div class="controls">
					<form:input path="contractCode" htmlEscape="false" maxlength="16" class="input-xlarge required" readonly="true"/>
					<span class="help-inline"><font color="red">*</font> </span>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">供应商编码：</label>
				<div class="controls">
					<sys:treeselect id="sup_code" name="docSupplier.supCode" value="${contractPurchase.docSupplier.supCode}" labelName="docSupplier.supName" labelValue="${contractPurchase.docSupplier.supName}"
									title="供应商" url="/doc/docSupplier/treeData2" cssClass="required"/>
					<span class="help-inline"><font color="red">*</font> </span>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">合同分类编码：</label>
				<div class="controls">
					<sys:treeselect id="archive_contract" name="archiveContract.contractCode" value="${contractPurchase.archiveContract.contractCode}" labelName="archiveContract.contractName" labelValue="${contractPurchase.archiveContract.contractName}"
									title="合同分类" url="/archive/archiveContract/treeData2" cssClass="required"/>
					<span class="help-inline"><font color="red">*</font> </span>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">签订日期：</label>
				<div class="controls">
					<input id="signDate" name="signDate" type="text" readonly="readonly" maxlength="20" class="Wdate required" readonly="readonly"
						   value="${contractPurchase.signDate}"
						   onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">签订地点：</label>
				<div class="controls">
					<form:input path="signPlace" htmlEscape="false" maxlength="20" class="input-xlarge required"/>
					<span class="help-inline"><font color="red">*</font> </span>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">签订部门：</label>
				<div class="controls">
					<sys:treeselect id="storageDepartment" name="docDepartment.departmentCode" value="${contractPurchase.docDepartment.departmentCode}" labelName="docDepartment.departmentName" labelValue="${contractPurchase.docDepartment.departmentName}"
									title="部门" url="/doc/docDepartment/treeData2" cssClass="required"/>
					<span class="help-inline"><font color="red">*</font> </span>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">结算方式编码：</label>
				<div class="controls">
					<sys:treeselect id="docAccmeth" name="docAccmeth.accmethCode" value="${contractPurchase.docAccmeth.accmethCode}" labelName="docAccmeth.accmethName" labelValue="${contractPurchase.docAccmeth.accmethName}"
									title="结算方式" url="/doc/docAccmeth/treeData2" cssClass="required"/>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">业务员编码：</label>
				<div class="controls">
					<sys:treeselect id="docOfficework" name="docOfficework.officeworkCode" value="${contractPurchase.docOfficework.officeworkCode}" labelName="docOfficework.officeworkName" labelValue="${contractPurchase.docOfficework.officeworkName}"
									title="业务员" url="/doc/docOfficework/treeData2" cssClass="required"/>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">违约金比例：</label>
				<div class="controls">
					<form:input path="liquidDateRate" htmlEscape="false" maxlength="20" class="input-xlarge required"/>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">有效期：</label>
				<div class="controls">
					<input id="periodStart" name="periodStart" type="text" readonly="readonly" maxlength="20" class="Wdate required" readonly="readonly"
						   value="${contractPurchase.periodStart}"
						   onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
					---
					<input id="periodEnd" name="periodEnd" type="text" readonly="readonly" maxlength="20" class="Wdate required" readonly="readonly"
						   value="${contractPurchase.periodEnd}"
						   onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">是否需要承运：</label>
				<div class="controls">
					<form:input path="transportType" htmlEscape="false" maxlength="20" class="input-xlarge "/>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">制单人：</label>
				<div class="controls">
					<form:input path="contraceCreate" htmlEscape="false" maxlength="20" class="input-xlarge required" readonly="true" value="${user.name}"/>
					<span class="help-inline"><font color="red">*</font> </span>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">制单日期：</label>
				<div class="controls">
					<form:input path="contractCreateDate" htmlEscape="false" maxlength="20" readonly="true" class="input-xlarge "/>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">审核人：</label>
				<div class="controls">
					<form:input path="contractAuditor" htmlEscape="false" maxlength="20" class="input-xlarge "/>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">审核日期：</label>
				<div class="controls">
					<form:input path="contractAuditDate" htmlEscape="false" maxlength="20" class="input-xlarge "/>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">作废人：</label>
				<div class="controls">
					<form:input path="contractCancel" htmlEscape="false" maxlength="20" class="input-xlarge "/>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">作废日期：</label>
				<div class="controls">
					<form:input path="contractCancelDate" htmlEscape="false" maxlength="20" class="input-xlarge "/>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">备注：</label>
				<div class="controls">
					<form:input path="remark" htmlEscape="false" maxlength="1000" class="input-xlarge "/>
				</div>
			</div>
				<%--<input name="docDepartment.departmentName" id="departmentName" type="text" style="display:none;"/>
                <input name="docSupplier.supName" id="supName" type="text" style="display:none;" value="123"/>
			<input name="archiveContract.contractName" id="contractName" type="text" style="display:none;"/>
			<input name="docAccmeth.accmethName" id="accmethName" type="text" style="display:none;"/>
			<input name="docOfficework.officeworkName" id="officeworkName" type="text" style="display:none;"/>--%>
			</p>
		</div>
		<div class="tab-pane fade" id="persons">
			<p>
				<table id="addDetailTable" class="table table-striped table-bordered table-condensed">
					<thead>

						<th>品种编码</th>
						<th>品种名称</th>
						<th>规格型号</th>
						<th>计量单位</th>
						<th>数量</th>
						<th>单价</th>
						<th>金额</th>
						<th>折算比</th>
						<th>扣称比例</th>
						<th>是否完成</th>
						<th>操作</th>
					</thead>
					<tbody>
					<c:forEach items="${detailList}" var="contractPurchaseDetail">
						<tr>
							<td>${fns:abbr(contractPurchaseDetail.kindCode,50)}</td>
							<td>${fns:abbr(contractPurchaseDetail.kindCode,50)}</td>
							<td>${fns:abbr(contractPurchaseDetail.kindCode,50)}</td>
							<td>${fns:abbr(contractPurchaseDetail.kindCode,50)}</td>
							<td>${fns:abbr(contractPurchaseDetail.kindCode,50)}</td>
							<td>${fns:abbr(contractPurchaseDetail.itemAmount,50)}</td>
							<td>${fns:abbr(contractPurchaseDetail.itemNumber,50)}</td>
							<td>${fns:abbr(contractPurchaseDetail.itemPrice,50)}</td>
							<td>${fns:abbr(contractPurchaseDetail.conversionRate,50)}</td>
							<td>${fns:abbr(contractPurchaseDetail.otherRate,50)}</td>
							<td>${fns:abbr(contractPurchaseDetail.isComplete,50)}</td>
							<td>
								<a href='#' id='saveLink' style="display: none" onclick='saveRowById(this)'>保存|</a>
								<a href='#' id='editLink' onclick='editRowById(this)'>编辑|</a>
								<a href='#' id='deleteLink' onclick='deleteRowById(this)'>删除</a>
							</td>
							<%--<td>${fns:abbr(contractPurchaseDetail.cusCode,50)}</td>--%>
						</tr>
					</c:forEach>

					</tbody>
				</table>
				<div>
					<input type="button" id="addRowBtn" value="添加一行" onclick="addDetail()"></input>
				</div>
			</p>
		</div>
	</div>

		<div class="form-actions">
			<shiro:hasPermission name="purchase:contractPurchase:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>