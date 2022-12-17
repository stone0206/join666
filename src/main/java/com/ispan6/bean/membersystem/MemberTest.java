package com.ispan6.bean.membersystem;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.PrePersist;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

<<<<<<< HEAD
import com.ispan6.bean.mallsystem.OrderBean;
=======
import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.ispan6.bean.chatsystem.MessageContent;
import com.ispan6.bean.chatsystem.Participants;
>>>>>>> 59db71002f1902e221e0d49d4a08b180d16cdbc3
import com.ispan6.bean.mallsystem.ShoppingCartItem;
import com.ispan6.bean.matchsystem.MatchBean;

@Entity
@Table(name = "memberTest")
public class MemberTest {
	@Id
	@Column(name="m_id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@Column(name="m_account")
	private String account;
	
	@Column(name="m_password")
	private String password;
	
	@Column(name="m_name")
	private String name;
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="birth")
	@DateTimeFormat(pattern ="yyyy-MM-dd")
	private Date birth;
	
	@Column(name="gender")
	private int gender;
	
	@Column(name="phone")
	private String phone;
	
	@Column(name="email")
	private String email;
	
	@Column(name="avatar")
	private String avator;
	
	@Column(name="address")
	private String address;
	
	@OneToMany(mappedBy = "memberTest")
	private List<ShoppingCartItem> sciList = new ArrayList<ShoppingCartItem>();

	@OneToMany(mappedBy = "userid")
	private List<MatchBean> userid = new ArrayList<MatchBean>();

	@OneToMany(mappedBy = "fuid")
	private List<MatchBean> fuid = new ArrayList<MatchBean>();
	
	@OneToMany(mappedBy = "memberTest")
	private List<OrderBean> order = new ArrayList<OrderBean>();

	//易
	@OneToMany(mappedBy = "participantsUserId")
	private List<Participants> participantsUserId=new ArrayList<Participants>();
	//易
	@OneToMany(mappedBy = "messageContentUserId")
	private List<MessageContent> messageContentUserId=new ArrayList<MessageContent>();
	
	public MemberTest() {
		super();
	}

	@PrePersist  // 當物件要從 Transient 狀態轉換成 Persistent 狀態時，先做...
	public void prePersist() {
		if(birth == null) {
			birth = new Date();
		}
	}
	

	public int getId() {
		return id;
	}

	
	public void setId(int id) {
		this.id = id;
	}

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Date getBirth() {
		return birth;
	}

	public void setBirth(Date birth) {
		this.birth = birth;
	}

	public int getGender() {
		return gender;
	}

	public void setGender(int gender) {
		this.gender = gender;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAvator() {
		return avator;
	}

	public void setAvator(String avator) {
		this.avator = avator;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public List<Participants> getParticipantsUserId() {
		return participantsUserId;
	}

	public void setParticipantsUserId(List<Participants> participantsUserId) {
		this.participantsUserId = participantsUserId;
	}

	public List<MessageContent> getMessageContentUserId() {
		return messageContentUserId;
	}

	public void setMessageContentUserId(List<MessageContent> messageContentUserId) {
		this.messageContentUserId = messageContentUserId;
	}
	
	
}
