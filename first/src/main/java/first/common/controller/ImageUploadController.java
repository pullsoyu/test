package first.common.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class ImageUploadController {
	Logger log = Logger.getLogger(this.getClass());
	
	@ResponseBody
	@RequestMapping("imageUpload.do")
	public void imageUpload(HttpServletRequest request,
			HttpServletResponse response,
			@RequestParam MultipartFile upload)
	throws Exception{
		//http header 설정
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		//http body
		//업로드한 파일 이름
		String fileName=upload.getOriginalFilename();
		//바이트 배열로 변환
		byte[] bytes=upload.getBytes();
		//이미지를 업로드할 디렉토리(배포 경로로 설정,절대경로??)
		String uploadPath = 
				request.getSession().getServletContext().getRealPath("/")+"/resources/CKimg/";
		
		
		//서버에 저장됨
		OutputStream out=new FileOutputStream(
				new File(uploadPath + fileName)); //java.io		

		
		//세션에 파일이름 올리기
		request.getSession().setAttribute("uploadFileName", fileName);
		System.out.println("파일이름 : " + fileName);
		
		out.write(bytes);
		String callback=request.getParameter("CKEditorFuncNum");
		PrintWriter printWriter=response.getWriter();
		String fileUrl
			=request.getContextPath()+"/resources/CKimg/"+fileName;
		System.out.println("fileUrl:"+fileUrl);
		printWriter.println(
				"<script>window.parent.CKEDITOR.tools.callFunction("
				+ callback+",'"+fileUrl+"','이미지가 업로드되었습니다.')"
				+ "</script>");
		//스트림 닫기
		printWriter.flush();
		
		
	}
	
	
	
}
