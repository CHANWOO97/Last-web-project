package com.green.Lupang.service;import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.green.Lupang.dto.SettleStatement;

	
@Service
public class MailServiceImpl implements MailService{
	@Autowired
	private JavaMailSender mailSender;
	@Override
	public void sendSimpleInvoiceMail(SettleStatement settleStatement) {
		 SimpleMailMessage message = new SimpleMailMessage(); 
		 	message.setTo("smile0537@naver.com"); // **수신자 
	        message.setSubject("[Lupang] 정산명세서 발송 안내");
	        message.setText(
	            "안녕하세요 " + settleStatement.getOn_id() + "님,\n\n" +
	            "Lupang 정산명세서가 발행되었습니다.\n" +
	            "- 총 결제금액: " + settleStatement.getTotal_amount() + "원\n" +
	            "- Lupang 수수료금액: " + settleStatement.getFee_amount() + "원\n" +
	            "- PG 수수료금액: " + settleStatement.getPg_fee() + "원\n" +
	            "- 정산금액: " + settleStatement.getNet_amount() + "원\n\n" +
	            "감사합니다."
	        );
	        mailSender.send(message);
	    }
	@Override
	public void sendMimeInvoiceMail(SettleStatement settleStatement) {		
	}

}
