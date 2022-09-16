package com.pj.gabozago.controller;

import java.awt.image.BufferedImage;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.security.NoSuchAlgorithmException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.codec.binary.Base64;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.pj.gabozago.common.SharedScopeKeys;
import com.pj.gabozago.common.UUIDGenerator;
import com.pj.gabozago.domain.JoinDTO;
import com.pj.gabozago.exception.ControllerException;
import com.pj.gabozago.service.MemberService;

import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;


@Log4j2
@NoArgsConstructor

@Controller 
@RequestMapping("/join") 
public class JoinController { 
	
	@Setter(onMethod_ = @Autowired)
	private MemberService service;
	
	@GetMapping("")
	public String join() {
		log.trace("join() invoked.");
		
		return "/join/join";
	}// join

	// 회원가입
	@PostMapping("/joinProcess")
	public String joinProcess(
			JoinDTO dto, // 사용자 정보 일반 전송 파라미터
			MultipartFile profileImg, // 사용자 프로필 이미지
			RedirectAttributes rttrs, 
			HttpServletRequest req) throws ControllerException { 
		
		log.info("joinProcess({}, {}, {}, {}) invoked.", dto, profileImg, rttrs, req);
		
		String profilePath = "";
		
		// 프로필 사진을 업로드한 경우
		if(profileImg.getSize() != 0) {
			// String targetDir = req.getServletContext().getRealPath("/resources/member/img/profile/"); // 상대 경로 지정
			// String targetDir = req.getServletContext().getRealPath("/upload/"); // 상대 경로 지정
			// String targetDir = "/resources/member/img/profile";
			// String targetDir = req.getSession().getServletContext().getRealPath("/");
			// String targetDir = System.getProperty("user.dir") + "/src/main/resources/static/profile/";
			 String targetDir = System.getProperty("user.home") + "/finalgabozago/profile/";
			
//			String targetDir = this.savePath; // 임시 보관장소로 이용해보기

			try {
				String base64 = convertBinary(profileImg);
				log.info(">>>>>>>>>>>> base64: ", base64);
			} catch (Exception e) {
				throw new ControllerException(e);
			}// try-catch

			log.info(">>>>>>>>>>>>>>>> 1. targetDir: {}", targetDir);
			
			Date today = new Date();
			SimpleDateFormat changer = new SimpleDateFormat("yyyyMMdd");
			String dateName = changer.format(today);
			
			log.info(">>>>> file 원본 이름: {}", profileImg.getOriginalFilename());
			log.info(">>>>> file 사이즈: {}", profileImg.getSize());

			targetDir += dateName + "/";

			File dir = new File(targetDir);
			
			if(!dir.exists()) {
				dir.mkdirs();
			}// if
			log.info(">>>>>>>>>>>>>>>> 2. targetDir 생성 완료: {}", targetDir);
			
			try {
				String fileFullName = profileImg.getOriginalFilename();
				String targetFile = targetDir + UUIDGenerator.generateUniqueKeysWithUUIDAndMessageDigest()
					+ fileFullName.substring(fileFullName.lastIndexOf("."));
								
				log.info(">>>>> targetFile: {}", targetFile);

				profilePath = targetFile;
					
				// profileImg.transferTo(new File(targetDir));
								
				InputStream is = profileImg.getInputStream();
				BufferedInputStream bis = new BufferedInputStream(is);
				
				FileOutputStream fos = new FileOutputStream(targetFile);
				BufferedOutputStream bos = new BufferedOutputStream(fos);
				
				try(is; bis; fos; bos;){
					byte[] buf = new byte[300];
					
					int readBytes = 0;
					
					while((readBytes = bis.read(buf)) != -1) {
						bos.write(buf, 0, readBytes);
					}// while
					
					bos.flush();
					log.info(">>>>> 파일 업로드 완료");
				}// try-with-resources
				
			} catch (NoSuchAlgorithmException | IOException e) {
				throw new ControllerException(e);
			}// try-catch
			
		}// if
		
		dto.setProfilePath(profilePath);
		log.info(">>>>> dto.setProfilePath({}) 수행 완료", profilePath);

		try { 
			log.info("this.service.create(dto) 수행 시작합니다.");
			if(this.service.create(dto)) { // 회원가입 성공
				log.info(">>>>> 회원가입 성공");

				rttrs.addFlashAttribute(SharedScopeKeys.RESULT_KEY, "회원가입에 성공하였습니다."); 
				return "redirect:/login";
			} else{ // 회원가입 실패
				rttrs.addFlashAttribute(SharedScopeKeys.RESULT_KEY, "회원가입에 실패하였습니다.");
				return "redirect:/join";
			}// if-else
			
		}catch(Exception e) {
			throw new ControllerException(e);
		}// try-catch
		
	}// joinProcess
	

	 public String convertBinary(MultipartFile files) throws Exception{
	        String fileName = StringUtils.cleanPath(files.getOriginalFilename()) ;
	        BufferedImage image = ImageIO.read(files.getInputStream());
	        ByteArrayOutputStream baos = new ByteArrayOutputStream();
	        ImageIO.write(image, fileName.substring(fileName.lastIndexOf(".") + 1), baos);
	        
	        return new String(Base64.encodeBase64(baos.toByteArray()));
	}// convertBinary
	 
//	public String fileToString(File file) {
//		
//          String fileString = new String();
//          FileInputStream inputStream = null;
//          ByteArrayOutputStream byteOutStream = null;
//          
//          try {
//              inputStream = new FileInputStream(file);
//              int len = 0;
//              byte[] buf = new byte[1024];
//              while ((len = inputStream.read(buf)) != -1) {
//            	  byteOutStream.write(buf, 0, len);
//              }
//              byte[] fileArray = byteOutStream.toByteArray();
//              fileString = new String(Base64.encodeBase64(fileArray));
//          } catch (IOException e) {
//              e.printStackTrace();
//          } finally {
//              try {
//            	  inputStream.close();
//              } catch (IOException e) {
//                  e.printStackTrace();
//              }
//              try {
//            	  byteOutStream.close();
//              } catch (IOException e) {
//                  e.printStackTrace();
//              }
//          }
//
//          return fileString;
//          
//      }	
	
}// end class
