<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>配合比通知单管理</title>
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

        function ratioCodeTreeselectCallBack(v,h,f){
            if("ok" == v){
                $.get("${ctx}/produces/coordinateRatio/get?id=" + $("#ratioCodeId").val(), function(data){
                    //设置input值
                    $("#kindWaterName").val(data.kindName1);
                    $("#kindCementName").val(data.kindName2);
                    $("#kindAg1Name").val(data.kindName3);
                    $("#kindAg2Name").val(data.kindName4);
                    $("#kindAg3Name").val(data.kindName5);
                    $("#kindAg4Name").val(data.kindName6);
                    $("#kindFlyashName").val(data.kindName7);
                    $("#kindBreezeName").val(data.kindName8);
                    $("#kindAdd1Name").val(data.kindName9);
                    $("#kindAdd2Name").val(data.kindName10);
                    $("#kindBackup1Name").val(data.kindName11);
                    $("#kindSlopsName").val(data.kindName12);
                    $("#dosageWater").val(data.dosageWater);
                    $("#dosageCement").val(data.dosageCement);
                    $("#dosageAg1").val(data.dosageAg1);
                    $("#dosageAg2").val(data.dosageAg2);
                    $("#dosageAg3").val(data.dosageAg3);
                    $("#dosageAg4").val(data.dosageAg4);
                    $("#dosageFlyash").val(data.dosageFlyash);
                    $("#dosageBreeze").val(data.dosageBreeze);
                    $("#dosageAdd1").val(data.dosageAdd1);
                    $("#dosageAdd2").val(data.dosageAdd2);
                    $("#dosageBackup1").val(data.dosageBackup1);
                    $("#dosageSlops").val(data.dosageSlops);
                });

            }
        }

        function noticeNoTreeselectCallBack(v,h,f){
            if("ok" == v){
                $.get("${ctx}/produces/produceDesign/get?id=" + $("#noticeNoId").val(), function(data){
                    //设置input值
                    $("#bengName").val(data.bengName);
                    $("#customName").val(data.customName);
                    $("#concreteName").val(data.concreteName);
                    $("#goodsCount").val(data.goodsCount);
                    $("#specialRequire").val(data.specialRequire);
                    $("#buildSite").val(data.buildSite);
                    $("#waterMeth").val(data.waterMeth);
                    $("#goodsDate").val(data.goodsDate);
                });

            }
        }
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li><a href="${ctx}/produces/coordinateRatioNotice/">配合比通知单列表</a></li>
		<li class="active"><a href="${ctx}/produces/coordinateRatioNotice/form?id=${coordinateRatioNotice.id}">配合比通知单<shiro:hasPermission name="produces:coordinateRatioNotice:edit">${not empty coordinateRatioNotice.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="produces:coordinateRatioNotice:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="coordinateRatioNotice" action="${ctx}/produces/coordinateRatioNotice/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>
	<table class="table table-striped table-bordered table-condensed">
		<tr>
			<td>
				<div class="control-group">
					<label class="control-label">生产通知单编号：</label>
					<div class="controls">
						<sys:treeselect id="noticeNo" name="produceDesign.noticeNo" value="${coordinateRatioNotice.produceDesign.noticeNo}" labelName="noticeNo" labelValue="${coordinateRatioNotice.noticeNo}"
										title="生产通知单" url="/produces/produceDesign/selNotice" cssClass="required"/>
					</div>
				</div>
			</td>
			<td>
				<div class="control-group">
					<label class="control-label">配合比编号：</label>
					<div class="controls">
						<sys:treeselect id="ratioCode" name="coordinateRatio.ratioCode" value="${coordinateRatioNotice.coordinateRatio.ratioCode}" labelName="ratioCode" labelValue="${coordinateRatioNotice.ratioCode}"
										title="生产通知单" url="/produces/coordinateRatio/selNotice" cssClass="required"/>
					</div>
				</div>
			</td>
			<td>
				<div class="control-group">
					<label class="control-label">通知单状态：</label>
					<div class="controls">
						<form:select path="noticeStatus" class="input-xlarge ">
							<form:options items="${fns:getDictList('notice_status')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
						</form:select>
					</div>
				</div>
			</td>
		</tr>
		<tr>
			<td>
				<div class="control-group">
					<label class="control-label">配合比通知单编号：</label>
					<div class="controls">
						<form:input path="ratioNoticeCode" htmlEscape="false" maxlength="20" class="input-xlarge required"/>
					</div>
				</div>
			</td>
			<td>
				<div class="control-group">
					<label class="control-label">配合比通知单编号：</label>
					<div class="controls">
						<form:input path="noticeMixing" htmlEscape="false" maxlength="20" class="input-xlarge required"/>
					</div>
				</div>
			</td>
		</tr>
	</table>
	<table>
		<tr>
			<td>
				<div class="control-group">
					<label class="control-label">泵名称：</label>
					<div class="controls">
						<form:input path="bengName" htmlEscape="false" maxlength="30" style="width:200px" />
					</div>
				</div>
			</td>
			<td>
				<div class="control-group">
					<label class="control-label">客户名称：</label>
					<div class="controls">
						<form:input path="customName" htmlEscape="false" maxlength="30" style="width:200px" />
					</div>
				</div>
			</td>
			<td>
				<div class="control-group">
					<label class="control-label">工程名称：</label>
					<div class="controls">
						<form:input path="projectName" htmlEscape="false" maxlength="30" style="width:200px" />
					</div>
				</div>
			</td>
			<td>
				<div class="control-group">
					<label class="control-label">强度等级：</label>
					<div class="controls">
						<form:input path="concreteName" htmlEscape="false" maxlength="30" style="width:200px" />
					</div>
				</div>
			</td>
		</tr>
		<tr>
			<td>
				<div class="control-group">
					<label class="control-label">要货数量：</label>
					<div class="controls">
						<form:input path="goodsCount" htmlEscape="false" maxlength="20" style="width:200px" />
					</div>
				</div>
			</td>
			<td>
				<div class="control-group">
					<label class="control-label">特殊要求：</label>
					<div class="controls">
						<form:input path="specialRequire" htmlEscape="false" maxlength="60" style="width:200px" />
					</div>
				</div>
			</td>
			<td>
				<div class="control-group">
					<label class="control-label">施工部位：</label>
					<div class="controls">
						<form:input path="buildSite" htmlEscape="false" maxlength="30" style="width:200px" />
					</div>
				</div>
			</td>
			<td>
				<div class="control-group">
					<label class="control-label">浇灌方法：</label>
					<div class="controls">
						<form:input path="waterMeth" htmlEscape="false" maxlength="60" style="width:200px" />
					</div>
				</div>
			</td>
		</tr>
		<tr>
			<td>
				<div class="control-group">
					<label class="control-label">施工日期：</label>
					<div class="controls">
						<input id="goodsDate"  name="goodsDate"  type="text" readonly="readonly" maxlength="20" class="Wdate required" style="width:163px;"
							   value="${coordinateRatioNotice.goodsDate}"
							   onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});"/>
					</div>
				</div>
			</td>
			<td>
				<div class="control-group">
					<label class="control-label">备注：</label>
					<div class="controls">
						<form:input path="noticeRemark" htmlEscape="false" maxlength="200" style="width:200px" />
					</div>
				</div>
			</td>
			<td>
				<div class="control-group">
					<label class="control-label">搅拌时间：</label>
					<div class="controls">
						<form:input path="mixingTime" htmlEscape="false" maxlength="20" style="width:200px" />
					</div>
				</div>
			</td>
			<td>
				<div class="control-group">
					<label class="control-label">搅拌系统编号：</label>
					<div class="controls">
						<form:input path="mixingNo" htmlEscape="false" maxlength="32" style="width:200px" />
					</div>
				</div>
			</td>
		</tr>
		<tr>
			<td>
				<div class="control-group">
					<label class="control-label">抗渗等级：</label>
					<div class="controls">
						<form:input path="imperviousLevel" htmlEscape="false" maxlength="20" style="width:200px" />
					</div>
				</div>
			</td>
			<td>
				<div class="control-group">
					<label class="control-label">抗折强度：</label>
					<div class="controls">
						<form:input path="flexuralLevel" htmlEscape="false" maxlength="20" style="width:200px" />
					</div>
				</div>
			</td>
			<td>
				<div class="control-group">
					<label class="control-label">搅拌站号：</label>
					<div class="controls">
						<sys:treeselect id="mixingStation" name="docStation.stationCode" value="${coordinateRatioNotice.docStation.stationCode}" labelName="mixingStation" labelValue="${coordinateRatioNotice.mixingStation}"
										title="搅拌站档案" url="/doc/docStation/treeData" cssClass="required"/>
					</div>
				</div>
			</td>
			<td>
				<div class="control-group">
					<label class="control-label">水胶比：</label>
					<div class="controls">
						<form:input path="waterRatio" htmlEscape="false" maxlength="10" style="width:200px" />
					</div>
				</div>
			</td>
		</tr>
		<tr>
			<td>
				<div class="control-group">
					<label class="control-label">砂率：</label>
					<div class="controls">
						<form:input path="sandRatio" htmlEscape="false" maxlength="10" style="width:200px" />
					</div>
				</div>
			</td>
			<td>
				<div class="control-group">
					<label class="control-label">坍落度：</label>
					<div class="controls">
						<form:input path="slumps" htmlEscape="false" maxlength="10" style="width:200px" />
					</div>
				</div>
			</td>
			<td>
				<div class="control-group">
					<label class="control-label">起始容重：</label>
					<div class="controls">
						<form:input path="startcapacity" htmlEscape="false" maxlength="10" style="width:200px" />
					</div>
				</div>
			</td>
			<td>
				<div class="control-group">
					<label class="control-label">终止容重：</label>
					<div class="controls">
						<form:input path="endCapacity" htmlEscape="false" maxlength="10" style="width:200px" />
					</div>
				</div>
			</td>
		</tr>
	</table>

		<table class="table table-striped table-bordered table-condensed">
			<tr>
				<td> </td>
				<td style="text-align:center">水</td>
				<td style="text-align:center">水泥</td>
				<td style="text-align:center">骨料1</td>
				<td style="text-align:center">骨料2</td>
				<td style="text-align:center">骨料3</td>
				<td style="text-align:center">骨料4</td>
				<td style="text-align:center">粉煤灰</td>
				<td style="text-align:center">矿粉</td>
				<td style="text-align:center">外加剂1</td>
				<td style="text-align:center">外加剂2</td>
				<td style="text-align:center">备用一</td>
				<td style="text-align:center">污水</td>
			</tr>
			<tr>
				<td style="text-align:center">材料品种</td>
				<td><sys:treeselect id="kindWater" name="docConcrete.kindCode" value="${coordinateRatioNotice.docConcrete.kindCode}" labelName="kindWater" labelValue="${coordinateRatioNotice.kindWater}"
									title="原材料档案" url="/doc/docConcrete/treeData" cssClass="required" cssStyle="width:60px"/>
				</td>
				<td><sys:treeselect id="kindCement" name="docConcrete.kindCode" value="${coordinateRatioNotice.docConcrete.kindCode}" labelName="kindCement" labelValue="${coordinateRatioNotice.kindCement}"
									title="原材料档案" url="/doc/docConcrete/treeData" cssClass="required" cssStyle="width:60px"/>
				</td>
				<td><sys:treeselect id="kindAg1" name="docConcrete.kindCode" value="${coordinateRatioNotice.docConcrete.kindCode}" labelName="kindAg1" labelValue="${coordinateRatioNotice.kindAg1}"
									title="原材料档案" url="/doc/docConcrete/treeData" cssClass="required" cssStyle="width:60px"/>
				</td>
				<td><sys:treeselect id="kindAg2" name="docConcrete.kindCode" value="${coordinateRatioNotice.docConcrete.kindCode}" labelName="kindAg2" labelValue="${coordinateRatioNotice.kindAg2}"
									title="原材料档案" url="/doc/docConcrete/treeData" cssClass="required" cssStyle="width:60px"/>
				</td>
				<td><sys:treeselect id="kindAg3" name="docConcrete.kindCode" value="${coordinateRatioNotice.docConcrete.kindCode}" labelName="kindAg3" labelValue="${coordinateRatioNotice.kindAg3}"
									title="原材料档案" url="/doc/docConcrete/treeData" cssClass="required" cssStyle="width:60px"/>
				</td>
				<td><sys:treeselect id="kindAg4" name="docConcrete.kindCode" value="${coordinateRatioNotice.docConcrete.kindCode}" labelName="kindAg4" labelValue="${coordinateRatioNotice.kindAg4}"
									title="原材料档案" url="/doc/docConcrete/treeData" cssClass="required" cssStyle="width:60px"/>
				</td>
				<td><sys:treeselect id="kindFlyash" name="docConcrete.kindCode" value="${coordinateRatioNotice.docConcrete.kindCode}" labelName="kindFlyash" labelValue="${coordinateRatioNotice.kindFlyash}"
									title="原材料档案" url="/doc/docConcrete/treeData" cssClass="required" cssStyle="width:60px"/>
				</td>
				<td><sys:treeselect id="kindBreeze" name="docConcrete.kindCode" value="${coordinateRatioNotice.docConcrete.kindCode}" labelName="kindBreeze" labelValue="${coordinateRatioNotice.kindBreeze}"
									title="原材料档案" url="/doc/docConcrete/treeData" cssClass="required" cssStyle="width:60px"/>
				</td>
				<td><sys:treeselect id="kindAdd1" name="docConcrete.kindCode" value="${coordinateRatioNotice.docConcrete.kindCode}" labelName="kindAdd1" labelValue="${coordinateRatioNotice.kindAdd1}"
									title="原材料档案" url="/doc/docConcrete/treeData" cssClass="required" cssStyle="width:60px"/>
				</td>
				<td><sys:treeselect id="kindAdd2" name="docConcrete.kindCode" value="${coordinateRatioNotice.docConcrete.kindCode}" labelName="kindAdd2" labelValue="${coordinateRatioNotice.kindAdd2}"
									title="原材料档案" url="/doc/docConcrete/treeData" cssClass="required" cssStyle="width:60px"/>
				</td>
				<td><sys:treeselect id="kindBackup1" name="docConcrete.kindCode" value="${coordinateRatioNotice.docConcrete.kindCode}" labelName="kindBackup1" labelValue="${coordinateRatioNotice.kindBackup1}"
									title="原材料档案" url="/doc/docConcrete/treeData" cssClass="required" cssStyle="width:60px"/>
				</td>
				<td><sys:treeselect id="kindSlops" name="docConcrete.kindCode" value="${coordinateRatioNotice.docConcrete.kindCode}" labelName="kindSlops" labelValue="${coordinateRatioNotice.kindSlops}"
									title="原材料档案" url="/doc/docConcrete/treeData" cssClass="required" cssStyle="width:60px"/>
				</td>
			</tr>
			<tr>
				<td style="text-align:center">仓库</td>
				<td><form:input path="repeWater" htmlEscape="false" maxlength="50" style="width:50px"/></td>
				<td><form:input path="repeCement" htmlEscape="false" maxlength="50" style="width:50px"/></td>
				<td><form:input path="repeAg1" htmlEscape="false" maxlength="50" style="width:50px"/></td>
				<td><form:input path="repeAg2" htmlEscape="false" maxlength="50" style="width:50px"/></td>
				<td><form:input path="repeAg3" htmlEscape="false" maxlength="50" style="width:50px"/></td>
				<td><form:input path="repeAg4" htmlEscape="false" maxlength="50" style="width:50px"/></td>
				<td><form:input path="repeFlyash" htmlEscape="false" maxlength="50" style="width:50px"/></td>
				<td><form:input path="repeBreeze" htmlEscape="false" maxlength="50" style="width:50px"/></td>
				<td><form:input path="repeAdd1" htmlEscape="false" maxlength="50" style="width:50px"/></td>
				<td><form:input path="repeAdd2" htmlEscape="false" maxlength="50" style="width:50px"/></td>
				<td><form:input path="repeBackup1" htmlEscape="false" maxlength="50" style="width:50px"/></td>
				<td><form:input path="repeSlops" htmlEscape="false" maxlength="50" style="width:50px"/></td>
			</tr>
			<tr>
				<td style="text-align:center">干料重量（kg/m3）</td>
				<td><form:input path="dosageWater" htmlEscape="false" maxlength="15" style="width:50px"/></td>
				<td><form:input path="dosageCement" htmlEscape="false" maxlength="15" style="width:50px"/></td>
				<td><form:input path="dosageAg1" htmlEscape="false" maxlength="15" style="width:50px"/></td>
				<td><form:input path="dosageAg2" htmlEscape="false" maxlength="15" style="width:50px"/></td>
				<td><form:input path="dosageAg3" htmlEscape="false" maxlength="15" style="width:50px"/></td>
				<td><form:input path="dosageAg4" htmlEscape="false" maxlength="15" style="width:50px"/></td>
				<td><form:input path="dosageFlyash" htmlEscape="false" maxlength="15" style="width:50px"/></td>
				<td><form:input path="dosageBreeze" htmlEscape="false" maxlength="15" style="width:50px"/></td>
				<td><form:input path="dosageAdd1" htmlEscape="false" maxlength="15" style="width:50px"/></td>
				<td><form:input path="dosageAdd2" htmlEscape="false" maxlength="15" style="width:50px"/></td>
				<td><form:input path="dosageBackup1" htmlEscape="false" maxlength="15" style="width:50px"/></td>
				<td><form:input path="dosageSlops" htmlEscape="false" maxlength="15" style="width:50px"/></td>
			</tr>
			<tr>
				<td style="text-align:center">含水率</td>
				<td><form:input path="primageWater" htmlEscape="false" maxlength="15" style="width:50px"/></td>
				<td><form:input path="primageCement" htmlEscape="false" maxlength="15" style="width:50px"/></td>
				<td><form:input path="primageAg1" htmlEscape="false" maxlength="15" style="width:50px"/></td>
				<td><form:input path="primageAg2" htmlEscape="false" maxlength="15" style="width:50px"/></td>
				<td><form:input path="primageAg3" htmlEscape="false" maxlength="15" style="width:50px"/></td>
				<td><form:input path="primageAg4" htmlEscape="false" maxlength="15" style="width:50px"/></td>
				<td><form:input path="primageFlyash" htmlEscape="false" maxlength="15" style="width:50px"/></td>
				<td><form:input path="primageBreeze" htmlEscape="false" maxlength="15" style="width:50px"/></td>
				<td><form:input path="primageAdd1" htmlEscape="false" maxlength="15" style="width:50px"/></td>
				<td><form:input path="primageAdd2" htmlEscape="false" maxlength="15" style="width:50px"/></td>
				<td><form:input path="primageBackup1" htmlEscape="false" maxlength="15" style="width:50px"/></td>
				<td><form:input path="primageSlops" htmlEscape="false" maxlength="15" style="width:50px"/></td>
			</tr>
			<tr>
				<td style="text-align:center">水重</td>
				<td><form:input path="weightWater" htmlEscape="false" maxlength="15" style="width:50px"/></td>
				<td><form:input path="weightCement" htmlEscape="false" maxlength="15" style="width:50px"/></td>
				<td><form:input path="weightAg1" htmlEscape="false" maxlength="15" style="width:50px"/></td>
				<td><form:input path="weightAg2" htmlEscape="false" maxlength="15" style="width:50px"/></td>
				<td><form:input path="weightAg3" htmlEscape="false" maxlength="15" style="width:50px"/></td>
				<td><form:input path="weightAg4" htmlEscape="false" maxlength="15" style="width:50px"/></td>
				<td><form:input path="weightFlyash" htmlEscape="false" maxlength="15" style="width:50px"/></td>
				<td><form:input path="weightBreeze" htmlEscape="false" maxlength="15" style="width:50px"/></td>
				<td><form:input path="weightAdd1" htmlEscape="false" maxlength="15" style="width:50px"/></td>
				<td><form:input path="weightAdd2" htmlEscape="false" maxlength="15" style="width:50px"/></td>
				<td><form:input path="weightBackup1" htmlEscape="false" maxlength="15" style="width:50px"/></td>
				<td><form:input path="weightSlops" htmlEscape="false" maxlength="15" style="width:50px"/></td>
			</tr>
			<tr>
				<td style="text-align:center">湿料重量</td>
				<td><form:input path="wetweightWater" htmlEscape="false" maxlength="15" style="width:50px"/></td>
				<td><form:input path="wetweightCement" htmlEscape="false" maxlength="15" style="width:50px"/></td>
				<td><form:input path="wetweightAg1" htmlEscape="false" maxlength="15" style="width:50px"/></td>
				<td><form:input path="wetweightAg2" htmlEscape="false" maxlength="15" style="width:50px"/></td>
				<td><form:input path="wetweightAg3" htmlEscape="false" maxlength="15" style="width:50px"/></td>
				<td><form:input path="wetweightAg4" htmlEscape="false" maxlength="15" style="width:50px"/></td>
				<td><form:input path="wetweightFlyash" htmlEscape="false" maxlength="15" style="width:50px"/></td>
				<td><form:input path="wetweightBreeze" htmlEscape="false" maxlength="15" style="width:50px"/></td>
				<td><form:input path="wetweightAdd1" htmlEscape="false" maxlength="15" style="width:50px"/></td>
				<td><form:input path="wetweightAdd2" htmlEscape="false" maxlength="15" style="width:50px"/></td>
				<td><form:input path="wetweightBackup1" htmlEscape="false" maxlength="15" style="width:50px"/></td>
				<td><form:input path="wetweightSlops" htmlEscape="false" maxlength="15" style="width:50px"/></td>
			</tr>
			<tr>
				<td style="text-align:center">掺量（%）</td>
				<td><form:input path="propWater" htmlEscape="false" maxlength="15" style="width:50px"/></td>
				<td><form:input path="propCement" htmlEscape="false" maxlength="15" style="width:50px"/></td>
				<td><form:input path="propAg1" htmlEscape="false" maxlength="15" style="width:50px"/></td>
				<td><form:input path="propAg2" htmlEscape="false" maxlength="15" style="width:50px"/></td>
				<td><form:input path="propAg3" htmlEscape="false" maxlength="15" style="width:50px"/></td>
				<td><form:input path="propAg4" htmlEscape="false" maxlength="15" style="width:50px"/></td>
				<td><form:input path="propFlyash" htmlEscape="false" maxlength="15" style="width:50px"/></td>
				<td><form:input path="propBreeze" htmlEscape="false" maxlength="15" style="width:50px"/></td>
				<td><form:input path="propAdd1" htmlEscape="false" maxlength="15" style="width:50px"/></td>
				<td><form:input path="propAdd2" htmlEscape="false" maxlength="15" style="width:50px"/></td>
				<td><form:input path="propBackup1" htmlEscape="false" maxlength="15" style="width:50px"/></td>
				<td><form:input path="propSlops" htmlEscape="false" maxlength="15" style="width:50px"/></td>
			</tr>
		</table>

	<table>
		<tr>
			<td>
				<div class="control-group">
					<label class="control-label">抗压数量：</label>
					<div class="controls">
						<form:input path="resistCount" htmlEscape="false" maxlength="10" class="input-xlarge "/>
					</div>
				</div>
			</td>
			<td>
				<div class="control-group">
					<label class="control-label">抗渗数量：</label>
					<div class="controls">
						<form:input path="imperviousCount" htmlEscape="false" maxlength="10" class="input-xlarge "/>
					</div>
				</div>
			</td>
			<td>
				<div class="control-group">
					<label class="control-label">抗折数量：</label>
					<div class="controls">
						<form:input path="flexuralCount" htmlEscape="false" maxlength="10" class="input-xlarge "/>
					</div>
				</div>
			</td>
		</tr>
	</table>
		<div class="control-group">
			<table class="table-form">
				<tr class="align-center">
					<td class="tit">制单人</td>
					<td><form:input path="createPerson" htmlEscape="false" maxlength="50"   readonly="true" value="${user.name}"/></td>
					<td class="tit">审核人</td>
					<td><form:input path="checkPerson" htmlEscape="false" maxlength="50"   readonly="true" value="${user.name}"/></td>
					<td class="tit">作废人</td>
					<td><form:input path="cancelPerson" htmlEscape="false" maxlength="50"   readonly="true" value="${user.name}"/></td>
					<td class="tit">负责人</td>
					<td>
						<sys:treeselect id="noticeOwner" name="docOfficework.officeworkCode" value="${coordinateRatioNotice.docOfficework.officeworkCode}" labelName="noticeOwner" labelValue="${coordinateRatioNotice.noticeOwner}"
										title="职员档案" url="/doc/docOfficework/treeData" cssClass="required"/>
					</td>
				</tr>
				<tr class="align-center">
					<td class="tit">制单日期</td>
					<td><input id="makeDate"  name="makeDate"  type="text" readonly="readonly" maxlength="20" class="Wdate required" style="width:163px;"
							   value="${coordinateRatioNotice.makeDate}"
							   onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});"/>
					</td>
					<td class="tit">审核日期</td>
					<td><input id="checkDate"  name="checkDate"  type="text" readonly="readonly" maxlength="20" class="Wdate required" style="width:163px;"
							   value="${coordinateRatioNotice.checkDate}"
							   onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});"/>
					</td>
					<td class="tit">作废日期</td>
					<td><input id="cancelDate"  name="cancelDate"  type="text" readonly="readonly" maxlength="20" class="Wdate required" style="width:163px;"
							   value="${coordinateRatioNotice.cancelDate}"
							   onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});"/>
					</td>
					<td class="tit">调整人</td>
					<td>
						<sys:treeselect id="modifyPerson" name="docOfficework.officeworkCode" value="${coordinateRatioNotice.docOfficework.officeworkCode}" labelName="modifyPerson" labelValue="${coordinateRatioNotice.modifyPerson}"
										title="职员档案" url="/doc/docOfficework/treeData" cssClass="required"/>
						</td>
				</tr>
			</table>
		</div>
		<div class="control-group">
			<label class="control-label">备注：</label>
			<div class="controls">
				<form:textarea path="currRemark" htmlEscape="false" rows="2" maxlength="200" style="width:1000px;"/>
			</div>
		</div>
		<div class="control-group"style="display: none">
			<label class="control-label">ext_field1：</label>
			<div class="controls">
				<form:input path="extField1" htmlEscape="false" maxlength="60" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group"style="display: none">
			<label class="control-label">ext_field2：</label>
			<div class="controls">
				<form:input path="extField2" htmlEscape="false" maxlength="60" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group"style="display: none">
			<label class="control-label">ext_field3：</label>
			<div class="controls">
				<form:input path="extField3" htmlEscape="false" maxlength="120" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group"style="display: none">
			<label class="control-label">remark：</label>
			<div class="controls">
				<form:input path="remark" htmlEscape="false" maxlength="1000" class="input-xlarge "/>
			</div>
		</div>
		<div class="form-actions">
			<shiro:hasPermission name="produces:coordinateRatioNotice:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>