package com.lh.persistence;

/**
 * 供应商信息持久化类
 * @author Li Hong
 */
public class Supplier {
	private int id;				//id号
	private String supplierno;  //供应商编号
	private String suppliername; //供应商名称
	private String contactperson; //联系人
	private String contacttel; //联系电话
	private String contactaddress; //地址
	private String remark; //备注
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getSupplierno() {
		return supplierno;
	}
	public void setSupplierno(String supplierno) {
		this.supplierno = supplierno;
	}
	public String getSuppliername() {
		return suppliername;
	}
	public void setSuppliername(String suppliername) {
		this.suppliername = suppliername;
	}
	public String getContactperson() {
		return contactperson;
	}
	public void setContactperson(String contactperson) {
		this.contactperson = contactperson;
	}
	public String getContacttel() {
		return contacttel;
	}
	public void setContacttel(String contacttel) {
		this.contacttel = contacttel;
	}
	public String getContactaddress() {
		return contactaddress;
	}
	public void setContactaddress(String contactaddress) {
		this.contactaddress = contactaddress;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	
	
	
}
