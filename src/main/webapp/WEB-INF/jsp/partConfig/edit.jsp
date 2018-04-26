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
	if($("#IP").val()==""){
	
		
		$("#IP").tips({
			side:2,
            msg:'请输入IP',
            bg:'#AE81FF',
            time:2
        });
		
		$("#IP").focus();
		return false;
	}
	
	$("#Form").submit();
	$("#zhongxin").hide();
	$("#zhongxin2").show();
}

function has(strData,strParm,infoData){
	
	var url = "partConfig/has.do";
	var boo=true;	
	$.ajax({  
		    type : "post",  
		    url : url,  
		    data : strData,  
		    async : false,//取消异步  
		    success : function(data){  		    	
		    	if(data=="error"){
					$("#"+strParm+"").css("background-color","#F5C5C5");					
					$("#"+strParm+"").tips({
						side:2,
			            msg:infoData+'已存在!',
			            bg:'#AE81FF',
			            time:3
			        });					
					$("#"+strParm+"").focus();
					boo=false;
				}
		   }  
	}); 	
 	return boo;		
}


</script>

<body>
	<form  action="partConfig/save.do" name="Form" id="Form" method="post" >
		<input type="hidden" name="PC_ID" id="PC_ID" value="${pd.PC_ID }"/>
		<div id="zhongxin">
			<table id="table_report" class="table table-striped table-bordered table-hover">
				
				<tr>
					<th>IP:</th>
					<td>
						<input type="text" name="IP" id="IP" value="${pd.IP}" maxlength="20" style="width: 50%;" placeholder="这里输入IP" title="IP" />
					</td>
				</tr>
				<tr>
					<th>端口:</th>
					<td>
						<input type="text" name="Port" id="Port" value="${pd.Port}" maxlength="20" style="width: 50%;" placeholder="这里输入端口" title="IP" />
					</td>
				</tr>
				<tr>
					<th>二维码长度</th>
					<td>
						<input type="text" name="Len" id="Len" value="${pd.Len}" maxlength="20" style="width: 50%;" placeholder="这里输入二维码长度" title="Len" />
					</td>
				</tr>
				<tr>
					<th>描述:</th>
					<td>
						<input type="text" name="Remark" id="Remark" value="${pd.Remark}" maxlength="20" style="width: 50%;" placeholder="这里输入位置描述" title="位置描述" />
					</td>
				</tr>
				
				<tr>
					<th>地点:</th>
					<td>
						<select id="Address" name="Address" placeholder="Choose a Country...">
							<option value="">请选择地点</option>
							<c:forEach items="${dataMap['Address']}" var="dataMap1">
								<c:if test="${pd.Address eq dataMap1.key}">  
									<option selected value="${dataMap1.key }">${dataMap1.value }</option>
								</c:if>
								<c:if test="${pd.Address ne dataMap1.key}">  
									<option value="${dataMap1.key }">${dataMap1.value }</option>
								</c:if>
							</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<th>厂区:</th>
					<td>
						<select id="EP" name="EP" placeholder="Choose a Country...">
							<option value="">请选择厂区</option>
							<c:forEach items="${dataMap['EP']}" var="dataMap1">
								<c:if test="${pd.EP eq dataMap1.key}">  
									<option selected value="${dataMap1.key }">${dataMap1.value }</option>
								</c:if>
								<c:if test="${pd.EP ne dataMap1.key}">  
									<option value="${dataMap1.key }">${dataMap1.value }</option>
								</c:if>
							</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<th>零件类型:</th>
					<td>
						<select id="TrayType" name="TrayType" placeholder="Choose a Country...">
							<option value="">请选择地点</option>
							<c:forEach items="${dataMap['TrayType']}" var="dataMap2">
								<c:if test="${pd.TrayType eq dataMap2.key}">  
									<option selected value="${dataMap2.key }">${dataMap2.value }</option>
								</c:if>
								<c:if test="${pd.TrayType ne dataMap2.key}">  
									<option value="${dataMap2.key }">${dataMap2.value }</option>
								</c:if>
							</c:forEach>
						</select>
					</td>
				</tr>
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