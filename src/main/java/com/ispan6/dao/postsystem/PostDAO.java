package com.ispan6.dao.postsystem;

import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import com.ispan6.bean.postsystem.PostBean;


public interface PostDAO extends JpaRepository<PostBean, Integer>,CrudRepository<PostBean, Integer> {
//	// show all product without any condition
//	//	用原生即可

	
	// show post by conteent
	@Query("from PostBean where content = :content")
	public List<PostBean> findpostBycontent(@Param("content") String content);
	
	//模糊搜尋 原SQL指令
	@Query(value="select * from post where content like %:content%",nativeQuery = true)
	public List<PostBean> findpostLikecontent(@Param("content")String content);
	
	// show post by postid
	@Query("from PostBean where postid = :postid")
	public Optional<PostBean> findpostBypostid(@Param("postid") Integer postid);
	
	
	@Transactional
	@Modifying
	@Query(value="delete from PostBean where postid = ?1")
	public List<PostBean> deletepostBypostid(Integer postid);
	
	public List<PostBean> findAllByOrderByPosttimeDesc();
	
	public List<PostBean> findFirstByOrderByPosttimeDesc();
	
	

//	// show product by Label
//	@Query("from Product where p_label = :label")
//	public List<Product> findByLabel(@Param("label") String label);
//
//	// show product by price
//	@Query("from Product where price between ?1 and ?2")
//	public List<Product> findByPriceBetween(Integer lowpeice, Integer highprice);
//
//	// show product order by price desc
//	@Query("from Product order by price desc")
//	public List<Product> orderByPriceDesc();
//	
//	// show product order by price asc
//	@Query("from Product order by price asc")
//	public List<Product> orderByPriceAsc();
//
//	// show product order by price inventory
//	@Query("from Product order by inventory")
//	public List<Product> orderByInventory();
//	
//	// show product order by price inventory
//	@Query(value = "select * from WorkMessage where text like %?1%", nativeQuery = true)
//	public List<Product> findBySearch(String keyword);
//	
//	// show product by img search
//	// show product by many keyword search
}
