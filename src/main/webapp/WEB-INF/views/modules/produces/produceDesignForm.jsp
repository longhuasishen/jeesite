<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>生产计划单管理</title>
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
            var mydate = new Date();
            var dateS = mydate.getFullYear()+"-"+mydate.getMonth()+1 + "-" + mydate.getDate();
            var dateSS = dateS + " " + mydate.getHours() + ":" + mydate.getMinutes() + ":" + mydate.getSeconds();
            $( "#firstDate" ).val(dateSS);
            $( "#goodsDate" ).val(dateSS);
            $( "#makeDate" ).val(dateS);

        });

        function customNameTreeselectCallBack(v,h,f){
            if("ok" == v){
                //获取指定客户信息
                $.get("${ctx}/doc/docCustomer/findByCode?cusCode=" + "123", function(data){
                    //设置input值
                    $("#buildUnit").val(data.cusOrg);
                    $("#receiveUnit").val(data.cusName);
					$("#hetongAccmeth").val(data.tongAccmeth);
                    $("#distance").val(data.distance);
                    $("#projectAddr").val(data.cusAddr);
                    $("#contact").val(data.receiver);
                });

            }
        }

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
		<li><a href="${ctx}/produces/produceDesign/">生产计划单列表</a></li>
		<li class="active"><a href="${ctx}/produces/produceDesign/form?id=${produceDesign.id}">生产计划单<shiro:hasPermission name="produces:produceDesign:edit">${not empty produceDesign.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="produces:produceDesign:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="produceDesign" action="${ctx}/produces/produceDesign/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>
		<table>
			<tr>
				<td>
					<div class="control-group">
						<label class="control-label">通知单号：</label>
						<div class="controls">
							<form:input path="noticeNo" htmlEscape="false" maxlength="32" class="input-xlarge required"/>
							<span class="help-inline"><font color="red">*</font> </span>
						</div>
					</div>
				</td>
				<td>
					<div class="control-group">
						<label class="control-label">要货日期：</label>
						<div class="controls">
							<input id="goodsDate"  name="goodsDate"  type="text" readonly="readonly" maxlength="20" class="Wdate required" style="width:163px;"
								   value="${produceDesign.goodsDate}"
								   onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'});"/>
						</div>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div class="control-group">
						<label class="control-label">首次送达时间：</label>
						<div class="controls">
							<input id="firstDate"  name="firstDate"  type="text" readonly="readonly" maxlength="20" class="Wdate required" style="width:163px;"
								   value="${produceDesign.firstDate}"
								   onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'});"/>
						</div>
					</div>
				</td>
				<td>
					<div class="control-group">
						<label class="control-label">客户名称：</label>
						<div class="controls">
							<sys:treeselect id="customName" name="contractSales.id" value="${produceDesign.contractSales.id}" labelName="customName" labelValue="${produceDesign.customName}"
											title="客户档案" url="/contract/contractSales/treeDataCusProject" />
						</div>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div class="control-group">
						<label class="control-label">建设单位：</label>
						<div class="controls">
							<form:input path="buildUnit" htmlEscape="false" maxlength="120" class="input-xlarge "/>
						</div>
					</div>
				</td>
				<td>
					<div class="control-group">
						<label class="control-label">收货单位：</label>
						<div class="controls">
							<form:input path="receiveUnit" htmlEscape="false" maxlength="120" class="input-xlarge "/>
						</div>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div class="control-group">
						<label class="control-label">要货数量：</label>
						<div class="controls">
							<form:input path="goodsCount" htmlEscape="false" maxlength="20" class="input-xlarge "/>
						</div>
					</div>
				</td>
				<td>
					<div class="control-group">
						<label class="control-label">计划数量：</label>
						<div class="controls">
							<form:input path="taskCount" htmlEscape="false" maxlength="20" class="input-xlarge "/>
						</div>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div class="control-group">
						<label class="control-label">合同结算方式：</label>
						<div class="controls">
							<form:input path="hetongAccmeth" htmlEscape="false" maxlength="60" class="input-xlarge "/>
						</div>
					</div>
				</td>
				<td>
					<div class="control-group">
						<label class="control-label">品种名称：</label>
						<div class="controls">
							<sys:treeselect id="kindName" name="docBeton.kindCode" value="${produceDesign.docBeton.kindCode}" labelName="kindName" labelValue="${produceDesign.kindName}"
											title="混凝土档案" url="/doc/docBeton/treeData" />
						</div>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div class="control-group">
						<label class="control-label">施工部位：</label>
						<div class="controls">
							<form:input path="buildSite" htmlEscape="false" maxlength="30" class="input-xlarge "/>
						</div>
					</div>
				</td>
				<td>
					<div class="control-group">
						<label class="control-label">浇灌方法：</label>
						<div class="controls">
							<sys:treeselect id="waterMeth" name="docWatermeth.watermethCode" value="${produceDesign.docWatermeth.watermethCode}" labelName="waterMeth" labelValue="${produceDesign.waterMeth}"
											title="浇灌方法档案" url="/doc/docWatermeth/treeData" />
						</div>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div class="control-group">
						<label class="control-label">现场调度：</label>
						<div class="controls">
							<sys:treeselect id="localeDispatch" name="docOfficework.officeworkCode" value="${produceDesign.docOfficework.officeworkCode}" labelName="localeDispatch" labelValue="${produceDesign.localeDispatch}"
											title="职员档案" url="/doc/docOfficework/treeData" />
						</div>
					</div>
				</td>
				<td>
					<div class="control-group">
						<label class="control-label">泵名称：</label>
						<div class="controls">
							<sys:treeselect id="bengName" name="docPump.pumpCode" value="${produceDesign.docPump.pumpCode}" labelName="bengName" labelValue="${produceDesign.bengName}"
											title="泵档案" url="/doc/docPump/treeData" />
						</div>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div class="control-group">
						<label class="control-label">运距：</label>
						<div class="controls">
							<%--<sys:treeselect id="distance" name="docCustomer.distanceCode" value="${produceDesign.projectDistance.distanceCode}" labelName="projectDistance.distanceName" labelValue="${produceDesign.projectDistance.distanceName}"--%>
											<%--title="工程运距" url="/doc/docCustomer/treeData" />--%>
								<form:input path="distance" htmlEscape="false" maxlength="20" class="input-xlarge "/>
						</div>
					</div>
				</td>
				<td>
					<div class="control-group">
						<label class="control-label">工程地址：</label>
						<div class="controls">
							<form:input path="projectAddr" htmlEscape="false" maxlength="240" class="input-xlarge "/>
						</div>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div class="control-group">
						<label class="control-label">联系人：</label>
						<div class="controls">
							<form:input path="contact" htmlEscape="false" maxlength="60" class="input-xlarge "/>
						</div>
					</div>
				</td>
			</tr>
		</table>
		<%--<div class="control-group">--%>
			<%--<label class="control-label">特殊要求：</label>--%>
			<%--<div class="controls">--%>
				<%--<form:input path="specialRequire" htmlEscape="false" maxlength="11" class="input-xlarge "/>--%>
			<%--</div>--%>
		<%--</div>--%>
		<table>
			<tr>
				<td rowspan="2">
					<div style="">
						<table id="jqGrid2"></table>
						<div id="jqGrid2Pager"></div>
					</div>
				</td>
				<%--<td valign="middle" rowspan="3">--%>
					<%--<button class="btn btn-primary btn-large btn-block" type="button" id="btn2Right" data-method="append">--></button> <button  id="btn2Left" class="btn btn-info btn-large btn-block" type="button"><---</button>--%>
				<%--</td>--%>
				<td rowspan="2">
					<div style="">
						<table id="jqGrid3"></table>
						<div id="jqGrid3Pager"></div>
					</div>
				</td>
				<td class="tit">混凝土名称</td>
			</tr>
			<tr>
				<td>
					<div>
						<form:textarea path="concreteName" htmlEscape="false" rows="13" maxlength="60" style="color:#FF0000;FONT-SIZE: 30px;width:500px; height=500px;"/>
					</div>
				</td>
			</tr>
		</table>
		<div id="aa" style="background: #aec3d6; position: absolute;display:none">
		</div>
		<div id="bb" style="background: #aec3d6; position: absolute;display:none">
		</div>
		<div class="control-group">
			<table class="table-form">
				<tr class="align-center">
					<td class="tit">生产调度</td>
					<td><form:input path="produceDispatch" htmlEscape="false" maxlength="50"   readonly="true" value="${user.name}"/></td>
					<td class="tit">审核人</td>
					<td><form:input path="checkPerson" htmlEscape="false" maxlength="50"   readonly="true" value="${user.name}"/></td>
					<td class="tit">作废人</td>
					<td><form:input path="canclePerson" htmlEscape="false" maxlength="50"   readonly="true" value="${user.name}"/></td>
				</tr>
				<tr class="align-center">
					<td class="tit">制单日期</td>
					<td><input id="makeDate"  name="makeDate"  type="text" readonly="readonly" maxlength="20" class="Wdate required" style="width:163px;"
							   value="${produceDesign.makeDate}"
							   onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});"/>
					</td>
					<td class="tit">审核日期</td>
					<td><input id="checkDate"  name="checkDate"  type="text" readonly="readonly" maxlength="20" class="Wdate required" style="width:163px;"
							   value="${produceDesign.checkDate}"
							   onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});"/>
					</td>
					<td class="tit">作废日期</td>
					<td><input id="cancelDate"  name="cancelDate"  type="text" readonly="readonly" maxlength="20" class="Wdate required" style="width:163px;"
							   value="${produceDesign.cancelDate}"
							   onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});"/>
					</td>
				</tr>
			</table>
		</div>
		<%--<div class="control-group">--%>
			<%--<label class="control-label">业务员：</label>--%>
			<%--<div class="controls">--%>
				<%--<form:input path="salesman" htmlEscape="false" maxlength="60" class="input-xlarge "/>--%>
			<%--</div>--%>
		<%--</div>--%>
		<%--<div class="control-group">--%>
			<%--<label class="control-label">坍落度：</label>--%>
			<%--<div class="controls">--%>
				<%--<form:input path="slumps" htmlEscape="false" maxlength="60" class="input-xlarge "/>--%>
			<%--</div>--%>
		<%--</div>--%>
		<%--<div class="control-group">--%>
			<%--<label class="control-label">状态：</label>--%>
			<%--<div class="controls">--%>
				<%--<form:input path="status" htmlEscape="false" maxlength="1" class="input-xlarge "/>--%>
			<%--</div>--%>
		<%--</div>--%>
		<%--<div class="control-group">--%>
			<%--<label class="control-label">生产通知单标志：</label>--%>
			<%--<div class="controls">--%>
				<%--<form:input path="noticeFlag" htmlEscape="false" maxlength="11" class="input-xlarge "/>--%>
			<%--</div>--%>
		<%--</div>--%>
		<%--<div class="control-group" style="display:none">--%>
			<%--<label class="control-label">ext_field1：</label>--%>
			<%--<div class="controls">--%>
				<%--<form:input path="extField1" htmlEscape="false" maxlength="60" class="input-xlarge "/>--%>
			<%--</div>--%>
		<%--</div>--%>
		<%--<div class="control-group" style="display:none">--%>
			<%--<label class="control-label">ext_field2：</label>--%>
			<%--<div class="controls">--%>
				<%--<form:input path="extField2" htmlEscape="false" maxlength="60" class="input-xlarge "/>--%>
			<%--</div>--%>
		<%--</div>--%>
		<%--<div class="control-group" >--%>
			<%--<label class="control-label">备注：</label>--%>
			<%--<div class="controls">--%>
				<%--<form:textarea path="extField3" htmlEscape="false" rows="1" maxlength="1000"/>--%>
			<%--</div>--%>
		<%--</div>--%>
		<%--<div class="control-group" style="display:none">--%>
			<%--<label class="control-label">remark：</label>--%>
			<%--<div class="controls">--%>
				<%--<form:input path="remark" htmlEscape="false" maxlength="1000" class="input-xlarge "/>--%>
			<%--</div>--%>
		<%--</div>--%>
		<div class="form-actions">
			<shiro:hasPermission name="produces:produceDesign:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>

	<script type="text/javascript">

        $(document).ready(function () {
            $("#jqGrid2").jqGrid({
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
                            dataInit: function (element) {
                                $(element).attr("readonly","readonly");
                                $(element).attr("id","specialreqCode");
                                $(element).css("padding-top","0px");
                                $(element).css("padding-bottom","0px");
                                $(element).css("width","150px");
                            }
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
                    }
                ],
                afterInsertRow: function (rowid, rowdata, rowelem) {
                    $("#" + rowid).mousedown(function () {
                        var id = $(this).attr("id");
                        var row = jQuery("#jqGrid2").getRowData(id);
                        $("#bb").html("<table>" + $("#" + id).html() + "</table>");

                        $("body").mouseup(function () {
                            $("#concreteName").val($("#concreteName").val().substring(0,($("#concreteName").val().length - rowdata.specialreqName.length)));
                            jQuery("#jqGrid3").addRowData(rowid, rowdata, "last");
                            jQuery("#jqGrid2").delRowData(rowid);
                            $("#bb").text("");
                            $("body").unbind("mousemove");
                            $("body").unbind("mouseup");
                        })

                        $("body").mousemove(function () {
                            bb.style.pixelLeft = event.clientX - 20;
                            bb.style.pixelTop = event.clientY + 3;
                        })
                    })
                },
                loadonce : true,
                viewrecords: true,
                caption: "特殊要求加价",
                rowList: [10, 20, 30],//用于改变显示行数的下拉列表框的元素数组。
                height: 250,
                rowNum: 20,
                pager: "#jqGrid2Pager"
            });
            $("#jqGrid3").jqGrid({
                url: '${ctx}/doc/docSpecialreq/listJson',
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
                            dataInit: function (element) {
                                $(element).attr("readonly","readonly");
                                $(element).attr("id","specialreqCode");
                                $(element).css("padding-top","0px");
                                $(element).css("padding-bottom","0px");
                                $(element).css("width","150px");
                            }
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
                    }
                ],
                afterInsertRow: function (rowid, rowdata, rowelem) {
                    $("#" + rowid).mousedown(function () {
                        var id = $(this).attr("id");
                        var row = jQuery("#jqGrid3").getRowData(id);
                        $("#aa").html("<table>" + $("#" + id).html() + "</table>");
                        $("body").mouseup(function () {
                            $("#concreteName").val($("#concreteName").val() + rowdata.specialreqName);
							jQuery("#jqGrid2").addRowData(rowid, rowdata, "first");
							jQuery("#jqGrid3").delRowData(rowid);
                            $("#aa").text("");
                            $("body").unbind("mousemove");
                            $("body").unbind("mouseup");
                        })
                        $("body").mousemove(function () {
                            aa.style.pixelLeft = event.clientX - 20;
                            aa.style.pixelTop = event.clientY + 3;
                        })

                    })
                },
                loadonce : true,
                viewrecords: true,
                caption: "特殊要求加价",
                rowList: [10, 20, 30],//用于改变显示行数的下拉列表框的元素数组。
                height: 250,
                rowNum: 20,
                pager: "#jqGrid3Pager"
            });

        });

	</script>
</body>
</html>