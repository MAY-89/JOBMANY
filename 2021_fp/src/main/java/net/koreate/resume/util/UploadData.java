package net.koreate.resume.util;

import java.io.File;
import java.io.IOException;

import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

public class UploadData {
	
	
	public String uploadFile(String uploadFolder, String userName, MultipartFile data) throws IOException {
		String savedName = "";
		String tail = data.getOriginalFilename().substring(data.getOriginalFilename().lastIndexOf("."));
		System.out.println("tailasdasd : "+tail);
		if(tail.equals(".zip")) {
			savedName = "JOBMANY_Resume_Portfolio_";
		}else {
			savedName = "JOBMANY_Resume_profilePicture_";
		}
		savedName += userName+tail;
		System.out.println("savedName : " + savedName);
		File file = new File(uploadFolder, savedName);
		FileCopyUtils.copy(data.getBytes(), file);
		return savedName;
	}

	
	
	
}
