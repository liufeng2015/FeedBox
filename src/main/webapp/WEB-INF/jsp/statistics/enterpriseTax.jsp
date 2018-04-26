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
		
<script type="text/javascript">
	
	$(top.hangge());
	
	//新增
	function add(){
	
	alert(document.body.clientWidth);
		 top.jzts();
		 var diag = new top.Dialog();
		 diag.Drag=true;
		 diag.Title ="新增";
		 diag.URL = '<%=basePath%>enterprise/toAdd.do';
		 diag.Width = document.body.clientWidth;
		 diag.Height = 600;
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
	function edit(E_ID){
		 top.jzts();
	   	 var diag = new top.Dialog();
		 diag.Drag=true;
		 diag.Title ="编辑";
		 diag.URL = '<%=basePath%>enterprise/toEdit.do?E_ID='+E_ID;
		 diag.Width = document.body.clientWidth;
		 diag.Height = 600;
		 diag.CancelEvent = function(){ //关闭事件
			 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
				 nextPage(${page.currentPage});
			}
			 diag.close();
		 };
		 diag.show();
	}
	
	

	
	//删除
	function del(E_ID){
		var flag = false;
		if(confirm("确定要删除该数据吗?")){
			flag = true;
		}
		if(flag){
			top.jzts();
			var url = "<%=basePath%>enterprise/del.do?E_ID="+E_ID+"&guid="+new Date().getTime();
			$.get(url,function(data){
				if("success" == data.result){
					top.jzts();
					nextPage(${page.currentPage});
				}else{
					top.hangge();
					alert("删除失败，请先删除其下级数据!"); 
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
	<form action="<%=basePath%>/statistics/enterpriseTax.do" method="post" name="userForm" id="userForm">
	
	
	<!-- 检索  -->

	<table id="table_report" class="table table-striped table-bordered table-hover">
		<thead>
		<tr>
			<th class="center">序号</th>
			<th class='center'>企业名称</th>
			<th class='center'>法人代表</th>
			<th class='center'>成立时间</th>
			<th class='center'>税收</th>
		</tr>
		</thead>
		<c:choose>
			<c:when test="${not empty varList}">
				<c:forEach items="${varList}" var="var" varStatus="vs">
				<tr>
				<td class="center">${vs.index + 1 }</td>
				
				<td class="center">${var.Name}</td>
				<td class="center">${var.LegalRepresentative}</td>
				<td class='center'><fmt:formatDate value="${var.EstablishmentTime}" pattern="yyyy-MM-dd" /></td>
				<td class="center">${var.TaxRevenue}</td>
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
				
				<td style="vertical-align:top;"><div class="pagination" style="float: right;padding-top: 0px;margin-top: 0px;">${page.pageStr}</div></td>
			</tr>
		</table>
		</div>
	
	
	</form>
</div>
</div>

</body>
</html>