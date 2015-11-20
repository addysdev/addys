package com.offact.addys.vo.comunity;

import com.offact.addys.vo.AbstractVO;
/**
 * @author 4530
 *
 */
public class CounselVO extends AbstractVO {
	
	private String idx;
	private String groupId;
	private String customerKey;
	private String customerId;
	private String counselState;
	private String counsel;
	private String counselImage;
	private String counselDateTime;
	
	private String userId;
	private String userName;
	private String counselResult;
	private String counselResultDateTime;
	
	public String getIdx() {
		return idx;
	}
	public void setIdx(String idx) {
		this.idx = idx;
	}
	public String getGroupId() {
		return groupId;
	}
	public void setGroupId(String groupId) {
		this.groupId = groupId;
	}
	public String getCustomerKey() {
		return customerKey;
	}
	public void setCustomerKey(String customerKey) {
		this.customerKey = customerKey;
	}
	public String getCustomerId() {
		return customerId;
	}
	public void setCustomerId(String customerId) {
		this.customerId = customerId;
	}
	public String getCounselState() {
		return counselState;
	}
	public void setCounselState(String counselState) {
		this.counselState = counselState;
	}
	public String getCounsel() {
		return counsel;
	}
	public void setCounsel(String counsel) {
		this.counsel = counsel;
	}
	public String getCounselDateTime() {
		return counselDateTime;
	}
	public void setCounselDateTime(String counselDateTime) {
		this.counselDateTime = counselDateTime;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getCounselResult() {
		return counselResult;
	}
	public void setCounselResult(String counselResult) {
		this.counselResult = counselResult;
	}
	public String getCounselResultDateTime() {
		return counselResultDateTime;
	}
	public void setCounselResultDateTime(String counselResultDateTime) {
		this.counselResultDateTime = counselResultDateTime;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getCounselImage() {
		return counselImage;
	}
	public void setCounselImage(String counselImage) {
		this.counselImage = counselImage;
	}
	
}
