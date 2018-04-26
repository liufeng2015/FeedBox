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
	if($("#PositionInfo").val()==""){
		
		$("#PositionInfo").tips({
			side:2,
            msg:'请输入位置描述',
            bg:'#AE81FF',
            time:2
        });
		
		$("#PositionInfo").focus();
		return false;
	}
	$("#Form").submit();
	$("#zhongxin").hide();
	$("#zhongxin2").show();
}

</script>

<body>
	<form  action="positionConfig/save.do" name="Form" id="Form" method="post" >
		<input type="hidden" name="AP_ID" id="AP_ID" value="${pd.ID }"/>
		<div id="zhongxin">
			<table id="table_report" class="table table-striped table-bordered table-hover">
				<tr>
					<th>编号:</th>
					<td>
						<input type="text" name="PositionCode" id="PositionCode" value="${pd.PositionCode}" maxlength="50" style="width: 50%;" placeholder="这里输入位置编号" title="位置编号" />
					</td>
				</tr>
				<tr>
					<th>IP:</th>
					<td>
						<input type="text" name="IP" id="IP" value="${pd.IP}" maxlength="20" style="width: 50%;" placeholder="这里输入IP" title="IP" />
					</td>
				</tr>
				<tr>
					<th>端口号:</th>
					<td>
						<input type="text" name="PORT" id="PORT" value="${pd.PORT}" maxlength="20" style="width: 50%;" placeholder="这里输入端口号" title="端口号" />
					</td>
				</tr>
				<tr>
					<th>描述:</th>
					<td>
						<input type="text" name="PositionInfo" id="PositionInfo" value="${pd.PositionInfo}" maxlength="20" style="width: 50%;" placeholder="这里输入位置描述" title="位置描述" />
					</td>
				</tr>
				<%-- <tr>
					<th>状态:</th>
					<td>
						<input type="text" name="State" id="State" value="${pd.State}" maxlength="20" style="width: 50%;" placeholder="这里输入状态" title="状态" />
					</td>
				</tr> --%>
				<tr>
					<th>状态:</th>
					<td>
						<select id="State" name="State" placeholder="Choose a Country...">
							<option value="">请选择状态</option>
							<c:forEach items="${dataMap['BoxNowState']}" var="dataMap1">
								<c:if test="${pd.State eq dataMap1.key}">  
									<option selected value="${dataMap1.key }">${dataMap1.value }</option>
								</c:if>
								<c:if test="${pd.State ne dataMap1.key}">  
									<option value="${dataMap1.key }">${dataMap1.value }</option>
								</c:if>
							</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<th>满箱状态:</th>
					<td>
						<select id="FullState" name="FullState" placeholder="Choose a Country...">
							<option value="">请选择满箱状态</option>
							<c:forEach items="${dataMap['BoxNowState']}" var="dataMap1">
								<c:if test="${pd.FullState eq dataMap1.key}">  
									<option selected value="${dataMap1.key }">${dataMap1.value }</option>
								</c:if>
								<c:if test="${pd.FullState ne dataMap1.key}">  
									<option value="${dataMap1.key }">${dataMap1.value }</option>
								</c:if>
							</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<th>空箱状态:</th>
					<td>
						<select id="EmptyState" name="EmptyState" placeholder="Choose a Country...">
							<option value="">请选择空箱状态</option>
							<c:forEach items="${dataMap['BoxNowState']}" var="dataMap1">
								<c:if test="${pd.EmptyState eq dataMap1.key}">  
									<option selected value="${dataMap1.key }">${dataMap1.value }</option>
								</c:if>
								<c:if test="${pd.EmptyState ne dataMap1.key}">  
									<option value="${dataMap1.key }">${dataMap1.value }</option>
								</c:if>
							</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<th>可使用空箱状态:</th>
					<td>
						<select id="CanUseState" name="CanUseState" placeholder="Choose a Country...">
							<option value="">请选择可使用空箱状态</option>
							<c:forEach items="${dataMap['BoxNowState']}" var="dataMap1">
								<c:if test="${pd.CanUseState eq dataMap1.key}">  
									<option selected value="${dataMap1.key }">${dataMap1.value }</option>
								</c:if>
								<c:if test="${pd.CanUseState ne dataMap1.key}">  
									<option value="${dataMap1.key }">${dataMap1.value }</option>
								</c:if>
							</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<th>待清洗空箱状态:</th>
					<td>
						<select id="DurtyState" name="DurtyState" placeholder="Choose a Country...">
							<option value="">待清洗空箱状态</option>
							<c:forEach items="${dataMap['BoxNowState']}" var="dataMap1">
								<c:if test="${pd.DurtyState eq dataMap1.key}">  
									<option selected value="${dataMap1.key }">${dataMap1.value }</option>
								</c:if>
								<c:if test="${pd.DurtyState ne dataMap1.key}">  
									<option value="${dataMap1.key }">${dataMap1.value }</option>
								</c:if>
							</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<th>LED:</th>
					<td>
						<input type="text" name="Led" id="Led" value="${pd.Led}" maxlength="20" style="width: 50%;" placeholder="这里输入LED" title="LED" />
					</td>
				</tr>
				<tr>
					<th>报警状态:</th>
					<td>
						<select id="AlertLight" name="AlertLight" placeholder="Choose a Country...">
							<option value="">请选择满箱状态</option>
							<c:forEach items="${dataMap['BoxNowState']}" var="dataMap1">
								<c:if test="${pd.AlertLight eq dataMap1.key}">  
									<option selected value="${dataMap1.key }">${dataMap1.value }</option>
								</c:if>
								<c:if test="${pd.AlertLight ne dataMap1.key}">  
									<option value="${dataMap1.key }">${dataMap1.value }</option>
								</c:if>
							</c:forEach>
						</select>
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
					<th>托盘种类:</th>
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