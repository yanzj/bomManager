<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />

	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/hui/H-ui.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/hui/H-ui.admin.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/hui/iconfont.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/hui/skin/default/skin.css" id="skin" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/hui/style.css" />
	<!-- _footer 作为公共模版分离出去 -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script> 
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/hui/layer/2.4/layer.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/hui/H-ui.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/hui/H-ui.admin.js"></script>
<!-- /_footer 作为公共模版分离出去 -->
<title>Insert title here</title>
</head>
	<body>
		<nav class="breadcrumb">
			<i class="Hui-iconfont">&#xe667;</i> 
			首页
			<span class="c-gray en">&gt;</span>
			订单管理
		</nav>
		<div class="page-container">
		<div class="text-c">
		<form class="Huiform" method="post" action="order-toManager" target="_self">
			
		<input type="text" class="input-text" style="width:250px" placeholder="输入订单号" id="" name="entity.orderNumber" value="${entity.orderNumber}">
		<button type="submit" class="btn btn-success radius" id="" name=""><i class="Hui-iconfont">&#xe665;</i> 搜索订单信息</button>
		</form>
		</div>
		<div class="cl pd-5 bg-1 bk-gray mt-20">
		 <strong class="l">管理列表</strong> <span class="r">共有数据：<strong>${request.sum}</strong> 条</span> 
		</div>
		<table class="table table-border table-bordered table-bg">
			<thead>
				<tr class="text-c">
					<th width="250">订单编号</th>
					<th width="100">订单分类</th>
					<th width="100">项目名称</th>
					<th width="100">类型</th>
					<th width="100">数量</th>
					<th width="100">材料</th>
					<th width="100">需求日期</th>
					<th width="200">联系人</th>
					<!-- <th width="200">联系电话</th> -->
					<!-- <th width="100">联系地址</th> -->
					<th width="100">报价</th>
					<th width="100">订单状态</th>
					<th width="100">交货日期</th>
					<th width="100">操作</th>
				</tr>
			</thead>
			<tbody>
				<s:iterator value="#request.OrderList">
					<tr class="text-c">
						<td>${orderNumber}</td>
						<td>${orderMode}</td>
						<td>${orderName}</td>
						<td>${orderType}</td>
						<td>${orderQty}</td>
						<td>${orderMaterial}</td>
						<td><s:date name="reqDate" format="yyyy-MM-dd"/></td>
						<%-- <td>${contact}</td> --%>
						<td>${cellPhone}</td>
						<%-- <td>${address}</td> --%>
						<td>${orderPrice}</td>
						<td>${orderStatus}</td>
						<td><s:date name="deliveryTime" format="yyyy-MM-dd"/></td>
							<td class="td-manage">
							<a title="详情" href="javascript:;" onclick="admin_detail('详情','order-toDetai.action?entity.orderNumber=${orderNumber}','800','500')" class="ml-5" style="text-decoration:none">
								<!-- <i class="Hui-iconfont">&#xe715;</i> -->
								<span class="btn size-MINI btn-secondary radius"> 详情 </span>
							</a>
							<s:if test="orderStatus.equals('已报价') ">
								<a title="确认订单" href="javascript:;" onclick="confirm(this,'${orderNumber}')" class="ml-5" style="text-decoration:none">
 									<!-- <i class="Hui-iconfont">&#xe6e1;</i> -->
 									 <span class="btn size-MINI btn-secondary radius">确认订单</span>
								</a>
							</s:if>
							<s:if test="#session.currentUser.u_Level >2 ">
								<a title="编辑" href="javascript:;" onclick="admin_edit('编辑','order-toEdit.action?entity.orderNumber=${orderNumber}','800','500')" class="ml-5" style="text-decoration:none">
									  <!-- <i class="Hui-iconfont">&#xe6df;</i> -->
									   <span class="btn size-MINI btn-secondary radius">编辑</span>
								</a>
								<s:if test="orderStatus.equals('已确认') ">
									<a title="完成订单" href="javascript:;" onclick="admin_detail('完成订单','order-toComplete.action?entity.orderNumber=${orderNumber}','800','500')" class="ml-5" style="text-decoration:none">
										<!-- <i class="Hui-iconfont">&#xe637;</i> -->
										 <span class="btn size-MINI btn-secondary radius">完成订单</span>
									</a>
								</s:if>
							</s:if>
							<s:if test="!orderStatus.equals('已完成') ">
								<a title="删除" href="javascript:;" onclick="admin_del(this,'${orderNumber}')" class="ml-5" style="text-decoration:none">
								 <!-- 	<i class="Hui-iconfont">&#xe6e2;</i> -->
								 <span class="btn size-MINI btn-danger radius"> 删除</span>
								</a>
							</s:if>
						</td>
					</tr>
				</s:iterator>
			</tbody>
		</table>
		<center>
        <font size="4">当前第<font color="red"><s:property value="pageBean.currentPage"/></font>页</font>&nbsp;&nbsp;
        <font size="4">共<font color="red"><s:property value="pageBean.totalPages"/></font>页 </font>
        <s:if test="pageBean.currentPage == 1">
            首页&nbsp;&nbsp;&nbsp;上一页
        </s:if>
        <s:else>
            <a href="inventory-list">首页</a>
            &nbsp;&nbsp;&nbsp;
        	<a href="javascript:void(0)" onclick="formSubmit(<s:property value="pageBean.currentPage  - 1"/>)">上一页</a>
        </s:else>
        <s:if test="pageBean.currentPage != pageBean.totalPages && pageBean.totalPages != 0">
        <a href="javascript:void(0)" onclick="formSubmit(<s:property value="pageBean.currentPage  + 1"/>)">下一页</a>
            &nbsp;&nbsp;&nbsp;
            <a href="javascript:void(0)" onclick="formSubmit(<s:property value="pageBean.totalPages"/>)">尾页</a>
        </s:if>
        <s:else>
            下一页&nbsp;&nbsp;&nbsp;尾页
        </s:else>
	</div>
		<form  id="fenyeForm"  method="post" action="order-toManager" target="_self">
			<input type="hidden" name="pageBean.currentPage" id="currentPage">
			<s:hidden name="entity.orderNumber"></s:hidden>
		</form>

	<!--请在下方写此页面业务相关的脚本-->
	<script type="text/javascript" src="js/hui/jquery.dataTables.min.js"></script> 
	<script type="text/javascript" src="js/hui/laypage/1.2/laypage.js"></script>
	<script type="text/javascript" src="js/jquery.form.js"></script>
	<script type="text/javascript">
	/*
		参数解释：
		title	标题
		url		请求的url
		id		需要操作的数据id
		w		弹出层宽度（缺省调默认值）
		h		弹出层高度（缺省调默认值）
	*/
	/*管理员-增加*/
	function admin_edit(title,url,w,h){
		layer_show(title,url,w,h);
	}
	function admin_detail(title,url,w,h){
		layer_show(title,url,w,h);
	}
	
	/* 分页表单提交 */
	function formSubmit(currentPage){
		$("#currentPage").val(currentPage);
		$("#fenyeForm").submit();
	}
	function confirm(obj,id){
		layer.confirm('确认要确认订单吗？',function(index){
			$.ajax({
				type: 'POST',
				url: 'order-doConfirm',
				data:{
					"entity.orderNumber":id,
				},
				dataType: 'text',
				success: function(data){
					if (data == "1") {
						layer.msg('已确认!',{icon:1,time:1000});
						setTimeout(function(){
							location.reload();
						},1000);
					}
				},
				error:function(data) {
					console.log(data.msg);
				},
			});		
		});
	}
	function admin_del(obj,orderNumber){
		layer.confirm('确认要删除吗？',function(index){
			$.ajax({
				type: 'POST',
				url: 'order-delete',
				dataType: 'text',
				data:{
					'entity.orderNumber':orderNumber,
				},
				success: function(data){
					if (data == "1") {
						layer.msg('已删除!',{icon:1,time:1000});
						setTimeout(function(){
							location.reload();
						},1000);
					}
				},
				error:function(data) {
					console.log(data.msg);
				},
			});		
		});
	}
	</script>
</body>
</html>