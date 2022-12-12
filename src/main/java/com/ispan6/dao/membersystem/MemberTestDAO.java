package com.ispan6.dao.membersystem;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.ispan6.bean.membersystem.MemberTest;


public interface MemberTestDAO extends JpaRepository<MemberTest, Integer> {
		@Query("from MemberTest where m_account= :account and m_password= :password")
		public MemberTest findByAccAndPwd(@Param("account") String account, @Param("password") String password); 
}