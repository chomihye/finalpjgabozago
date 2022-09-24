package com.pj.gabozago.service.mypage;

import java.io.FileReader;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.pj.gabozago.domain.MemberDTO;
import com.pj.gabozago.domain.MemberVO;
import com.pj.gabozago.exception.DAOException;
import com.pj.gabozago.exception.ServiceException;
import com.pj.gabozago.mapper.MypageMainMemberMapper;
import com.pj.gabozago.service.MessageService;

import lombok.Cleanup;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;


@Log4j2
@NoArgsConstructor

//마이페이지 메인과 회원정보수정 및 탈퇴 페이지 관련 service
@Service
public class MypageMainMemberServiceImpl implements MypageMainMemberService {

	
	@Setter(onMethod_ = {@Autowired})
	private MypageMainMemberMapper mapper;
	
	@Setter(onMethod_= {@Autowired})
	private MessageService messageService;
	
	
	// 회원정보 업데이트가 필요한 경우, 다시 정보를 불러오는 메소드
	@Override
	public MemberVO getMemberInfo(MemberVO member) throws ServiceException {
		try { return this.mapper.selectMemberInfo(member); } 
		catch (DAOException e) { throw new ServiceException(e); }
	} // getMemberProfile
	
	
	// 회원의 사용일 임박순 숙소예약내역 2건을 가져오는 메소드
	@Override
	public List<LinkedHashMap<String, Object>> getReserOrderOfUseDate(MemberVO member) throws ServiceException {
		try { return this.mapper.selectReserOrderOfUseDate(member); } 
		catch (DAOException e) { throw new ServiceException(e); }
	} // getReserOrderOfUseDate

	
	// 닉네임 중복검사용
	@Override
	public boolean checkDoubleNickname(String nickname) throws ServiceException {
		try { return this.mapper.selectDoubleNickname(nickname); } 
		catch (DAOException e) { throw new ServiceException(e); }
	} // checkDoubleNickname
	
	
	// 휴대폰 번호 인증
	@Override
	public Map<String, Object> verifyPhoneNumber(String oldNumber, String newNumber) throws ServiceException {
		log.trace(">>>>>>>>>>>>>>>>>>>>>> verifyPhoneNumber() invoked.");
		
		try { 
			boolean isDouble;
			
			// 중복여부 체크
			if(newNumber.equals(oldNumber)) {		// 변경하려는 휴대폰번호가 기존과 동일한 경우,
				isDouble = false;	// 중복아님
			}else {
				isDouble = this.mapper.selectDoublePhone(newNumber); 	
			} // if-else
			
			String randomNumber = null;
			
			if(!isDouble) {		// 번호가 중복이 아니면,
				// 랜덤번호 생성
				Double doubleNum = ((Math.random()) * (999999 - 111111 + 1)) + 111111;
				int intNum = doubleNum.intValue();
				randomNumber = String.valueOf(intNum);
				
				// 메시지 보내는 메소드
				this.messageService.sendMessageforModifyPhone(newNumber, randomNumber);
//				log.info("====================================== 인증번호 : {}", randomNumber);
			} // if
			
			Map<String, Object> resultMap = new HashMap<String, Object>();
			resultMap.put("isDouble", isDouble);
			resultMap.put("randomNumber", randomNumber);
			
			return resultMap;
		} catch (DAOException e) { 
			throw new ServiceException(e); 
		} // try-catch
	} // verifyPhoneNumber
	
	
	// 회원 수정 로직
	@Override					
	public MemberVO modifyMemberInfo(HttpServletRequest req, MemberDTO dto, MemberVO vo) throws ServiceException {
		try { 
			dto.setIdx(vo.getIdx());	
			
			if(dto.getName() == "") { dto.setName(vo.getName()); }		 // 이름
			
			if(dto.getPassword() == "") { 
				dto.setPassword(vo.getPassword()); 
			}else { 
				String newPwd = dto.getPassword() + "__SALT__";
				BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
				String cipherText = encoder.encode(newPwd);		
				dto.setPassword(cipherText); 
			} // 비밀번호(해쉬처리)
			
			if(dto.getNickname() == "") { dto.setNickname(vo.getNickname()); }		 // 닉네임

			if(dto.getPhone() == "") { dto.setPhone(vo.getPhone()); }		 // 휴대폰번호
			
			if(dto.getProfileImg() == "" || dto.getProfileImg() == null) { 
				dto.setProfileImg(vo.getProfileImg());
			}else { 
				String imgName = dto.getProfileImg();		// 이미지 파일 이름
		        String filePath = req.getServletContext().getRealPath("resources/member/img/profile/" + imgName);		// 파일의 경로
		        String profileImg = null;		// DB에 저장할 이미지 파일 경로 변수 선언
		        
		        try {
		        	@Cleanup
					FileReader reader = new FileReader(filePath);
					
					// 파일을 읽었을 때, 오류가 발생하지 않는다면 => 파일 존재함
					profileImg = "/resources/member/img/profile/" + imgName;
				} catch (Exception e) {
					// 파일을 읽었을 때, 오류가 발생한다면 => 파일이 없음
					profileImg = null;
				} // try-catch
		        
		        dto.setProfileImg(profileImg); 
			} // 프로필 이미지경로	
			
			this.mapper.updateMemberInfo(dto); 
			
			MemberVO newInfo = new MemberVO(vo.getIdx(), vo.getEmail(), dto.getPassword(), dto.getName(), dto.getNickname(),
			dto.getPhone(), vo.getBirthday(), vo.getProvider(), vo.getUidNum(), dto.getProfileImg(),
			vo.getPoint(), vo.getRememberMe(), vo.getRememberAge(), vo.getInsertTs(), vo.getUpdateTs(), 
			vo.getIsSecession());
			
			return newInfo;
		} catch (DAOException e) { 
			throw new ServiceException(e); 
		} // try-catch
	} // modifyMemberInfo
	
	
	// 회원 탈퇴 처리
	@Override
	public Boolean withdrawFromSite(MemberVO member) throws ServiceException {
		try { return this.mapper.deleteMember(member); } 
		catch (DAOException e) { throw new ServiceException(e); }
	} // withdrawFromSite


} // end class
