<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/hui/H-ui.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/hui/H-ui.admin.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/hui/iconfont.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/hui/skin/default/skin.css" id="skin" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/hui/style.css" />
</head>
<body>
<article class="page-container">
	<form class="form form-horizontal" id="form-user-add">
		<div class="row cl">
		<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>料号：</label>
		<div class="formControls col-xs-8 col-sm-9">	
			<s:hidden name="entity.id.partnumber"></s:hidden>
			<label class="form-label " >${entity.id.partnumber}</label>
		</div>
	</div>
			
	<div class="row cl">
		<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>名称：</label>
		<div class="formControls col-xs-8 col-sm-9">
			<s:hidden name="entity.partName"></s:hidden>
			<label class="form-label " >${entity.partName}</label>
		</div>
	</div>
	<div class="row cl">
		<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>版本：</label>
		<div class="formControls col-xs-8 col-sm-9">
			<s:hidden name="entity.id.partRev"></s:hidden>
			<label class="form-label " >${entity.id.partRev}</label>
		</div>
	</div>
	<div class="row cl">
		<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>供应商名称：</label>
		<div class="formControls col-xs-8 col-sm-9">
			<s:hidden name="entity.id.supplierName"></s:hidden>
			<label class="form-label " >${entity.id.supplierName}</label>
		</div>
	</div>
		<div class="row cl">
		  <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>供应商代码：</label>
		<div class="formControls col-xs-8 col-sm-9">
			<input type="text" class="input-text"  value="${entity.supplierCode}"  placeholder="" id="supplierCode" name="entity.supplierCode">
		</div>
	</div>
	<div class="row cl">
		<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>材料规格：</label>
		<div class="formControls col-xs-8 col-sm-9">
			<input type="text" class="input-text"  placeholder="" id="partSpec" name="entity.partSpec"  value="${entity.partSpec}">
		</div>
	</div>
	<div class="row cl">
		<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>执行标准：</label>
		<div class="formControls col-xs-8 col-sm-9">
			<input type="text" class="input-text"  placeholder="" id="partStandard" name="entity.partStandard" value="${entity.partStandard}">
		</div>
	</div>
	<div class="row cl">
		<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>单位：</label>
		<div class="formControls col-xs-8 col-sm-9">
			<input type="text" class="input-text"  placeholder="" id="partUnit" name="entity.partUnit"  value="${entity.partUnit}">
		</div>
	</div>
	<div class="row cl">
		<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>单价：</label>
		<div class="formControls col-xs-8 col-sm-9">
			<input type="text" class="input-text"  placeholder="" id="partPrice" name="entity.partPrice"  value="${entity.partPrice}">
		</div>
	</div>
	<s:if test="entity.partActive =='N'.toString()">
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>是否有效：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<span class="select-box">
					<select class="select"  name="entity.partActive" id="partActive">
						<option value="Y" 	<s:if test="entity.partActive =='Y'.toString()">selected</s:if> >有效</option>
						<option value="N" <s:if test="entity.partActive =='N'.toString()">selected</s:if> >无效</option>
					</select>
				</span>
			</div>
		</div>
	</s:if>
	<s:else>
		<s:hidden name="entity.partActive"></s:hidden>
	</s:else>
	<div class="row cl">
		<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
			<input class="btn btn-primary radius" type="submit" value="&nbsp;&nbsp;提交&nbsp;&nbsp;" >
		</div>
	</div>
	</form>
</article>
</body>
	<!-- _footer 作为公共模版分离出去 -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script> 
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/hui/layer/2.4/layer.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/hui/H-ui.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/hui/H-ui.admin.js"></script>
<!-- /_footer 作为公共模版分离出去 -->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.validation/1.14.0/jquery.validate.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.validation/1.14.0/validate-methods.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.validation/1.14.0/messages_zh.js"></script> 
<script src="http://static.runoob.com/assets/jquery-validation-1.14.0/dist/jquery.validate.min.js"></script>
<script type="text/javascript">
$(function(){
	$("#form-user-add").validate({
		rules:{
			'entity.id.partRev':{
				required:true,
			},
			'entity.id.supplierName':{
				required:true,
			},
			'entity.partSpec':{
				required:true,
			},
			'entity.partStandard':{
				required:true,
			},
			'entity.partUnit':{
				required:true,
			},
			'entity.partPrice':{
				required:true,
			},
		},
		onkeyup:false,
		focusCleanup:true,
		success:"valid",
		submitHandler:function(form){
			$(form).ajaxSubmit({
				type: 'post',
				url: "supplier-doEdit", 
				success: function(data){
					if(data == "1"){
						layer.msg('修改成功!',{icon:1,time:1000});
						setTimeout(function(){
							var index = parent.layer.getFrameIndex(window.name);
							parent.location.reload();
							parent.layer.close(index);
						},1000);
					}
					if(data == "0"){
						layer.msg('修改失败!',{icon:1,time:1000});
					}
				},
			    error: function(XmlHttpRequest, textStatus, errorThrown){
					layer.msg('error!',{icon:1,time:1000}); 
				}
			});	
			}
	});
});  
$(function(){
	$("#partModel").change(function(){
		if($(this).val() == '部件'){
			$("#partCost").val('小时');
			$("#partCost").attr('readonly',true);
			$("#partQty").val('');
			$("#partQty").attr('readonly',false);
		}else{
			$("#partQty").val(1);
			$("#partQty").attr('readonly',true);
			$("#partCost").val('');
			$("#partCost").attr('readonly',false);
		}
	});
});

</script> 
</html>