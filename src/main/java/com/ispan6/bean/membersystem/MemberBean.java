package com.ispan6.bean.membersystem;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "member")
public class MemberBean {
//	
//	[id] [int] IDENTITY(1,1) NOT NULL,
//	[m_account] [nvarchar](50) NOT NULL,
//	[m_password] [nvarchar](50) NOT NULL

	@Id
	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer mid;
	@Column(name = "m_account")
	private String mAccount;
	@Column(name = "m_password")
	private String mPassword;

	public Integer getMid() {
		return mid;
	}

	public void setMid(Integer mid) {
		this.mid = mid;
	}

	public Integer getId() {
		return mid;
	}

	public void setId(Integer id) {
		this.mid = id;
	}

	public String getmAccount() {
		return mAccount;
	}

	public void setmAccount(String mAccount) {
		this.mAccount = mAccount;
	}

	public String getmPassword() {
		return mPassword;
	}

	public void setmPassword(String mPassword) {
		this.mPassword = mPassword;
	}

}
