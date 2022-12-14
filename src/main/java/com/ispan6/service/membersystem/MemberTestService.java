package com.ispan6.service.membersystem;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ispan6.bean.membersystem.MemberTest;
import com.ispan6.dao.membersystem.MemberTestDAO;

@Service
public class MemberTestService {
		@Autowired
		private MemberTestDAO mDAO;
		
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

}
