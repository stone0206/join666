package com.ispan6.bean.reunionsystem;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="payment")
public class Payment {
  //付款方式
	@Id
	@Column(name="payid")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer payId ;
	
	
	@Column(name="paytype", columnDefinition = "nvarchar(50)")
	private String paytype;

//	@OneToOne(fetch = FetchType.LAZY,mappedBy = "payment",cascade=CascadeType.ALL)
//	private List<reunion> reunion;
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
