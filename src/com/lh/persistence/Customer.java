package com.lh.persistence;

/**
 * �ͻ���Ϣ�־û���
 * @author Li Hong
 */
public class Customer {
	private int id;				//id��
	private String customerno;  //�ͻ����
	private String customername; //�ͻ�����
	private String contactperson; //��ϵ��
	private String contacttel; //��ϵ�绰
	private String contactaddress; //��ַ
	private String remark; //��ע
	public String getCustomerno() {
		return customerno;
	}
	public void setCustomerno(String customerno) {
		this.customerno = customerno;
	}
	public String getCustomername() {
		return customername;
	}
	public void setCustomername(String customername) {
		this.customername = customername;
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
	public void setId(int id) {
		this.id = id;
	}
	public int getId() {
		return id;
	}
	
	
}
