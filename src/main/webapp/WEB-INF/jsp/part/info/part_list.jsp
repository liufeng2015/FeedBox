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
	
	//新增
	function add(TrayId){
		 top.jzts();
		 var diag = new top.Dialog();
		 diag.Drag=true;
		 diag.Title ="新增";
		 diag.URL = '<%=basePath%>partInfo/toAdd.do?TrayId='+TrayId;
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
	
	//修改
	function edit(AP_ID){
		 top.jzts();
	   	 var diag = new top.Dialog();
		 diag.Drag=true;
		 diag.Title ="编辑";
		 diag.URL = '<%=basePath%>partInfo/toEdit.do?ID='+AP_ID;
		 diag.Width = 600;
		 diag.Height = 500;
		 diag.CancelEvent = function(){ //关闭事件
			 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
				 nextPage(${page.currentPage});
			}
			 diag.close();
		 };
		 diag.show();
	}
	
	
	//删除
	function del(AP_ID){
		var flag = false;
		if(confirm("确定要删除该数据吗?")){
			flag = true;
		}
		if(flag){
			top.jzts();
			var url = "<%=basePath%>partInfo/del.do?ID="+AP_ID+"&guid="+new Date().getTime();
			$.get(url,function(data){
				if("success" == data.result){
					top.jzts();
					nextPage(${page.currentPage});
				}else{
					top.hangge();
					alert("删除失败，请先删除已绑定的项目数据!"); 
				}
			});
		}
	}
	
</script> 
</head>

<body>
<div id="page-content" class="clearfix">
<div class="row-fluid">
	
	<!-- 检索  -->
	<form action="<%=basePath%>/partInfo.do" method="post" name="userForm" id="userForm">
	<input name="TrayId" id="TrayId" type="hidden" value="${pd.TrayId }" />
	<table>
		<tr>
			<td><font color="#808080">检索二维码：</font></td>
			<td><input type="text" name="FuzzySearch" value="${pd.FuzzySearch }" placeholder="这里输入检索条件" style="width:130px;"/></td>
			<td><font color="#808080">类型：</font></td>
			<td>
						<select id="PartType" name="PartType" style="width: 100%;">
	                        <option value="">请选择</option>
	                        <c:forEach items="${dataMap['TrayType']}" var="var" varStatus="vs">
							  
							  	<c:choose>
									<c:when test="${pd.PartType eq var.key}">
										<option value='${var.key}' selected="selected" >${var.value}</option>
									</c:when>
									<c:otherwise>
										<option value="${var.key }">${var.value }</option>
									</c:otherwise>
								</c:choose>
							  </c:forEach>
	                        
	                        
			             </select>
			</td>
			<td><font color="#808080">产线：</font></td>
			<td>
						<select id="Line" name="Line" style="width: 100%;">
	                        <option value="">请选择</option>
	                        <c:forEach items="${dataMap['Line']}" var="var" varStatus="vs">
							  
							  	<c:choose>
									<c:when test="${pd.Line eq var.key}">
										<option value='${var.key}' selected="selected" >${var.value}</option>
									</c:when>
									<c:otherwise>
										<option value="${var.key }">${var.value }</option>
									</c:otherwise>
								</c:choose>
							  </c:forEach>
	                        
	                        
			             </select>
			</td>
			<td><font color="#808080">零件状态：</font></td>
			<td>
						<select id="PartState" name="PartState" style="width: 100%;">
	                        <option value="">请选择</option>
	                        <c:forEach items="${dataMap['PartState']}" var="var" varStatus="vs">
							  
							  	<c:choose>
									<c:when test="${pd.PartState eq var.key}">
										<option value='${var.key}' selected="selected" >${var.value}</option>
									</c:when>
									<c:otherwise>
										<option value="${var.key }">${var.value }</option>
									</c:otherwise>
								</c:choose>
							  </c:forEach>
	                        
	                        
			             </select>
			</td>
			
			
			</tr>
					<tr>
					<td>下线时间</td>
					<td>
						<input   class="span10 date-picker"  name="startTime" id="startTime" value='${pd.startTime}' type="text" data-date-format="yyyy-mm-dd" />
						<span class="add-on"><i	class="icon-calendar"></i></span>
					</td>
					<td>~
					</td>
					<td>
						<input   class="span10 date-picker"  name="endTime" id="endTime" value='${pd.endTime}' type="text" data-date-format="yyyy-mm-dd" />
						
						<span class="add-on"><i	class="icon-calendar"></i></span>
					</td>
					<td>装配时间</td>
					<td>
						<input   class="span10 date-picker"  name="UseStartTime" id="UseStartTime" value='${pd.UseStartTime}' type="text" data-date-format="yyyy-mm-dd" />
						<span class="add-on"><i	class="icon-calendar"></i></span>
					</td>
					<td>~
					</td>
					<td>
						<input   class="span10 date-picker"  name="UseEndTime" id="UseEndTime" value='${pd.UseEndTime}' type="text" data-date-format="yyyy-mm-dd" />
						
						<span class="add-on"><i	class="icon-calendar"></i></span>
					</td>
					
					<td style="vertical-align:top;"><button class="btn btn-mini btn-light" onclick="search();"><i id="nav-search-icon" class="icon-search"></i></button></td>
				</tr>			
			
		
		</tr>
	</table>
	<!-- 检索  -->

	<table id="table_report" class="table table-striped table-bordered table-hover">
		<thead>
		<tr>
			<th class="center">序号</th>
			<th class='center'>二维码</th>
			<th class='center'>状态</th>
			<th class='center'>下线时间</th>
			<th class='center'>装配时间</th>
			<th class='center'>类型</th>
			<th class='center'>操作</th>
		</tr>
		</thead>
		<c:choose>
			<c:when test="${not empty varList}">
				<c:forEach items="${varList}" var="var" varStatus="vs">
				<tr>
					<td class="center">${vs.index + 1 }</td>
					<td class='center'>${var.QRCode}</td>	
					<td class="center">${var.State}</td>
					<td class="center">${var.CreateTime}</td>
					<td class="center">${var.UseTime}</td>
					<td class="center">${var.PartType}</td>
					<td style="width: 155px;">
						<a class='btn btn-mini btn-info' title="编辑" onclick="edit('${var.ID }')" ><i class='icon-edit'></i></a>
						<a class='btn btn-mini btn-danger' title="删除"  onclick="del('${var.ID }')"><i class='icon-trash'></i></a>
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
	
		
		<div class="page-header position-relative">
		<table style="width:100%;">
			<tr>
				<td style="vertical-align:top;width:50px;"><a class="btn btn-small btn-success" onclick="add('${pd.PARENT_ID}');">新增</a></td>				
				<td style="vertical-align:top;"><div class="pagination" style="float: right;padding-top: 0px;margin-top: 0px;">${page.pageStr}</div></td>
			</tr>
		</table>
		</div>
	
	
	</form>
</div>
</div>

<script type="text/javascript">


	$(function() {

		$('#startTime').datepicker();
		$('#endTime').datepicker();
		$('#UseStartTime').datepicker();
		$('#UseEndTime').datepicker();
		
	});
</script>
</body>
</html>