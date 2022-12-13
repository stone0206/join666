package com.ispan6.service.matchsystem;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ispan6.bean.membersystem.MemberTest;
import com.ispan6.dao.matchsystem.MatchDAO;

@Service
@Transactional
public class MatchService {
	@Autowired
	private MatchDAO matchDAO;
	
	public List<MemberTest> random3Members(Integer id){
		return matchDAO.random3Members(id);
	};
	
	public List<MemberTest> random3Members( ){
		return matchDAO.random3Members();
	};
	
	public MemberTest random1(Integer id){
		return matchDAO.random1(id);
	};


	public MemberTest random1(){
		return matchDAO.random1();
	};

}
