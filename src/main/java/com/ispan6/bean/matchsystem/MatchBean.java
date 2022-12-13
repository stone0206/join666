package com.ispan6.bean.matchsystem;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.criteria.CriteriaBuilder.In;

import com.ispan6.bean.chatsystem.GroupRoom;
import com.ispan6.bean.membersystem.MemberTest;

@Entity
@Table(name = "friend")
public class MatchBean {

//	create table friend( 
//			friendid int primary key identity(1,1),
//			userid int foreign key references memberTest(m_id),--自己ID
//			fuid int foreign key references memberTest(m_id),--好友ID
//			isFriend int default 0,--是不是朋友
//			roomid int,--房間ID
//			foreign key (roomId) references grouproom(groupId),
//		);
	@Id
	@Column(name = "friendid")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer friendid;
	
	@ManyToOne
	@JoinColumn(name = "userid")
	private MemberTest userid;
	@ManyToOne
	@JoinColumn(name = "fuid")
	private MemberTest fuid;
	@Column(name = "isFriend")
	private Integer isFriend;
	@ManyToOne
	private GroupRoom roomid;
}
