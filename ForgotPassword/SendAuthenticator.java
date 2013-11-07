

package email;
import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;


public class SMTPAuthenticator extends Authenticator{
private String username,password;
	public SMTPAuthenticator(String username,String password){
		this.username=username;
		this.password=password;
		System.out.println("username = "+this.username+" \npasword are set");
	}
    @Override
	public javax.mail.PasswordAuthentication getPasswordAuthentication(){
		System.out.println("verifying username and password with ="+this.username);
		return new PasswordAuthentication(this.username,this.password);
	}
}
