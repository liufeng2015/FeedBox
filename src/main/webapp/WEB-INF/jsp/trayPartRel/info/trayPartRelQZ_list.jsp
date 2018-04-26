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
	
	body { font-family: "Microsoft Yahei", Arial } 
</style>
<script type="text/javascript">
	
	$(top.hangge());
	
	
	var array =new Array();
	
	
	function doDelete(strId,index){
		if(confirm("确定要删除序号为"+index+"的零件吗？")){
			var url = "<%=basePath%>trayPartRelInfo/deletePartData.do";
			$.ajax({
			    type : "post",  
			    url : url,  
			    data : "id="+strId,
			    async : false,//取消异步  
			    success : function(data){
			    	if(data.result=="success"){
			    		document.getElementById("userForm").submit();
			    		alert("零件删除成功");
			    	}
			    	
				}
			});	
	 	}
	}
	
	
	
	function bingingTrayPart(){
		var trayId = $("#TrayId").val();
		
		var ss="TRAY"+trayId;
		
		
		var fullNumber = $("#FullNumber").val();
		var Sclass = $("#Sclass").val();
		if(Sclass == null || Sclass == ""){
			alert("请选择班组");
			return;
		}
		if(trayId == null || trayId == "" || document.getElementById(ss)==null ){
			
			alert("请选择需绑定的托盘");
			return;
		}
		var url = "<%=basePath%>trayPartRelInfo/saveTrayPartRel.do";
		
		$.ajax({
		    type : "post",  
		    url : url,  
		    data : "State=未使用&ID="+trayId+"&TrayId="+trayId+"&FullNumber="+fullNumber+"&Sclass="+Sclass+"&arrayData="+array+"&Address=${pd.Address}",
		    async : false,//取消异步  
		    success : function(data){
		    	if(data.result=="success"){
		    		
		    		document.getElementById("userForm").submit();
		    		openP(data.B_ID);
		    	}else{
		    		alert("绑定失败");
		    		return;
		    	}	    	
			}
		});	
	}
	
	function changTray(TrayID){
	
		
		var oo=$("#TrayId").val();
		
		$("#TrayId").val(TrayID);
		
		document.getElementById("TRAY"+TrayID).className = "btn btn-success  btn-large";//styleclass为新的属性值
		document.getElementById("TRAY"+TrayID).setAttribute("class","btn btn-success  btn-large");
		
		document.getElementById("TRAY"+oo).className = "btn btn-yellow  btn-large";//styleclass为新的属性值
		document.getElementById("TRAY"+oo).setAttribute("class","btn btn-yellow  btn-large");
		
	}
	
	function changClass(Sclass){
		
		if(Sclass=='A'){
			document.getElementById('B').className = "btn btn-info radius-4";//styleclass为新的属性值
			document.getElementById('B').setAttribute("class","btn btn-info radius-4");
			document.getElementById('C').className = "btn btn-info radius-4";//styleclass为新的属性值
			document.getElementById('C').setAttribute("class","btn btn-info radius-4");
		}
		
		if(Sclass=='B'){
			document.getElementById('A').className = "btn btn-info radius-4";//styleclass为新的属性值
			document.getElementById('A').setAttribute("class","btn btn-info radius-4");
			document.getElementById('C').className = "btn btn-info radius-4";//styleclass为新的属性值
			document.getElementById('C').setAttribute("class","btn btn-info radius-4");
		}
		
		if(Sclass=='C'){
			document.getElementById('A').className = "btn btn-info radius-4";//styleclass为新的属性值
			document.getElementById('A').setAttribute("class","btn btn-info radius-4");
			document.getElementById('B').className = "btn btn-info radius-4";//styleclass为新的属性值
			document.getElementById('B').setAttribute("class","btn btn-info radius-4");
		}
		
		$("#Sclass").val(Sclass);
		document.getElementById(Sclass).className = "btn btn-success radius-4";//styleclass为新的属性值
		document.getElementById(Sclass).setAttribute("class","btn btn-success radius-4");
	}
	
	function openP(B_ID){
		 window.open("<%=basePath%>/trayPartRelInfo/printTable.do?B_ID="+B_ID,"", 'left=250,top=150,width=750,height=500,toolbar=no,menubar=no,status=no,scrollbars=yes,resizable=yes');
	}
</script> 
</head>

<body  >


	<div id="page-content" class="clearfix">
		<div class="row-fluid">
			<div id="zhongxin">
				<!-- 检索  -->
				<form action="<%=basePath%>/trayPartRelInfo.do" method="post"	name="userForm" id="userForm">
				
					<input name="Sclass" id="Sclass" type="hidden" value="${pd.Sclass}" />
					<input type="text" value="" id="gun" name="gun" style="width:0;height:0;"/>
					<input name="TrayId" id="TrayId" type="hidden" value="${pd.TrayId}" />
					<input name="Address" id="Address" type="hidden" value="${pd.Address}" />
					<input name="FullNumber" id="FullNumber" type="hidden" value="${pd.FullNumber}" />	
					<input name="var1c" id="var1c" type="hidden" value="${varList.size()}" />	
					<input name="var2c" id="var2c" type="hidden" value="${varList2.size()}" />					
					<!-- <input type="button" value="新增零件" onclick="addPartInfo()"/>&nbsp; -->
					
					
						
					<table id="table_report" class="table table-bordered table-hover"  >
					<tr height="75px" >
					
						<th width="15%"><font color="#808080"  size="5"><br>${pd.AddressName}</font></th>
						<th width="35%"><font color="#808080" size="5"><br>型号：${pd.Model}</font></th>
						<th width="30%"><font color="#808080" size="5"><br>下线日期:<fmt:formatDate value="${pd.CreateTime}" pattern="yyyy-MM-dd"/></font></th>
						<th rowspan="2" width="10%"><input type="button" value="绑定并打印" class="btn btn-app btn-success" onclick="bingingTrayPart()"  style="width: 100%;height: 150px;font-size: 28px;" /></th>
					</tr>
						<tr height="75px">
							<th><p><font color="#808080" size="5" ><br>箱号：${pd.No}</font></p></th>
							<th><p><font color="#808080" size="5"><br>零件号：${pd.PartNumber}</font></p></th>
							
							<th>
									<font color="#808080" size="5" ><br>班组: 
										<a id="A" href="javascript:changClass('A')" class="btn btn-info" style="width: 17%;height: 40px;top: -10px" >A</a>
										<a id="B" href="javascript:changClass('B')" class="btn btn-info" style="width: 17%;height: 40px;top: -10px" >B</a>
										<a id="C" href="javascript:changClass('C')" class="btn btn-info" style="width: 17%;height: 40px;top: -10px" >C</a>
									</font>
							</th>
						</tr>
					</table>
					
					
					<!-- <input type="button" value="打印" onclick="openP()"/>&nbsp;如果点不开,换个浏览器试试 -->
					<table class="table">
						<tr>
							<td style="width:180px;">
							
									<c:choose>
										<c:when test="${not empty varList}">
											<c:forEach items="${varList}" var="var" varStatus="vs">
												<input id="TRAY${var.ID}" type="button" value="${var.TrayName}" class="btn btn-yellow  btn-large" style="width:180px;height: 75px" onclick="javascript:changTray('${var.ID}');"/>
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
							
							<td width="50%">
										<table id="table_PartReport" class="table table-striped table-bordered table-hover">
										<thead>
											<tr>
											    <th class='center' width="10%" >序号</th>	
												<th class='center' width="80%">二维码</th>	
												<th class='center' width="10%">操作</th>
											</tr>
										</thead>
											<c:choose>
												<c:when test="${not empty varList2}">
													<c:forEach items="${varList2}" var="var2" varStatus="vs">
													<c:if test="${vs.index<12 }">
													<tr>
														<td class="center">${vs.index + 1 }</td>
														<td class='center'>${var2.QRCodeShow}</td>	
														<td class='center' style="width: 155px;">
															<a class='btn btn-mini btn-danger' title="删除" onclick="doDelete('${var2.ID }','${vs.index + 1 }')" >删除</a>
														</td>
													</tr>
													</c:if>
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
							<td  width="50%">
										<table id="table_PartReport" class="table table-striped table-bordered table-hover">
											<thead>
												<tr>
											    <th class='center' width="10%" >序号</th>	
												<th class='center' width="80%">二维码</th>	
												<th class='center' width="10%">操作</th>
												</tr>
											</thead>
											<c:choose>
												<c:when test="${not empty varList3}">
													<c:forEach items="${varList3}" var="var3" varStatus="vs">
													<tr>
														<td class="center">${vs.index + 13 }</td>
														<td class='center'>${var3.QRCodeShow}</td>	
														<td class='center' style="width: 155px;">
															<a class='btn btn-mini btn-danger' title="删除" onclick="doDelete('${var3.ID }','${vs.index + 1 }')" >删除</a>
														</td>
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
						</tr>
						<tr><td><font color="#808080" size="5">总数量：${pd.AllC}</font></td></tr>
					</table>
				</form>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	$(function() {
	
		setTimeout("refresh()",5000);
		var ss=$("#Sclass").val();
		document.getElementById(ss).className = "btn btn-success radius-4";//styleclass为新的属性值
		document.getElementById(ss).setAttribute("class","btn btn-success radius-4");
		
		var tt=$("#TrayId").val();
		document.getElementById("TRAY"+tt).className = "btn btn-success  btn-large";//styleclass为新的属性值
		document.getElementById("TRAY"+tt).setAttribute("class","btn btn-success  btn-large");
		
		
	})
	
	function refresh(){
		var var1c=$("#var1c").val();
		var var2c=$("#var2c").val();
		if(var2c<24 || var1c==0){
			$("#userForm").submit();
		}
	}
	
</script>
</html>