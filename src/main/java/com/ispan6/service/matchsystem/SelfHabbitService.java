package com.ispan6.service.matchsystem;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ispan6.bean.mallsystem.Product;
import com.ispan6.bean.matchsystem.HobbitBean;
import com.ispan6.bean.matchsystem.SelfHobbitBean;
import com.ispan6.bean.membersystem.MemberTest;
import com.ispan6.dao.matchsystem.SelfHobbitDto;
import com.ispan6.dao.membersystem.MemberTestDAO;

@Service
@Transactional
public class SelfHabbitService {
	
	
	@Autowired
	private SelfHobbitDto selfHobbitDto;
	
	private MemberTestDAO mdao;

	
	@PersistenceContext
	private EntityManager entityManager;
	public List<SelfHobbitBean> findMatch() {
		return selfHobbitDto.findAll();
	}

//	public List<MemberTest> findByTypeAndLabel(Integer[] genderCondi, Integer[] hobbitCondi) {
//		CriteriaBuilder builder = entityManager.getCriteriaBuilder();
//		CriteriaQuery<MemberTest> query = builder.createQuery(MemberTest.class);
//		Root<SelfHobbitBean> root = query.from(SelfHobbitBean.class);
//		List<Integer> typeList = Arrays.asList(genderCondi);
//		List<Integer> labelList = Arrays.asList(hobbitCondi);
//		Predicate typePredicate = null;
//		Predicate labelPredicate = null;
//
//		if (genderCondi.length == 0 && hobbitCondi.length == 0) {
//			return mdao.findAll();
//		}
//
//		if (genderCondi.length == 0) {
//			typePredicate = root.get("type").in(1, 2);
//		} else {
//			typePredicate = root.get("type").in(typeList);
//		}
//
//		if (hobbitCondi.length == 0) {
//			labelPredicate = root.get("label").in(1, 2, 3, 4, 5, 6);
//		} else {
//			labelPredicate = root.get("label").in(labelList);
//		}
//		Predicate statusPredicate = root.get("status").in(0);
//
//		query.where(builder.and(typePredicate, labelPredicate, statusPredicate));
//
//		TypedQuery<SelfHobbitBean> typedQuery = entityManager.createQuery(query);
//		return null;
//	}
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public List<MemberTest> findByHobbitAndGender(Integer[] hobbitId, Integer[] genders) {
		List<Integer> hobbitList = Arrays.asList(hobbitId);
		List<Integer> genderList = Arrays.asList(genders);
		List<Integer> hobbit = new ArrayList(hobbitList);
		List<Integer> gender = new ArrayList(genderList);

		
		if (hobbitId.length == 0) {
			hobbit.add(0, 1);
			hobbit.add(1, 2);
			hobbit.add(2, 3);
			hobbit.add(3, 4);
			hobbit.add(4, 5);
			hobbit.add(5, 6);
		} 

		if (genders.length == 0) {
			gender.add(0,1);
			gender.add(1,2);
		} 
		System.out.println(hobbit);
		System.out.println(gender);
		return mdao.findByHobbitIdsAndGenders(hobbit, gender);
	}
}
