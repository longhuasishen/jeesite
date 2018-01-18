<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>期初入库管理</title>
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
            $("#btnSubmit").click(function () {
                var tableDatas = getTableDatasById("addDetailTable");
                $("#tableDatas").val(tableDatas);
            });
		});
	</script>
	<script src="/static/common.js"></script>
	<%--<script src="${ctxStatic}/jquery/jquery-1.9.1.min.js" type="text/javascript"></script>--%>
	<script src="${ctxStatic}/jquery/jquery-1.8.3.min.js" type="text/javascript"></script>
	<%--<script src="${ctxStatic}/bootstrap/3.3.4/js/bootstrap.min.js" type="text/javascript"></script>--%>
	<link href="${ctxStatic}/jquery-validation/1.11.0/jquery.validate.min.css" type="text/css" rel="stylesheet" />
	<script src="${ctxStatic}/jquery-validation/1.11.0/jquery.validate.min.js" type="text/javascript"></script>
	<script src="/static/jqGrid/4.7/js/jquery.jqGrid.js"></script>
	<script src="/static/jqGrid/4.7/js/i18n/grid.locale-cn.js" type="text/javascript" charset="utf-8"></script>
	<link rel="stylesheet" type="text/css" href="/static/jquery-ui-1.12.1/jquery-ui.min.css" />
	<link rel="stylesheet" type="text/css" href="/static/jquery-ui-1.12.1/jquery-ui.theme.min.css" />
	<link rel="stylesheet" type="text/css" href="/static/jqGrid/4.7/css/ui.jqgrid-bootstrap-ui.css" />
	<%--<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css"/>
	<link rel="stylesheet" type="text/css" href="/static/jqGrid/4.7/css/ui.jqgrid-bootstrap.css" />--%>
	<link rel="stylesheet" type="text/css" href="/static/jqGrid/4.7/css/trirand/ui.jqgrid-bootstrap.css" />
	<link rel="stylesheet" type="text/css" href="/static/jqGrid/4.7/css/ui.jqgrid.css" />
	<script type="text/ecmascript" src="/static/bootstrap/3.3.4/js/bootstrap-datepicker.js"></script>
	<script type="text/ecmascript" src="/static/bootstrap/3.3.4/js/bootstrap3-typeahead.js"></script>
	<link rel="stylesheet" type="text/css" media="screen" href="/static/bootstrap/3.3.4/css/bootstrap-datepicker.css" />

	<script>
        $.jgrid.defaults.width = $(window).width()*0.95;
        $.jgrid.defaults.responsive = true;
        $.jgrid.defaults.styleUI = 'Bootstrap';
	</script>
	<style type="text/css">
		.ui-jqgrid-sortable{
			line-height: 14px;
		}
		.ui-jqgrid .ui-jqgrid-htable thead th{
			border-bottom: 1px solid #ddd;
		}
	</style>
</head>
<body>
	<ul class="nav nav-tabs">
		<li><a href="${ctx}/financedoc/docInitStorageMain/">期初入库列表</a></li>
		<li class="active"><a href="${ctx}/financedoc/docInitStorageMain/form?id=${docInitStorageMain.id}">期初入库<shiro:hasPermission name="financedoc:docInitStorageMain:edit">${not empty docInitStorageMain.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="financedoc:docInitStorageMain:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="docInitStorageMain" action="${ctx}/financedoc/docInitStorageMain/save" method="post" class="form-horizontal">
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
				<label class="control-label">单据编号：</label>
				<div class="controls">
					<form:input path="docCode" htmlEscape="false" maxlength="12" class="input-xlarge required"/>
					<span class="help-inline"><font color="red">*</font> </span>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">入库单号：</label>
				<div class="controls">
					<form:input path="storageCode" htmlEscape="false" maxlength="50" class="input-xlarge "/>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">入库日期时间：</label>
				<div class="controls">
					<input id="storageDate" name="storageDate" type="text" readonly="readonly" maxlength="20" class="Wdate required" readonly="readonly"
						   value="${docInitStorageMain.storageDate}"
						   onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">入库部门：</label>
				<div class="controls">
					<sys:treeselect id="storageDepartment" name="docDepartment.departmentCode" value="${docInitStorageMain.docDepartment.departmentCode}" labelName="docDepartment.departmentName" labelValue="${docInitStorageMain.docDepartment.departmentName}"
									title="部门" url="/doc/docDepartment/treeData2" cssClass="required"/>
					<span class="help-inline"><font color="red">*</font> </span>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">入库仓库：</label>
				<div class="controls">
					<sys:treeselect id="storageRepertory" name="docRepertory.repertoryCode" value="${docInitStorageMain.docRepertory.repertoryCode}" labelName="docRepertory.repertoryName" labelValue="${docInitStorageMain.docRepertory.repertoryName}"
									title="仓库" url="/doc/docRepertory/treeData2" cssClass="required"/>
					<span class="help-inline"><font color="red">*</font> </span>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">红蓝标志：</label>
				<div class="controls">
					<form:radiobuttons path="storageFlag" items="${fns:getDictList('red_blue_flag')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
					<span class="help-inline"><font color="red">*</font> </span>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">入库类型：</label>
				<div class="controls">
					<form:input path="storageType" htmlEscape="false" maxlength="20" class="input-xlarge required" value="期初入库" readonly="true"/>
					<span class="help-inline"><font color="red">*</font> </span>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">制单人：</label>
				<div class="controls">
					<form:input path="storageCreate" htmlEscape="false" maxlength="20" class="input-xlarge required"  readonly="true" value="${user.name}"/>
					<span class="help-inline"><font color="red">*</font> </span>
				</div>
			</div>
				<input type="text" id="tableDatas" name ="tableDatas" value="" style="display:none;"></input>
				</p>
			</div>
			<div class="tab-pane fade" id="persons">
				<p>
				<div style="">
					<table id="jqGrid"></table>
					<div id="jqGridPager"></div>
				</div>
				<script type="text/javascript">

                    $(document).ready(function () {
						var url = '${ctx}/financedoc/docInitStorageDetail/listJson?storageCode=${docInitStorageMain.storageCode}';
                        setDetail(url);

                    });
                    function setDetail2(){
                        var url = '${ctx}/financedoc/docInitStorageDetail/listJson?storageCode=01';
                        $("#jqGrid").jqGrid('clearGridData');
                        $("#jqGrid").jqGrid('setGridParam',{url:url}).trigger('reloadGrid');
					}
                    function setDetail(url){
                        $("#jqGrid").jqGrid('clearGridData');
                        $("#jqGrid").jqGrid({
                            url:url,
                            editurl: 'clientArray',
                            mtype: "GET",
                            datatype: "json",
                            page: 1,
                            colModel: [
                                { label: '序号', name: 'id', key: true, width: 50,hidden:true
                                },
                                { label: '品种编码', name: 'kindCode', key: false, width: 100,
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
                                    label: '规格型号',
                                    name: 'kindLevel',
                                    width: 75,
                                    editable: true,
                                    edittype:"text",//可以编辑的类型。可选值：text, textarea, select, checkbox, password, button, image and file.s
                                    editoptions: {
                                        dataInit: function (element) {
                                            $(element).attr("readonly","readonly");
                                            $(element).attr("id","kindLevel");
                                            $(element).css("padding-top","0px");
                                            $(element).css("padding-bottom","0px");
                                            $(element).css("width","75px");
                                        }
                                    }
                                },
                                {
                                    label: '计量单位',
                                    name: 'firstUnit',
                                    width: 50,
                                    editable: true,
                                    edittype:"text",//可以编辑的类型。可选值：text, textarea, select, checkbox, password, button, image and file.s
                                    editoptions: {
                                        dataInit: function (element) {
                                            $(element).attr("readonly","readonly");
                                            $(element).attr("id","firstUnit");
                                            $(element).css("padding-top","0px");
                                            $(element).css("padding-bottom","0px");
                                            $(element).css("width","50px");
                                        }
                                    }
                                },
                                {
                                    label: '单价',
                                    name: 'itemPrice',
                                    width: 50,
                                    editable: true,
                                    edittype: "text",
                                    editoptions: {
                                        dataInit: function (element) {
                                            $(element).css("padding-top","0px");
                                            $(element).css("padding-bottom","0px");
                                            $(element).css("width","50px");
                                        }
                                    }
                                },
                                {
                                    label: '金额',
                                    name: 'itemAmount',
                                    width: 50,
                                    editable: true,
                                    edittype: "text",
                                    editoptions: {
                                        dataInit: function (element) {
                                            $(element).css("padding-top","0px");
                                            $(element).css("padding-bottom","0px");
                                            $(element).css("width","50px");
                                        }
                                    }
                                },
                                {
                                    label: '数量',
                                    name: 'itemNumber',
                                    width: 50,
                                    sorttype:"number",
                                    editable: true,
                                    edittype:"text",
//                                edittype: "custom",
                                    editoptions: {
                                        dataInit: function (element) {
                                            $(element).css("padding-top","0px");
                                            $(element).css("padding-bottom","0px");
                                            $(element).css("width","50px");
                                        }
                                    }
                                },
                                {
                                    label: '备注',
                                    name: 'remark',
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
//                            loadonce : true,
//                        onSelectRow: editRow, // the javascript function to call on row click. will ues to to put the row in edit mode
                            viewrecords: true,
                            caption: "入库明细单列表",
                            rowList: [10, 20, 30],//用于改变显示行数的下拉列表框的元素数组。
                            height: 250,
                            rowNum: 20,
                            pager: "#jqGridPager"
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
                                            var lvalue = h.find("iframe")[0].contentWindow.document.getElementById('lvalue').value;
                                            var uvalue = h.find("iframe")[0].contentWindow.document.getElementById('uvalue').value;
                                            if(svalue !=""&& svalue!="undefined"&&svalue!=null){
                                                $("#kindCode").val(svalue);
                                                $("#kindName").val(nvalue);
                                                $("#kindLevel").val(lvalue);
                                                $("#firstUnit").val(uvalue);
                                            }
                                        }
                                    }
                                }
                            );
                        }

                        function createKindCodeEditElement(value, editOptions) {
                            var div = $("<div class='input-append'></div>");
                            var treeSelect = $("<input>",{type:"text",name:"kindCode",readonly:"readonly",value:value,style:"width:100px;padding-top:0px;padding-bottom:0px",class:'required',id:'kindCode'});
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
                        $('#jqGrid').setGroupHeaders(
                            {
                                useColSpanStyle: true,
                                groupHeaders: [
                                    { "numberOfColumns": 3, "titleText": "入库情况", "startColumnName": "itemPrice" }
                                ]
                            });
					}

				</script>
				</p>
			</div>
		</div>
		<div class="form-actions">
			<shiro:hasPermission name="financedoc:docInitStorageMain:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<shiro:hasPermission name="financedoc:docInitStorageMain:edit"><input id="btnAduit" class="btn btn-primary" type="button" value="审 核" onclick="setDetail2()"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>