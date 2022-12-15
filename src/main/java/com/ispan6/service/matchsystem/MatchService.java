package com.ispan6.service.matchsystem;

import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ispan6.bean.mallsystem.Product;
import com.ispan6.bean.matchsystem.MatchBean;
import com.ispan6.bean.membersystem.MemberTest;
import com.ispan6.dao.matchsystem.MatchDAO;
import com.ispan6.dao.membersystem.MemberTestDAO;

@Service
@Transactional
public class MatchService {
	@Autowired
	private MemberTestDAO memberTestDao;
	@Autowired
	private MatchDAO matchDao;
	
	public List<MemberTest> random3Members(Integer id){
		return memberTestDao.random3Members(id);
	};
	
	public List<MemberTest> random3Members( ){
		return memberTestDao.random3Members();
	};
	
	public MemberTest random1(Integer id){
		return memberTestDao.random1(id);
	};


	public MemberTest random1(){
		return memberTestDao.random1();
	};
	
	public  void addNewFriend(MatchBean matchBean) {
		matchDao.save(matchBean);
	};
	
	public MemberTest findById(Integer id) {
		 Optional<MemberTest> matchBean = memberTestDao.findById(id);
		 if(matchBean.isPresent()) {
			 return matchBean.get();
		 }
		 return null;
	}

}
