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
	
	//导出excel
	function toExcel(){
		var startTime = $("#startTime").val();
		var endTime = $("#endTime").val();
		window.location.href='<%=basePath%>tongJiInfo/excel.do?startTime='+startTime+'&endTime='+endTime;
	}
	
	
	
	function Search(PartName){
	   //$("#PartName").val(PartName);
	
	}
</script> 
</head>

<body>
<div id="page-content" class="clearfix">
<div class="row-fluid">
	
	<!-- 检索  -->
	<form action="<%=basePath%>/tongJiInfo/tongji2.do" method="post" name="userForm" id="userForm">
	
	
		<table >
				<tr>
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
					<td style="vertical-align:top;"><button class="btn btn-mini btn-light" onclick="search();" title="检索"><i id="nav-search-icon" class="icon-search"></i></button></td>
					<td style="vertical-align:top;"><a class="btn btn-mini btn-light" onclick="toExcel();" title="导出到EXCEL"><i id="nav-search-icon" class="icon-download-alt"></i></a></td>
				</tr>
			</table>
			<!-- 检索  -->
			
			<h3>下线统计</h3>
			<table  border="0"   style="width: 100%" >
			
			
			<tr>
			
				
				
						
						<td align="center" width="20%" > 
						<div class="span2" style="width: 100%; "  >
						
								<c:if test="${varXXGT == null }">
					               <table border="0" style="width: 100%"  >
					                  <tr>
					                     <td colspan="2">
					                     
					                     	 <a href="javascript:void(0)" class="btn btn-block btn-small btn-purple5"  ><h4>ZKG缸体</h4><h2>0</h2></a>
										 </td>
					                  </tr>
					                  <tr>
					                     <td width="50%" ><a href="javascript:void(0)" class="btn btn-block btn-small  disabled"><h4>1线</h4><h2>0</h2></a></td>
					                     <td width="50%" ><a href="javascript:void(0)" class="btn btn-block btn-small btn-grey disabled"><h4>3线</h4><h2>0</h2></a></td>
					                  </tr>
					               </table>
					             </c:if>
					             <c:if test="${varXXGT != null }">
					               <table border="0" style="width: 100%"  >
					                  <tr>
					                     <td colspan="2">
					                     
					                     	 <a href="javascript:void(0)" class="btn btn-block btn-small btn-purple5"  ><h4>ZKG缸体</h4><h2>${varXXGT.cou}</h2></a>
										 </td>
					                  </tr>
					                  <tr>
					                     <td width="50%" ><a href="javascript:void(0)" class="btn btn-block btn-small  disabled"><h4>1线</h4><h2>${varXXGT.EPA1}</h2></a></td>
					                     <td width="50%" ><a href="javascript:void(0)" class="btn btn-block btn-small btn-grey disabled"><h4>3线</h4><h2>${varXXGT.EPA3}</h2></a></td>
					                  </tr>
					               </table>
					             </c:if>
					    </div>
						</td>
					
						<td align="center" width="20%" > 
						<div class="span2" style="width: 100%; "  >
						
								<c:if test="${varXXGG == null }">
					               <table border="0" style="width: 100%"  >
					                  <tr>
					                     <td colspan="2">
					                     	 <a href="javascript:void(0)" class="btn btn-block btn-small btn-purple4"  ><h4>ZK缸盖</h4><h2>0</h2></a>
										 </td>
					                  </tr>
					                  <tr>
					                     <td width="50%" ><a href="javascript:void(0)" class="btn btn-block btn-small disabled "><h4>1线</h4><h2>0</h2></a></td>
					                     <td width="50%" ><a href="javascript:void(0)" class="btn btn-block btn-small btn-grey disabled"><h4>3线</h4><h2>0</h2></a></td>
					                  </tr>
					               </table>
					             </c:if>
					             
								<c:if test="${varXXGG != null }">
					               <table border="0" style="width: 100%"  >
					                  <tr>
					                     <td colspan="2">
					                     	 <a href="javascript:void(0)" class="btn btn-block btn-small btn-purple4"  ><h4>${varXXGG.PartName}</h4><h2>${varXXGG.cou}</h2></a>
										 </td>
					                  </tr>
					                  <tr>
					                     <td width="50%" ><a href="javascript:void(0)" class="btn btn-block btn-small disabled "><h4>1线</h4><h2>${varXXGG.EPA1}</h2></a></td>
					                     <td width="50%" ><a href="javascript:void(0)" class="btn btn-block btn-small btn-grey disabled"><h4>3线</h4><h2>${varXXGG.EPA3}</h2></a></td>
					                  </tr>
					               </table>
					             </c:if>
					    </div>
						</td>
						
						
						<td align="center" width="20%" > 
						<div class="span2" style="width: 100%; "  >
							<c:if test="${varXXQZ == null }">
					               <table border="0" style="width: 100%"  >
					                  <tr>
					                     <td colspan="3">
					                     	 <a href="javascript:void(0)" class="btn btn-block btn-small btn-purple3"  ><h4>KW曲轴</h4><h2>0</h2></a>
										 </td>
					                  </tr>
					                  <tr>
					                     <td width="33%" ><a href="javascript:void(0)" class="btn btn-block btn-small disabled "><h4>1线</h4><h2>0</h2></a></td>
					                     <td width="33%" ><a href="javascript:void(0)" class="btn btn-block btn-small btn-grey disabled"><h4>2线</h4><h2>0</h2></a></td>
					                     <td width="33%" ><a href="javascript:void(0)" class="btn btn-block btn-small btn-grey  disabled"><h4>3线</h4><h2>0</h2></a></td>
					                  </tr>
					               </table>
					           </c:if>
					           <c:if test="${varXXQZ != null }">
					               <table border="0" style="width: 100%"  >
					                  <tr>
					                     <td colspan="3">
					                     	 <a href="javascript:void(0)" class="btn btn-block btn-small btn-purple3"  ><h4>${varXXQZ.PartName}</h4><h2>${varXXQZ.cou}</h2></a>
										 </td>
					                  </tr>
					                  <tr>
					                     <td width="33%" ><a href="javascript:void(0)" class="btn btn-block btn-small disabled "><h4>1线</h4><h2>${varXXQZ.EPA1}</h2></a></td>
					                     <td width="33%" ><a href="javascript:void(0)" class="btn btn-block btn-small btn-grey disabled"><h4>2线</h4><h2>${varXXQZ.EPA2}</h2></a></td>
					                     <td width="33%" ><a href="javascript:void(0)" class="btn btn-block btn-small btn-grey  disabled"><h4>3线</h4><h2>${varXXQZ.EPA3}</h2></a></td>
					                  </tr>
					               </table>
					           </c:if>
					    </div>
						</td>
						
						<td align="center" width="20%" > 
						<div class="span2" style="width: 100%; "  >
						
						<c:if test="${varXXLG == null }">
					               <table border="0" style="width: 100%"  >
					                  <tr>
					                     <td colspan="2">
					                     	 <a href="javascript:void(0)" class="btn btn-block btn-small btn-purple2"  ><h4>PL连杆</h4><h2>0</h2></a>
										 </td>
					                  </tr>
					                  <tr>
					                     <td width="50%" ><a href="javascript:void(0)" class="btn btn-block btn-small disabled "><h4>1线</h4><h2>0</h2></a></td>
					                     <td width="50%" ><a href="javascript:void(0)" class="btn btn-block btn-small btn-grey disabled"><h4>3线</h4><h2>0</h2></a></td>
					                  </tr>
					               </table>
					         </c:if>
					         
						<c:if test="${varXXLG != null }">
					               <table border="0" style="width: 100%"  >
					                  <tr>
					                     <td colspan="2">
					                     	 <a href="javascript:void(0)" class="btn btn-block btn-small btn-purple2"  ><h4>${varXXLG.PartName}</h4><h2>${varXXLG.cou}</h2></a>
										 </td>
					                  </tr>
					                  <tr>
					                     <td width="50%" ><a href="javascript:void(0)" class="btn btn-block btn-small disabled "><h4>1线</h4><h2>${varXXLG.EPA1}</h2></a></td>
					                     <td width="50%" ><a href="javascript:void(0)" class="btn btn-block btn-small btn-grey disabled"><h4>3线</h4><h2>${varXXLG.EPA3}</h2></a></td>
					                  </tr>
					               </table>
					         </c:if>
					    </div>
						</td>
						
						
						<td align="center" width="20%" > 
						<div class="span2" style="width: 100%; "  >
						<c:if test="${varXXPHZ == null }">
					               <table border="0" style="width: 100%"  >
					                  <tr>
					                     <td colspan="1">
					                     	 <a href="javascript:void(0)" class="btn btn-block btn-small btn-purple1"  ><h4>AGW平衡轴</h4><h2>0</h2></a>
										 </td>
					                  </tr>
					                  <tr>
					                     <td><a href="javascript:void(0)" class="btn btn-block btn-small disabled  "><h4>1线</h4><h2>0</h2></a></td>
					                  </tr>
					               </table>
					             </c:if>
					             <c:if test="${varXXPHZ != null }">
					               <table border="0" style="width: 100%"  >
					                  <tr>
					                     <td colspan="1">
					                     	 <a href="javascript:void(0)" class="btn btn-block btn-small btn-purple1"  ><h4>${varXXPHZ.PartName}</h4><h2>${varXXPHZ.cou}</h2></a>
										 </td>
					                  </tr>
					                  <tr>
					                     <td><a href="javascript:void(0)" class="btn btn-block btn-small disabled  "><h4>1线</h4><h2>${varXXPHZ.EPA1}</h2></a></td>
					                  </tr>
					               </table>
					             </c:if>
					    </div>
						</td>
			</tr>
			
		</table>
				
			
		
		<h3>装配报交统计</h3>
	<table  border="0"   style="width: 100%" >
			
			<tr>
			
				
				
						<c:forEach items="${varListSX}" var="var" varStatus="vs">
						<td align="center" width="20%" > 
						<div class="span2" style="width: 100%; "  >
					               <table border="0" style="width: 100%"  >
					                  <tr>
					                     <td colspan="2">
					                       <c:if test="${fn:contains(var.PartName,'平衡轴')}">
					                     <a href="javascript:void(0)" class="btn btn-block btn-small btn-purple1 "  ><h4>${var.PartName}</h4><h2>${var.cou}</h2></a>
					                     </c:if>
										
					                     <c:if test="${fn:contains(var.PartName,'连杆')}">
					                     <a href="javascript:void(0)" class="btn btn-block btn-small btn-purple2"  ><h4>${var.PartName}</h4><h2>${var.cou}</h2></a>
					                     </c:if>
					                    <c:if test="${fn:contains(var.PartName,'曲轴')}">
					                     <a href="javascript:void(0)" class="btn btn-block btn-small btn-purple3"  ><h4>${var.PartName}</h4><h2>${var.cou}</h2></a>
					                     </c:if>
					                      <c:if test="${fn:contains(var.PartName,'缸盖')}">
					                     <a href="javascript:void(0)" class="btn btn-block btn-small btn-purple4 "  ><h4>${var.PartName}</h4><h2>${var.cou}</h2></a>
					                     </c:if>
					                      <c:if test="${fn:contains(var.PartName,'缸体')}">
					                     <a href="javascript:void(0)" class="btn btn-block btn-small btn-purple5"  ><h4>${var.PartName}</h4><h2>${var.cou}</h2></a>
					                     </c:if>
					                     </td>
					                  </tr>
					                  <tr>
					                     <td width="50%"><a href="javascript:void(0)"   class="btn btn-block btn-small disabled "><h4>1线</h4><h2>${var.EPA1}</h2></a></td>
					                     <td width="50%"><a href="javascript:void(0)"  class="btn btn-block btn-small btn-grey disabled"><h4>3线</h4><h2>${var.EPA3}</h2></a></td>
					                  </tr>
					               </table>
					             
					    </div>
						</td>
					    </c:forEach>
					
				
			</tr>
			</thead>
			
		</table>
		
	</form>
	
<c:if test="${DaySub eq 'True' }">
	
	<table id="table_report" class="table table-bordered table-hover"  >
			<thead>
				<th width="10%" style="text-align: center">类型</th>
				<th width="10%" style="text-align: center">时间段</th>
				<th width="10%" style="text-align: center">1线</th>
				<th width="10%" style="text-align: center">2线</th>
				<th width="10%" style="text-align: center">3线</th>
				<th width="10%" style="text-align: center">下线</th>
				<th width="10%" style="text-align: center">1线</th>
				<th width="10%" style="text-align: center">3线</th>
				<th width="10%" style="text-align: center">装配报交</th>
			
			</thead>
		
			
			<tr>
				<td rowspan="2"  style="vertical-align: middle;text-align: center">${varListDayTJGT.PartName}</td>
				<td style="text-align: center">04:30~16:30</td>
				<td style="text-align: center">${varListDayTJGT.S11}</td>
				<td>&nbsp;</td>
				<td style="text-align: center">${varListDayTJGT.S13}</td>
				<td style="text-align: center">${varListDayTJGT.S1}</td>
				<td style="text-align: center">${varListDayTJGT.S31}</td>
				<<td style="text-align: center">${varListDayTJGT.S33}</td>
				<td style="text-align: center">${varListDayTJGT.S3}</td>
			</tr>
			<tr>
				<td style="text-align: center">16:30~04:30</td>
				<td style="text-align: center">${varListDayTJGT.S21}</td>
				<td style="text-align: center">&nbsp;</td>
				<td style="text-align: center">${varListDayTJGT.S23}</td>
				<td style="text-align: center">${varListDayTJGT.S2}</td>
				<td style="text-align: center">${varListDayTJGT.S41}</td>
				<td style="text-align: center">${varListDayTJGT.S43}</td>
				<td style="text-align: center">${varListDayTJGT.S4}</td>
			</tr>
			<thead style="background: #f1f1f1 ">
				<th colspan="2"  style="text-align: center">合计</th>
				<th style="text-align: center">${varListDayTJGT.S11+varListDayTJGT.S21}</th>
				<th style="text-align: center">&nbsp;</th>
				<th style="text-align: center">${varListDayTJGT.S13+varListDayTJGT.S23}</th>
				<th style="text-align: center">${varListDayTJGT.S1+varListDayTJGT.S2}</th>
				<th style="text-align: center">${varListDayTJGT.S31+varListDayTJGT.S41}</th>
				<th style="text-align: center">${varListDayTJGT.S33+varListDayTJGT.S43}</th>
				<th style="text-align: center">${varListDayTJGT.S3+varListDayTJGT.S4}</th>
			</thead>
	
	
			
			<tr>
				<td rowspan="2" style="vertical-align: middle;text-align: center" >${varListDayTJGG.PartName}</td>
				<td style="text-align: center">04:30~16:30</td>
				<td style="text-align: center">${varListDayTJGG.S11}</td>
				<td style="text-align: center">&nbsp;</td>
				<td style="text-align: center">${varListDayTJGG.S13}</td>
				<td style="text-align: center">${varListDayTJGG.S1}</td>
				<td style="text-align: center">${varListDayTJGG.S31}</td>
				<td style="text-align: center">${varListDayTJGG.S33}</td>
				<td style="text-align: center">${varListDayTJGG.S3}</td>
			</tr>
			<tr>
				<td style="text-align: center">16:30~04:30</td>
				<td style="text-align: center">${varListDayTJGG.S21}</td>
				<td style="text-align: center">&nbsp;</td>
				<td style="text-align: center">${varListDayTJGG.S23}</td>
				<td style="text-align: center">${varListDayTJGG.S2}</td>
				<td style="text-align: center">${varListDayTJGG.S41}</td>
				<td style="text-align: center">${varListDayTJGG.S43}</td>
				<td style="text-align: center">${varListDayTJGG.S4}</td>
			</tr>
			<thead style="background: #f1f1f1 ">
				<th colspan="2"  style="text-align: center">合计</th>
				<th style="text-align: center">${varListDayTJGG.S11+varListDayTJGG.S21}</th>
				<th style="text-align: center">&nbsp;</th>
				<th style="text-align: center">${varListDayTJGG.S13+varListDayTJGG.S23}</th>
				<th style="text-align: center">${varListDayTJGG.S1+varListDayTJGG.S2}</th>
				<th style="text-align: center">${varListDayTJGG.S31+varListDayTJGG.S41}</th>
				<th style="text-align: center">${varListDayTJGG.S33+varListDayTJGG.S43}</th>
				<th style="text-align: center">${varListDayTJGG.S3+varListDayTJGG.S4}</th>
			</thead>
			
			
			<tr>
				<td rowspan="2" style="vertical-align: middle;text-align: center" >${varListDayTJQZ.PartName}</td>
				<td style="text-align: center">04:30~16:30</td>
				<td style="text-align: center">${varListDayTJQZ.S11}</td>
				<td style="text-align: center">${varListDayTJQZ.S12}</td>
				<td style="text-align: center">${varListDayTJQZ.S13}</td>
				<td style="text-align: center">${varListDayTJQZ.S1}</td>
				<td style="text-align: center">${varListDayTJQZ.S31}</td>
				<td style="text-align: center">${varListDayTJQZ.S33}</td>
				<td style="text-align: center">${varListDayTJQZ.S3}</td>
			</tr>
			<tr>
				<td style="text-align: center">16:30~04:30</td>
				<td style="text-align: center">${varListDayTJQZ.S21}</td>
				<td style="text-align: center">${varListDayTJQZ.S22}</td>
				<td style="text-align: center">${varListDayTJQZ.S23}</td>
				<td style="text-align: center">${varListDayTJQZ.S2}</td>
				<td style="text-align: center">${varListDayTJQZ.S41}</td>
				<td style="text-align: center">${varListDayTJQZ.S43}</td>
				<td style="text-align: center">${varListDayTJQZ.S4}</td>
			</tr>
			<thead style="background: #f1f1f1 ">
				<th colspan="2"  style="text-align: center">合计</th>
				<th style="text-align: center">${varListDayTJQZ.S11+varListDayTJQZ.S21}</th>
				<th style="text-align: center">${varListDayTJQZ.S12+varListDayTJQZ.S22}</th>
				<th style="text-align: center">${varListDayTJQZ.S13+varListDayTJQZ.S23}</th>
				<th style="text-align: center">${varListDayTJQZ.S1+varListDayTJQZ.S2}</th>
				<th style="text-align: center">${varListDayTJQZ.S31+varListDayTJQZ.S41}</th>
				<th style="text-align: center">${varListDayTJQZ.S33+varListDayTJQZ.S43}</th>
				<th style="text-align: center">${varListDayTJQZ.S3+varListDayTJQZ.S4}</th>
			</thead>
			
			<tr>
				<td rowspan="2"  style="vertical-align: middle;text-align: center">${varListDayTJLG.PartName}</td>
				<td style="text-align: center">04:30~16:30</td>
				<td style="text-align: center">${varListDayTJLG.S11}</td>
				<td style="text-align: center">&nbsp;</td>
				<td style="text-align: center">${varListDayTJLG.S13}</td>
				<td style="text-align: center">${varListDayTJLG.S1}</td>
				<td style="text-align: center">${varListDayTJLG.S31}</td>
				<td style="text-align: center">${varListDayTJLG.S33}</td>
				<td style="text-align: center">${varListDayTJLG.S3}</td>
			</tr>
			<tr>
				<td style="text-align: center">16:30~04:30</td>
				<td style="text-align: center">${varListDayTJLG.S21}</td>
				<td style="text-align: center">&nbsp;</td>
				<td style="text-align: center">${varListDayTJLG.S23}</td>
				<td style="text-align: center">${varListDayTJLG.S2}</td>
				<td style="text-align: center">${varListDayTJLG.S41}</td>
				<td style="text-align: center">${varListDayTJLG.S43}</td>
				<td style="text-align: center">${varListDayTJLG.S4}</td>
			</tr>
			<thead style="background: #f1f1f1 ">
				<th colspan="2"  style="text-align: center">合计</th>
				<th style="text-align: center">${varListDayTJLG.S11+varListDayTJLG.S21}</th>
				<th style="text-align: center">&nbsp;</th>
				<th style="text-align: center">${varListDayTJLG.S13+varListDayTJLG.S23}</th>
				<th style="text-align: center">${varListDayTJLG.S1+varListDayTJLG.S2}</th>
				<th style="text-align: center">${varListDayTJLG.S31+varListDayTJLG.S41}</th>
				<th style="text-align: center">${varListDayTJLG.S33+varListDayTJLG.S43}</th>
				<th style="text-align: center">${varListDayTJLG.S3+varListDayTJLG.S4}</th>
			</thead>
			
			
			
			<tr>
				<td rowspan="2"  style="vertical-align: middle;text-align: center">${varListDayTJPHZ.PartName}</td>
				<td style="text-align: center">04:30~16:30</td>
				<td style="text-align: center">${varListDayTJPHZ.S11}</td>
				<td style="text-align: center">&nbsp;</td>
				<td style="text-align: center">${varListDayTJPHZ.S13}</td>
				<td style="text-align: center">${varListDayTJPHZ.S1}</td>
				<td style="text-align: center">${varListDayTJPHZ.S31}</td>
				<td style="text-align: center">${varListDayTJPHZ.S33}</td>
				<td style="text-align: center">${varListDayTJPHZ.S3}</td>
			</tr>
			<tr>
				<td style="text-align: center">16:30~04:30</td>
				<td style="text-align: center">${varListDayTJPHZ.S21}</td>
				<td style="text-align: center">&nbsp;</td>
				<td style="text-align: center">${varListDayTJPHZ.S23}</td>
				<td style="text-align: center">${varListDayTJPHZ.S2}</td>
				<td style="text-align: center">${varListDayTJPHZ.S41}</td>
				<td style="text-align: center">${varListDayTJPHZ.S43}</td>
				<td style="text-align: center">${varListDayTJPHZ.S4}</td>
			</tr>
			<thead style="background: #f1f1f1 " >
				<th colspan="2"  style="text-align: center" >合计</th>
				<th style="text-align: center">${varListDayTJPHZ.S11+varListDayTJPHZ.S21}</th>
				<th style="text-align: center">&nbsp;</th>
				<th style="text-align: center">${varListDayTJPHZ.S13+varListDayTJPHZ.S23}</th>
				<th style="text-align: center">${varListDayTJPHZ.S1+varListDayTJPHZ.S2}</th>
				<th style="text-align: center">${varListDayTJPHZ.S31+varListDayTJPHZ.S41}</th>
				<th style="text-align: center">${varListDayTJPHZ.S33+varListDayTJPHZ.S43}</th>
				<th style="text-align: center">${varListDayTJPHZ.S3+varListDayTJPHZ.S4}</th>
			</thead>
			
			
			
	
	</table>
	</c:if>
</div>
</div>

</body>

<script type="text/javascript">


	$(function() {

		$('#startTime').datepicker();
		$('#endTime').datepicker();
		
	});
</script>
</html>