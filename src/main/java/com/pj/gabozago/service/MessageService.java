package com.pj.gabozago.service;

import java.util.HashMap;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Service;

import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j2;
import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

/**
 * @class ExampleSend
 * @brief This sample code demonstrate how to send sms through CoolSMS Rest API PHP
 */
@NoArgsConstructor

@Service("messageService")
public class MessageService  {
	
	public void sendMessage(String toNumber, String randomNumber) {

	    String api_key = "#ENTER_YOUR_OWN#";
	    String api_secret = "#ENTER_YOUR_OWN#";
	    String fromNumber = "010-8741-9039";
	    
	    Message coolsms = new Message(api_key, api_secret);
	    
	    // 4 params(to, from, type, text) are mandatory. must be filled
		HashMap<String, String> params = new HashMap<String, String>();
		params.put("to", toNumber);
		params.put("from", fromNumber);
		params.put("type", "SMS");
		params.put("text", "[가보자고] 인증번호 " + randomNumber + " 를 입력하세요.");
		params.put("app_version", "test app 1.2"); // application name and version

		try {
			JSONObject obj = (JSONObject) coolsms.send(params);
			System.out.println(obj.toString());
		} catch (CoolsmsException e) {
			System.out.println(e.getMessage());
			System.out.println(e.getCode());
		}// try-catch
	}// sendMessage
	
}// end class