 package com.ispan6.controller.postsystem;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.logging.log4j.message.Message;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ispan6.pageController;
import com.ispan6.bean.membersystem.MemberTest;
import com.ispan6.bean.postsystem.PostBean;
import com.ispan6.dao.postsystem.PostDAO;
import com.ispan6.dao.postsystem.PostDto;
import com.ispan6.service.postsystem.PostService;


@Controller
public class PostController {
	

    
	@Autowired
	private PostDAO postDao;
	
	@Autowired
	private PostService postService;
	
	
	

	
	
	@GetMapping("/add")
	public String insert(@RequestParam(name="p",defaultValue = "1") Integer pageNumber,@ModelAttribute("postBean")PostBean postBean,Model model,HttpSession session) {
	MemberTest member = (MemberTest) session.getAttribute("loginUser");
		
		PostBean p1 = new PostBean();
		
		model.addAttribute("postBean", p1);
		
		List<PostBean> latestPosts = postService.getLatest();
		
		model.addAttribute("latestPosts", latestPosts);
		
		Page<PostBean> page= postService.findByPostPage(pageNumber);
		model.addAttribute("page", page);
		
		return "redirect:/intopost";
	}
	
	@GetMapping("/intopost")
	public String postPageList(@RequestParam(name="p",defaultValue = "1") Integer pageNumber,Model model) {
		Page<PostBean> page= postService.findByPostPage(pageNumber);
		model.addAttribute("page", page);
		return "index";
		
	}
	
//	@GetMapping("/intopost")
//	public String intoPost(@ModelAttribute PostBean postBean,Model model) {
//		List<PostBean> latestPosts = postService.getLatest();
//		model.addAttribute("latestPosts", latestPosts);
//		
//		return "postpage";
//	}
	
	@GetMapping("/edit/{id}")
	public String updatePost(@PathVariable Integer id,Model model){
		PostBean postBean = postService.findBypostid(id);
		model.addAttribute("postBean",postBean);
		return "editpostpage";
	}
	
	@PostMapping("/editpost")
	public String  postUpdate(@ModelAttribute PostBean postBean) {
		postService.insertOrUpdate(postBean);
		return "redirect:/add";
		
	}
	
	@GetMapping("/deletepost")
	public String deletePost(@RequestParam Integer postid) {
		postService.deletePost(postid);
		return "redirect:/add";
	}
	
	@PostMapping("/post")
	public String  insertPost(@RequestParam(name="p",defaultValue = "1") Integer pageNumber,@ModelAttribute PostBean postBean,Model model,HttpSession session) {
		MemberTest member = (MemberTest) session.getAttribute("loginUser");
		
//		List<PostBean> latestPosts = postService.findLatest();
//		
//		model.addAttribute("latestPosts", latestPosts);
//		Integer id=member.getId();
//		MemberTest mTest=new MemberTest();
//		mTest.setId(id);
		postBean.setMemberTest(member); //mTest
		postService.insertOrUpdate(postBean);
		
		Page<PostBean> page= postService.findByPostPage(pageNumber);
		model.addAttribute("page", page);

		return "redirect:/add";
	}
	
	@ResponseBody
	@PostMapping("/api/post")
	public Page<PostBean>postMsgApi(@RequestBody PostDto dto) {
		String userInputText = dto.getText();
		PostBean newMsg = new PostBean();
		
		newMsg.setPosttime(new Date());
		postService.insertOrUpdate(newMsg);
		
		newMsg.setContent(userInputText);
		
		postService.insertOrUpdate(newMsg);
		
		Page<PostBean>page=postService.findByPostPage(1);
		return page;
		
	}
	
	
	
		
	
	
	
	
	
	
	
	
	
//	//從程式裡新增
//	@ResponseBody
//	@GetMapping("/insertPost2")
//	public PostBean insert2() {
//		PostBean p1 = new PostBean();
//		p1.setContent("第二次測試貼文內容");
//		PostBean res = postDao.save(p1);
//		return res;
//	}
	
	//從外面丟進來新增
//	@ResponseBody
//	@PostMapping("/insertPost3")
//	public PostBean insert3(@RequestBody PostBean postBean) {
//		return postDao.save(postBean);
//	}
//	
//	//新增多個
//	@ResponseBody
//	@PostMapping("/insertPost4")
//	public List<PostBean> insert4(@RequestBody List<PostBean> postBeanList) {
//		return postDao.saveAll(postBeanList);
//	}
//	
//	@ResponseBody
//	@PostMapping("/All")
//	public List<PostBean> getAll(){
//		return postDao.findAll();
//	}
//	
//	@ResponseBody
//	@GetMapping("/findId/{id}")
//	public PostBean findById(@PathVariable Integer id){
//		Optional<PostBean> optional = postDao.findById(id);
//		
//		if(optional.isPresent()) {
//			PostBean returnData = optional.get();
//			return returnData;
//		}
//		
//		PostBean errorMsg = new PostBean();
//		errorMsg.setContent("沒有此筆資料");
//		
//		return errorMsg;
//		
//	}
//	 
////	@ResponseBody
////	@GetMapping("/find/P/{pageNumber}")
////	public List<PostBean> findByPage(@PathVariable Integer pageNumber){
////		Pageable pgb = PageRequest.of(pageNumber-1, 3,Direction.DESC,"posttime");
////		Page<PostBean> page=postDao.findAll(pgb);
////		return page.getContent();
////		
////	}
//	
//	
////	可送多個參數@RequestParam(name = "p"....
////	若加載失敗預設值會跑第1頁 defaultValue = "1"
////	若加載失敗不會報錯required = false
//	@ResponseBody
//	@GetMapping("/find/page")
//	public List<PostBean> findByPage(@RequestParam(name = "p" ,required = false,defaultValue = "1") Integer pageNumber){
//		Pageable pgb = PageRequest.of(pageNumber-1, 3,Direction.DESC,"posttime");
//		Page<PostBean> page=postDao.findAll(pgb);
//		return page.getContent();
//		
//	}
//	
//	@ResponseBody
//	@GetMapping("/find/content")
//	public List<PostBean> findpostBycontent(@RequestParam(name = "c") String content){
//		return postDao.findpostBycontent(content);
//	}
//	
//	
//	@ResponseBody
//	@GetMapping("/find/like/content")
//	public List<PostBean> findpostLikecontent(@RequestParam(name = "c") String content){
//		return postDao.findpostLikecontent(content);
//		
//	}
//	
//	@ResponseBody
//	@GetMapping("/delete/{postid}")
//	public String deletepostBypostid(@PathVariable("postid") Integer postid) {
//		postDao.deletepostBypostid(postid);
//		return "刪除OK";
//	}
//	 @PostMapping("/{postId}/replies")
//    public String createReply(@PathVariable Long postId, @ModelAttribute Reply reply, RedirectAttributes attrs) {
//        reply.setPostId(postId);
//        replyService.create(reply);
//        attrs.addFlashAttribute("message", "新增貼文回復成功");
//        return "redirect:/posts/" + postId;
//    }
//
//    @DeleteMapping("/{postId}/replies/{replyId}")
//    public String deleteReply(@PathVariable Long postId, @PathVariable Long replyId, RedirectAttributes attrs) {
//        replyService.delete(replyId);
//        attrs.addFlashAttribute("message", "刪除貼文回復成功");
//        return "redirect:/posts/" + postId;
//    }
//
//
// @GetMapping
//    public String index(Model model) {
//        List<Post> posts = postsService.findAll();
//        model.addAttribute("posts", posts);
//        return "posts/post-list";
//    }
//
//    @GetMapping("/new")
//    public String newPost(Model model) {
//        model.addAttribute("post", new Post());
//        return "posts/post-new";
//    }
//
//    @GetMapping("/{id}")
//    public String show(@PathVariable Long id, Model model) {
//        Post post = postsService.findById(id);
//        List<Reply> replies = replyService.findByPostId(id);
//        model.addAttribute("post", post);
//        model.addAttribute("replies", replies);
//        return "posts/post-detail";
//    }
//
//  
//
//    @PostMapping
//    public String create(@ModelAttribute Post post, RedirectAttributes attrs) {
//        postsService.create(post);
//        attrs.addFlashAttribute("message", "新增貼文成功");
//        return "redirect:/posts";
//    }
//
//    @PutMapping("/{id}")
//    public String update(@PathVariable Long id, @ModelAttribute Post post, RedirectAttributes attrs) {
//        post.setId(id);
//        postsService.update(post);
//        attrs.addFlashAttribute("message", "更新貼文成功");
//        return "redirect:/posts";
//    }
//
//    @DeleteMapping("/{id}")
//    public String delete(@PathVariable Long id, RedirectAttributes attrs) {
//        postsService.delete(id);
//        attrs.addFlashAttribute("message", "刪除貼文成功");
//        return "redirect:/posts";
//
//
//    }
//	

}
