<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<c:set var="dataMap" value='<%=com.fh.util.DataConstants.dataMap%>' />
<!DOCTYPE html>
<html lang="en">
<head>
<base href="<%=basePath%>">

<meta charset="utf-8" />
<title></title>
<meta name="description" content="overview & stats" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<!-- basic styles -->
<link href="static/css/bootstrap.min.css" rel="stylesheet" />
<link href="static/css/bootstrap-responsive.min.css" rel="stylesheet" />
<link rel="stylesheet" href="static/css/font-awesome.min.css" />
<!--[if IE 7]>
		  <link rel="stylesheet" href="static/css/font-awesome-ie7.min.css" />
		<![endif]-->
<!-- page specific plugin styles -->



<link rel="stylesheet" href="static/css/jquery-ui-1.10.2.custom.min.css" />
<link rel="stylesheet" href="static/css/chosen.css" />
<link rel="stylesheet" href="static/css/datepicker.css" />
<link rel="stylesheet" href="static/css/bootstrap-timepicker.css" />
<link rel="stylesheet" href="static/css/daterangepicker.css" />
<link rel="stylesheet" href="static/css/colorpicker.css" />
<!-- ace styles -->
<link rel="stylesheet" href="static/css/ace.min.css" />
<link rel="stylesheet" href="static/css/ace-responsive.min.css" />
<link rel="stylesheet" href="static/css/ace-skins.min.css" />
<!--[if lt IE 9]>
		  <link rel="stylesheet" href="static/css/ace-ie.min.css" />
			<script type="text/javascript" src="static/js/excanvas.min.js"></script>
		<![endif]-->

<!-- basic scripts -->
<script src="static/1.9.1/jquery.min.js"></script>
<script type="text/javascript">
	window.jQuery
			|| document
					.write("<script src='static/js/jquery-1.9.1.min.js'>\x3C/script>");
</script>

<script src="static/js/bootstrap.min.js"></script>
<!--提示框-->
<script type="text/javascript" src="static/js/jquery.tips.js"></script>


<script type="text/javascript" src="static/js/jquery-ui-1.10.2.custom.min.js"></script>
<script type="text/javascript" src="static/js/jquery.ui.touch-punch.min.js"></script>
<script type="text/javascript" src="static/js/chosen.jquery.min.js"></script>
<script type="text/javascript" src="static/js/fuelux.spinner.js"></script>
<script type="text/javascript" src="static/js/bootstrap-datepicker.min.js"></script>
<script type="text/javascript" src="static/js/bootstrap-timepicker.min.js"></script>
<script type="text/javascript" src="static/js/date.js"></script>
<script type="text/javascript" src="static/js/daterangepicker.min.js"></script>
<script type="text/javascript" src="static/js/bootstrap-colorpicker.min.js"></script>
<script type="text/javascript" src="static/js/jquery.knob.min.js"></script>
<script type="text/javascript" src="static/js/jquery.autosize-min.js"></script>
<script type="text/javascript" src="static/js/jquery.inputlimiter.1.3.1.min.js"></script>
<script type="text/javascript" src="static/js/jquery.maskedinput.min.js"></script>
<script type="text/javascript" src="static/js/bootbox.min.js"></script>
<script type="text/javascript" src="static/js/commonValidate.js"></script>
<!-- ace scripts -->
<script src="static/js/ace-elements.min.js"></script>
<script src="static/js/ace.min.js"></script>
<!-- inline scripts related to this page -->
</head>

<script type="text/javascript">
$(top.hangge());
//保存
function save(){
	if($("#PartName").val()==""){
		
		$("#PartName").tips({
			side:2,
            msg:'请输入托盘名称',
            bg:'#AE81FF',
            time:2
        });
		
		$("#PartName").focus();
		return false;
	}else{
		var strId = '${pd.ID}';
		if(strId == "" || strId == null){
			if(!has()){
				return false;
			}
		}		
	}
	$("#Form").submit();
	$("#zhongxin").hide();
	$("#zhongxin2").show();
}

//判断公司名称是否存在
function has(){
	var QRCode = $("#QRCode").val();
	var url = "partInfo/has.do";
	var boo=true;	
	$.ajax({  
		    type : "post",  
		    url : url,  
		    data : "QRCode=" + QRCode,  
		    async : false,//取消异步  
		    success : function(data){  		    	
		    	if(data=="error"){
					$("#QRCode").css("background-color","#F5C5C5");					
					$("#QRCode").tips({
						side:2,
			            msg:'QRCode已存在!',
			            bg:'#AE81FF',
			            time:3
			        });					
					$("#QRCode").focus();
					boo=false;
				}
		   }  
	}); 	
 	return boo;		
}

</script>

<body>
	<form  action="partInfo/save.do" name="Form" id="Form" method="post" >
		<input type="hidden" name="AP_ID" id="AP_ID" value="${pd.ID }"/>
		<input type="hidden" name="trayId" id="trayId" value="${pd.trayId }"/>
		<input type="hidden" name="trayRFID" id="trayRFID" value="${pd.trayRFID }"/>
		<div id="zhongxin">
			<table id="table_report" class="table table-striped table-bordered table-hover">
				<tr>
					<th>二维码号:</th>
					<td>
						<input type="text" name="QRCode" id="QRCode" value="${pd.QRCode}" maxlength="50" style="width: 50%;" placeholder="这里输入二维码" title="二维码" />
					</td>
				</tr>
				<tr>
					<th>零件名:</th>
					<td>
						<input type="text" name="PartName" id="PartName" value="${pd.PartName}" maxlength="20" style="width: 50%;" placeholder="这里输入零件名" title="零件名" />
					</td>
				</tr>

				<tr>
					<th>零件类型:</th>
					<td>
						<%-- <input type="text" name="PartType" id="PartType" value="${pd.PartType}" maxlength="32" style="width: 50%;"	placeholder="这里输入零件类型" title="零件类型" /> --%>
						<select id="PartType" name="PartType" placeholder="Choose a Country...">
							<option value="">请选择零件类型</option>
							<c:forEach items="${dataMap['TrayType']}" var="dataMap1">
								<c:if test="${pd.PartType eq dataMap1.key}">  
									<option selected value="${dataMap1.key }">${dataMap1.value }</option>
								</c:if>
								<c:if test="${pd.PartType ne dataMap1.key}">  
									<option value="${dataMap1.key }">${dataMap1.value }</option>
								</c:if>
							</c:forEach>
						</select>
					</td>
				</tr>
				<%-- <tr>
					<th>工厂/车间号:</th>
					<td>
						<input type="text" name="PlantNumber" id="PlantNumber" value="${pd.PlantNumber}" maxlength="32" style="width: 50%;"	placeholder="这里输入工厂/车间号" title="工厂/车间号" />
					</td>
				</tr>
				<tr>
					<th>日期:</th>
					<td>
						<div class="row-fluid input-append date">
							<input class="span10 date-picker" name="PartDate" id="PartDate" value="${pd.PartDate}" type="text" data-date-format="yyyy-mm-dd" /> 
							<span class="add-on"><i	class="icon-calendar"></i></span>
						</div>
					</td>
				</tr>
				<tr>
					<th>总成号:</th>
					<td>
						<input type="text" name="AssemblyNumber" id="AssemblyNumber" value="${pd.AssemblyNumber}" maxlength="20" style="width: 50%;" placeholder="这里输入总成号" title="总成号" />
					</td>
				</tr>
				<tr>
					<th>组别号:</th>
					<td>
						<input type="text" name="RowNumber" id="RowNumber" value="${pd.RowNumber}" maxlength="20" style="width: 50%;" placeholder="这里输入组别号" title="组别号" />
					</td>
				</tr>
				<tr>
					<th>分组号:</th>
					<td>
						<input type="text" name="GroupNumber" id="GroupNumber" value="${pd.GroupNumber}" maxlength="20" style="width: 50%;" placeholder="这里输入分组号" title="分组号" />
					</td>
				</tr>
				<tr>
					<th>时间/流水号:</th>
					<td>
						<input type="text" name="DateNumber" id="DateNumber" value="${pd.DateNumber}" maxlength="20" style="width: 50%;" placeholder="这里输入时间/流水号" title="时间/流水号" />
					</td>
				</tr>
				<tr>
					<th>条线号:</th>
					<td>
						<input type="text" name="LineNumber" id="LineNumber" value="${pd.LineNumber}" maxlength="20" style="width: 50%;" placeholder="这里输入条线号" title="条线号" />
					</td>
				</tr>
				<tr>
					<th>VM图纸号:</th>
					<td>
						<input type="text" name="VMNumber" id="VMNumber" value="${pd.VMNumber}" maxlength="20" style="width: 50%;" placeholder="这里输入VM图纸号" title="VM图纸号" />
					</td>
				</tr>
				<tr>
					<th>流水号:</th>
					<td>
						<input type="text" name="SerialNumber" id="SerialNumber" value="${pd.SerialNumber}" maxlength="20" style="width: 50%;" placeholder="这里输入流水号" title="流水号" />
					</td>
				</tr>
				<tr>
					<th>工厂组织结构:</th>
					<td>
						<input type="text" name="PlantStructure" id="PlantStructure" value="${pd.PlantStructure}" maxlength="20" style="width: 50%;" placeholder="这里输入工厂组织结构" title="工厂组织结构" />
					</td>
				</tr>
				<tr>
					<th>状态:</th>
					<td>
						<input type="text" name="State" id="State" value="${pd.State}" maxlength="20" style="width: 50%;" placeholder="这里输入状态" title="状态" />
					</td>
				</tr> --%>
				<tr>
					<td style="text-align: center;" colspan="2"><a
						class="btn btn-mini btn-primary" onclick="save();">保&nbsp;&nbsp;存</a> <a
						class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取&nbsp;&nbsp;消</a>
					</td>
				</tr>
			</table>
		</div>

		<div id="zhongxin2" class="center" style="display: none">
			<br />
			<br />
			<br />
			<br />
			<br />
			<img src="static/images/jiazai.gif" /><br />
			<h4 class="lighter block green">提交中...</h4>
		</div>

	</form>

	<script type="text/javascript">
		$(top.hangge());
		$(function() {
			$('#RegistrationTime').datepicker();
		});
	</script>
</body>
</html>