package com.ispan6.service.matchsystem;

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
import com.ispan6.dao.matchsystem.SelfHobbitDto;

@Service
@Transactional
public class SelfHabbitService {
	
	
	@Autowired
	private SelfHobbitDto selfHobbitDto;

	
	@PersistenceContext
	private EntityManager entityManager;
	public List<SelfHobbitBean> findMatch() {
		return selfHobbitDto.findAll();
	}

	public List<SelfHobbitBean> findByTypeAndLabel(Integer[] typeCondi, Integer[] labelCondi) {
		CriteriaBuilder builder = entityManager.getCriteriaBuilder();
		CriteriaQuery<SelfHobbitBean> query = builder.createQuery(SelfHobbitBean.class);
		Root<SelfHobbitBean> root = query.from(SelfHobbitBean.class);
		List<Integer> typeList = Arrays.asList(typeCondi);
		List<Integer> labelList = Arrays.asList(labelCondi);
		Predicate typePredicate = null;
		Predicate labelPredicate = null;

		if (typeCondi.length == 0 && labelCondi.length == 0) {
			return selfHobbitDto.findAll();
		}

		if (typeCondi.length == 0) {
			typePredicate = root.get("type").in(1, 2, 3, 4);
		} else {
			typePredicate = root.get("type").in(typeList);
		}

		if (labelCondi.length == 0) {
			labelPredicate = root.get("label").in(1, 2, 3);
		} else {
			labelPredicate = root.get("label").in(labelList);
		}
		Predicate statusPredicate = root.get("status").in(0);

		query.where(builder.and(typePredicate, labelPredicate, statusPredicate));

		TypedQuery<SelfHobbitBean> typedQuery = entityManager.createQuery(query);
		return typedQuery.getResultList();
	}
}
