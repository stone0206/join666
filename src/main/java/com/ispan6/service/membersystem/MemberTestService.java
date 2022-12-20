package com.ispan6.service.membersystem;

import java.util.HashSet;
import java.util.List;
import java.util.Optional;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ispan6.bean.mallsystem.Product;
import com.ispan6.bean.membersystem.MemberTest;
import com.ispan6.dao.membersystem.MemberTestDAO;

@Service
public class MemberTestService {
		@Autowired
		private MemberTestDAO mDAO;
		
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
		//易查會員資料
		public List<MemberTest> senderFile(HashSet<Integer> id){
			return mDAO.senderFile(id);
		}
		

}
