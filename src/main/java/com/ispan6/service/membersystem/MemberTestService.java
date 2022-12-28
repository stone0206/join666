package com.ispan6.service.membersystem;

import java.util.HashSet;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ispan6.bean.membersystem.MemberTest;
import com.ispan6.dao.membersystem.MemberTestDAO;
import com.ispan6.utils.CodeUtils;

@Service
public class MemberTestService {
		@Autowired
		private MemberTestDAO mDAO;
		
		@Autowired
	    CodeUtils codeUtils;
		
		public void insertMember(MemberTest mt) {
			mDAO.save(mt);			
		}
		
		public MemberTest findByAccAndPwd(String account, String password) {
//			Optional<MemberTest> optional = mDAO.findByAccAndPwd(account, password);
			return mDAO.findByAccAndPwd(account, password);
		}
		
		public MemberTest findByAcc(String account) {
			return mDAO.findByAcc(account);
		}
		
		public void updateByAcc(String account, String avator, String name, String address) {
			mDAO.updateByAcc(account, avator, name, address);
		}
		
		public MemberTest existsByAccount(String account) {
//			System.out.println(mDAO.existsByAccount(account));
			return mDAO.existsByAccount(account);				
		
		}
		
		public List<MemberTest> getAllMemberTest() {
			return mDAO.findAll();
		}
		
		public List<MemberTest> findByGender(int male, int female) {
			if(male==0&&female==0) {return mDAO.findAll();}else
			return mDAO.findByGender(male, female);
		}
		
		public List<MemberTest> findMem(int male, int female, String account, String name) {
			return mDAO.findMem(male, female, account, name);
		}
		
	    public boolean sendCode(HttpSession session, MemberTest mt) {
	       if ( codeUtils.sendCode(session, mt)) 
	           return true;
	       else
	           return false;
	    }

		
		//易查會員資料
		public List<MemberTest> senderFile(HashSet<Integer> id){
			return mDAO.senderFile(id);
		}

}
