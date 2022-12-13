package com.ispan6.service.reunionsystem;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


import com.ispan6.bean.reunionsystem.Reunion;
import com.ispan6.dao.reunionsystem.ReunionsystemRepository;

@Transactional
@Service
public class ReunionsystemService {
	
	@Autowired
	private ReunionsystemRepository wRepo;
	
	
//	public WorkMessageService(WorkMessageRepository wRepo) {
//		this.wRepo = wRepo;
//	}
//	
	public void insert(Reunion msg) {
		wRepo.save(msg);
	}
	
//	public Reunion getLatest() {
//		return wRepo.findFirstByOrderByAddedDesc();
//	}
	
	public Page<Reunion> findByPage(Integer pageNumber){
		Pageable pgb = PageRequest.of(pageNumber-1,3, Sort.Direction.DESC,"reunionid");
		
		return wRepo.findAll(pgb);
	}
	


}
