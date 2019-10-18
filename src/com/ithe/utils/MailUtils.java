package com.ithe.utils;

import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;

public class MailUtils {

	public static void sendMail(String email, String emailMsg)
			throws AddressException, MessagingException {
		
		 // 收件人电子邮箱
	     String to = email;

	     // 发件人电子邮箱
	     String from = "2967627664@qq.com";

	     // 指定发送邮件的主机为 smtp.qq.com
	     String host = "smtp.qq.com";  //QQ 邮件服务器

	     // 获取系统属性
	     Properties properties = System.getProperties();

	     // 设置邮件服务器
	     properties.setProperty("mail.smtp.host", host);

	     properties.put("mail.smtp.auth", "true");
	     
	     // 获取默认session对象
	     Session session = Session.getInstance(properties,new Authenticator(){
	       public PasswordAuthentication getPasswordAuthentication()
	       {
	        return new PasswordAuthentication("2967627664@qq.com", "nesocnzjbvnbdgbf"); //发件人邮件用户名、授权码
	       }
	      });

	     try{
	        // 创建默认的 MimeMessage 对象
	        MimeMessage message = new MimeMessage(session);

	        // Set From: 头部头字段
	        message.setFrom(new InternetAddress(from));

	        // Set To: 头部头字段
	        message.addRecipient(Message.RecipientType.TO,
	                                 new InternetAddress(to));

	        // Set Subject: 头部头字段
	        message.setSubject("大学二手商城");

	        // 设置消息体
	        message.setText(emailMsg);

	        // 发送消息
	        Transport.send(message);
	     }catch (MessagingException mex) {
	        mex.printStackTrace();
	     }
	}
}
