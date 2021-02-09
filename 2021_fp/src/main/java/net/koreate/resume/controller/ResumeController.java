package net.koreate.resume.controller;

import java.io.File;
import java.io.IOException;

import javax.annotation.PostConstruct;
import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
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
	@Resource(name = "uploadFolder")
	String uploadFolder;
	@Autowired
	ServletContext context;

	@PostConstruct
	public void initController() {

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
		System.out.println(vo);
		HttpSession session = req.getSession();
		MultipartFile portfolio = mhsr.getFile("portfoliofile");
		String portfolioFileName = uploadPortfolio(vo.getName(), portfolio.getBytes()); 
		vo.setPortfolio(portfolioFileName);
		
//		if(vo.getPic() != null) {
//		  사진란 만들어야함
//		  MultipartFile pic = mhsr.getFile("picfile"); 
//		  String picFileName = uploadPortfolio(vo.getName(), pic.getBytes());
//		  vo.setPic(picFileName);
//		}
		
		
		//후에 인터셉터로 만들면 좋을꺼같습니다.
		if(session.getAttribute("userInfo") != null) {
			UserVO user = (UserVO) session.getAttribute("userInfo");
			vo.setRno(user.getUno());
		}else {
//			System.out.println("로그인 정보 없시 로그인 화면으로 리다이렉트");
//			return "redirect:/member/login";
		}
		
		try {
			rs.insert(vo);
		} catch (Exception e) {
			rttr.addFlashAttribute("message", "입력에 실패하였습니다.");
			return "redirect:/resume/resumeWrite";
		}
		
		rttr.addFlashAttribute("resume", vo);
		//나중에 readResume 로 변경 예정
		return "redirect:/resume/resumeResult";
	}
	@RequestMapping("resumeResult")
	public String resumeResult() {
		return "resume/resumeResult";
	}

	@GetMapping("/resumeList")
	public String resumeList(SearchCriteria cri, Model model) throws Exception {
		System.out.println("ResumeList");
		model.addAttribute("likeList", rs.likeList(cri));
		model.addAttribute("list", rs.list(cri));
		model.addAttribute("pm", rs.getPageMaker(cri));
		return "resume/resumeList";
	}

	@GetMapping("/readResume")
	public String readResume(int rno, Model model) throws Exception {
		System.out.println("readResume");
		model.addAttribute("resume", rs.select(rno));
		return "resume/readResume";
	}

	@PostMapping("/update")
	public String updateResume(ResumeVO vo, RedirectAttributes rttr) throws Exception {
		rttr.addFlashAttribute("resume", rs.update(vo));
		return "redirect:/readResume";
	}

	public String uploadPortfolio(String userName, byte[] fileData) throws IOException {
		String savedName = "JOBMANY_Resume_Portfolio_";
		savedName += userName+".zip";
		System.out.println("savedName : " + savedName);
		File file = new File(uploadFolder, savedName);
		FileCopyUtils.copy(fileData, file);
		return savedName;
	}

	public String uploadPicture(String userName, byte[] fileData) throws IOException {
		String savedName = "JOBMANY_Resume_Picture_";
		savedName += userName;
		System.out.println("savedName : " + savedName);
		File file = new File(uploadFolder, savedName);
		FileCopyUtils.copy(fileData, file);
		return savedName;
	}
}
