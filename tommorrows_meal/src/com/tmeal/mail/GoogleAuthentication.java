package com.tmeal.mail;
import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class GoogleAuthentication extends Authenticator {
	PasswordAuthentication passAuth;
    
    public GoogleAuthentication(){
        passAuth = new PasswordAuthentication("ggg0140", "jwkoqsmqazstmggt");
    }
 
    public PasswordAuthentication getPasswordAuthentication() {
        return passAuth;
    }
}
