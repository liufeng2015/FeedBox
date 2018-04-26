<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
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
		window.jQuery || document.write("<script src='static/js/jquery-1.9.1.min.js'>\x3C/script>");
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
<!-- ace scripts -->
<script src="static/js/ace-elements.min.js"></script>
<script src="static/js/ace.min.js"></script>
<!-- inline scripts related to this page -->
<script type="text/javascript">

	$(top.hangge());
	function reset(){
		$("#userForm").attr("action","rentInfo/resetRentInfo.do");
		$("#userForm").submit();
			
	}
	function onChange(strId,QRCode){
	 	var url = "<%=basePath%>trayBoxRelInfo/save.do";
	 	var CHOOSE_TYPE = $("#CHOOSE_TYPE").val();
	 	var TrayId = $("#TrayId").val();
	 	var TrayRFID =$("#TrayRFID").val();
	 	$.ajax({  
			    type : "post",  
			    url : url,  
			    data : "CHOOSE_TYPE="+CHOOSE_TYPE+ "&TrayId="+TrayId+ "&TrayRFID="+TrayRFID+ "&BoxId="+strId+ "&BoxQRCode="+QRCode,  
			    async : false,//取消异步  
			    success : function(data){
			    	top.jzts();
					nextPage(${page.currentPage});
				}
		}); 
	}
	
	function doDelete(strId){
		var flag = false;
		var CHOOSE_TYPE = $("#CHOOSE_TYPE").val();
		if(confirm("确定要移除该物料箱么?")){
			flag = true;
		}
		if(flag){
			top.jzts();
			var url = "<%=basePath%>trayBoxRelInfo/del.do?ID=" + strId+ "&CHOOSE_TYPE="+CHOOSE_TYPE;
			$.get(url,function(data){
				if("success" == data.result){
					top.jzts();
					nextPage(${page.currentPage});
				}else{
					top.hangge();
					alert("移除失败!"); 
				}
			});
		}
	}
	
	function setType(value){
		$("#CHOOSE_TYPE").val(value);
	}
	
	$(document).ready(function(){
	    var parentId = ${pd.CHOOSE_TYPE};
		if(parentId!=""){
			if(parentId=="1"){
				$("#form-field-radio1").attr("checked",true);
				$("#form-field-radio2").attr("checked",false);
			}else if(parentId=="2"){
				$("#form-field-radio1").attr("checked",false);
				$("#form-field-radio2").attr("checked",true);
			}
		}
	});
	
</script>
</head>

<body>
	<div id="page-content" class="clearfix">
		<div class="row-fluid">
			<div id="zhongxin">
				<!-- 检索  -->
				<form action="<%=basePath%>/trayBoxRelInfo.do" method="post"	name="userForm" id="userForm">
					<input name="TrayId" id="TrayId" type="hidden" value="${pd.TrayId }" />
					<input name="TrayRFID" id="TrayRFID" type="hidden" value="${pd.TrayRFID }" />
					<input type="hidden" name="CHOOSE_TYPE" id="CHOOSE_TYPE" value="${pd.CHOOSE_TYPE }"/>
					<!-- <table>
						<tr>
							<td style="text-align: center;">
								<label style="float:left;padding-left: 32px;"><input name="form-field-radio" id="form-field-radio1" onclick="setType('1');" type="radio" value="icon-edit"><span class="lbl">已选择</span></label>
								<label style="float:left;padding-left: 5px;"><input name="form-field-radio" id="form-field-radio2" onclick="setType('2');" type="radio" value="icon-edit"><span class="lbl">未选择</span></label>
							</td>
							<td style="vertical-align: top;">
								<button	class="btn btn-mini btn-light" onclick="search();">
									<i id="nav-search-icon" class="icon-search"></i>
								</button>
							</td>
						</tr>
					</table> -->
					<!-- 检索  -->

					<table id="table_report" class="table table-striped table-bordered table-hover">
						<thead>
							<tr>
								<th class="center">序号</th>
								<!-- <th class='center'>二维码</th> -->
								<th class='center'>零件名</th>
								<th class='center'>零件类型</th>
								<!-- <th class='center'>工厂/车间号</th>
								<th class='center'>日期</th>
								<th class='center'>总成号</th>
								<th class='center'>组别号</th>
								<th class='center'>分组号</th>
								<th class='center'>工厂组织结构</th> -->
								<th class='center'>托盘编号</th>
								<th class='center'>托盘RFID</th>
								<th class='center'>托盘RFID</th>
								<!-- <th class='center'>操作</th> -->
							</tr>
						</thead>
						<c:choose>
							<c:when test="${not empty varList}">
								<c:forEach items="${varList}" var="var" varStatus="vs">
									<tr>
										<td class="center">${vs.index + 1 }</td>
										<td class='center'>${var.PartName}</a></td>
										<td class='center'>${var.PartType }</td>
										<td class="center">${var.TrayName }</td>
										<td class="center">${var.RFID}</td>
										<td class="center">${var.RFID2}</td>
										<%-- <td style="width: 155px;">
											<c:choose>
												<c:when test="${pd.CHOOSE_TYPE== '1'}">
													<a class='btn btn-mini btn-success' id='noChoose' title="取消选择" onclick="doDelete('${var.ID}')">
														<i class='icon-lock'></i>
													</a>
												</c:when>
											    <c:otherwise>
													<a class='btn btn-mini btn-warning' id='choose' title="选择" onclick="onChange('${var.ID}','${var.QRCode}')">
														<i class='icon-unlock'></i>
													</a>
												</c:otherwise>
											</c:choose>										
										</td> --%>
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

					<div class="page-header position-relative">
						<table style="width: 100%;">
							<tr>
								<td style="vertical-align: top;">
									<div class="pagination" style="float: right; padding-top: 0px; margin-top: 0px;">${page.pageStr}</div>
								</td>
							</tr>
							<tr>
								<td style="vertical-align: top;" class="left">
									<a class="btn btn-small btn-info" onclick="location.href='<%=basePath%>/trayInfo.do';">返回</a>
									<a class="btn btn-small btn-success" onclick="add('${pd.TrayId }','${pd.TrayRFID }');">新增零件</a>
								</td>
							</tr>
						</table>
					</div>
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
	
	//新增
	function add(strTrayId,strTrayRFID){
		 top.jzts();
		 var diag = new top.Dialog();
		 diag.Drag=true;
		 diag.Title ="新增";
		 diag.URL = '<%=basePath%>partInfo/toAdd.do?trayId='+strTrayId+'&trayRFID='+strTrayRFID;
		 diag.Width = 600;
		 diag.Height = 500;
		 diag.CancelEvent = function(){ //关闭事件
			 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
				var num = '${page.currentPage}';
			 	if(num == '0'){
			 		top.jzts();
			 		location.href = location.href;
			 	}else{
			 		nextPage(${page.currentPage});
			 	}
			}
			 diag.close();
		 };
		 diag.show();
	}
</script>
</html>