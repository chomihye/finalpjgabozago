package com.pj.gabozago.service;

import java.sql.Timestamp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.pj.gabozago.common.EmailSender;
import com.pj.gabozago.domain.EmailDTO;
import com.pj.gabozago.domain.JoinDTO;
import com.pj.gabozago.domain.LoginDTO;
import com.pj.gabozago.domain.MemberVO;
import com.pj.gabozago.exception.MemberException;
import com.pj.gabozago.exception.ServiceException;
import com.pj.gabozago.mapper.MemberMapper;

import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@Log4j2
@NoArgsConstructor

@Service("memberService")
public class MemberServiceImpl implements MemberService {
	
	
	@Setter(onMethod_=@Autowired)
	private MemberMapper mapper;
	
	@Setter(onMethod_=@Autowired)
    private EmailSender emailSender;
	
	@Setter(onMethod_=@Autowired)
	private MessageService messageService;	 // 
	
	@Override
	public boolean create(JoinDTO dto) throws ServiceException {
		log.trace("create() invoked.");

		try {
			// 비밀번호 해시처리
			String pw = dto.getPassword() + "__SALT__";
			BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
			
			String cipherPw = encoder.encode(pw);
			
			dto.setPassword(cipherPw);
			
			// 프로필 사진 업로드			
			return this.mapper.insert(dto) == 1;
		} catch (MemberException e) {
			throw new ServiceException(e);
		}// try-catch
		
	}// create

	@Override
	public MemberVO login(LoginDTO dto) throws ServiceException {
		log.trace("login() invoked.");
		
		try {						
			return this.mapper.selectUser(dto);
		} catch (MemberException e) {
			throw new ServiceException(e);
		}// try-catch
	}// login
	
	@Override
	public boolean modifyUserWithRememberMe(Integer idx, String rememberMe, Timestamp rememberAge) throws ServiceException {
		log.trace("modifyUserWithRememberMe() invoked.");
		
		try {
			return this.mapper.updateUserWithRememberMe(idx, rememberMe, rememberAge) == 1;		
		} catch (MemberException e) {
			throw new ServiceException(e);
		}// try-catch
	}// modifyUserWithRememberMe
	
	@Override
	public MemberVO findUserByRememberMe(String rememberMe) throws ServiceException {
		log.trace("findUserByRememberMe({}) invoked.", rememberMe);
		
		try {
			return this.mapper.selectUserByRememberMe(rememberMe);
		} catch (Exception e) {
			throw new ServiceException(e);
		}// try-catch
	}// findUserByRememberMe

	@Override
	public String findUserIdByPhone(String phone) throws ServiceException {
		log.trace("findUserIdByPhone({}) invoked.", phone);

		try {
			return this.mapper.selectUserIdByPhone(phone);
		} catch (MemberException e) {
			throw new ServiceException(e);
		}// try-catch
	}// findUserIdByPhone

	@Override
	public String findUserPwByEmail(String email) throws ServiceException {
		log.trace("findUserPwByEmail({}) invoked.", email);
		
		try {
			return this.mapper.selectUserIdByEmail(email);
		} catch (MemberException e) {
			throw new ServiceException(e);
		}// try-catch
	}// findUserPwByEmail

	@Override
	public String findUserPwByPhone(String phone) throws ServiceException {
		log.trace("findUserIdByPhone({}) invoked.", phone);
		
		try {
			return this.mapper.selectUserPhoneByPhone(phone);
		} catch (MemberException e) {
			throw new ServiceException(e);
		}// try-catch	
	}

	@Override
	public boolean modifyUserforFindPwWithEmail(String email, String uid, String password) throws ServiceException {
		log.trace("modifyUserforFindPwWithEmail({}, {}) invoked.", email, password);
		
		try {
			EmailDTO mail = new EmailDTO();
	        mail.setReceiver(email);
	        mail.setSubject("[가보자고] 임시 비밀번호 발송");
	        mail.setContent(new StringBuffer().
	        		append("임시 비밀번호는 [").
	        		append(uid).
	        		append("] 입니다. 로그인 후 꼭 비밀번호 변경을 해주세요.").
	        		toString());
	        
	        emailSender.SendEmail(mail);
			
			return this.mapper.updateUserforFindPwWithEmail(email, password) == 1;
		} catch (Exception e) {
			throw new ServiceException(e);
		}// try-catch	
	}// modifyUserforFindPwWithEmail

	
	@Override
	public boolean modifyUserforFindPwWithPhone(String phone, String uid, String password) throws ServiceException {
		log.trace("modifyUserforFindPwWithPhone({}, {}) invoked.", phone, password);
		
		try {
			// 문자 발송 로직
			this.messageService.sendMessage(phone, uid);
			
			return this.mapper.updateUserforFindPwWithPhone(phone, password) == 1;
		} catch (Exception e) {
			throw new ServiceException(e);
		}// try-catch	
	}// modifyUserforFindPwWithPhone
}// end class
