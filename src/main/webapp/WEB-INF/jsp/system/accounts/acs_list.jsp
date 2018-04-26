<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
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
		
		//新增
		function add(){
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="新增";
			 diag.URL = '<%=basePath%>accountsController/toAdd.do';
			 diag.Width = 500;
			 diag.Height = 400;
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
		//编辑
		function edit(id){
			top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="编辑";
			 diag.URL = '<%=basePath%>accountsController/toEdit.do?acsId='+id;
			 diag.Width = 500;
			 diag.Height = 400;
			 diag.CancelEvent = function(){ //关闭事件
				 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
					 if('${page.currentPage}' == '0'){
						 top.jzts();
						 setTimeout("self.location=self.location",100);
					 }else{
						 nextPage(${page.currentPage});
					 }
				}
				diag.close();
			 };
			 diag.show();
		}
		
		
		
		//删除
		function del(id){
			bootbox.confirm("确定要删除?", function(result) {
				if(result) {
					var url = "<%=basePath%>accountsController/remove.do?acsId="+id;
					$.get(url,function(data){
						top.jzts();
						nextPage(${page.currentPage});
					});
				}
			});
		}
		
</script>
</head>

<body>
<div id="page-content" class="clearfix">
<div class="row-fluid">
	<div id="zhongxin">
	<form action="<%=basePath%>/accountsController/accountsList.do" method="post" name="userForm" id="userForm">

       <table id="table_report" class="table table-striped table-bordered table-hover">
					<thead>
					<tr>
						<th class="center">序号</th>
						<th class='center'>公众号名称</th>
						<th class='center'>应用Id</th>
						<th class='center'>密钥</th>
						<th class='center'>承办单位</th>
						<th class='center'>状态</th>
					</tr>
					</thead>
					
					<c:set var="nowDate" value="<%=System.currentTimeMillis()%>"></c:set>
					
					<c:choose>
						<c:when test="${not empty varList}">
							<c:forEach items="${varList}" var="var" varStatus="vs">
							<tr>
							   <td class="center">${vs.index + 1 }</td>
							   <td class="center">${var.acsName}</td>
							   <td class="center">${var.App_Id}</td>
							   <td class="center">${var.App_secret}</td>
							   <td class="center">${var.organizer}</td>
							   <td class="center">
							             <c:if test="${var.status==0}">启用</c:if>
							             <c:if test="${var.status==1}">禁用</c:if>
							   </td>
							   <td style="width: 68px;">
					             <a class='btn btn-mini btn-info' title="编辑" onclick="edit('${var.acsId}')" ><i class='icon-edit'></i></a>
					             <a class='btn btn-mini btn-danger' title="删除" onclick="del('${var.acsId }')"><i class='icon-trash'></i></a>
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
			    <td style="vertical-align:top;" class="left"><a class="btn btn-small btn-success" onclick="add('${pd.AP_ID }');">新增</a></td>
				<td style="vertical-align:top;"><div class="pagination" style="float: right;padding-top: 0px;margin-top: 0px;">${page.pageStr}</div></td>
			</tr>
		</table>
		</div>
	</form>
	</div>
</div>

</div>

</body>
</html>