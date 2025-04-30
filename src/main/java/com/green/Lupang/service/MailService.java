package com.green.Lupang.service;

import com.green.Lupang.dto.SettleStatement;

public interface MailService {

	void sendSimpleInvoiceMail(SettleStatement settleStatement);

	void sendMimeInvoiceMail(SettleStatement settleStatement);

	void sendPwMail(String toEmail, String randomPassword);
}
