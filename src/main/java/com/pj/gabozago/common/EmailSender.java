package com.pj.gabozago.common;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailException;
import org.springframework.mail.javamail.JavaMailSender;

import com.pj.gabozago.domain.EmailDTO;

import lombok.Setter;

public class EmailSender {
    
    @Setter(onMethod_=@Autowired)
    protected JavaMailSender mailSender;
    
    public void SendEmail(EmailDTO email) throws Exception{
        
        MimeMessage msg = mailSender.createMimeMessage();
        
        try{
            msg.setSubject(email.getSubject());
            msg.setText(email.getContent());
            msg.setRecipients(MimeMessage.RecipientType.TO, InternetAddress.parse(email.getReceiver()));
            
        }catch(MessagingException e){
            System.out.println("MessagingException");
            e.printStackTrace();
        }
        
        try{
            mailSender.send(msg);
        }catch(MailException e){
            System.out.println("MailException 발생");
            e.printStackTrace();
        }
        
    }//SendEmail
 
}// end class