package com.ispan6.service.reunionsystem;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ispan6.bean.reunionsystem.Register;
import com.ispan6.dao.reunionsystem.ReunionregisterReposity;




@Transactional
@Service
public class ReunionregisterService {
	
	@Autowired
	private ReunionregisterReposity ReunionregisterReposity;
	
	
	public void insertRegister(Register register) {
		ReunionregisterReposity.save(register);
	}
    public boolean registerEmpty(Integer reunionid, Integer memberid) {
		return ReunionregisterReposity.findRegisterByReunionidAndMemberid(reunionid, memberid).isEmpty();
			
	}
}
