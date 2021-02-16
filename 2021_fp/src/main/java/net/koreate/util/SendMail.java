package net.koreate.util;

import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

import org.springframework.core.io.ClassPathResource;

public class SendMail extends Authenticator {

		PasswordAuthentication pa;	
		
		public SendMail() throws Exception {
			ClassPathResource resource = new ClassPathResource("prop/googleMail.properties");
			Properties prop = new Properties();
			prop.load(resource.getInputStream());
			/*
			String path = SendMail.class.getResource("/prop/googleMail.properties").getPath();
			Properties prop = new Properties();
			prop.load(new FileReader(path));
			*/
			pa = new PasswordAuthentication(prop.getProperty("auth"), prop.getProperty("pass"));
		}
		
		public PasswordAuthentication getPasswordAuthentication() {
			return pa;
		}
		
		public Properties getProperties() {
			
			Properties prop = new Properties();
			
			prop.put("mail.smtp.starttls.enable", "true");
			prop.put("mail.smtp.host", "smtp.gmail.com");
			prop.put("mail.smtp.auth", "true");
			prop.put("mail.smtp.port", "587");
			
			return prop;
		}
}
