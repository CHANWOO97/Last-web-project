package com.green.Lupang.service;import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import com.green.Lupang.dto.SettleStatement;

import jakarta.mail.internet.MimeMessage;
import lombok.extern.slf4j.Slf4j;

@Slf4j	
@Service
public class MailServiceImpl implements MailService{
	@Autowired
	private JavaMailSender mailSender;
	@Override
	public void sendSimpleInvoiceMail(SettleStatement settleStatement) {
		 SimpleMailMessage message = new SimpleMailMessage(); 
		 	message.setTo("smile0537@naver.com"); // **수신자 test 용 계정 (user.getEmail())
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
	@Override
	public void sendPwMail(String toEmail, String randomPassword) {
		try {
	        MimeMessage message = mailSender.createMimeMessage();
	        MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");

	        String subject = "✔ 루팡 사이트 비밀번호 초기화 안내";
	        String content = """
	        	    <div style='font-family: Arial, sans-serif; padding: 20px; border: 1px solid #ddd; border-radius: 10px; background-color: #f9f9f9;'>
	        	        <h2 style='color: #2c3e50;'>🛡️ 비밀번호 초기화 완료</h2>
	        	        <p>요청하신 임시 비밀번호는 아래와 같습니다.<br>
	        	        <strong>마이페이지 &gt; 비밀번호 변경</strong> 메뉴에서 새 비밀번호로 변경해주세요.</p>

	        	        <div style='padding: 10px 20px; background-color: #f0f0f0; border-radius: 6px; font-size: 18px; font-weight: bold; color: #e74c3c; display: inline-block; margin-top: 10px;'>
	        	            %s
	        	        </div>

	        	        <p style='margin-top: 30px; font-size: 14px; color: #555;'>보안을 위해 반드시 비밀번호를 변경해주시기 바랍니다.</p>
	        	        <p style='margin-top: 10px;'>감사합니다.<br><strong>루팡 서비스 센터</strong></p>
	        	    </div>
	        	    """.formatted(randomPassword);

	        helper.setTo(toEmail);
	        helper.setSubject(subject);
	        helper.setText(content, true); // true = HTML

	        helper.setFrom("lupang884@gmail.com"); // 보내는 이메일

	        mailSender.send(message);

	    } catch (Exception e) {
	        e.printStackTrace();
	        log.error("비밀번호 메일 전송 실패: {}", e.getMessage());
	    }
		
	}

}
