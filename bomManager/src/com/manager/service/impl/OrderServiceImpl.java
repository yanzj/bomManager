/*
 * 文件名：SupplierServiceImpl.java
 * 版权：Copyright 2012-2016 YLINK Tech. Co. Ltd. All Rights Reserved. 
 * 描述： SupplierServiceImpl.java
 * 修改人：liyuelong 1610139
 * 修改时间：2017年7月6日
 * 修改内容：新增
 */
package com.manager.service.impl;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;

import org.apache.struts2.ServletActionContext;

import com.manager.common.tools.FileUtil;
import com.manager.common.tools.StringUtil;
import com.manager.dao.OrderDAO;
import com.manager.entity.Order;
import com.manager.service.OrderService;

import sun.print.resources.serviceui;

/**
 * TODO添加类描述
 * @author     liyuelong 1610139
 * @version    CCAS 2017年7月6日
 * @since      CCAS
 */
public class OrderServiceImpl implements OrderService{
	private OrderDAO orderDAO;
	
	public OrderDAO getOrderDAO() {
		return orderDAO;
	}

	public void setOrderDAO(OrderDAO orderDAO) {
		this.orderDAO = orderDAO;
	}

	@Override
	public boolean Add(Order  order) {
		order.setOrderConfirm("N");
		order.setDelivered("N");
		order.setPaid("N");;
		order.setOrderStatus("待报价");
		Boolean result=orderDAO.Add(order);
		if(result){
			return true;
		}else{
		   return false;
		}
	}

	@Override
	public int getCount(Map formParams, Order order) {
		StringBuffer hql = new StringBuffer("SELECT count(*) From Order e where 1=1 ");
		HashMap sqlParams = new HashMap();
		builhql(hql, formParams, order, sqlParams);
		return orderDAO.getCount(hql.toString(), sqlParams);
	}

	@Override
	public List<Order> getList(Map formParams, Order order, int offset, int length) {
		//hql语句
		StringBuffer hql = new StringBuffer("From Order e where 1=1 ");
		// 查询参数列表
		HashMap sqlParams = new HashMap();
		builhql(hql, formParams,order,sqlParams);
		List<Order> list = orderDAO.executeHQL(hql.toString(), sqlParams,offset,length);
		return list;
	}

	
	@Override
	public List<Order> getList(Map formParams, Order order) {
		//hql语句
		StringBuffer hql = new StringBuffer("From Order e where 1=1 ");
		// 查询参数列表
		HashMap sqlParams = new HashMap();
		builhql(hql, formParams,order,sqlParams);

		List<Order> list = orderDAO.executeHQL(hql.toString(), sqlParams);
		return list;
	}

	@Override
	public void builhql(StringBuffer hql, Map formParams, Order order, HashMap sqlParams) {
			String orderNumber = order.getOrderNumber();
			if(!StringUtil.isNullOrWhiteSpace(orderNumber)){
				orderNumber = "%"+orderNumber+"%";
				hql.append(" and e.orderNumber like :orderNumber");
			    sqlParams.put("orderNumber", orderNumber);
			}
			String orderStatus = order.getOrderStatus();
			if(!StringUtil.isNullOrWhiteSpace(orderStatus)){
				hql.append(" and e.orderStatus = :orderStatus");
			    sqlParams.put("orderStatus", orderStatus);
			}
			String orderConfirm = order.getOrderConfirm();
			if(!StringUtil.isNullOrWhiteSpace(orderConfirm)){
				hql.append(" and e.orderConfirm = :orderConfirm");
			    sqlParams.put("orderConfirm", orderConfirm);
			}
			
			if (formParams.containsKey("u_level")) {
				int u_level  = (Integer) formParams.get("u_level");
				if(u_level < 3 ){
					String contact =  (String) formParams.get("u_number");
					hql.append(" and e.contact = :contact");
					sqlParams.put("contact", contact);
				}
			}
			String orderTime = (String)formParams.get("orderTime");
			if(!StringUtil.isNullOrWhiteSpace(orderTime)){
				hql.append(" and e.orderNumber > :orderTime");
				  sqlParams.put("orderTime", orderTime);
			}
			
			String paid = order.getPaid();
			if(!StringUtil.isNullOrWhiteSpace(paid)){
				hql.append(" and e.paid = :paid");
				sqlParams.put("paid", paid);
				
			}
			
			String payWay = order.getPayWay();
			if(!StringUtil.isNullOrWhiteSpace(payWay)){
				hql.append(" and e.payWay = :payWay");
				sqlParams.put("payWay", payWay);
			}
			
			String orderMode = order.getOrderMode();
			if(!StringUtil.isNullOrWhiteSpace(orderMode)){
				hql.append(" and e.orderMode = :orderMode");
				sqlParams.put("orderMode", orderMode);
			}
			
			String delivered = order.getDelivered();
			if(!StringUtil.isNullOrWhiteSpace(delivered)){
				hql.append(" and e.delivered = :delivered");
				sqlParams.put("delivered", delivered);
			}
			//搜索
			String cellPhone = order.getCellPhone();
			if(!StringUtil.isNullOrWhiteSpace(cellPhone)){
				cellPhone = "%" + cellPhone + "%"; 
				hql.append(" and e.cellPhone like :cellPhone");
				sqlParams.put("cellPhone", cellPhone);
			}
			String orderName = order.getOrderName();
			if(!StringUtil.isNullOrWhiteSpace(orderName)){
				orderName = "%" + orderName + "%"; 
				hql.append(" and e.orderName like :orderName");
				sqlParams.put("orderName", orderName);
			}
			
			String orderby = (String) formParams.get("orderby");
			if(!StringUtil.isNullOrWhiteSpace(orderby)){
				hql.append(" order by e.orderNumber desc");
			}
	}
	@Override
	public Order getOrder(Order order) {
		return (Order) orderDAO.get(Order.class, order.getOrderNumber());
	}

	@Override
	public Boolean verify(Map params, Order order) throws IOException {
		File file = (File) params.get("img");
		// 获取文件名
		String fileName = (String) params.get("imgFileName");
		String path = (String) params.get("path");
		
		//存储文件名到本地的OrderFile文件夹下
	/*	ServletContext servletContext = ServletActionContext.getServletContext();
		String targetFileName = servletContext.getRealPath("/quotationFile/" + fileName);*/
		//判断文件夹是否存在
		File dir = new File(path);
		if(!dir.exists()){
			dir.mkdir();
		}
		// 获取文件的后缀名,即文件类型
		String[] arry = fileName.split("\\.");
		String fileType = arry[arry.length - 1];
		// 获取订单编号
		String orderNumber = order.getOrderNumber();
		// 重命名文件名,以订单号+文件类型命名
		fileName = "quotation" + orderNumber + "." + fileType;
		
		String targetFileName = path  + "/" + fileName;
		
		FileUtil.writeFile(targetFileName, file);
		//设置订单的报价单文件名
		order.setQuotationFile(fileName);
		return  orderDAO.update(order);
	}

	@Override
	public Boolean edit(Order order) {
		Order item = getOrder(order);
		item.setOrderName(order.getOrderName());
		item.setOrderType(order.getOrderType());
		item.setOrderQty(order.getOrderQty());
		item.setOrderMaterial(order.getOrderMaterial());
		item.setOrderDesc(order.getOrderDesc());
		item.setReqDate(order.getReqDate());
		item.setContact(order.getContact());
		item.setCellPhone(order.getCellPhone());
		item.setAddress(order.getAddress());
		item.setOrderPrice(order.getOrderPrice());
		item.setOrderStatus("待报价");
		return orderDAO.update(item);
	}

	@Override
	public Boolean confirm(Order order) {
		order.setOrderStatus("已确认");
		order.setConfirmTime(new Date());
		order.setOrderConfirm("Y");
		return orderDAO.update(order);
	}

	@Override
	public Boolean complete(Order order) {
		Order item = getOrder(order);
		item.setDelivered("Y");
		item.setDeliveryTime(order.getDeliveryTime());
		item.setPaid("Y");
		item.setPayment(order.getPayment());
		item.setPayWay(order.getPayWay());
		item.setExpress(order.getExpress());
		item.setExpressNum(order.getExpressNum());
		item.setOrderStatus("已完成");
		return orderDAO.update(item);
	}

	@Override
	public Boolean delete(Order order) {
		Order item = (Order) orderDAO.get(Order.class, order.getOrderNumber());
		if(item == null){
			return false;
		}
		return orderDAO.delete(item);
	}
	
	
	
} 

