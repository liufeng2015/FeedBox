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
	function add(){
		 top.jzts();
		 var diag = new top.Dialog();
		 diag.Drag=true;
		 diag.Title ="新增";
		 diag.URL = '<%=basePath%>trayInfo/toAdd.do';
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
		 diag.URL = '<%=basePath%>trayInfo/toEdit.do?ID='+AP_ID;
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
			var url = "<%=basePath%>trayInfo/del.do?ID="+AP_ID+"&guid="+new Date().getTime();
			$.get(url,function(data){
				if("success" == data.result){
					top.jzts();
					nextPage(${page.currentPage});
				}else{
					top.hangge();
					alert("删除失败，请先删除已绑定的物料箱数据!"); 
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
	<form action="<%=basePath%>/trayInfo.do" method="post" name="userForm" id="userForm">
	<input name="PARENT_ID" id="PARENT_ID" type="hidden" value="${pd.AP_ID }" />
	<table>
		<tr>
			<td><font color="#808080">检索内容：</font></td>
			<td><input type="text" name="FuzzySearch" value="${pd.FuzzySearch }" placeholder="这里输入检索内容" style="width:130px;"/></td>	
			<td><font color="#808080">地点：</font></td>
			<td>
						<select id="Address" name="Address" style="width: 100%;">
	                        <option value="">请选择</option>
	                        <c:forEach items="${dataMap['Address']}" var="var" varStatus="vs">
							  
							  	<c:choose>
									<c:when test="${pd.Address eq var.key}">
										<option value='${var.key}' selected="selected" >${var.value}</option>
									</c:when>
									<c:otherwise>
										<option value="${var.key }">${var.value }</option>
									</c:otherwise>
								</c:choose>
							  </c:forEach>
	                        
	                        
			             </select>
			</td>
			<td><font color="#808080">托盘种类：</font></td>
			<td>
						<select id="TrayType" name="TrayType" style="width: 100%;">
	                        <option value="">请选择</option>
	                        <c:forEach items="${dataMap['TrayType']}" var="var" varStatus="vs">
							  
							  	<c:choose>
									<c:when test="${pd.TrayType eq var.key}">
										<option value='${var.key}' selected="selected" >${var.value}</option>
									</c:when>
									<c:otherwise>
										<option value="${var.key }">${var.value }</option>
									</c:otherwise>
								</c:choose>
							  </c:forEach>
			             </select>
			</td>	
			<td style="vertical-align:top;"><button class="btn btn-mini btn-light" onclick="search();"><i id="nav-search-icon" class="icon-search"></i></button></td>
			<td style="vertical-align:top;"><button class="btn btn-mini btn-light" onclick="reset();"> <i id="nav-search-icon" class="icon-refresh"></i></button></td>
		
		</tr>
	</table>
	<!-- 检索  -->

	<table id="table_report" class="table table-striped table-bordered table-hover">
		<thead>
		<tr>
			<th class="center">序号</th>
			<th class='center'>RFID1</th>
			<th class='center'>RFID2</th>
			<th class='center'>托盘编号</th>
			<th class='center'>托盘种类</th>
			<th class='center'>满载数量</th>
			<!-- <th class='center'>工厂号</th>
			<th class='center'>日期</th>
			<th class='center'>总成号</th> -->
			<th class='center'>地点</th>
			<th class='center'>托盘状态</th>
			<th class='center'>零件数</th>
			<th class='center'>操作</th>
		</tr>
		</thead>
		<c:choose>
			<c:when test="${not empty varList}">
				<c:forEach items="${varList}" var="var" varStatus="vs">
				<tr>
					<td class="center">${vs.index + 1 }</td>
					<td class='center'>${var.RFID}</td>				
					<td class='center'>${var.RFID2}</td>	
					<td class="center">${var.TrayName}</td>
					<td class="center">${var.TrayType}</td>
					<td class='center'>${var.FullNumber }</td>
					<%-- <td class="center">${var.PlantNumber}</td>
					<td class="center">${var.TrayDate}</td>
					<td class="center">${var.AssemblyNumber}</td> --%>
					<td class="center">${var.Address}</td>
					<td class="center">${var.State}</td>
					<td class="center"><a href="<%=basePath%>/partInfo.do?TrayId=${var.ID}" title="查看零件列表">${var.partSize}</a></td>
					<td style="width: 155px;">
					
						<a class='btn btn-mini btn-pink' title="日志"  href="<%=basePath%>/logInfo.do?trayId=${var.ID}" ><i class='icon-book'></i></a>
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

</body>
</html>