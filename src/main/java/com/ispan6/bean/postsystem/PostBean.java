package com.ispan6.bean.postsystem;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.PrePersist;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.ispan6.bean.membersystem.MemberBean;
import com.ispan6.bean.membersystem.MemberTest;


@Entity
@Table(name = "post")
public class PostBean {

	@Id
	@Column(name="postid")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer postid;
	
	@Column(name="content", columnDefinition = "nvarchar(500)")
	private String content;
	
	@Column(name="memberId",insertable = false,updatable = false)
	private Integer memberId;
	
	public Integer getMemberId() {
		return memberId;
	}

	public void setMemberId(Integer memberId) {
		this.memberId = memberId;
	}

	public MemberTest getMemberTest() {
		return memberTest;
	}

	public void setMemberTest(MemberTest memberTest) {
		this.memberTest = memberTest;
	}


	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "postTime")
	@JsonFormat(pattern = "yyyy/MM/dd HH:mm:ss", timezone = "GMT+8")
	@DateTimeFormat(pattern = "yyyy/MM/dd HH:mm:ss")
	private Date posttime;
	
	@PrePersist
	public void prePersist() {
		if(posttime == null) {
			posttime = new Date();
		}
	}

	
	@Column(name = "picture ")
	private String picture;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "memberId")
	private MemberTest memberTest;
	
	public  PostBean() {
		
	}

	public Integer getPostid() {
		return postid;
	}

	public void setPostid(Integer postid) {
		this.postid = postid;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getPosttime() {
		return posttime;
	}

	public void setPosttime(Date posttime) {
		this.posttime = posttime;
	}

	public String getPicture() {
		return picture;
	}

	public void setPicture(String picture) {
		this.picture = picture;
	}


	public void setmemberId(MemberTest memberId) {
		this.memberTest = memberId;
	}

	
	
}
