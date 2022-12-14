package com.ispan6.dao.membersystem;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import com.ispan6.bean.membersystem.MemberTest;


public interface MemberTestDAO extends JpaRepository<MemberTest, Integer> {
		@Query("from MemberTest where m_account= :account and m_password= :password")
		public MemberTest findByAccAndPwd(@Param("account") String account, @Param("password") String password); 

		@Transactional
		@Modifying
		@Query(value = "UPDATE MemberTest SET m_name= :name, avator= :avator, address= :address WHERE m_account= :account")
		public void updateByAcc(@Param("account") String account, @Param("avator") String avator, @Param("name") String name, @Param("address") String address);
		
		@Query("from MemberTest where m_account= :account")
		public MemberTest findByAcc(@Param("account") String account); 
		
		@Query(value="FROM MemberTest where m_account= :account")
		public MemberTest existsByAccount(@Param("account") String account);
		
//		@Override
//		public String existsByMemberId(String memberId) {
//			String hql = "FROM MemberEntity m WHERE m.memberId = :id";
//			String id = ""; 
//			
//			Session session = factory.getCurrentSession();
//			
//			List<Member> list = session.createQuery(hql, Member.class)
//									   .setParameter("id", memberId)
//									   .getResultList();
//			if (!  list.isEmpty()) {
//				id = list.get(0).getMemberId();
//			}
//			
//			return id;
//		}
}

