package com.green.Lupang.service;

import com.green.Lupang.dto.SettleStatement;

import jakarta.mail.MessagingException;

public interface MailService {

	void sendSimpleInvoiceMail(SettleStatement settleStatement);

	void sendMimeInvoiceMail(SettleStatement settleStatement) throws MessagingException, Exception;

	void sendPwMail(String toEmail, String randomPassword);
	
	
}
