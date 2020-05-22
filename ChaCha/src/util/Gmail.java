package util;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class Gmail extends Authenticator{
	
	@Override
	protected PasswordAuthentication getPasswordAuthentication() {
		return new PasswordAuthentication("wjdekthf4245@gmail.com", "qw12as!@"); //관리자 아이디 , 비밀번호
	}
}
