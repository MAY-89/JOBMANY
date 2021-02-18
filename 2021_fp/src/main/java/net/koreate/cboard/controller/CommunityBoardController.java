package net.koreate.cboard.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import net.koreate.cboard.service.CommunityBoardService;
import net.koreate.cboard.service.CommunityCommentService;
import net.koreate.cboard.service.CommunityLikeyService;
import net.koreate.cboard.vo.CommunityBoardVO;
import net.koreate.cboard.vo.CommunityCommentVO;
import net.koreate.member.vo.UserVO;
import net.koreate.util.SearchCriteria;

@Controller
@RequestMapping("community")
public class CommunityBoardController {

	@Inject
	CommunityBoardService cbs;
	@Inject
	CommunityCommentService ccs;
	@Inject
	CommunityLikeyService cls;

	@GetMapping("/list")
	public ModelAndView list(ModelAndView mav, @ModelAttribute("cri") SearchCriteria cri) throws Exception {

		System.out.println("list : " + cri);
		cri.setPerPageNum(4);
		mav.addObject("list", cbs.listReplyCriteria(cri));
		mav.addObject("pm", cbs.getPageMaker(cri));
		mav.setViewName("community/list");
		return mav;
	}

	@GetMapping("/write")
	public String write() throws Exception {
		return "community/write";
	}

	@PostMapping("/write")
	public String write(CommunityBoardVO vo, HttpSession session) throws Exception {
		UserVO user = (UserVO)session.getAttribute("userInfo");
		System.out.println(vo);
		vo.setUno(user.getUno());
		vo.setCbwriter(user.getUname());
		cbs.regist(vo);
		return "redirect:/community/list";
	}
	
	@PostMapping("/writeComment")
	public String writeComment(CommunityCommentVO vo, HttpSession session) throws Exception{
		UserVO user = (UserVO)session.getAttribute("userInfo");
		System.out.println("댓글 정보 : "+vo);
		vo.setCcwriter(user.getUname());
		vo.setUno(user.getUno());
		ccs.addComment(vo);
		return "redirect:/community/readDetail?cbno="+vo.getCbno();
	}
	

	@GetMapping("/read")
	public String read(@RequestParam("cbno") int cbno, SearchCriteria cri, RedirectAttributes rttr) throws Exception {
		cbs.updateCnt(cbno);
		System.out.println("========= read page =======");
		System.out.println(cri);
		System.out.println(cbno);
		System.out.println("===========================");
		rttr.addAttribute("cbno", cbno);
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addAttribute("searchType", cri.getSearchType());
		rttr.addAttribute("keyword", cri.getKeyword());
		return "redirect:/community/readDetail";
	}

	@GetMapping("/readDetail")
	public ModelAndView readDetail(
			@RequestParam("cbno") int cbno, 
			@ModelAttribute("cri") SearchCriteria cri,
			ModelAndView mav, HttpSession session) throws Exception {
		
		UserVO user = (UserVO)session.getAttribute("userInfo");
		
		mav.addObject("commentCount",ccs.listCount(cbno));
		mav.addObject("list",ccs.commentList(cbno));
		
		mav.addObject("likeyYN",cls.LikeyYN(cbno, user.getUno()));
		
		mav.addObject(cbs.readReply(cbno));
		mav.setViewName("community/read");
		
		
		return mav;
	}

	@PostMapping("/remove")
	public String remove(@RequestParam("cbno") int cbno) throws Exception {
		cbs.removeBoard(cbno);
		return "redirect:/community/list";
	}
	
	@RequestMapping("/removeComment")
	public String removeComment(@RequestParam("ccno") int ccno, @RequestParam("cbno") int cbno) throws Exception{
		System.out.println(ccno);
		ccs.delete(ccno);
		return "redirect:/community/readDetail?cbno="+cbno;
	}

	@GetMapping("/modify")
	public ModelAndView modify(@RequestParam("cbno") int cbno, ModelAndView mav) throws Exception {
		
		mav.addObject(cbs.readReply(cbno));
		mav.setViewName("community/modify");
		
		return mav;
	}

	@PostMapping("/modify")
	public String modify(CommunityBoardVO vo) throws Exception {
		cbs.modify(vo);
		return "redirect:/community/list";
	}
	
	
	@PostMapping(value="/like/{cbno}/{uno}", produces = "text/plain; charset=utf-8")
	@ResponseBody
	public void likeClick(@PathVariable("cbno") int cbno, @PathVariable("uno") int uno) throws Exception{
		cls.Likey(cbno, uno);
	}
	
}

