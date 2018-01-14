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

            $("#btnSubmit").click(function () {
                var tableDatas = getTableDatasById("addDetailTable");
                $("#tableDatas").val(tableDatas);
            });
        })
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
	</style>
	<%--<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>--%>
</head>
<body>

<ul class="nav nav-tabs">
	<li><a href="${ctx}/purchase/contractPurchaseSupplement/">采购合同补充协议列表</a></li>
	<li class="active"><a href="${ctx}/purchase/contractPurchaseSupplement/form?id=${contractPurchaseSupplement.id}">采购合同补充协议添加<shiro:hasPermission name="purchase:contractPurchaseSupplement:edit">${not empty contractPurchaseSupplement.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="purchase:contractPurchaseSupplement:edit">查看</shiro:lacksPermission></a></li>
</ul><br/>
<form:form id="inputForm" modelAttribute="contractPurchaseSupplement" action="${ctx}/purchase/contractPurchaseSupplement/save" method="post" class="form-horizontal">
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
					<sys:treeselect id="sup_code" name="docSupplier.supCode" value="${contractPurchaseSupplement.docSupplier.supCode}" labelName="docSupplier.supName" labelValue="${contractPurchaseSupplement.docSupplier.supName}"
									title="供应商" url="/doc/docSupplier/treeData2" cssClass="required"/>
					<span class="help-inline"><font color="red">*</font> </span>
				</div>
			</div>

			<div class="control-group">
				<label class="control-label">签订日期：</label>
				<div class="controls">
					<input id="signDate" name="signDate" type="text" readonly="readonly" maxlength="20" class="Wdate required" readonly="readonly"
						   value="${contractPurchaseSupplement.signDate}"
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
				<label class="control-label">结算方式编码：</label>
				<div class="controls">
					<sys:treeselect id="docAccmeth" name="docAccmeth.accmethCode" value="${contractPurchaseSupplement.docAccmeth.accmethCode}" labelName="docAccmeth.accmethName" labelValue="${contractPurchaseSupplement.docAccmeth.accmethName}"
									title="结算方式" url="/doc/docAccmeth/treeData2" cssClass="required"/>
				</div>
			</div>

			<div class="control-group">
				<label class="control-label">有效期：</label>
				<div class="controls">
					<input id="periodStart" name="periodStart" type="text" readonly="readonly" maxlength="20" class="Wdate required" readonly="readonly"
						   value="${contractPurchaseSupplement.periodStart}"
						   onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
					---
					<input id="periodEnd" name="periodEnd" type="text" readonly="readonly" maxlength="20" class="Wdate required" readonly="readonly"
						   value="${contractPurchaseSupplement.periodEnd}"
						   onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
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
                    $("#jqGrid").jqGrid({
                        url: '${ctx}/purchase/contractPurchaseSupplementDetail/listJson?contractCode=${contractPurchaseSupplement.contractCode}',
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
                                /*edittype: "select",
                                editoptions: {
                                    value: "ALFKI:ALFKI;ANATR:ANATR;ANTON:ANTON;AROUT:AROUT;BERGS:BERGS;BLAUS:BLAUS;BLONP:BLONP;BOLID:BOLID;BONAP:BONAP;BOTTM:BOTTM;BSBEV:BSBEV;CACTU:CACTU;CENTC:CENTC;CHOPS:CHOPS;COMMI:COMMI;CONSH:CONSH;DRACD:DRACD;DUMON:DUMON;EASTC:EASTC;ERNSH:ERNSH;FAMIA:FAMIA;FISSA:FISSA;FOLIG:FOLIG;FOLKO:FOLKO;FRANK:FRANK;FRANR:FRANR;FRANS:FRANS;FURIB:FURIB;GALED:GALED;GODOS:GODOS;GOURL:GOURL;GREAL:GREAL;GROSR:GROSR;HANAR:HANAR;HILAA:HILAA;HUNGC:HUNGC;HUNGO:HUNGO;ISLAT:ISLAT;KOENE:KOENE;LACOR:LACOR;LAMAI:LAMAI;LAUGB:LAUGB;LAZYK:LAZYK;LEHMS:LEHMS;LETSS:LETSS;LILAS:LILAS;LINOD:LINOD;LONEP:LONEP;MAGAA:MAGAA;MAISD:MAISD;MEREP:MEREP;MORGK:MORGK;NORTS:NORTS;OCEAN:OCEAN;OLDWO:OLDWO;OTTIK:OTTIK;PARIS:PARIS;PERIC:PERIC;PICCO:PICCO;PRINI:PRINI;QUEDE:QUEDE;QUEEN:QUEEN;QUICK:QUICK;RANCH:RANCH;RATTC:RATTC;REGGC:REGGC;RICAR:RICAR;RICSU:RICSU;ROMEY:ROMEY;SANTG:SANTG;SAVEA:SAVEA;SEVES:SEVES;SIMOB:SIMOB;SPECD:SPECD;SPLIR:SPLIR;SUPRD:SUPRD;THEBI:THEBI;THECR:THECR;TOMSP:TOMSP;TORTU:TORTU;TRADH:TRADH;TRAIH:TRAIH;VAFFE:VAFFE;VICTE:VICTE;VINET:VINET;WANDK:WANDK;WARTH:WARTH;WELLI:WELLI;WHITC:WHITC;WILMK:WILMK;WOLZA:WOLZA"
                                }*/
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
                                label: '数量',
                                name: 'itemNumber',
                                width: 50,
                                sorttype:"number",
                                editable: true,
                                edittype:"text",
//                                edittype: "custom",
                                editoptions: {
//                                    custom_value: getFreightElementValue,
//                                    custom_element: createFreightEditElement
                                    dataInit: function (element) {
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
                                label: '原始数量',
                                name: 'originItemNumber',
                                width: 50,
                                sorttype:"number",
                                editable: true,
                                edittype:"text",
//                                edittype: "custom",
                                editoptions: {
//                                    custom_value: getFreightElementValue,
//                                    custom_element: createFreightEditElement
                                    dataInit: function (element) {
                                        $(element).css("padding-top","0px");
                                        $(element).css("padding-bottom","0px");
                                        $(element).css("width","50px");
                                    }
                                }
                            },
                            {
                                label: '原始单价',
                                name: 'originItemPrice',
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
                                label: '原始金额',
                                name: 'originItemAmount',
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
                                label: '折算比',
                                name: 'conversionRate',
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
                            },
                            {
                                label: '扣称比例',
                                name: 'otherRate',
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
//                        onSelectRow: editRow, // the javascript function to call on row click. will ues to to put the row in edit mode
                        viewrecords: true,
                        caption: "采购明细单补充列表",
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
                    /*function createFreightEditElement(value, editOptions) {
                        var div =$("<div style='margin-top:5px'></div>");
                        var label = $("<label class='radio-inline'></label>");
                        var radio = $("<input>", { type: "radio", value: "0", name: "freight", id: "zero", checked: (value != 25 && value != 50 && value != 100) });
                        label.append(radio).append("0");
                        var label1 = $("<label class='radio-inline'></label>");
                        var radio1 = $("<input>", { type: "radio", value: "25", name: "freight", id: "twentyfive", checked: value == 25 });
                        label1.append(radio1).append("25");
                        var label2 = $("<label class='radio-inline'></label>");
                        var radio2 = $("<input>", { type: "radio", value: "50", name: "freight", id: "fifty", checked: value == 50 });
                        label2.append(radio2).append("50");
                        //var label3 = $("<label class='radio-inline'></label>");
                        //var radio3 = $("<input>", { type: "radio", value: "100", name: "freight", id: "hundred", checked: value == 100 });
                        //label3.append(radio3).append("100");
                        div.append(label).append(label1).append(label2);//.append(label3);

                        return div;
                    }*/

                    // The javascript executed specified by JQGridColumn.EditTypeCustomGetValue when EditType = EditType.Custom
                    // One parameter passed - the custom element created in JQGridColumn.EditTypeCustomCreateElement
                    /*function getFreightElementValue(elem, oper, value) {
                        if (oper === "set") {
                            var radioButton = $(elem).find("input:radio[value='" + value + "']");
                            if (radioButton.length > 0) {
                                radioButton.prop("checked", true);
                            }
                        }

                        if (oper === "get") {
                            return $(elem).find("input:radio:checked").val();
                        }
                    }*/
                    /*$('#jqGrid').jqGrid('editRow',id,{url:'clientArray',oneditfunc:function(){
                        $("#userButton").unbind("click").click(function(){
                            searchKind(id);
                        });
					}});*/
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
                });

			</script>
			</p>
		</div>
	</div>

	<div class="form-actions">
		<shiro:hasPermission name="purchase:contractPurchaseSupplement:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
		<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
	</div>
</form:form>

</body>
</html>