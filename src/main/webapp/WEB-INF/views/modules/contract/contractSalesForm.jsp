<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
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

        function btnClickBeton(){
            $("#jqGrid").jqGrid('clearGridData');
            $("#jqGrid").jqGrid('setGridParam',{
                url: '${ctx}/doc/docBeton/listJson',
                mtype: "GET",
                datatype: "json",
            }).trigger("reloadGrid");
		}

        function btnClickWatermeth(){
            $("#jqGrid2").jqGrid('clearGridData');
            $("#jqGrid2").jqGrid('setGridParam',{
                url: '${ctx}/doc/docWatermeth/listJson',
                mtype: "GET",
                datatype: "json",
            }).trigger("reloadGrid");
        }

        function btnClickSpecialreq(){
            $("#jqGrid3").jqGrid('clearGridData');
            $("#jqGrid3").jqGrid('setGridParam',{
                url: '${ctx}/doc/docSpecialreq/listJson',
                mtype: "GET",
                datatype: "json",
            }).trigger("reloadGrid");
        }

        $(function () {
            $("#addDetailTable"+" tbody").find("tr").find('td:eq(0)').hide();
            /*$("#addRowBtn").click(function(){
                $.jBox($("#importBox").html(), {title:"导入数据", buttons:{"关闭":true},
                    bottomText:"导入文件不能超过5M，仅允许导入“xls”或“xlsx”格式文件！"});
            });*/

            $("#btnSubmit").click(function () {
                var tableDatas = getTableDatasById("addDetailTable");
                $("#tableDatas").val(tableDatas);
                var tableDatas2 = getTableDatasById2("addDetailTable");
                $("#tableDatas2").val(tableDatas2);
                var tableDatas3 = getTableDatasById3("addDetailTable");
                $("#tableDatas3").val(tableDatas3);
            });

        });
	</script>
	<script src="/static/common.js"></script>
	<script src="${ctxStatic}/jquery/jquery-1.8.3.min.js" type="text/javascript"></script>
	<link href="${ctxStatic}/jquery-validation/1.11.0/jquery.validate.min.css" type="text/css" rel="stylesheet" />
	<script src="${ctxStatic}/jquery-validation/1.11.0/jquery.validate.min.js" type="text/javascript"></script>
	<script src="/static/jqGrid/4.7/js/jquery.jqGrid.js"></script>
	<script src="/static/jqGrid/4.7/js/i18n/grid.locale-cn.js" type="text/javascript" charset="utf-8"></script>
	<link rel="stylesheet" type="text/css" href="/static/jquery-ui-1.12.1/jquery-ui.min.css" />
	<link rel="stylesheet" type="text/css" href="/static/jquery-ui-1.12.1/jquery-ui.theme.min.css" />
	<link rel="stylesheet" type="text/css" href="/static/jqGrid/4.7/css/ui.jqgrid-bootstrap-ui.css" />
	<link rel="stylesheet" type="text/css" href="/static/jqGrid/4.7/css/trirand/ui.jqgrid-bootstrap.css" />
	<link rel="stylesheet" type="text/css" href="/static/jqGrid/4.7/css/ui.jqgrid.css" />
	<script type="text/ecmascript" src="/static/bootstrap/3.3.4/js/bootstrap-datepicker.js"></script>
	<script type="text/ecmascript" src="/static/bootstrap/3.3.4/js/bootstrap3-typeahead.js"></script>
	<link rel="stylesheet" type="text/css" media="screen" href="/static/bootstrap/3.3.4/css/bootstrap-datepicker.css" />

	<script>
        $.jgrid.defaults.width = $(window).width()*0.3;
        $.jgrid.defaults.responsive = true;
        $.jgrid.defaults.styleUI = 'Bootstrap';
	</script>
</head>
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
				   value="${contractSales.effStart}"
				   onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});"/>
			　--　
			<input id="effEnd" name="effEnd" type="text" readonly="readonly" maxlength="20" class="Wdate required" style="width:163px;"
				   value="${contractSales.effEnd}"
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
				   value="${contractSales.timeStart}"
				   onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});"/>
			　--　
			<input id="timeEnd" name="timeEnd" type="text" readonly="readonly" maxlength="20" class="Wdate required" style="width:163px;"
				   value="${contractSales.timeEnd}"
				   onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});"/>
		</div>
	</div>
	<div>
		<table>
			<tr>

				<td>
					<div style="text-align: center;">
						<input id="btnBeton" class="btn btn-primary" type="button" value="生成混凝土单价" onclick="btnClickBeton()"/>
					</div>
				</td>

				<td>
					<div style="text-align: center;">
						<input id="btnWatermeth" class="btn btn-primary" type="button" value="生成浇灌方法加价" onclick="btnClickWatermeth()"/>
					</div>
				</td>
				<td>
					<div style="text-align: center;">
						<input id="btnSpecialreq" class="btn btn-primary" type="button" value="生成特殊要求方法加价" onclick="btnClickSpecialreq()"/>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div style="">
						<table id="jqGrid"></table>
						<div id="jqGridPager"></div>
					</div>
				</td>
				<td>
					<div style="">
						<table id="jqGrid2"></table>
						<div id="jqGrid2Pager"></div>
					</div>
				</td>
				<td>
					<div style="">
						<table id="jqGrid3"></table>
						<div id="jqGrid3Pager"></div>
					</div>
				</td>
			</tr>
		</table>
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
						   value="${contractSales.makeDate}"
						   onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});"/>
				</td>
				<td class="tit">审核日期</td>
				<td><input id="checkDate"  name="checkDate"  type="text" readonly="readonly" maxlength="20" class="Wdate required" style="width:163px;"
						   value="${contractSales.checkDate}"
						   onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});"/>
				</td>
				<td class="tit">作废日期</td>
				<td><input id="cancelDate"  name="cancelDate"  type="text" readonly="readonly" maxlength="20" class="Wdate required" style="width:163px;"
						   value="${contractSales.cancelDate}"
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

		<%--<div class="control-group">--%>
			<%--<label class="control-label">混凝土单价：</label>--%>
			<%--<li class="btns"><input id="qry" class="btn btn-primary" value="查询" onclick="qryDocConcrete()"/></li>--%>
			<%--<div class="controls">--%>
				<%--<table id="concretePrice" class="table table-striped table-bordered table-condensed">--%>
					<%--<thead>--%>
						<%--<tr>--%>
							<%--<th class="hide"></th>--%>
							<%--<th>品种编码</th>--%>
							<%--<th>品种名称</th>--%>
							<%--<th>单价</th>--%>
						<%--</tr>--%>
					<%--</thead>--%>
					<%--<tbody>--%>
					<%--<c:forEach items="${page.list}" var="docConcrete">--%>
						<%--<td>${fns:abbr(docConcrete.kindCode,50)}</td>--%>
						<%--<td>${fns:abbr(docConcrete.kindName,120)}</td>--%>
					<%--</c:forEach>--%>
					<%--</tbody>--%>
				<%--</table>--%>
			<%--</div>--%>
		<%--</div>--%>

	<%--<div class="control-group">--%>
		<%--<label class="control-label">浇灌方式单价：</label>--%>
		<%--<div class="controls">--%>
			<%--<table id="watermethPrice" class="table table-striped table-bordered table-condensed">--%>
				<%--<thead>--%>
				<%--<tr>--%>
					<%--<th class="hide"></th>--%>
					<%--<th>浇灌编码</th>--%>
					<%--<th>浇灌名称</th>--%>
					<%--<th>单价</th>--%>
					<%--<shiro:hasPermission name="test:testDataMain:edit"><th width="10">&nbsp;</th></shiro:hasPermission>--%>
				<%--</tr>--%>
				<%--</thead>--%>
				<%--<tbody id="testDataChildList">--%>
				<%--</tbody>--%>
				<%--<shiro:hasPermission name="test:testDataMain:edit"><tfoot>--%>
				<%--<tr><td colspan="4"><a href="javascript:" onclick="addRow('#testDataChildList', testDataChildRowIdx, testDataChildTpl);testDataChildRowIdx = testDataChildRowIdx + 1;" class="btn">新增</a></td></tr>--%>
				<%--</tfoot></shiro:hasPermission>--%>
			<%--</table>--%>
	<%--</div>--%>
	<%--<div class="control-group">--%>
		<%--<label class="control-label">特殊要求单价：</label>--%>
		<%--<div class="controls">--%>
			<%--<table id="specPrice" class="table table-striped table-bordered table-condensed">--%>
				<%--<thead>--%>
				<%--<tr>--%>
					<%--<th class="hide"></th>--%>
					<%--<th>浇灌编码</th>--%>
					<%--<th>浇灌名称</th>--%>
					<%--<th>单价</th>--%>
					<%--<shiro:hasPermission name="test:testDataMain:edit"><th width="10">&nbsp;</th></shiro:hasPermission>--%>
				<%--</tr>--%>
				<%--</thead>--%>
				<%--<tbody id="testDataChildList">--%>
				<%--</tbody>--%>
				<%--<shiro:hasPermission name="test:testDataMain:edit"><tfoot>--%>
				<%--<tr><td colspan="4"><a href="javascript:" onclick="addRow('#testDataChildList', testDataChildRowIdx, testDataChildTpl);testDataChildRowIdx = testDataChildRowIdx + 1;" class="btn">新增</a></td></tr>--%>
				<%--</tfoot></shiro:hasPermission>--%>
			<%--</table>--%>
	<%--</div>--%>
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
	<div class="control-group"  style="display:none">
		<label class="control-label">ext_field1：</label>
		<div class="controls">
			<form:input path="extField1" htmlEscape="false" maxlength="60" class="input-xlarge "/>
		</div>
	</div>
	<div class="control-group"  style="display:none">
		<label class="control-label">ext_field2：</label>
		<div class="controls">
			<form:input path="extField2" htmlEscape="false" maxlength="60" class="input-xlarge "/>
		</div>
	</div>
	<div class="control-group"  style="display:none">
		<label class="control-label">ext_field3：</label>
		<div class="controls">
			<form:input path="extField3" htmlEscape="false" maxlength="120" class="input-xlarge "/>
		</div>
	</div>
	<div class="control-group"  style="display:none">
		<label class="control-label">remark：</label>
		<div class="controls">
			<form:input path="remark" htmlEscape="false" maxlength="1000" class="input-xlarge "/>
		</div>
	</div>
		<input type="text" id="tableDatas" name ="tableDatas" value="" style="display:none;"></input>
		<input type="text" id="tableDatas2" name ="tableDatas2" value="" style="display:none;"></input>
		<input type="text" id="tableDatas3" name ="tableDatas3" value="" style="display:none;"></input>

			<script type="text/javascript">

                $(document).ready(function () {
                    $("#jqGrid").jqGrid({
                        url: '${ctx}/contract/contractSalesBeton/listJson?contractId=${contractSales.contractId}',
                        editurl: 'clientArray',
                        mtype: "GET",
                        datatype: "json",
                        page: 1,
                        colModel: [
                            { label: '序号', name: 'id', key: true, width: 150,hidden:true
                            },
                            { label: '品种编码', name: 'kindCode', key: false, width: 150,
                                editable: true,
                                edittype: "custom",
                                editoptions: {
                                    custom_value: getKindCodeElementValue,
                                    custom_element: createKindCodeEditElement
                                }
                            },
                            {
                                label: '品种名称',
                                name: 'kindName',
                                width: 150,
                                editable: true,
                                edittype:"text",//可以编辑的类型。可选值：text, textarea, select, checkbox, password, button, image and file.s
                                editoptions: {
                                    dataInit: function (element) {
                                        $(element).attr("readonly","readonly");
                                        $(element).attr("id","kindName");
                                        $(element).css("padding-top","0px");
                                        $(element).css("padding-bottom","0px");
                                        $(element).css("width","150px");
                                    }
                                }
                            },
                            {
                                label: '单价',
                                name: 'univalent',
                                width: 75,
                                editable: true,
                                edittype: "text",
                                editoptions: {
                                    dataInit: function (element) {
                                        $(element).css("padding-top","0px");
                                        $(element).css("padding-bottom","0px");
                                        $(element).css("width","75px");
                                    }
                                }
                            }
                        ],
                        loadonce : true,
                        viewrecords: true,
                        caption: "混凝土单价",
                        rowList: [10, 20, 30],//用于改变显示行数的下拉列表框的元素数组。
                        height: 250,
                        rowNum: 20,
                        pager: "#jqGridPager"
                    });

                    $("#jqGrid2").jqGrid({
                        url: '${ctx}/contract/contractSalesWatermeth/listJson?contractId=${contractSales.contractId}',
                        editurl: 'clientArray',
                        mtype: "GET",
                        datatype: "json",
                        page: 1,
                        colModel: [
                            { label: '序号', name: 'id', key: true, width: 180, hidden:true
                            },
                            { label: '浇灌方式编码', name: 'watermethCode', key: false, width: 180,
                                editable: true,
                                edittype: "custom",
                                editoptions: {
                                    custom_value: getWatermethCodeElementValue,
                                    custom_element: createWatermethCodeEditElement
                                }
                            },
                            {
                                label: '浇灌方法名称',
                                name: 'watermethName',
                                width: 180,
                                editable: true,
                                edittype:"text",//可以编辑的类型。可选值：text, textarea, select, checkbox, password, button, image and file.s
                                editoptions: {
                                    dataInit: function (element) {
                                        $(element).attr("readonly","readonly");
                                        $(element).attr("id","watermethName");
                                        $(element).css("padding-top","0px");
                                        $(element).css("padding-bottom","0px");
                                        $(element).css("width","150px");
                                    }
                                }
                            },
                            {
                                label: '单价',
                                name: 'watermethUnivalent',
                                width: 180,
                                editable: true,
                                edittype: "text",
                                editoptions: {
                                    dataInit: function (element) {
                                        $(element).css("padding-top","0px");
                                        $(element).css("padding-bottom","0px");
                                        $(element).css("width","75px");
                                    }
                                }
                            }
                        ],
                        loadonce : true,
                        viewrecords: true,
                        caption: "浇灌方法加价",
                        rowList: [10, 20, 30],//用于改变显示行数的下拉列表框的元素数组。
                        height: 250,
                        rowNum: 20,
                        pager: "#jqGrid2Pager"
                    });
                    $("#jqGrid3").jqGrid({
                        url: '${ctx}/contract/contractSalesSpecialreq/listJson?contractId=${contractSales.contractId}',
                        editurl: 'clientArray',
                        mtype: "GET",
                        datatype: "json",
                        page: 1,
                        colModel: [
                            { label: '序号', name: 'id', key: true, width: 150,hidden:true
                            },
                            { label: '特殊方式编码', name: 'specialreqCode', key: false, width: 150,
                                editable: true,
                                edittype: "custom",
                                editoptions: {
                                    custom_value: getSpecialreqCodeElementValue,
                                    custom_element: createSpecialreqCodeEditElement
                                }
                            },
                            {
                                label: '特殊方式名称',
                                name: 'specialreqName',
                                width: 150,
                                editable: true,
                                edittype:"text",//可以编辑的类型。可选值：text, textarea, select, checkbox, password, button, image and file.s
                                editoptions: {
                                    dataInit: function (element) {
                                        $(element).attr("readonly","readonly");
                                        $(element).attr("id","specialreqName");
                                        $(element).css("padding-top","0px");
                                        $(element).css("padding-bottom","0px");
                                        $(element).css("width","150px");
                                    }
                                }
                            },
                            {
                                label: '单价',
                                name: 'specialreqUnivalent',
                                width: 75,
                                editable: true,
                                edittype: "text",
                                editoptions: {
                                    dataInit: function (element) {
                                        $(element).css("padding-top","0px");
                                        $(element).css("padding-bottom","0px");
                                        $(element).css("width","75px");
                                    }
                                }
                            }
                        ],
                        loadonce : true,
                        viewrecords: true,
                        caption: "特殊要求加价",
                        rowList: [10, 20, 30],//用于改变显示行数的下拉列表框的元素数组。
                        height: 250,
                        rowNum: 20,
                        pager: "#jqGrid3Pager"
                    });

                    var lastSelection;

                    function editRow(id) {
                        if (id && id !== lastSelection) {
                            var grid = $("#jqGrid");
                            grid.jqGrid('restoreRow',lastSelection);
                            grid.jqGrid('editRow',id, {keys:false, focusField: 4});
//                            grid.jqGrid('saveRow',id,{url:'clientArray'});
                            lastSelection = id;
                        }
                        $("#userButton").unbind("click").click(function(){
                            searchKind(id);
                        });
                    }
                    function searchKind(id) {
                        top.$.jBox.open("iframe:${ctx}/doc/docKind/listFrame",
                            "品种选择",700,330,
                            {
                                buttons:{"确定":"OK"},
                                submit:function(v,h,f) {
                                    if (v == 'OK') {
                                        var svalue = h.find("iframe")[0].contentWindow.document.getElementById('svalue').value;
                                        var nvalue = h.find("iframe")[0].contentWindow.document.getElementById('nvalue').value;
                                        if(svalue !=""&& svalue!="undefined"&&svalue!=null){
                                            $("#kindCode").val(svalue);
                                            $("#kindName").val(nvalue);
                                        }
                                    }
                                }
                            }
                        );
                    }

                    function searchWatermeth(id) {
                        top.$.jBox.open("iframe:${ctx}/doc/docWatermeth/listFrame",
                            "浇灌方式",700,330,
                            {
                                buttons:{"确定":"OK"},
                                submit:function(v,h,f) {
                                    if (v == 'OK') {
                                        var svalue = h.find("iframe")[0].contentWindow.document.getElementById('svalue').value;
                                        var nvalue = h.find("iframe")[0].contentWindow.document.getElementById('nvalue').value;
                                        if(svalue !=""&& svalue!="undefined"&&svalue!=null){
                                            $("#watermethCode").val(svalue);
                                            $("#watermethName").val(nvalue);
                                        }
                                    }
                                }
                            }
                        );
                    }

                    function searchSpecialreq(id) {
                        top.$.jBox.open("iframe:${ctx}/doc/docSpecialreq/listFrame",
                            "浇灌方式",700,330,
                            {
                                buttons:{"确定":"OK"},
                                submit:function(v,h,f) {
                                    if (v == 'OK') {
                                        var svalue = h.find("iframe")[0].contentWindow.document.getElementById('svalue').value;
                                        var nvalue = h.find("iframe")[0].contentWindow.document.getElementById('nvalue').value;
                                        if(svalue !=""&& svalue!="undefined"&&svalue!=null){
                                            $("#specialreqCode").val(svalue);
                                            $("#specialreqName").val(nvalue);
                                        }
                                    }
                                }
                            }
                        );
                    }

                    function createKindCodeEditElement(value, editOptions) {
                        var div = $("<div class='input-append'></div>");
                        var treeSelect = $("<input>",{type:"text",name:"kindCode",readonly:"readonly",value:value,style:"width:120px;padding-top:0px;padding-bottom:0px",class:'required',id:'kindCode'});
                        var searchClass = $("<a>",{id:'userButton',href:'#',class:'btn  ',style:'padding-top:0px;padding-right:1px;padding-bottom:0px;padding-left:1px;'});
                        var iClass = $("<i>",{class:'icon-search'});
                        searchClass.append(iClass);
                        div.append(treeSelect).append(searchClass);
                        return div;
                    }

                    function createWatermethCodeEditElement(value, editOptions) {
                        var div = $("<div class='input-append'></div>");
                        var treeSelect = $("<input>",{type:"text",name:"watermethCode",readonly:"readonly",value:value,style:"width:120px;padding-top:0px;padding-bottom:0px",class:'required',id:'watermethCode'});
                        var searchClass = $("<a>",{id:'userButton',href:'#',class:'btn  ',style:'padding-top:0px;padding-right:1px;padding-bottom:0px;padding-left:1px;'});
                        var iClass = $("<i>",{class:'icon-search'});
                        searchClass.append(iClass);
                        div.append(treeSelect).append(searchClass);
                        return div;
                    }

                    function createSpecialreqCodeEditElement(value, editOptions) {
                        var div = $("<div class='input-append'></div>");
                        var treeSelect = $("<input>",{type:"text",name:"specialreqCode",readonly:"readonly",value:value,style:"width:120px;padding-top:0px;padding-bottom:0px",class:'required',id:'specialreqCode'});
                        var searchClass = $("<a>",{id:'userButton',href:'#',class:'btn  ',style:'padding-top:0px;padding-right:1px;padding-bottom:0px;padding-left:1px;'});
                        var iClass = $("<i>",{class:'icon-search'});
                        searchClass.append(iClass);
                        div.append(treeSelect).append(searchClass);
                        return div;
                    }

                    function getKindCodeElementValue(elem, oper, value) {
                        if (oper === "get") {
                            var val = $("#kindCode").val();
                            return val;
                        }
                    }
                    function getWatermethCodeElementValue(elem, oper, value) {
                        if (oper === "get") {
                            var val = $("#watermethCode").val();
                            return val;
                        }
                    }
                    function getSpecialreqCodeElementValue(elem, oper, value) {
                        if (oper === "get") {
                            var val = $("#specialreqCode").val();
                            return val;
                        }
                    }
                    $('#jqGrid').navGrid("#jqGridPager", {edit: false, add: false, del: true, refresh: false, view: false});
                    $('#jqGrid').inlineNav('#jqGridPager',
                        // the buttons to appear on the toolbar of the grid
                        {
                            edit: true,
                            add: true,
                            del: true,
                            cancel: true,
                            editParams: {
                                keys: true,
                                oneditfunc:function () {
                                    $("#userButton").unbind("click").click(function(){
                                        searchKind(id);
                                    });
                                }
                            },
                            addParams: {
                                keys: true,
                                addRowParams:{
                                    oneditfunc:function () {
                                        $("#userButton").unbind("click").click(function(){
                                            searchKind(id);
                                        });
                                    }
                                }
                            }
                        }
                    );

                    $('#jqGrid2').navGrid("#jqGrid2Pager", {edit: false, add: false, del: true, refresh: false, view: false});
                    $('#jqGrid2').inlineNav('#jqGrid2Pager',
                        // the buttons to appear on the toolbar of the grid
                        {
                            edit: true,
                            add: true,
                            del: true,
                            cancel: true,
                            editParams: {
                                keys: true,
                                oneditfunc:function () {
                                    $("#userButton").unbind("click").click(function(){
                                        searchWatermeth(id);
                                    });
                                }
                            },
                            addParams: {
                                keys: true,
                                addRowParams:{
                                    oneditfunc:function () {
                                        $("#userButton").unbind("click").click(function(){
                                            searchWatermeth(id);
                                        });
                                    }
                                }
                            }
                        }
                    );

                    $('#jqGrid3').navGrid("#jqGrid3Pager", {edit: false, add: false, del: true, refresh: false, view: false});
                    $('#jqGrid3').inlineNav('#jqGrid3Pager',
                        // the buttons to appear on the toolbar of the grid
                        {
                            edit: true,
                            add: true,
                            del: true,
                            cancel: true,
                            editParams: {
                                keys: true,
                                oneditfunc:function () {
                                    $("#userButton").unbind("click").click(function(){
                                        searchSpecialreq(id);
                                    });
                                }
                            },
                            addParams: {
                                keys: true,
                                addRowParams:{
                                    oneditfunc:function () {
                                        $("#userButton").unbind("click").click(function(){
                                            searchSpecialreq(id);
                                        });
                                    }
                                }
                            }
                        }
                    );

                });

			</script>
	</div>

	<div class="form-actions">
		<shiro:hasPermission name="contract:contractSales:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
		<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
	</div>
</form:form>
</body>
</html>