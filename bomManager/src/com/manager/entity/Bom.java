package com.manager.entity;

import java.math.BigDecimal;

// Generated 2017-7-14 16:34:52 by Hibernate Tools 3.4.0.CR1

import java.util.Date;

import javax.persistence.Transient;

/**
 * Tblbom generated by hbm2java
 */
public class Bom implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private BomId id;
	private String topName;
	private String partName;
	private String f_Name;
	private Integer secq;
	private Double useQty;
	private String editor;
	private Date datetime;
	

	


	public Bom(BomId id, String partName) {
		this.id = id;
		this.partName = partName;
	}


	public BomId getId() {
		return this.id;
	}

	public void setId(BomId id) {
		this.id = id;
	}

	public String getTopName() {
		return this.topName;
	}

	public void setTopName(String topName) {
		this.topName = topName;
	}

	public String getPartName() {
		return this.partName;
	}

	public void setPartName(String partName) {
		this.partName = partName;
	}

	public String getF_Name() {
		return f_Name;
	}

	public void setF_Name(String f_Name) {
		this.f_Name = f_Name;
	}

	public Integer getSecq() {
		return this.secq;
	}

	public void setSecq(Integer secq) {
		this.secq = secq;
	}

	public Double getUseQty() {
		return this.useQty;
	}

	public void setUseQty(Double useQty) {
		this.useQty = useQty;
	}

	public String getEditor() {
		return this.editor;
	}

	public void setEditor(String editor) {
		this.editor = editor;
	}

	public Date getDatetime() {
		return this.datetime;
	}

	public void setDatetime(Date datetime) {
		this.datetime = datetime;
	}
	/**
	 * 材料规格
	 */
	@Transient
	private String partSpec;
	/**
	 * 图样代号
	 */
	@Transient
	private String tuNumber;
	/**
	 * 执行标准
	 */
	@Transient
	private String partStandard;
	/**
	 * 零件or部件
	 */
	@Transient
	private String partModel;
	
	@Transient
	private BigDecimal partPrice;
	
	@Transient
	private BigDecimal partQty;
	
	public String getTuNumber() {
		return tuNumber;
	}

	public void setTuNumber(String tuNumber) {
		this.tuNumber = tuNumber;
	}

	public String getPartSpec() {
		return partSpec;
	}

	public void setPartSpec(String partSpec) {
		this.partSpec = partSpec;
	}

	public String getPartStandard() {
		return partStandard;
	}

	public void setPartStandard(String partStandard) {
		this.partStandard = partStandard;
	}

	public String getPartModel() {
		return partModel;
	}

	public void setPartModel(String partModel) {
		this.partModel = partModel;
	}

	public BigDecimal getPartPrice() {
		return partPrice;
	}

	public void setPartPrice(BigDecimal partPrice) {
		this.partPrice = partPrice;
	}

	
	public BigDecimal getPartQty() {
		return partQty;
	}

	public void setPartQty(BigDecimal partQty) {
		this.partQty = partQty;
	}
	
	public Bom() {
	}
	public Bom(BomId id, String topName, String partName, String f_Name, Integer secq, Double useQty, String editor,
			Date datetime, String partSpec, String tuNumber, String partStandard, String partModel,
			BigDecimal partPrice, BigDecimal partQty) {
		super();
		this.id = id;
		this.topName = topName;
		this.partName = partName;
		this.f_Name = f_Name;
		this.secq = secq;
		this.useQty = useQty;
		this.editor = editor;
		this.datetime = datetime;
		this.partSpec = partSpec;
		this.tuNumber = tuNumber;
		this.partStandard = partStandard;
		this.partModel = partModel;
		this.partPrice = partPrice;
		this.partQty = partQty;
	}
	

	public Bom(BomId id, String topName, String partName, String f_Name, Integer secq, Double useQty, String editor,
			Date datetime){
		super();
		this.id = id;
		this.topName = topName;
		this.partName = partName;
		this.f_Name = f_Name;
		this.secq = secq;
		this.useQty = useQty;
		this.editor = editor;
		this.datetime = datetime;
	}



	

}
