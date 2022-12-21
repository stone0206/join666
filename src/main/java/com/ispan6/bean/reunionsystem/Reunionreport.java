package com.ispan6.bean.reunionsystem;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.ispan6.bean.membersystem.MemberTest;

@Entity
@Table(name="reunionreport")
public class Reunionreport {
  //聚會檢舉
	@Id
	@Column(name="reunionreportid")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer reunionreportid ;
	
	
	@OneToOne(fetch = FetchType.LAZY)
	@JoinColumn(name="reunionid")
	private Reunion reunion ;
	

	
	@OneToOne(fetch = FetchType.LAZY)
	@JoinColumn(name="memberid")
	private MemberTest memberTest ;
	
	@Column(name="content",columnDefinition ="nvarchar(50)")
	private String content;

	public Integer getReunionreportid() {
		return reunionreportid;
	}

	public void setReunionreportid(Integer reunionreportid) {
		this.reunionreportid = reunionreportid;
	}

	
	
	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Reunion getReunion() {
		return reunion;
	}

	public void setReunion(Reunion reunion) {
		this.reunion = reunion;
	}

	public MemberTest getMemberTest() {
		return memberTest;
	}

	public void setMemberTest(MemberTest memberTest) {
		this.memberTest = memberTest;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
