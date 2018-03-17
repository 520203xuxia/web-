import com.sun.mail.util.MailSSLSocketFactory;
import java.security.GeneralSecurityException;
import java.util.Date;
import java.util.Properties;
import javax.mail.Address;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.NoSuchProviderException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
public class SendMail {
	 public static void sendMail(String IDNumber,String name, String email) {
	        Properties props = new Properties();//创建一个properties对象，配置一些发送邮件需要的属性
	        props.setProperty("mail.debug", "true");//开启debug调试
	        props.setProperty("mail.smtp.auth", "true");//发送服务器需要身份验证 
	        props.setProperty("mail.host", "smtp.qq.com");// 设置邮件服务器主机名
	        props.setProperty("mail.transport.protocol", "smtp");// 发送邮件协议名称  
	        MailSSLSocketFactory sf = null;
	        Message msg = null;
	        Transport transport = null;
	        try {
	            sf = new MailSSLSocketFactory();
	            sf.setTrustAllHosts(true);
	            props.put("mail.smtp.ssl.enable", "true");
	            props.put("mail.smtp.ssl.socketFactory", sf);
	            Session session = Session.getInstance(props);//设置环境信息  
	            msg = new MimeMessage(session);// 创建邮件对象  
	            msg.setSubject("WEB"); 
	            StringBuffer strBody = new StringBuffer();
	         // 设置邮件内容 
	            strBody.append("点击下面链接激活账号，48小时生效，否则重新注册账号，链接只能使用一次，请尽快激活！</br>");
	            strBody.append("<a href='http://172.31.238.35:8080/actservlet?username=" + name + "&IDNumber=" + IDNumber + "'>点击这里</a></br>");
	            msg.setContent(strBody.toString(), "text/html;charset=UTF-8");
	            msg.setSentDate(new Date());
	            msg.setFrom(new InternetAddress("1786425454@qq.com"));// 设置发件人  
	            transport = session.getTransport();
	            transport.connect("smtp.qq.com", "1786425454@qq.com", "ujpfarivoitcecaj"); // 连接邮件服务器  
	            transport.sendMessage(msg, new Address[]{new InternetAddress(email)});// 发送邮件  
	        } catch (GeneralSecurityException var23) {
	            var23.printStackTrace();
	        } catch (AddressException var24) {
	            var24.printStackTrace();
	        } catch (NoSuchProviderException var25) {
	            var25.printStackTrace();
	        } catch (MessagingException var26) {
	            var26.printStackTrace();
	        } finally {
	            try {
	                transport.close();
	            } catch (MessagingException var22) {
	                var22.printStackTrace();
	            }

	        }

	    }

	}
