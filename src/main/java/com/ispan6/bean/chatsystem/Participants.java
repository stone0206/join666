package com.ispan6.bean.chatsystem;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.DynamicUpdate;

import com.ispan6.bean.membersystem.MemberBean;
//群組
@Entity
@Table(name="participants")
//如果update 值是null 則不會被更改
@DynamicUpdate
public class Participants implements Serializable{

	
	
	//不確定
	private static final long serialVersionUID = 1L;

	public Participants() {
		
	}
//	,insertable=false,updatable=false
	@Id // 添加一个空的id标识，因为jpa在映射实体是需要一个id，这个必须
	@Column(name="PARTICIPANTSID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int participantsId;
	
//	重要：不知道要不要加
	
	
//	//參與者ID 會員外來鍵
//	@Column(name="PERSONID")
//	private int personId;
//	//聊天室ID
//	@Column(name="GROUPID")
//	private int groupId;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name="PERSONID")
	private MemberBean userId;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name="GROUPID")
	private GroupRoom groupRoomId;

//	public int getPersonId() {
//		return personId;
//	}
//
//	public void setPersonId(int personId) {
//		this.personId = personId;
//	}
//
//	public int getGroupId() {
//		return groupId;
//	}
//
//	public void setGroupId(int groupId) {
//		this.groupId = groupId;
//	}

	public MemberBean getUserId() {
		return userId;
	}

	public void setUserId(MemberBean userId) {
		this.userId = userId;
	}

	public GroupRoom getGroupRoomId() {
		return groupRoomId;
	}

	public void setGroupRoomId(GroupRoom groupRoomId) {
		this.groupRoomId = groupRoomId;
	}

	public int getParticipantsId() {
		return participantsId;
	}

	public void setParticipantsId(int participantsId) {
		this.participantsId = participantsId;
	}
	
	
}
