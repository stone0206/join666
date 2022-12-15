package com.ispan6.service.reunionsystem;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ispan6.bean.reunionsystem.Reunionreport;
import com.ispan6.dao.reunionsystem.ReunionreportRepository;




@Transactional
@Service
public class ReunionreportService {
	
	@Autowired
	private ReunionreportRepository ReunionreportRepository;
	
	
	
	public void deleteReunionreport(Integer id) {
		 ReunionreportRepository.deleteReunionreportById(id);
	}
	
	
	
	public List<Reunionreport> getAllReunionreport() {
		return ReunionreportRepository.findAll();
	}
}
