package net.koreate.resume.controller;

import java.io.File;
import java.io.IOException;
import java.util.Map;

import javax.annotation.PostConstruct;
import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import net.koreate.resume.service.ResumeServiceImpl;
import net.koreate.resume.util.UploadData;
import net.koreate.resume.vo.ResumeVO;
import net.koreate.util.SearchCriteria;

@Controller
@RequestMapping("resume")
public class ResumeController {

	@Inject
	ResumeServiceImpl rs;
	@Resource(name = "uploadFolder")
	String uploadFolder;
	@Autowired
	ServletContext context;
	UploadData ud;
	
	@PostConstruct
	public void initController() {
		ud = new UploadData();
		uploadFolder = context.getRealPath(File.separator + uploadFolder);
		System.out.println("업로드 경로 : "+uploadFolder);
		File file = new File(uploadFolder);
		if (!file.exists()) {
			file.mkdirs();
			System.out.println("파일 경로 생성완료");
		}
	}

	@GetMapping("/resume")
	public String resume() {
		System.out.println("resume 쓰기");
		return "resume/resume";
	}

	@PostMapping("/resumeWrite")
	public String resume(ResumeVO vo,RedirectAttributes rttr,HttpServletRequest req, MultipartHttpServletRequest mhsr) throws IOException {
		HttpSession session = req.getSession();
		if(!mhsr.getFile("portfoliofile").isEmpty()) {
			MultipartFile portfolio = mhsr.getFile("portfoliofile");
			String portfolioFileName = ud.uploadFile(uploadFolder,Integer.toString(vo.getRno()), portfolio);
			vo.setPortfolio(portfolioFileName);
		}
		
		if(!mhsr.getFile("profilePic").isEmpty()) {
			MultipartFile profile = mhsr.getFile("profilePic");
			String profileName = ud.uploadFile(uploadFolder, Integer.toString(vo.getRno()), profile);
			vo.setPic(profileName);
		}
		
		//후에 인터셉터로 만들면 좋을꺼같습니다.
		if(session.getAttribute("userInfo") != null) {
//			UserVO user = (UserVO) session.getAttribute("userInfo");
//			vo.setRno(user.getUno());
		}else {
//			System.out.println("로그인 정보 없시 로그인 화면으로 리다이렉트");
//			return "redirect:/member/login";
		}
		
		try {
			vo.setRno(11111);//로그인 된 아이디가 있으면 필요없음
			rs.insert(vo);
			System.out.println("이력서 db 삽입 완료");
		} catch (Exception e) {
			rttr.addFlashAttribute("message", "입력에 실패하였습니다.");
			System.out.println("이력서 db 삽입 실패");
			e.printStackTrace();
			return "redirect:/resume/resume";
		}
		
		return "redirect:/resume/resumeList";
	}
	

	@GetMapping("/resumeList")
	public String resumeList(@ModelAttribute("cri")SearchCriteria cri, Model model) throws Exception {
		System.out.println("ResumeList");
		System.out.println(cri);
		Map<String,Object> map = rs.list(cri);
		model.addAllAttributes(map);
		return "resume/resumeList";
	}

	@GetMapping("/readResume")
	public String readResume(int rno,RedirectAttributes rttr,SearchCriteria cri) throws Exception {
		rs.updateViews(rno);
		System.out.println("조회수 증가");
		rttr.addAttribute("rno",rno);
		rttr.addAttribute("page",cri.getPage());
		rttr.addAttribute("perPageNum",cri.getPerPageNum());
		rttr.addAttribute("searchType",cri.getSearchType());
		rttr.addAttribute("keyword",cri.getKeyword());
		return "redirect:/resume/read";
	}
	
	@GetMapping("/read")
	public String readResume(int rno,Model model,@ModelAttribute("cri")SearchCriteria cri) throws Exception {
		System.out.println("readResume");
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
	public ModelAndView updateResume(ResumeVO vo, ModelAndView mav,MultipartHttpServletRequest mhsr) throws Exception {
		
		if(!mhsr.getFile("portfoliofile").isEmpty()) {
			MultipartFile portfolio = mhsr.getFile("portfoliofile");
			String portfolioFileName = ud.uploadFile(uploadFolder,Integer.toString(vo.getRno()), portfolio);
			vo.setPortfolio(portfolioFileName);
		}
		
		if(!mhsr.getFile("profilePic").isEmpty()) {
			MultipartFile profile = mhsr.getFile("profilePic");
			String profileName = ud.uploadFile(uploadFolder, Integer.toString(vo.getRno()), profile);
			vo.setPic(profileName);
		}
		
		mav.addObject("resume", vo);
		mav.setViewName("resume/updateResume");
		return mav;
	}
	
	
	@GetMapping("/showhide")
	public String showhide(@PathVariable(name="rno")int rno) throws Exception{
		rs.showHide(rno);
		return "redirect:/resume/resumeList";
	}
	
	
	
	
	
	
	
	
	
	
	
	
}

