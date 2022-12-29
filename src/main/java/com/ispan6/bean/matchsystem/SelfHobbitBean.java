package com.ispan6.bean.matchsystem;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.ispan6.bean.membersystem.MemberTest;

@Entity
@Table(name="selfhobbit")
public class SelfHobbitBean {
//	self_id int primary key identity(1,1), 
//    userhid int,
//    hobbitid INT,
	@Id
	@Column(name = "self_id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer self_id;
	
	@ManyToOne
	@JoinColumn(name = "userhid")
	private MemberTest userhid;
	
	@ManyToOne
	@JoinColumn(name = "hobbitid")
	private HobbitBean hobbitid;
	
	public Integer getSelf_id() {
		return self_id;
	}
	public void setSelf_id(Integer self_id) {
		this.self_id = self_id;
	}
	public MemberTest getUserhid() {
		return userhid;
	}
	public void setUserhid(MemberTest userhid) {
		this.userhid = userhid;
	}
	public HobbitBean getHobbitid() {
		return hobbitid;
	}
	public void setHobbitid(HobbitBean hobbitid) {
		this.hobbitid = hobbitid;
	}
	
	
	
	
	
}