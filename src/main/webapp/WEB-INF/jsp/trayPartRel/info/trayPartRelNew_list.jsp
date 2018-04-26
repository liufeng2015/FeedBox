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
<style type="text/css">
 .s1 {
	 background-color: yellow;
	}
</style>
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
	function getAllPartData(strId,strFullNumber){
		$("#TrayId").val(strId);
		$("#FullNumber").val(strFullNumber);
		array =new Array();
		var url = "<%=basePath%>trayPartRelInfo/getAllPartData.do";	
		$.ajax({  
		    type : "post",  
		    url : url,  
		    data : "State=未使用&TrayId="+strId+"&FullNumber="+strFullNumber,
		    async : false,//取消异步  
		    success : function(data){
		    	//选中托盘中所有容纳零件总和
		    	var FullNumber = 4;
		    	
		    	jQuery('#listTableContent').empty();
		    	var listData = data.result;
		    	var size = 1;
		    	var arrSize = 0;
				for(var i = listData.length - 1;i >= 0;i--){
			        var data = listData[i];	
			        if(FullNumber>=size){
			        	var trHTML='<tr>'
							+'  <td><font size="3" color="red">'+size+'</font></td>'
							+'	<td><font size="3" color="red">'+data.QRCode+'</font></td>';
							array[arrSize] = data.ID+"~"+data.QRCode;
		    			jQuery('#listTableContent').append(trHTML);
			        }else{
			        	var trHTML='<tr>'
							+'  <td>'+data.PartName+'</td>'
							+'	<td>'+data.DateNumber+'</td>';			
		    			jQuery('#listTableContent').append(trHTML);
			        }
			        arrSize++;
	    			size++;
				}
			}
		});		
	}
	
	function addPartInfo(QRNum){
	
		var TrayId = $("#TrayId").val();
		/* if(TrayId == "" || TrayId == null){
			alert("请选中绑定零件的托盘");
			return;
			
		} */
		var url = "<%=basePath%>trayPartRelInfo/savePartInfo.do";	
		//参数：零件二维码、零件名称、总成号、流水号、日期、时间、生产线、类型、分组、
		//32位长度曲轴二维码，流水号取最后5位（分组号）
		
		//36位长度零件二维码，取流水号
		
		//零件名称取固定：32位为曲轴；36位为某某某
		
		var partName = "";
		//时间流水号
		var dateNumber = "";
		var partType = "";
		//下线点
		var address = "";
		$.ajax({
		    type : "post",  
		    url : url,  
		    data : "QRCode="+QRNum+"&PartName="+partName+"&DateNumber="+dateNumber+"&PartType="+partType+"&TrayId="+TrayId+"&Address=${pd.Address}&DR=0&State=未使用",
		    async : false,//取消异步  
		    success : function(data){
		    	if(data.result=="success"){
		    		getAllPartData(data.TrayId);
		    	}
		    	
			}
		});	
		
	}
	
	$(document).ready(function(){
		
		
	});
	
	function bingingTrayPart(){
		var trayId = $("#TrayId").val();
		var fullNumber = $("#FullNumber").val();
		var row = $("#ROW").val();
		if(row == null || row == ""){
			alert("请选择班组");
			return;
		}
		if(trayId == null || trayId == ""){
			alert("请选择需绑定的托盘");
			return;
		}
		var url = "<%=basePath%>trayPartRelInfo/saveTrayPartRel.do";
		
		$.ajax({
		    type : "post",  
		    url : url,  
		    data : "State=未使用&ID="+trayId+"&TrayId="+trayId+"&FullNumber="+fullNumber+"&ROW="+row+"&arrayData="+array+"&partType=${pd.Address}",
		    async : false,//取消异步  
		    success : function(data){
		    	if(data.result=="success"){
		    		getAllPartData(data.TrayId);
		    		window.location.reload();
		    		openP(trayId,row);
		    	}else{
		    		alert("绑定失败");
		    		return;
		    	}	    	
			}
		});	
	}
	function openP(trayId,row){
		 window.open(encodeURI("<%=basePath%>/trayPartRelInfo/printTable.do?partType=${pd.Address}&TrayId="+trayId+"&ROW="+row), "", 'left=250,top=150,width=750,height=500,toolbar=no,menubar=no,status=no,scrollbars=yes,resizable=yes');
	}
	
	$(document).ready(function () {
/* 		$('#table_report tr:eq(1)').addClass("s1");
		$('#table_report tr:eq(1)').find(":radio").attr("checked", true); */
	    $("#table_report>tbody>tr").on("click", function () {
	    	$(this).addClass("s1").siblings().removeClass("s1");
	    	$(this).find(":radio").attr("checked", true);
	    });
		
	});
	
	//判断托盘是否已经满载
	
	
</script> 
</head>

<body  >
	<div id="page-content" class="clearfix">
		<div class="row-fluid">
			<div id="zhongxin">
				<!-- 检索  -->
				<form action="<%=basePath%>/trayPartRelInfo.do" method="post"	name="userForm" id="userForm">
				
					<input name="TrayId" id="TrayId" type="hidden" value="${pd.TrayId}" />
					<input name="Address" id="Address" type="hidden" value="${pd.Address}" />
					<input name="FullNumber" id="FullNumber" type="hidden" value="" />					
					<!-- <input type="button" value="新增零件" onclick="addPartInfo()"/>&nbsp; -->
					<input type="button" value="绑定并打印" class="btn btn-info" onclick="bingingTrayPart()"/>&nbsp;
					班组：
					<select id="ROW" name="ROW" placeholder="Choose a Country...">
							<option value="">请选择班组</option>
							<c:forEach items="${dataMap['ROW']}" var="dataMap1">
								<c:if test="${pd.ROW eq dataMap1.key}">  
									<option selected value="${dataMap1.key }">${dataMap1.value }</option>
								</c:if>
								<c:if test="${pd.ROW ne dataMap1.key}">  
									<option value="${dataMap1.key }">${dataMap1.value }</option>
								</c:if>
							</c:forEach>
						</select>
					<input type="text" value="" id="gun" name="gun" style="width:10;height:0;"/>
					<!-- <input type="button" value="打印" onclick="openP()"/>&nbsp;如果点不开,换个浏览器试试 -->
					<table class="table">
						<tr>
							<td style="width:280px;">
							
									<c:choose>
										<c:when test="${not empty varList}">
											<c:forEach items="${varList}" var="var" varStatus="vs">
												<input type="button" value="${var.TrayName}" class="btn btn-yellow  btn-large" style="width:280px;" onclick="javascript:getAllPartData('${var.ID}','${var.FullNumber}');"/>
											<HR style="FILTER: alpha(opacity=100,finishopacity=0,style=3)" width="100%" color=#987cb9 SIZE=3>
											</c:forEach>
										</c:when>
										<c:otherwise>
											<tr>
											<td colspan="100" class="center">没有相关数据</td>
											</tr>
										</c:otherwise>
									</c:choose>
							
							
								

							</td>
							
							<td>
								<table id="table_PartReport" class="table table-striped table-bordered table-hover">
								<thead>
									<tr>
									    <th class='center'>序号</th>	
										<th class='center'>二维码</th>	
										<!-- <th class='center'>托盘号</th>		 -->				
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
	
	$("#gun").focus();;
	
	getAllPartData('');
	//注册键盘事件
	document.onkeydown = function(event) {
		
		var e=event || window.event;
		if(e&& e.keyCode==13){
			var QRNum = $("#gun").val();
			addPartInfo(QRNum);
			$("#gun").val("");
			$("#gun").focus();
		}
		//捕捉回车事件
		
	}
	timedCount();
	});
	
function timedCount(){
	$("#gun").focus();
	setTimeout("timedCount()",5000);
}
</script>
</html>