package com.green.Lupang.dto;

import java.io.File;

import org.apache.ibatis.type.Alias;

import lombok.Data;
@Data
@Alias("invoiceemail")
public class InvoiceEmail {
		 private String toemail;
		 private String subject;
		 private String content;
		 //private File file;
}
