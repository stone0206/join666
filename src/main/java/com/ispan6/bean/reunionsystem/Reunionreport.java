package com.ispan6.bean.reunionsystem;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

@Entity
@Table(name="reunionreport")
public class Reunionreport {
  //聚會檢舉
	@Id
	@Column(name="reunionreportid ")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer reunionreportid ;
	
	@Column(name="reunionid ")
	private Integer reunionid  ;
	
	@Column(name="memberid ")
	private Integer memberid ;
	
	@Column(name="content", columnDefinition = "nvarchar(50)")
	private String content;

	public Integer getReunionreportid() {
		return reunionreportid;
	}

	public void setReunionreportid(Integer reunionreportid) {
		this.reunionreportid = reunionreportid;
	}

	public Integer getReunionid() {
		return reunionid;
	}

	public void setReunionid(Integer reunionid) {
		this.reunionid = reunionid;
	}

	public Integer getMemberid() {
		return memberid;
	}

	public void setMemberid(Integer memberid) {
		this.memberid = memberid;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
