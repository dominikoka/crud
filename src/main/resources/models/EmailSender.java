package main.resources.models;

import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.*;

public class EmailSender {



  public void sendEmail(String to, String subject, String content, String host, String port, String userName, String password) {
    // Konfiguracja właściwości
    Properties properties = new Properties();
    properties.put("mail.smtp.host", host);
    properties.put("mail.smtp.port", port);
    properties.put("mail.smtp.auth", "true");
    properties.put("mail.smtp.starttls.enable", "true");
    properties.put("mail.user", userName);
    properties.put("mail.password", password);
    properties.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
    Session session = Session.getInstance(properties, new Authenticator() {
      @Override
      protected PasswordAuthentication getPasswordAuthentication() {
        return new PasswordAuthentication(userName, password);
      }
    });
    try {
      Message message = new MimeMessage(session);
      message.setFrom(new InternetAddress(userName));
      message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
      message.setSubject(subject);
      message.setText(content);
      Transport.send(message);
      System.out.println("E-mail został wysłany pomyślnie.");
    } catch (MessagingException e) {
      e.printStackTrace();
    }
  }
}