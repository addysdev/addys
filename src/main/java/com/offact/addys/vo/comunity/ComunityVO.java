package com.offact.addys.vo.comunity;

import com.offact.addys.vo.AbstractVO;
/**
 * @author 4530
 *
 */
public class ComunityVO extends AbstractVO {
	
	private String customerKey;
	private String groupId;
	private String customerId;
	private String commentType;
	private String comment;
	private String commentDateTime;
	
	public String getCustomerKey() {
		return customerKey;
	}
	public void setCustomerKey(String customerKey) {
		this.customerKey = customerKey;
	}
	public String getGroupId() {
		return groupId;
	}
	public void setGroupId(String groupId) {
		this.groupId = groupId;
	}
	public String getCustomerId() {
		return customerId;
	}
	public void setCustomerId(String customerId) {
		this.customerId = customerId;
	}
	public String getCommentType() {
		return commentType;
	}
	public void setCommentType(String commentType) {
		this.commentType = commentType;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public String getCommentDateTime() {
		return commentDateTime;
	}
	public void setCommentDateTime(String commentDateTime) {
		this.commentDateTime = commentDateTime;
	}
	
	
}
