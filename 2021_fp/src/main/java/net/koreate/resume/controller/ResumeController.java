package net.koreate.resume.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import net.koreate.member.vo.UserVO;
import net.koreate.resume.service.ResumeService;
import net.koreate.resume.vo.ResumeVO;
import net.koreate.util.SearchCriteria;

@Controller
@RequestMapping("resume")
public class ResumeController {

	@Inject
	ResumeService rs;

	@GetMapping("/resume")
	public String resume(HttpSession session,Model model) throws Exception {
		UserVO user = (UserVO)session.getAttribute("userInfo");
		if(user == null) {
			return "redirect:/member/login";
		}
		ResumeVO resume = rs.select(user.getUno());
		if(resume != null) {
			SearchCriteria cri = new SearchCriteria();
			return readResume(resume.getRno(), cri, model,session);
		}
		return "resume/resume";
	}

	@PostMapping("/resumeWrite")
	public String resume(ResumeVO vo,RedirectAttributes rttr,HttpServletRequest req, MultipartHttpServletRequest mhsr,Model model) throws Exception {
		HttpSession session = req.getSession();
		UserVO user = (UserVO) session.getAttribute("userInfo");
		//후에 인터셉터로 만들면 좋을꺼같습니다.
		SearchCriteria cri = new SearchCriteria();
		if(rs.select(user.getUno()) != null) {
	         return readResume(user.getUno(),cri,model,session);
	      }
		try {
			rs.insert(vo,mhsr,user);
		} catch (Exception e) {
			rttr.addFlashAttribute("message", "입력에 실패하였습니다.");
			return "redirect:/resume/resume";
		}
		
		return "redirect:/resume/resumeList";
	}
	

	@GetMapping("/resumeList")
	public String resumeList(@ModelAttribute("cri")SearchCriteria cri, Model model) throws Exception {
		Map<String,Object> map = rs.list(cri);
		model.addAllAttributes(map);
		return "resume/resumeList";
	}

	@GetMapping("/readResume")
	public String readResume(int rno,RedirectAttributes rttr,SearchCriteria cri) throws Exception {
		rs.updateViews(rno);
		rttr.addAttribute("rno",rno);
		rttr.addAttribute("page",cri.getPage());
		rttr.addAttribute("perPageNum",cri.getPerPageNum());
		rttr.addAttribute("searchType",cri.getSearchType());
		rttr.addAttribute("keyword",cri.getKeyword());
		return "redirect:/resume/read";
	}
	
	@GetMapping("/read")
	public String readResume(int rno,@ModelAttribute("cri")SearchCriteria cri,Model model,HttpSession session) throws Exception {
		UserVO user = (UserVO)session.getAttribute("userInfo");
		if(user != null) {
			model.addAttribute("likeYN", rs.likeYN(rno,user.getUno()));	
		}
		model.addAttribute("resume", rs.select(rno));
		model.addAttribute("cri", cri);
		return "resume/readResume";
	}

	@GetMapping("/updateResume")
	public ModelAndView updateResume(@RequestParam("rno")int rno, ModelAndView mav) throws Exception {
		mav.addObject("resume", rs.select(rno));
		mav.setViewName("resume/updateResume");
		return mav;
	}
	@PostMapping("/updateResume")
	public ModelAndView updateResume(ResumeVO vo, ModelAndView mav,MultipartHttpServletRequest mhsr) throws IOException {
		try {
			rs.update(vo,mhsr);
			mav.addObject("resume", vo);
			mav.addObject("message", "회원 수정 완료 되었습니다.");
			mav.setViewName("resume/readResume");
		} catch (Exception e) {
			e.printStackTrace();
			mav.addObject("message", "회워수정 실패");
			mav.setViewName("resume/updateResume");
		}
		return mav;
	}
	
	
	@PostMapping(value="/showhide/{rno}", produces="text/plain; charset=utf-8")
	@ResponseBody
	public ResponseEntity<String> showhide(@PathVariable("rno")int rno) throws Exception{
		ResponseEntity<String> entity = null;
		if(rs.showHide(rno)) {
			entity = new ResponseEntity<String>("비공개 설정",HttpStatus.OK);
		}else {
			entity = new ResponseEntity<String>("공개 설정",HttpStatus.OK);
		}
		return entity;
	}
	
	@PostMapping(value = "/like/{rno}", produces = "text/plain; charset=utf-8")
	@ResponseBody
	public ResponseEntity<String> likeClick(@PathVariable("rno")int rno,HttpSession session) throws Exception{
		ResponseEntity<String> entity = null;
		UserVO user = (UserVO)session.getAttribute("userInfo");
		if(user == null) {
			entity = new ResponseEntity<String>("로그인 후 이용해주시기 바랍니다.",HttpStatus.OK);
			return entity;
		}
		if(rs.like(rno,user.getUno())) {
			entity = new ResponseEntity<String>("좋아요😀😀",HttpStatus.OK);	
		}else {
			entity = new ResponseEntity<String>("좋아요 취소😥😥",HttpStatus.OK);
		}
		return entity;
	}
	
	@GetMapping("/mainList")
	@ResponseBody
	public ResponseEntity<List<ResumeVO>> mainList(){
		ResponseEntity<List<ResumeVO>> entity = null;
		List<ResumeVO> list = rs.mainList();  
		return entity = new ResponseEntity<List<ResumeVO>>(list,HttpStatus.OK);
	}
	
	
	
	
	
	
	
	
	
	
	
}

