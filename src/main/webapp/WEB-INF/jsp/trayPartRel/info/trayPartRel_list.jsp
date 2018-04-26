<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<c:set var="dataMap" value='<%=com.fh.util.DataConstants.dataMap%>'/>
<!DOCTYPE html>
<html lang="en">
<head>
<base href="<%=basePath%>">

<meta charset="utf-8" />
<title></title>
<meta name="description" content="overview & stats" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<base href="<%=basePath%>">
		
		<meta charset="utf-8" />
		<title></title>
		<meta name="description" content="overview & stats" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<link href="static/css/bootstrap.min.css" rel="stylesheet" />
		<link href="static/css/bootstrap-responsive.min.css" rel="stylesheet" />
		<link rel="stylesheet" href="static/css/font-awesome.min.css" />
		<link rel="stylesheet" href="static/css/ace.min.css" />
		<link rel="stylesheet" href="static/css/ace-responsive.min.css" />
		<link rel="stylesheet" href="static/css/ace-skins.min.css" />
		<script type="text/javascript" src="static/js/jquery-1.7.2.js"></script>
		<script type="text/javascript" src="static/js/bootbox.min.js"></script><!-- 确认窗口 -->
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

<script type="text/javascript">
	
	$(top.hangge());
	function setSelectTray(strNum){
		var url = "<%=basePath%>trayPartRelInfo.do";
		
		$.ajax({  
		    type : "post",  
		    url : url,  
		    data : "",  
		    async : false,//取消异步  
		    success : function(data){  
		    	alert("零件总数100"); 
		    	var trHTML='<tr>'
					+'  <td>'+i+'</td>'
					+'	<td>2</td>'
					+'	<td>3</td>'
					+'	<td>4</td>';
	    		jQuery('#table_PartReport').append(trHTML);
			}
		}); 
	}
	
	var array =new Array();
	function getAllPartData(strId){
		$("#TrayId").val(strId);
		array =new Array();
		var url = "<%=basePath%>trayPartRelInfo/getAllPartData.do";	
		$.ajax({  
		    type : "post",  
		    url : url,  
		    data : "State=未使用&TrayId="+strId,
		    async : false,//取消异步  
		    success : function(data){
		    	//选中托盘中所有箱子容纳零件总和
		    	var boxFullSize = data.boxFullSize;
		    	//箱子总数
		    	var boxSize = data.boxSize;
		    	jQuery('#listTableContent').empty();
		    	var listData = data.result;
		    	var size = 1;
		    	var arrSize = 0;
				for(var i = listData.length - 1;i >= 0;i--){
			        var data = listData[i];	
			        if(boxFullSize>=size){
			        	var trHTML='<tr>'
							+'  <td><font size="3" color="red">'+data.PartName+'</font></td>'
							+'	<td><font size="3" color="red">'+data.DateNumber+'</font></td>'
							+'	<td><font size="3" color="red">'+data.QRCode+'</font></td>';
							array[arrSize] = data.ID+"~"+data.QRCode;
		    			jQuery('#listTableContent').append(trHTML);
			        }else{
			        	var trHTML='<tr>'
							+'  <td>'+data.PartName+'</td>'
							+'	<td>'+data.DateNumber+'</td>'
							+'	<td>'+data.QRCode+'</td>';			
		    			jQuery('#listTableContent').append(trHTML);
			        }
			        arrSize++;
	    			size++;
				}
			}
		});		
	}
	
	function addPartInfo(){
		var TrayId = $("#TrayId").val();
		var url = "<%=basePath%>trayPartRelInfo/savePartInfo.do";	
		//参数：零件二维码、零件名称、总成号、流水号、日期、时间、生产线、类型、分组、
		//32位长度曲轴二维码，流水号取最后5位（分组号）
		
		//36位长度零件二维码，取流水号
		
		//零件名称取固定：32位为曲轴；36位为某某某
		var partName = "曲轴20171125";
		var dateNumber = "aaa0006";
		var partType = "曲轴";
		$.ajax({
		    type : "post",  
		    url : url,  
		    data : "QRCode=TEST20171125&PartName="+partName+"&DateNumber="+dateNumber+"&PartType="+partType+"&TrayId="+TrayId+"&State=未使用",
		    async : false,//取消异步  
		    success : function(data){
		    	if(data.result=="success"){
		    		getAllPartData(data.TrayId);
		    	}
		    	
			}
		});	
		
	}
	
	$(document).ready(function(){
		getAllPartData("")
	});
	
	function bingingTrayPart(){
		var trayId = $("#TrayId").val();
		if(trayId == null || trayId == ""){
			alert("请选择需绑定的托盘");
			return;
		}
		var url = "<%=basePath%>trayPartRelInfo/saveTrayPartRel.do";
		
		$.ajax({
		    type : "post",  
		    url : url,  
		    data : "State=0&TrayId="+trayId+"&arrayData="+array,
		    async : false,//取消异步  
		    success : function(data){
		    	if(data.result=="success"){
		    		getAllPartData(data.TrayId);
		    		window.location.reload();
		    		openP();
		    	}else{
		    		alert("绑定失败");
		    		return;
		    	}	    	
			}
		});	
	}
	function openP(){
		 window.open("<%=basePath%>/trayPartRelInfo/printTable.do", "", 'left=250,top=150,width=750,height=500,toolbar=no,menubar=no,status=no,scrollbars=yes,resizable=yes');
	}
</script> 
</head>

<body>
	<div id="page-content" class="clearfix">
		<div class="row-fluid">
			<div id="zhongxin">
				<!-- 检索  -->
				<form action="<%=basePath%>/trayPartRelInfo.do?Address='清洗'" method="post"	name="userForm" id="userForm">
					<input name="TrayId" id="TrayId" type="hidden" value="" />
					<input type="button" value="新增零件" onclick="addPartInfo()"/>&nbsp;
					<input type="button" value="绑定并打印" onclick="bingingTrayPart()"/>&nbsp;
					<!-- <input type="button" value="打印" onclick="openP()"/>&nbsp;如果点不开,换个浏览器试试 -->
					<table class="table">
						<tr>
							<td>
								<table id="table_report" class="table table-striped table-bordered table-hover">
								<thead>
									<tr>
										<th class="center">请选择</th>
										<th class='center'>托盘编号</th>								
									</tr>
								</thead>
								
								<c:choose>
									<c:when test="${not empty varList}">
										<c:forEach items="${varList}" var="var" varStatus="vs">
										<tr>
											<td class="center"><input name="form-field-radio" id="form-field-radio" onclick="getAllPartData('${var.ID}');" type="radio" value="icon-edit"/><span class="lbl"></span></td>
											<td class='center'>${var.TrayName}</td>					
										</tr>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<tr>
										<td colspan="100" class="center">没有相关数据</td>
										</tr>
									</c:otherwise>
								</c:choose>
							</table>
							</td>
							
							<td>
								<table id="table_PartReport" class="table table-striped table-bordered table-hover">
								<thead>
									<tr>
										<th class='center'>零件名称</th>	
										<th class='center'>流水号</th>	
										<th class='center'>托盘号</th>						
									</tr>
								</thead>
								<tbody id="listTableContent"></tbody>								
							</table>
							</td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	$(function() {
		$('#PaymentTimeStart').datepicker();
		$('#PaymentTimeEnd').datepicker();		
	});
</script>
</html>