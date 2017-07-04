package py.gov.stp.mh.tools;

import java.util.Date;
import java.util.Properties;

import javax.activation.DataHandler;
import javax.activation.FileDataSource;
import javax.mail.Authenticator;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

public class SendMail {
	
	public static void sendEmail(String host, String port,
            final String userName, final String password, String toAddress,
            String subject, String message, String nombreArchivoAdj, String urlArchivoAdj)
            		throws AddressException, MessagingException {
 
        // sets SMTP server properties
        Properties properties = new Properties();
        properties.put("mail.smtp.host", host);
        properties.put("mail.smtp.port", port);
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");
 
        // creates a new session with an authenticator
        Authenticator auth = new Authenticator() {
            public PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(userName, password);
            }
        };
 
        Session session = Session.getInstance(properties, auth);

        //Se crea la parte del cuerpo del mensaje.
        BodyPart texto = new MimeBodyPart();
        texto.setText(message);        
        BodyPart adjunto = new MimeBodyPart();
        
        if(nombreArchivoAdj != null ){	        
	        adjunto.setDataHandler(new DataHandler(new FileDataSource(urlArchivoAdj)));
	        adjunto.setFileName(nombreArchivoAdj);
        }
        
        //Juntar las dos partes
        MimeMultipart multiParte = new MimeMultipart();
        multiParte.addBodyPart(texto);
        if (nombreArchivoAdj != null) multiParte.addBodyPart(adjunto);
        
        // creates a new e-mail message
        Message msg = new MimeMessage(session);
 
        msg.setFrom(new InternetAddress(userName));
        InternetAddress[] toAddresses = null;
        toAddresses = InternetAddress.parse(toAddress, false);

        msg.setRecipients(Message.RecipientType.TO, toAddresses);
        msg.setSubject(subject);
        msg.setSentDate(new Date());
        //msg.setText(message);
        msg.setContent(multiParte);
 
        // sends the e-mail
        Transport.send(msg);       

    }
	
}
