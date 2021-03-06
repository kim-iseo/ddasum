package kr.or.ddasum.file.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kr.or.ddasum.file.model.service.FileService;
import kr.or.ddasum.file.model.vo.MemberCard;
import kr.or.ddasum.file.model.vo.FileData;
import kr.or.ddasum.member.model.vo.Member;

@Controller
public class FileController {
	
	@Autowired
	private FileService fService;
	
	@Autowired
	private ServletContext context;
	
	@RequestMapping(value = "/file/fileUpload.do",method = RequestMethod.POST )
	public void fileUpload(HttpServletRequest request, HttpServletResponse response, @SessionAttribute Member member) throws IOException{
		
		/*String uploadPath = "/WEB-INF/upload/userProfile"; */
		 String uploadPath = "/resources/images/userProfile"; 
		
		
		String uploadFilePath = context.getRealPath(uploadPath);
		
		int uploadFileSize = 20*1024*1024;
		
		String encType = "UTF-8";
		
		MultipartRequest multi = new MultipartRequest(request,
														uploadFilePath,
														uploadFileSize,
														encType,
														new DefaultFileRenamePolicy());
		
		String originalFileName = multi.getFilesystemName("uploadFile");
		
		int userNo = member.getUserNo();
		
		long currentTime = Calendar.getInstance().getTimeInMillis();
		
		
		/*
		 * File file = new File(uploadFilePath +"\\"+originalFileName);
		 * file.renameTo(new File(uploadFilePath+"\\"+currentTime));
		 */
		
		
		String changeFileName = currentTime +userNo+ "_ddasum"; 
		
		
		File reNameFile = new File("\\resources\\images\\userProfile\\"+originalFileName); 
		 /*File reNameFile = new File(uploadFilePath+"\\"+originalFileName); */
		String filePath = reNameFile.getPath();
		 
		long fileSize = reNameFile.length();
		
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss.SSS");
		Timestamp uploadTime = Timestamp.valueOf(format.format(currentTime));
		
		FileData fd = new FileData();
		fd.setpOriginal(originalFileName);
		fd.setpChange(changeFileName);
		fd.setpFilePath(filePath);
		fd.setpFileSize(fileSize);
		fd.setUserNo(userNo);
		fd.setpFileUpdate(uploadTime);
		
		int result1 = fService.insertUploadFile(fd);
		
		 member.setpImage(filePath);
		
		 int result2 = 0;
		 if(result1>0) {
			 result2 = fService.memberPImage(member);
		}
		
		if(result2 >0) {
			response.getWriter().print("true");
		}else {
			response.getWriter().print("false");
		}
	}

		
	@RequestMapping(value = "/file/enrollMentImgUpload.do", method = RequestMethod.POST )
	public void enrollMentImgUpload(HttpServletRequest request, HttpServletResponse response, @SessionAttribute Member member) throws IOException{
	
		String uploadPath = "/resources/images/enrollMentImg"; 
		
		
		String uploadFilePath = context.getRealPath(uploadPath);
		
		int uploadFileSize = 20*1024*1024;
		
		String encType = "UTF-8";
		
		MultipartRequest multi = new MultipartRequest(request,
														uploadFilePath,
														uploadFileSize,
														encType,
														new DefaultFileRenamePolicy());
		
		String originalFileName = multi.getFilesystemName("enrollMentImgFIle");
		
		int userNo = member.getUserNo();
		
		long currentTime = Calendar.getInstance().getTimeInMillis();
		
		
		/*
		 * File file = new File(uploadFilePath +"\\"+originalFileName);
		 * file.renameTo(new File(uploadFilePath+"\\"+currentTime));
		 */
		
		
		String changeFileName = currentTime +userNo+ "_ddasum"; 
		
		
		File reNameFile = new File("\\resources\\images\\enrollMentImg\\"+originalFileName); 
		 /*File reNameFile = new File(uploadFilePath+"\\"+originalFileName); */
		String filePath = reNameFile.getPath();
		 
		long fileSize = reNameFile.length();
		
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss.SSS");
		Timestamp uploadTime = Timestamp.valueOf(format.format(currentTime));
		
		MemberCard c = new MemberCard();
		c.setcOriginal(originalFileName);
		c.setcChange(changeFileName);
		c.setcFilePath(filePath);
		c.setcFileSize(fileSize);
		c.setUserNo(userNo);
		c.setcFileUpdate(uploadTime);
	
		int result1 = fService.enrollMentImgUpload(c);
		
		 member.setCdImage(filePath);
		
		int result2 = 0;
		 if(result1>0) {
			 result2 = fService.memberCardImage(member);
		}
		 
		if(result2 >0) {
			response.getWriter().print("true");
		}else {
			response.getWriter().print("false");
		}
	}
	
}
