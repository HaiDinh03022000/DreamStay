package DAO;


import java.util.Properties;
import java.util.Random;
import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;


/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author win
 */
public class SendEmail {
    String fromEmail;
    String pass;
    
    public String getRanom(){
        Random rnd = new Random();
        int otp = rnd.nextInt(999999);
        return String.format("%06d", otp);
    }
    
    public boolean sendEmail(String toEmail, String otp, String message, String subject){
        boolean test = false;
        fromEmail= "dreamstayotp@gmail.com";
        pass= "mqihieupswekvgix";
        try {
            Properties pr = new Properties();
            pr.put("mail.smtp.host", "smtp.gmail.com");
            pr.put("mail.smtp.port", "587");
            pr.put("mail.smtp.auth", "true");
            pr.put("mail.smtp.starttls.enable", "true");          
            
            Session session = Session.getInstance(pr,new Authenticator(){
                protected PasswordAuthentication getPasswordAuthentication(){
                    return new PasswordAuthentication(fromEmail,pass);
                }       
            });
            
            Message mess = new MimeMessage(session);
            
            mess.setFrom(new InternetAddress(fromEmail));
            mess.setRecipient(Message.RecipientType.TO, new InternetAddress(toEmail));
            
            mess.setSubject(subject);
            mess.setText(message + otp);
            Transport.send(mess);
            test = true;
        } catch (Exception e) {
        }
        return test;
    }
    
//    public static void main(String[] args) {
//        SendEmail a = new SendEmail();
//    }
}

