package com.ispan6.bean.reunionsystem;

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
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

@Entity
@Table(name="reunion_type")
public class Reunion_type {
  //付聚會類型
	@Id
	@Column(name="reut_id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer reut_id ;
	
	
	@Column(name="reu_type", columnDefinition = "nvarchar(50)")
	private String reu_type;
	
//	@OneToMany(fetch = FetchType.LAZY,mappedBy = "reunion_type",cascade=CascadeType.ALL)
//	private List<reunion> reunion;
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
