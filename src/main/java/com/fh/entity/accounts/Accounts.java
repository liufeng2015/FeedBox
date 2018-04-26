package com.fh.entity.accounts;

public class Accounts {
    private Long acsId;   //公众号Id
    private String acsName; //公众号名称
    private String App_Id;  //应用Id
    private String App_secret; //密钥
    private String status;    //状态  0启用 ，1禁用
    private String organizer; //承办单位
    private String createDate; 
    private String updateDate; 
    private String deleteDate;
    private String deleteUser;
    private String dr;
	public Long getAcsId() {
		return acsId;
	}
	public void setAcsId(Long acsId) {
		this.acsId = acsId;
	}
	public String getAcsName() {
		return acsName;
	}
	public void setAcsName(String acsName) {
		this.acsName = acsName;
	}
	public String getApp_Id() {
		return App_Id;
	}
	public void setApp_Id(String app_Id) {
		App_Id = app_Id;
	}
	public String getApp_secret() {
		return App_secret;
	}
	public void setApp_secret(String app_secret) {
		App_secret = app_secret;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getOrganizer() {
		return organizer;
	}
	public void setOrganizer(String organizer) {
		this.organizer = organizer;
	}
	public String getCreateDate() {
		return createDate;
	}
	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}
	public String getUpdateDate() {
		return updateDate;
	}
	public void setUpdateDate(String updateDate) {
		this.updateDate = updateDate;
	}
	public String getDeleteDate() {
		return deleteDate;
	}
	public void setDeleteDate(String deleteDate) {
		this.deleteDate = deleteDate;
	}
	public String getDr() {
		return dr;
	}
	public void setDr(String dr) {
		this.dr = dr;
	}
	public String getDeleteUser() {
		return deleteUser;
	}
	public void setDeleteUser(String deleteUser) {
		this.deleteUser = deleteUser;
	}
    
}
