<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
		<!-- basic styles -->
        <link href="static/css/bootstrap.min.css" rel="stylesheet" />
        <link href="static/css/bootstrap-responsive.min.css" rel="stylesheet" />
        <link rel="stylesheet" href="static/css/font-awesome.min.css" />
 
 
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
	
	function Search(TrayType){
		$("#TrayType").val(TrayType);
		$("#EP").val("");
		$("#userForm").submit();
	}
	function Search(TrayType,EP){
		$("#TrayType").val(TrayType);
		$("#EP").val(EP);
		$("#userForm").submit();
	}
</script> 
</head>

<body>
<div id="page-content" class="clearfix">
<div class="row-fluid">
	
	<!-- 检索  -->
	<form action="<%=basePath%>/tongJiInfo.do" method="post" name="userForm" id="userForm">
	<input type="hidden" name="TrayType" id="TrayType" value="${pd.TrayType }"/>
	<input type="hidden" name="EP" id="EP" value="${pd.EP }"/>
	<!-- 检索  -->
	<table  border="0"   style="width: 100%" >
			
			<tr>
			
				
				
						
						<c:forEach items="${varList}" var="var" varStatus="vs">
						<td align="center" width="20%" > 
						<div class="span2" style="width: 100%;"  >
					               <table border="0" style="width: 100%"  >
					                  <tr>
					                     <td colspan="2" >
					                     
					                     
					                      <c:if test="${fn:contains(var.TrayType,'平衡轴')}">
					                     <a href="javascript:void(0)" 
					                     <c:if test="${fn:contains(pd.TrayType,'平衡轴')}">
					                     	style="border-bottom: 5px solid #588c1f;"
					                     </c:if> 
					                     class="btn btn-block btn-small btn-purple1"  onclick="Search('${var.TrayType}')"><h4>${var.TrayType}</h4><h2>${var.cou}</h2></a>
					                     </c:if>
					                   
					                     
					                   
					                     
					                       <c:if test="${fn:contains(var.TrayType,'连杆')}">
					                     <a href="javascript:void(0)" 
					                     <c:if test="${fn:contains(pd.TrayType,'连杆')}">
					                     	style="border-bottom: 5px solid #588c1f;"
					                     </c:if>
					                     class="btn btn-block btn-small btn-purple2"  onclick="Search('${var.TrayType}')"><h4>${var.TrayType}</h4><h2>${var.cou}</h2></a>
					                     </c:if>
					                     
					                       
										<c:if test="${fn:contains(var.TrayType,'曲轴')}">
					                     <a href="javascript:void(0)" 
					                     <c:if test="${fn:contains(pd.TrayType,'曲轴')}">
					                     	style="border-bottom: 5px solid #588c1f;"
					                     </c:if>
					                      class="btn btn-block btn-small btn-purple3"  onclick="Search('${var.TrayType}')"><h4>${var.TrayType}</h4><h2>${var.cou}</h2></a>
					                     </c:if>
					                      <c:if test="${fn:contains(var.TrayType,'缸盖')}">
					                     <a href="javascript:void(0)" 
					                     <c:if test="${fn:contains(pd.TrayType,'缸盖')}">
					                     	style="border-bottom: 5px solid #588c1f;"
					                     </c:if>
					                     class="btn btn-block btn-small btn-purple4 "    onclick="Search('${var.TrayType}')"><h4>${var.TrayType}</h4><h2>${var.cou}</h2></a>
					                     </c:if>
					                     
					                      <c:if test="${fn:contains(var.TrayType,'缸体')}">
					                     <a href="javascript:void(0)" 
					                     <c:if test="${fn:contains(pd.TrayType,'缸体')}">
					                     	style="border-bottom: 5px solid #588c1f;" 
					                     </c:if>
					                     class="btn btn-block btn-small btn-purple5"  onclick="Search('${var.TrayType}')"><h4>${var.TrayType}</h4><h2>${var.cou}</h2></a>
					                     </c:if>
					                     </td>
					                  </tr>
					                  <tr>
					                     <td><a href="javascript:void(0)"  
					                     <c:if test="${fn:contains(pd.EP,'EPA1')&& fn:contains(pd.TrayType,var.TrayType)}">
					                     	style="border-bottom: 5px solid #588c1f;"
					                     </c:if>
					                     onclick="Search('${var.TrayType}','EPA1')" class="btn btn-block btn-small  "><h4>EPA1</h4><h2>${var.EPA1}</h2></a></td>
					                     
					                     <td><a href="javascript:void(0)" 
					                     <c:if test="${fn:contains(pd.EP,'EPA3')&& fn:contains(pd.TrayType,var.TrayType)}">
					                     	style="border-bottom: 5px solid #588c1f;"
					                     </c:if>
					                      onclick="Search('${var.TrayType}','EPA3')"class="btn btn-block btn-small btn-grey "><h4>EPA3</h4><h2>${var.EPA3}</h2></a></td>
					                  </tr>
					               </table>
					             
					    </div>
					    </td>
					    </c:forEach>
						
					
				
			</tr>
			
		</table>
	
	<HR style="FILTER: alpha(opacity=100,finishopacity=0,style=3)" width="100%" color=#987cb9 SIZE=3>
	
		<table id="table_report" class="table  table-bordered table-hover"  >
			<thead>
			
			<tr >
				<th  width="20%" ></th>
				<th  width="20%" style="text-align: center">满箱</th>
				<th  width="20%" style="text-align: center">待清洗</th>
				<th  width="20%" style="text-align: center" >空箱</th>
				<th  width="20%" style="text-align: center">合计</th>
			</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${not empty listTable}">
					<c:set var="en" value="0" />
					<c:set var="fn" value="0" />
					<c:set var="cn" value="0" />
						<c:forEach items="${listTable}" var="var" varStatus="vs">
							<c:set var="fn" value="${fn+var.FullNum }" />
							
							<c:set var="en" value="${en+var.EmptyNum }" />
							<c:set var="cn" value="${cn+var.CleanNum }" />
							
							
							<tr>
								<td style="text-align: center"><h5>${var.Address}</h5></td>
								<td style="text-align: center"><h5>${var.FullNum}</h5></td>
								<td style="text-align: center"><h5>${var.CleanNum}</h5></td>
								<td style="text-align: center"><h5>${var.EmptyNum}</h5></td>
								<td style="text-align: center"><h4>${var.EmptyNum+var.FullNum+var.CleanNum}<h4></td>
							</tr>
						</c:forEach>
						<tr>
							<td></td>
							<td style="text-align: center"><h2 style="color: green" >${fn}</h2></td>
							<td style="text-align: center"><h2 style="color: #ffbf3c" >${cn}</h2></td>
							<td style="text-align: center"><h2 style="color: red" >${en}</h2></td>
							<td style="text-align: center"></td>
						</tr>
					</c:when>
					<c:otherwise>
						<tr>
						<td colspan="100" class="center">没有相关数据</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>	
	</form>
</div>
</div>

</body>
</html>