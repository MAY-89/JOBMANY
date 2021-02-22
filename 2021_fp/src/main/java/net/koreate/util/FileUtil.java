package net.koreate.util;

import java.awt.image.BufferedImage;
import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import javax.imageio.ImageIO;

import org.imgscalr.Scalr;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

public class FileUtil {

	String uploadPath;
	
	private static FileUtil utils;
	
	private FileUtil() {};
	
	private FileUtil(String uploadPath) {
		this.uploadPath = uploadPath;
	}
	
	public static FileUtil getInstance(String uploadPath) {
		if(utils == null)utils = new FileUtil(uploadPath);
		
		return utils;
	}
	
	public String uploadFile(MultipartFile file, String folder) throws Exception{
		
		String uploadFolder = folder+File.separator+getDateFoler();
		String originalName = file.getOriginalFilename();
		UUID uid = UUID.randomUUID();
		String saveName = uid.toString().replace("-", "")+"_"+originalName;
		File uploadFileFolder = new File(uploadPath,uploadFolder);
		if(!uploadFileFolder.exists())uploadFileFolder.mkdirs();
		
		String path = uploadPath+File.separator+uploadFolder;
		File upload = new File(path, saveName);
		
		byte[] bytes = file.getBytes();
		FileCopyUtils.copy(bytes, upload);
		
		return makerFileUploadName(uploadFolder,saveName);
	}
	
	
	public String makerFileUploadName(String uploadFolder, String saveName) throws Exception{
		
		String ext = saveName.substring(saveName.lastIndexOf(".")+1);
		
		String uploadName = uploadPath+File.separator+uploadFolder+File.separator+saveName;
		
		File file = new File(uploadPath+File.separator+uploadFolder,saveName);
		
		BufferedImage originImage = ImageIO.read(file);
		
		BufferedImage souceImage = Scalr.resize(
				originImage,
				Scalr.Method.AUTOMATIC,
				Scalr.Mode.FIT_TO_HEIGHT,100);
		
		uploadName = uploadPath+File.separator+uploadFolder+File.separator+"s_"+saveName;
		
		file = new File(uploadName);
		ImageIO.write(souceImage, ext, file);
		uploadName = uploadName.substring(uploadPath.length()).replace(File.separatorChar, '/');
		
		return uploadName;
	}
	
	
	public String getDateFoler() {
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String str = sdf.format(new Date());
		return str.replace("-", File.separator);
	}
}
