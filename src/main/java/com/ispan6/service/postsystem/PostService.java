package com.ispan6.service.postsystem;

import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.hibernate.query.criteria.internal.expression.function.LengthFunction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Service;

import com.ispan6.bean.postsystem.PostBean;
import com.ispan6.dao.postsystem.PostDAO;

import net.bytebuddy.agent.builder.AgentBuilder.RedefinitionStrategy.BatchAllocator.ForTotal;

@Service
@Transactional
public class PostService {
	
	
	@Autowired
	private PostDAO postDAO;
	

	public List<PostBean> getAllPostBean() {
		return postDAO.findAll();
	}
	
	public void insertOrUpdate(PostBean postBean) {
		postDAO.save(postBean);
	}
	
	public List<PostBean> findAllPosts() {
	    return postDAO.findAllByOrderByPosttimeDesc();
	  }
	
	public void deletePost(Integer postid) {
		postDAO.deleteById(postid);
	}
	
	
	public List<PostBean> getLatest() {
		return postDAO.findAllByOrderByPosttimeDesc();
	}
	
	//拿最新的
	public List<PostBean> findLatest() {
		return postDAO.findFirstByOrderByPosttimeDesc();
		
	}
	
	public PostBean findBypostid(Integer postid) {
		Optional<PostBean> optional= postDAO.findpostBypostid(postid);
	
		if(optional.isPresent()) {
			return optional.get();
		}
		
		return null;
	}
	

	public Page<PostBean> findByPostPage(Integer pageNumber){
		  int length = 10; // 设置默认页面大小为 10
		  int postCount = postDAO.findAll().size(); // 获取貼文数量
		  if (postCount > 0) { // 如果貼文数量大于 0
		    length = postCount; // 将页面大小设置为貼文数量
		  }
		  Pageable pgb = PageRequest.of(pageNumber-1,length, Direction.DESC,"posttime");
		  return postDAO.findAll(pgb);
		}
//	
//	public Page<PostBean> findByPostPage(Integer pageNumber){
//		int length=postDAO.findAll().size();
//		Pageable pgb = PageRequest.of(pageNumber-1,length, Direction.DESC,"posttime");
//		
//		return postDAO.findAll(pgb);
//		
//	}
	

	
}
