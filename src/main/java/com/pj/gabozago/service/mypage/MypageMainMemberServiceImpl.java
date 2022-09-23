package com.pj.gabozago.service.mypage;

import java.util.LinkedHashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.pj.gabozago.domain.MemberDTO;
import com.pj.gabozago.domain.MemberVO;
import com.pj.gabozago.exception.DAOException;
import com.pj.gabozago.exception.ServiceException;
import com.pj.gabozago.mapper.MypageMainMemberMapper;

import lombok.NoArgsConstructor;
import lombok.Setter;


@NoArgsConstructor

//마이페이지 메인과 회원정보수정 및 탈퇴 페이지 관련 service
@Service
public class MypageMainMemberServiceImpl implements MypageMainMemberService {

	
	@Setter(onMethod_ = {@Autowired})
	private MypageMainMemberMapper mapper;
	
	
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
	
	// 회원 수정 로직
	@Override					
	public MemberVO modifyMemberInfo(MemberDTO dto, MemberVO vo) throws ServiceException {
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
				String profileImg = "/resources/member/img/profile/" + dto.getProfileImg();
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
