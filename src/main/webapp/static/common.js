/**
 * 动态表格
 * @param tableId
 * @param datas
 */
function addRowByTable(tableId) {
    var rowTemplate = "<tr>";
    var rowText = $("#"+tableId+" tbody").find("tr:last").find("td:first").text();
    if(rowText == ""||rowText.length ==0){
        rowText = "0";
    }
    var rowNumber = parseInt(rowText,10);
    rowTemplate +="<td hidden>";
    rowNumber++;
    rowTemplate +=rowNumber;
    var ths = $("#"+tableId+" thead").find("th");
    for(var index =0;index<ths.length-1;index++){
        rowTemplate +="</td>";
        rowTemplate +="<td>";
        rowTemplate +="<input type='text' style='width: 80px'/>";
        rowTemplate +="</td>";
    }
    rowTemplate += "<td>";
    rowTemplate += "<a href='#' id='saveLink' onclick='saveRowById(this)'>保存|</a>";
    rowTemplate += "<a href='#' id='editLink' style='display: none;' onclick='editRowById(this)'>编辑|</a>";
    rowTemplate += "<a href='#' id='deleteLink' onclick='deleteRowById(this)'>删除</a>";
    rowTemplate += "</td>";
    rowTemplate += "</tr>";
    $("#"+tableId+" tbody").html($("#"+tableId+" tbody").html()+rowTemplate);
}
function deleteRowById(obj) {
    $.jBox.confirm("确定删除记录吗？",'提示',function(v,h,f){
        if(v == 'ok'){
            $(obj).parent().parent().remove();
        }
    });

}
function editRowById(obj) {
    var tds = $(obj).parent().parent().find("td");
    tds.each(function (tdx) {
        if(tdx>0 && tdx<tds.length-1){
            $(tds[tdx]).html("<input type='text' style='width:80px' value='"+$(tds[tdx]).text()+"'/>");
        }
    })
    $(obj).parent().find("a#saveLink").show();
    $(obj).hide();
}
function saveRowById(obj) {
    var tds = $(obj).parent().parent().find("td");
    tds.each(function (tdx) {
        if(tdx>0 && tdx<tds.length-1){
            $(tds[tdx]).html($(tds[tdx]).find("input").attr("value"));
        }
    });
    $(obj).parent().find("a#editLink").show();
    $(obj).hide();
}

function getTableDatasById(tableId) {
    /*var tableArray = [];
    $("#"+tableId+" tbody").find("tr").each(function () {
        var tdArray = [];
        var obj = $(this);
        var tds = obj.find("td").length;
        obj.find("td").each(function (i) {
            if(i<tds-1){
                tdArray.push($(this).text());
            }
        });
        tableArray.push(tdArray);
    });*/
    var o = jQuery("#jqGrid");
    var rows = o.jqGrid('getRowData');
    return encodeHtml(JSON.stringify(rows));
}