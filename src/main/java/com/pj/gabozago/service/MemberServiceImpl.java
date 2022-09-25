package com.pj.gabozago.service;

import java.sql.Timestamp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.pj.gabozago.common.EmailSender;
import com.pj.gabozago.domain.EmailDTO;
import com.pj.gabozago.domain.GoogleDTO;
import com.pj.gabozago.domain.JoinDTO;
import com.pj.gabozago.domain.KakaoDTO;
import com.pj.gabozago.domain.LoginDTO;
import com.pj.gabozago.domain.MemberVO;
import com.pj.gabozago.domain.NaverDTO;
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
	private MessageService messageService;
	
	@Override
	public boolean create(JoinDTO dto) throws ServiceException {
		log.trace("create() invoked.");

		try {
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
			boolean isFoundSuccess = this.mapper.updateUserforFindPwWithEmail(email, password) == 1;
			
			if(isFoundSuccess) {
				EmailDTO mail = new EmailDTO();
				mail.setReceiver(email);
				mail.setSubject("[가보자고] 임시 비밀번호 발송");
				mail.setContent(new StringBuffer().
						append("임시 비밀번호는 [").
						append(uid).
						append("] 입니다. 로그인 후 꼭 비밀번호 변경을 해주세요.").
						toString());
				
				emailSender.SendEmail(mail);				
			}// if
			
			return isFoundSuccess;
		} catch (Exception e) {
			throw new ServiceException(e);
		}// try-catch	
	}// modifyUserforFindPwWithEmail

	@Override
	public boolean modifyUserforFindPwWithPhone(String phone, String uid, String password) throws ServiceException {
		log.trace("modifyUserforFindPwWithPhone({}, {}) invoked.", phone, password);
		
		try {
			boolean isFoundSuccess = this.mapper.updateUserforFindPwWithPhone(phone, password) == 1;
			
			if(isFoundSuccess) {
				this.messageService.sendMessageforFindPw(phone, uid); // SMS 발송
			}// if
			
			return isFoundSuccess;
		} catch (Exception e) {
			throw new ServiceException(e);
		}// try-catch	
	}

	@Override
	public int findUserforNicknameCheck(String nickname) throws ServiceException {
		log.trace("findUserforNicknameCheck({}) invoked.", nickname);
		
		try {
			return this.mapper.selectUserforNickCheck(nickname);
		} catch (MemberException e) {
			throw new ServiceException(e);
		}// try-catch
		
	}// findUserforNicknameCheck

	@Override
	public int findUserforEmailCheck(String email, String uid) throws ServiceException {
		log.trace("findUserforEmailCheck({}, {}) invoked.", email, uid);
		
		try {
			
			int checkNum = this.mapper.selectUserforEmailCheck(email, uid);
			
			if(checkNum == 0) { // 이미 가입된 이메일이 아닌 경우 이메일 인증을 위한 uid 인증번호 발송
				EmailDTO mail = new EmailDTO();
				mail.setReceiver(email);
				mail.setSubject("[가보자고] 회원가입을 위한 이메일 인증번호 발송");
				mail.setContent(new StringBuffer().
						append("회원가입을 위해 인증번호를 입력해주세요. [").
						append(uid).
						append("] ").
						toString());
				
				emailSender.SendEmail(mail);				
			}// if
			
			return checkNum;
			
		} catch (Exception e) {
			throw new ServiceException(e);
		}// try-catch
		
	}// findUserforEmailCheck

	@Override
	public int findUserforPhoneCheck(String phone, String uid) throws ServiceException {
		log.trace("findUserforPhoneCheck({}, {}) invoked.", phone, uid);
		
		try {
			int checkNum = this.mapper.selectUserforPhoneCheck(phone, uid);
			
			if(checkNum == 0) { // 이미 가입된 휴대폰 번호가 아닌 경우 휴대폰 인증을 위한 uid 인증번호 발송
				this.messageService.sendMessageforJoin(phone, uid); // SMS 발송 @@@@@@ 임시 주석 설정 시 sms 발송 안됨
			}// if
			
			return checkNum;
			
		} catch (Exception e) {
			throw new ServiceException(e);
		}// try-catch
	}

	@Override
	public MemberVO naverLogin(String uid_num) throws ServiceException {
		log.trace("naverLogin() invoked.");
		
		try {						
			return this.mapper.selectUserForNaverLogin(uid_num);
		} catch (MemberException e) {
			throw new ServiceException(e);
		}// try-catch
	} // naverLogin

	@Override
	public boolean createUserForNaverLogin(NaverDTO dto) throws ServiceException {
		log.trace("create() invoked.");

		try {
			return this.mapper.insertUserForNaverLogin(dto) == 1;
		} catch (MemberException e) {
			throw new ServiceException(e);
		}// try-catch
	}// createUserForNaverLogin

	@Override
	public MemberVO kakaoLogin(String email) throws ServiceException {
		log.trace("kakaoLogin() invoked.");
		
		try {						
			return this.mapper.selectUserForKakaoLogin(email);
		} catch (MemberException e) {
			throw new ServiceException(e);
		}// try-catch
	}// kakaoLogin

	@Override
	public MemberVO googleLogin(String email) throws ServiceException {
		log.trace("kakaoLogin() invoked.");
		
		try {						
			return this.mapper.selectUserForGoogleLogin(email);
		} catch (MemberException e) {
			throw new ServiceException(e);
		}// try-catch
	}// kakaoLogin
	
	@Override
	public boolean createUserForKakaoLogin(KakaoDTO dto) throws ServiceException {
		log.trace("createUserForKakaoLogin() invoked.");

		try {
			return this.mapper.insertUserForKakaoLogin(dto) == 1;
		} catch (MemberException e) {
			throw new ServiceException(e);
		}// try-catch
	}// createUserForKakaoLogin
	
	@Override
	public boolean createUserForGoogleLogin(GoogleDTO dto) throws ServiceException {
		log.trace("createUserForGoogleLogin() invoked.");

		try {
			return this.mapper.insertUserForGoogleLogin(dto) == 1;
		} catch (MemberException e) {
			throw new ServiceException(e);
		}// try-catch
	}// createUserForGoogleLogin
	
}// end class
