package cn.believeus.service;

import java.security.Security;
import java.util.Properties;
import java.util.ResourceBundle;

import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.Authenticator;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.mail.internet.MimeUtility;

import org.springframework.stereotype.Service;


@Service
public class MailService {

    private String fromuser; //读取配置文件中的参数
    private String pwd;
    public MailService() {
		ResourceBundle bundle = ResourceBundle.getBundle("project");
		this.fromuser=bundle.getString("fromuser");
		this.pwd=bundle.getString("password");
	}

    /**
     * 使用加密的方式,利用465端口进行传输邮件,开启ssl
     */

    public String sendMail(String title, String message, String toMail,String pdfpath,String pdfname) {
        Security.addProvider(new com.sun.net.ssl.internal.ssl.Provider());
        //设置邮件会话参数
        Properties props = new Properties();
        props.setProperty("mail.smtp.host", "smtp.gmail.com");
        props.setProperty("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
        props.setProperty("mail.smtp.socketFactory.fallback", "false");
        props.setProperty("mail.smtp.port", "465");
        props.setProperty("mail.smtp.socketFactory.port", "465");
        props.put("mail.smtp.auth", "true");
        try {
            Security.addProvider(new com.sun.net.ssl.internal.ssl.Provider());
            //获取到邮箱会话,利用匿名内部类的方式,将发送者邮箱用户名和密码授权给jvm
            Session session = Session.getInstance(props, new Authenticator() {
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(fromuser, pwd);
                }
            });
            MimeMessage mime = new MimeMessage(session);
			// Set From: 头部头字段
            mime.setFrom(new InternetAddress(fromuser));
 
			// Set To: 头部头字段
            mime.addRecipient(Message.RecipientType.TO, new InternetAddress(toMail));
			// Set Subject: 主题文字
            mime.setSubject(title);
	         // 创建消息部分
	         BodyPart messageBodyPart = new MimeBodyPart();
	         // 消息
	         messageBodyPart.setText(message);
			 // 创建多重消息
	         Multipart multipart = new MimeMultipart();
	         // 设置文本消息部分
	         multipart.addBodyPart(messageBodyPart);
	         // 附件部分
	         messageBodyPart = new MimeBodyPart();
	         DataSource source = new FileDataSource(pdfpath);

	         messageBodyPart.setDataHandler(new DataHandler(source));
	         
	         //messageBodyPart.setFileName(filename);
	         //处理附件名称中文（附带文件路径）乱码问题
	         //设置附件中显示的文件名,通过filename解析出来
	         messageBodyPart.setFileName(MimeUtility.encodeText(pdfname));
	         multipart.addBodyPart(messageBodyPart);
	         // 发送完整消息
	         mime.setContent(multipart);
			//保存邮件
	         mime.saveChanges();
	         //   发送消息
	         Transport.send(mime);
        } catch (Exception e) {
            e.printStackTrace();
            return "error-email";
        }
        System.out.println("email Send success!");
        return "success";
    }
}
