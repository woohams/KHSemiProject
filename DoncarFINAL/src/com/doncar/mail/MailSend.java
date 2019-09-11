package com.doncar.mail;

import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.SendFailedException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import com.doncar.biz.MemberBiz;
import com.doncar.dto.MemberDto;

public class MailSend {
	
	String url = "192.168.10.33:8787";
	
	public void MailInsert(String mail_addr,String member_no) throws SendFailedException {
		Properties prop= System.getProperties();
		prop.put("mail.smtp.starttls.enable", "true");
		prop.put("mail.smtp.host", "smtp.gmail.com");
	    prop.put("mail.smtp.auth", "true");
	    prop.put("mail.smtp.port", "587");

	    Authenticator auth = new MailAuth();
	    
	    Session session = Session.getDefaultInstance(prop, auth);
	    
	    MimeMessage msg = new MimeMessage(session);
	    
	    try {
			msg.setSentDate(new Date());
			
			msg.setFrom(new InternetAddress("yb.ctrlv@gmail.com", "DONCAR_ADMIN"));
			InternetAddress to = new InternetAddress(mail_addr);
			msg.setRecipient(Message.RecipientType.TO, to); 
			msg.setSubject("돈카 이메일 인증입니다","UTF-8");
			msg.setText("링크를 누르면 인증이 완료됩니다.  http://"+url+"/Doncar/doncar.do?command=mailUpdate&mail_addr="+mail_addr+"&member_no="+member_no,"UTF-8");
			
			Transport.send(msg);
		} catch (MessagingException e) {
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	    
	}
	
	public void findID(String mail_addr) throws SendFailedException {
		Properties prop= System.getProperties();
		prop.put("mail.smtp.starttls.enable", "true");
		prop.put("mail.smtp.host", "smtp.gmail.com");
	    prop.put("mail.smtp.auth", "true");
	    prop.put("mail.smtp.port", "587");

	    Authenticator auth = new MailAuth();
	    
	    Session session = Session.getDefaultInstance(prop, auth);
	    
	    MimeMessage msg = new MimeMessage(session);
	    MemberBiz biz = new MemberBiz();
	    MemberDto dto = biz.selectMail(mail_addr);
	    String name = dto.getMember_name();
	    String id = dto.getMember_id();
	    try {
			msg.setSentDate(new Date());
			
			msg.setFrom(new InternetAddress("yb.ctrlv@gmail.com", "DONCAR_ADMIN"));
			InternetAddress to = new InternetAddress(mail_addr);
			msg.setRecipient(Message.RecipientType.TO, to); 
			msg.setSubject("[돈카] 아이디 찾기","UTF-8");
			msg.setText(name+"님의 아이디는 "+id+" 입니다.","UTF-8");
			
			Transport.send(msg);
		} catch (MessagingException e) {
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	    
	}
	
	public void findPW(String mail_addr) throws SendFailedException  {
		Properties prop= System.getProperties();
		prop.put("mail.smtp.starttls.enable", "true");
		prop.put("mail.smtp.host", "smtp.gmail.com");
	    prop.put("mail.smtp.auth", "true");
	    prop.put("mail.smtp.port", "587");

	    Authenticator auth = new MailAuth();
	    
	    Session session = Session.getDefaultInstance(prop, auth);
	    
	    MimeMessage msg = new MimeMessage(session);
	    MemberBiz biz = new MemberBiz();
	    MemberDto dto = biz.selectMail(mail_addr);
	    String name = dto.getMember_name();
	    String pw = dto.getMember_pw();
	    try {
			msg.setSentDate(new Date());
			
			msg.setFrom(new InternetAddress("yb.ctrlv@gmail.com", "DONCAR_ADMIN"));
			InternetAddress to = new InternetAddress(mail_addr);
			msg.setRecipient(Message.RecipientType.TO, to); 
			msg.setSubject("[돈카]비밀번호 찿기","UTF-8");
			msg.setText(name+"님의 비밀번호는 "+pw+"입니다.","UTF-8");
			
			Transport.send(msg);
		} catch (MessagingException e) {
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	    
	}
	
	

}
