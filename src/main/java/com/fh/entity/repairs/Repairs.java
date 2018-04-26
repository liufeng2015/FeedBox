package com.fh.entity.repairs;

import java.util.Date;

public class Repairs {
      private int reid;
      private String repairsMan; 			//报修人
      private String content;				//内容
      private String disposeName;			//受理人
      private String result;				//受理结果
      private Date disposeDate;			//处理时间
      private String phone;				//报修人电话
      private String AP_ID;                 //项目id
      private Date deleteDate;
      private Date createDate;
      private Date updateDate;
      private String checkDate;//新增登记时间 
      private int dr ;
      private String deleteUser;
      
	public String getDeleteUser() {
		return deleteUser;
	}
	public void setDeleteUser(String deleteUser) {
		this.deleteUser = deleteUser;
	}
	public int getDr() {
		return dr;
	}
	public void setDr(int dr) {
		this.dr = dr;
	}
	public int getReid() {
		return reid;
	}
	public void setReid(int reid) {
		this.reid = reid;
	}
	
	public String getRepairsMan() {
		return repairsMan;
	}
	public void setRepairsMan(String repairsMan) {
		this.repairsMan = repairsMan;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getDisposeName() {
		return disposeName;
	}
	public void setDisposeName(String disposeName) {
		this.disposeName = disposeName;
	}
	public String getResult() {
		return result;
	}
	public void setResult(String result) {
		this.result = result;
	}
	public Date getDisposeDate() {
		return disposeDate;
	}
	public void setDisposeDate(Date disposeDate) {
		this.disposeDate = disposeDate;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	
	
	public String getAP_ID() {
		return AP_ID;
	}
	public void setAP_ID(String aP_ID) {
		AP_ID = aP_ID;
	}
	public Date getDeleteDate() {
		return deleteDate;
	}
	public void setDeleteDate(Date deleteDate) {
		this.deleteDate = deleteDate;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public Date getUpdateDate() {
		return updateDate;
	}
	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}
	public String getCheckDate() {
		return checkDate;
	}
	public void setCheckDate(String checkDate) {
		this.checkDate = checkDate;
	}
	
      
}
