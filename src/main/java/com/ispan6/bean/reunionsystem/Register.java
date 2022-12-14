package com.ispan6.bean.reunionsystem;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="register")
public class Register {
  //聚會報名
	@Id
	@Column(name="registerid ")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer registerid ;
	
	@Column(name="reunionid ")
	private Integer reunionid  ;
	
	@Column(name="memberid ")
	private Integer memberid ;
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
