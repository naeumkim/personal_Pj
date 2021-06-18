package com.tmeal.mail;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import javax.mail.*;
import javax.mail.internet.*;

import java.io.*;
import java.util.*;
@WebServlet("/mailServlet")
public class MailServlet extends HttpServlet{
	public void doGet(HttpServletRequest req, HttpServletResponse res) 
			throws ServletException, IOException{
		  Properties p = System.getProperties();
	        p.put("mail.smtp.starttls.enable", "true");   
	        p.put("mail.smtp.host", "smtp.gmail.com");    
	        p.put("mail.smtp.auth","true");               
	        p.put("mail.smtp.port", "587");                 
	        
	        Authenticator auth = new MyAuthentication();
	         
	        Session session = Session.getDefaultInstance(p, auth);
	        MimeMessage msg = new MimeMessage(session);
	         
	        try{
	            msg.setSentDate(new Date());
	             
	            InternetAddress from = new InternetAddress() ;
	             
	             
	            from = new InternetAddress("gardenfi3847@naver.com");
	             
	            msg.setFrom(from);
	             
	             
	            InternetAddress to = new InternetAddress("gardenfi3847@naver.com");
	            msg.setRecipient(Message.RecipientType.TO, to);
	             
	            msg.setSubject("dd.", "UTF-8");
	             
	            msg.setText("dd.", "UTF-8");
	             
	            msg.setHeader("content-Type", "text/html");
	             
	            javax.mail.Transport.send(msg);
	             
	        }catch (AddressException addr_e) {
	            addr_e.printStackTrace();
	        }catch (MessagingException msg_e) {
	            msg_e.printStackTrace();
	        }
	       
	        
	    }

	}

	class MyAuthentication extends Authenticator {
	    
	    PasswordAuthentication pa;
	    
	 
	    public MyAuthentication(){
	         
	        String id = "xptmxmkim1111@gmail.com";      
	        String pw = "xptmxmxptmxm";          
	 
	        pa = new PasswordAuthentication(id, pw);
	      
	    }
	 
	    public PasswordAuthentication getPasswordAuthentication() {
	        return pa;
	    }

	}
