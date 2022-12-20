package com.ispan6.dao.membersystem;



import java.util.HashSet;
import java.util.List;



import java.util.List;


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
		
		@Query(value="FROM MemberTest where gender= :male or gender= :female")
		public List<MemberTest> findByGender(@Param("male") Integer male, @Param("female") Integer female);
		
		@Query(value = "SELECT top 3* from memberTest where m_id != ?1 ORDER BY NEWID()", nativeQuery = true)
		public List<MemberTest> random3Members(Integer id);
		

		@Query(value = "SELECT top 3* from memberTest  ORDER BY NEWID()", nativeQuery = true)
		public List<MemberTest> random3Members();
		

		@Query(value = "SELECT top 1* from memberTest where m_id != ?1 ORDER BY NEWID()", nativeQuery = true)
		public MemberTest random1(Integer id);
		

		@Query(value = "SELECT top 1* from memberTest ORDER BY NEWID()", nativeQuery = true)
		public MemberTest random1();
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
		
		//易
		@Query(value="SELECT * FROM memberTest where m_id in(?1)",nativeQuery = true)
		public List<MemberTest> senderFile(HashSet<Integer> id);
}

