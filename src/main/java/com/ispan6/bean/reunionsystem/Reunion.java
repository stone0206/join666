package com.ispan6.bean.reunionsystem;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

@Entity
@Table(name = "Reunion")
public class Reunion {

//	@Id
//	@Column(name = "reunionid")
//	@GeneratedValue(strategy = GenerationType.IDENTITY)
//	private Integer reunionid;
	
	@Id
	@Column(name = "reunionid")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer reunionid;

	@Column(name = "topic", columnDefinition = "nvarchar(50)")
	private String topic;

	public Integer getReunionid() {
		return reunionid;
	}





	public void setReunionid(Integer reunionid) {
		this.reunionid = reunionid;
	}

	@Column(name = "content", columnDefinition = "nvarchar(50)")
	private String content;

	@Column(name = "place", columnDefinition = "nvarchar(50)")
	private String place;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "holdTime")
	@JsonFormat(pattern = "yyyy/MM/dd HH:mm:ss", timezone = "GMT+8")
	@DateTimeFormat(pattern = "yyyy/MM/dd HH:mm:ss") // Java 環境內的格式
	private Date holdTime;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "reviewTime")
	@JsonFormat(pattern = "yyyy/MM/dd HH:mm:ss", timezone = "GMT+8")
	@DateTimeFormat(pattern = "yyyy/MM/dd HH:mm:ss") // Java 環境內的格式
	private Date reviewTime;

	@Column(name = "people")
	private Integer people;

//	@Column(name = "activity", columnDefinition = "nvarchar(50)")
	@OneToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "activity", columnDefinition = "nvarchar(50)")
	private Reuniontype reuniontype;

	@OneToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "payment")
	private Payment payment;

	@Column(name = "budget")
	private Integer budget;

	@Column(name = "picture")
	private String picture;

//	@ManyToOne(fetch = FetchType.LAZY)
//	@JoinColumn(name="memberId", columnDefinition = "nvarchar(50)")
//	private Integer memberId;



	public String getPicture() {
		return picture;
	}





	public void setPicture(String picture) {
		this.picture = picture;
	}

	public String getTopic() {
		return topic;
	}

	public void setTopic(String topic) {
		this.topic = topic;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getPlace() {
		return place;
	}

	public void setPlace(String place) {
		this.place = place;
	}

	public Date getHoldTime() {
		return holdTime;
	}

	public void setHoldTime(Date holdTime) {
		this.holdTime = holdTime;
	}

	public Date getReviewTime() {
		return reviewTime;
	}

	public void setReviewTime(Date reviewTime) {
		this.reviewTime = reviewTime;
	}

	public Integer getPeople() {
		return people;
	}

	public void setPeople(Integer people) {
		this.people = people;
	}

	

	public Reuniontype getReuniontype() {
		return reuniontype;
	}





	public void setReuniontype(Reuniontype reuniontype) {
		this.reuniontype = reuniontype;
	}





	public Payment getPayment() {
		return payment;
	}

	public void setPayment(Payment payment) {
		this.payment = payment;
	}

	public Integer getBudget() {
		return budget;
	}

	public void setBudget(Integer budget) {
		this.budget = budget;
	}

//	public Integer getMemberId() {
//		return memberId;
//	}
//
//
//	public void setMemberId(Integer memberId) {
//		this.memberId = memberId;
//	}

}
