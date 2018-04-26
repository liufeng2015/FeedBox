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
<script type="text/javascript">
	
	$(top.hangge());
	
	//新增
	function add(){
		 top.jzts();
		 var diag = new top.Dialog();
		 diag.Drag=true;
		 diag.Title ="新增";
		 diag.URL = '<%=basePath%>notice/toAdd.do?';
		 diag.Width = 500;
		 diag.Height = 350;
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
	function edit(id){
		 top.jzts();
	   	 var diag = new top.Dialog();
		 diag.Drag=true;
		 diag.Title ="编辑";
		 diag.URL = '<%=basePath%>notice/toEdit.do?id='+id;
		 diag.Width = 500;
		 diag.Height = 350;
		 diag.CancelEvent = function(){ //关闭事件
			 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
				 nextPage(${page.currentPage});
			}
			 diag.close();
		 };
		 diag.show();
	}
	
	//查看内容
	function look(id){
		 top.jzts();
	   	 var diag = new top.Dialog();
		 diag.Drag=true;
		 diag.Title ="查看内容";
		 diag.URL = '<%=basePath%>notice/toView.do?id='+id;
		 diag.Width = 500;
		 diag.Height = 350;
		 diag.CancelEvent = function(){ //关闭事件
			 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
				 nextPage(${page.currentPage});
			}
			 diag.close();
		 };
		 diag.show();
	}
	
	//删除
	function del(id){
		var flag = false;
		if(confirm("确定要删除该数据吗?")){
			flag = true;
		}
		if(flag){
			top.jzts();
			var url = '<%=basePath%>notice/del.do?id='+id;
			$.get(url,function(data){
					top.jzts();
					nextPage(${page.currentPage});
			});
		}
	}
	
	function search(){
		$("#userForm").submit();
	}
	
    function reset(){
    	$("#title").val()=="";
    }
</script>
</head>

<body>
<div id="page-content" class="clearfix">
<div class="row-fluid">
	
	<!-- 检索  -->
	<form action="<%=basePath%>/notice/noticeList.do" method="post" name="userForm" id="userForm">
	 <table>
		<tr>
			<th>标题：</th>
			<td><input type="text" name="title" id="title" value="${pd.title }" placeholder="这里输入标题" style="width:130px;"/></td>
			<td style="vertical-align:top;"><button class="btn btn-mini btn-light" onclick="search();" title="查询"><i id="nav-search-icon" class="icon-search"></i></button></td>
		    <!-- <td style="vertical-align:top;">&nbsp;&nbsp;&nbsp;<button class="btn btn-mini btn-light" title="重置" onclick="reset();"> <i id="nav-search-icon" class="icon-refresh"></i></button></td>  -->
		</tr>
	</table>
	<!-- 检索  -->

	<table id="table_report" class="table table-striped table-bordered table-hover">
		<thead>
		<tr>
			<th class="center">序号</th>
			<th class='center'>标题</th>
			<th class='center'>发布人</th>
			<th class='center'>发布时间</th>
			<th class='center'>状态</th>
			<th class='center'>附件</th>
			<th class='center'>操作</th>
		</tr>
		</thead>
		<c:choose>
			<c:when test="${not empty varList}">
				<c:forEach items="${varList}" var="var" varStatus="vs">
				<tr>
				<th class="center">${vs.index+1 }</th>
			    <th class='center'>
			      <a onclick="look('${var.id }')" title="查看内容"><i class="icon-arrow-right  icon-on-right"></i>&nbsp;${var.title }</a>
			     </th>
			    <th class='center'>${var.author }</th>
			    <th class='center'>${var.publishTime }</th>
			    <th class='center'>
			       <c:if test="${var.isInvalid eq 1}">
				              草稿
				   </c:if>
				   <c:if test="${var.isInvalid eq 2}">
				              发布
				   </c:if>
			    </th>
			    <th class="center" style="width: 32px;">${var.fileName}
					<c:if test="${var.filenamepath != null && var.filenamepath != '' && var.filenamepath!= 'null' }">
						<a class="btn btn-mini  icon-cloud-download" title="下载" href="<%=basePath%>uploadFiles/file/${var.filenamepath}" target="_blank"></a>
					</c:if>
				</th>
				<th style="width: 68px;" class="center">
				  <c:if test="${var.isInvalid ne 2}">
				      <a class='btn btn-mini btn-info' title="编辑" onclick="edit('${var.id }')" ><i class='icon-edit'></i></a>
				  </c:if>
				  <a class='btn btn-mini btn-danger' title="删除"  onclick="del('${var.id }')"><i class='icon-trash'></i></a>
				</tr>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<tr>
				<th colspan="100" class="center">没有相关数据</th>
				</tr>
			</c:otherwise>
		</c:choose>
	</table>
	
		<div class="page-header position-relative">
		<table style="width:100%;">
			<tr>
				<td style="vertical-align:top;width:50px;"><a class="btn btn-small btn-success" onclick="add();">新增</a></td>
				<td style="vertical-align:top;"><div class="pagination" style="float: right;padding-top: 0px;margin-top: 0px;">${page.pageStr}</div></td>
			</tr>
		</table>
		</div>
	
	</form>
</div>
</div>

</body>
</html>