package com.pj.gabozago.service;

import java.util.HashMap;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Service;

import lombok.NoArgsConstructor;
import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

/**
 * @class ExampleSend
 * @brief This sample code demonstrate how to send sms through CoolSMS Rest API PHP
 */
@NoArgsConstructor

@Service("messageService")
public class MessageService  {
	
	public void sendMessageforFindPw(String toNumber, String randomNumber) {

	    String api_key = "NCSAZ5E97ZPWMERQ";
	    String api_secret = "IZIBQUG7TKCSX9LJCCUYPKTHZVG85CA7";
	    String fromNumber = "010-8741-9039";
	    
	    Message coolsms = new Message(api_key, api_secret);
	    
	    // 4 params(to, from, type, text) are mandatory. must be filled
		HashMap<String, String> params = new HashMap<String, String>();
		params.put("to", toNumber);
		params.put("from", fromNumber);
		params.put("type", "SMS");
		params.put("text", "[가보자고] 임시 비밀번호는 " + randomNumber + " 입니다. 로그인 후 꼭 비밀번호를 변경해주세요.");
		params.put("app_version", "test app 1.2"); // application name and version

		try {
			JSONObject obj = (JSONObject) coolsms.send(params);
			System.out.println(obj.toString());
		} catch (CoolsmsException e) {
			System.out.println(e.getMessage());
			System.out.println(e.getCode());
		}// try-catch
	}// sendMessage
	
	
	
	
	
	
	
	public void sendMessageforJoin(String toNumber, String randomNumber) {

	    String api_key = "NCSAZ5E97ZPWMERQ";
	    String api_secret = "IZIBQUG7TKCSX9LJCCUYPKTHZVG85CA7";
	    String fromNumber = "010-8741-9039";
	    
	    Message coolsms = new Message(api_key, api_secret);
	    
	    // 4 params(to, from, type, text) are mandatory. must be filled
		HashMap<String, String> params = new HashMap<String, String>();
		params.put("to", toNumber);
		params.put("from", fromNumber);
		params.put("type", "SMS");
		params.put("text", "[가보자고] 회원가입 인증번호는 " + randomNumber + " 입니다. 3분 이내에 입력해주세요.");
		params.put("app_version", "test app 1.2"); // application name and version

		try {
			JSONObject obj = (JSONObject) coolsms.send(params);
			System.out.println(obj.toString());
		} catch (CoolsmsException e) {
			System.out.println(e.getMessage());
			System.out.println(e.getCode());
		}// try-catch
	}// sendMessage
	
	
	// 마이페이지 회원정보 수정 Page 휴대폰번호 변경을 위한 메소드
	public void sendMessageforModifyPhone(String toNumber, String randomNumber) {

	    String api_key = "NCSAZ5E97ZPWMERQ";
	    String api_secret = "IZIBQUG7TKCSX9LJCCUYPKTHZVG85CA7";
	    String fromNumber = "010-8741-9039";
	    
	    Message coolsms = new Message(api_key, api_secret);
	    
	    // 4 params(to, from, type, text) are mandatory. must be filled
		HashMap<String, String> params = new HashMap<String, String>();
		params.put("to", toNumber);
		params.put("from", fromNumber);
		params.put("type", "SMS");
		params.put("text", "[가보자고] 휴대폰 번호 변경 인증번호는 " + randomNumber + " 입니다. 3분 이내에 입력해주세요.");
		params.put("app_version", "test app 1.2"); // application name and version

		try {
			JSONObject obj = (JSONObject) coolsms.send(params);
			System.out.println(obj.toString());
		} catch (CoolsmsException e) {
			System.out.println(e.getMessage());
			System.out.println(e.getCode());
		}// try-catch
		
	}// sendMessageforModifyPhone
	
	
}// end class