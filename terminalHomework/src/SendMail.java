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
	        Properties props = new Properties();//����һ��properties��������һЩ�����ʼ���Ҫ������
	        props.setProperty("mail.debug", "true");//����debug����
	        props.setProperty("mail.smtp.auth", "true");//���ͷ�������Ҫ�����֤ 
	        props.setProperty("mail.host", "smtp.qq.com");// �����ʼ�������������
	        props.setProperty("mail.transport.protocol", "smtp");// �����ʼ�Э������  
	        MailSSLSocketFactory sf = null;
	        Message msg = null;
	        Transport transport = null;
	        try {
	            sf = new MailSSLSocketFactory();
	            sf.setTrustAllHosts(true);
	            props.put("mail.smtp.ssl.enable", "true");
	            props.put("mail.smtp.ssl.socketFactory", sf);
	            Session session = Session.getInstance(props);//���û�����Ϣ  
	            msg = new MimeMessage(session);// �����ʼ�����  
	            msg.setSubject("WEB"); 
	            StringBuffer strBody = new StringBuffer();
	         // �����ʼ����� 
	            strBody.append("����������Ӽ����˺ţ�48Сʱ��Ч����������ע���˺ţ�����ֻ��ʹ��һ�Σ��뾡�켤�</br>");
	            strBody.append("<a href='http://172.31.238.35:8080/actservlet?username=" + name + "&IDNumber=" + IDNumber + "'>�������</a></br>");
	            msg.setContent(strBody.toString(), "text/html;charset=UTF-8");
	            msg.setSentDate(new Date());
	            msg.setFrom(new InternetAddress("1786425454@qq.com"));// ���÷�����  
	            transport = session.getTransport();
	            transport.connect("smtp.qq.com", "1786425454@qq.com", "ujpfarivoitcecaj"); // �����ʼ�������  
	            transport.sendMessage(msg, new Address[]{new InternetAddress(email)});// �����ʼ�  
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
