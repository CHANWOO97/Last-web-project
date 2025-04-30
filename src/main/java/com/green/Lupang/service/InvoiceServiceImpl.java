package com.green.Lupang.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.green.Lupang.dto.Items;
import com.green.Lupang.dto.SettleStatement;
import com.green.Lupang.mapper.InvoiceMapper;

import jakarta.mail.internet.MimeMessage;

@Service
public class InvoiceServiceImpl implements InvoiceService{
	@Autowired
	private InvoiceMapper ivm;
	@Autowired
	private JavaMailSender mailSender;
	
	@Override
	public List<SettleStatement> settleList(int offset, int rowPerPage) {
		Map<String, Object> map = new HashMap<>();
		map.put("offset", offset);
		map.put("rowPerPage", rowPerPage);
		return ivm.settleList(map);
	}

	@Override
	public void insertSettleInvoice(SettleStatement settleStatement) {
		ivm.insertSettleInvoice(settleStatement);
	}

	@Override
	public SettleStatement getSettleInvoice(int sr_id) {
		return ivm.getSettleInvoice(sr_id);
	}
}
