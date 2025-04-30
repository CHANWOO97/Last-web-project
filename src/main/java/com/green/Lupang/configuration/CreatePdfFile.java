package com.green.Lupang.configuration;

import java.io.File;
import java.io.FileOutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;

import com.green.Lupang.dto.SettleStatement;
import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Chunk;
import com.itextpdf.text.Document;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.Rectangle;
import com.itextpdf.text.pdf.BaseFont;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import com.itextpdf.text.pdf.draw.LineSeparator;

public class CreatePdfFile {
	public static File createEncryptedInvoicePdf(SettleStatement settleStatement, String password) throws Exception {
        File file = File.createTempFile("settle-invoice-", ".pdf");

        Document document = new Document();
        PdfWriter writer = PdfWriter.getInstance(document, new FileOutputStream(file));

        writer.setEncryption(
                password.getBytes(),    // 사용자 비밀번호
                null,                   // 관리자 비밀번호 (null이면 동일)
                PdfWriter.ALLOW_PRINTING,
                PdfWriter.ENCRYPTION_AES_128
        );
//        BaseFont baseFont = BaseFont.createFont("c:/windows/fonts/malgun.ttf", BaseFont.IDENTITY_H, BaseFont.EMBEDDED);
//        Font font = new Font(baseFont, 12);
//
//        document.open();
//        document.add(new Paragraph("Lupang 정산명세서", font));
//        document.add(new Paragraph("판매자: " + settleStatement.getOn_id(), font));
//        document.add(new Paragraph("총 결제금액: " + settleStatement.getTotal_amount() + "원", font));
//        document.add(new Paragraph("Lupang 수수료: " + settleStatement.getFee_amount() + "원", font));
//        document.add(new Paragraph("PG 수수료: " + settleStatement.getPg_fee() + "원", font));
//        document.add(new Paragraph("최종 정산금액: " + settleStatement.getNet_amount() + "원", font));
//        document.close();
        
        // 한글 폰트 설정
        BaseFont baseFont = BaseFont.createFont("c:/windows/fonts/malgun.ttf", BaseFont.IDENTITY_H, BaseFont.EMBEDDED);
        Font titleFont = new Font(baseFont, 16, Font.BOLD);
        Font labelFont = new Font(baseFont, 12, Font.BOLD);
        Font valueFont = new Font(baseFont, 12);

        document.open();

        // 타이틀
        Paragraph title = new Paragraph("Lupang 정산명세서", titleFont);
        title.setAlignment(Element.ALIGN_CENTER);
        document.add(title);

        document.add(Chunk.NEWLINE); // 여백

        // 구분선
        LineSeparator separator = new LineSeparator();
        separator.setLineColor(BaseColor.GRAY);
        document.add(separator);
        document.add(Chunk.NEWLINE);

        // 정산 테이블
        PdfPTable table = new PdfPTable(2);
        table.setWidths(new int[]{1, 3});
        table.setWidthPercentage(100);

        addTableRow(table, "판매자", settleStatement.getOn_id(), labelFont, valueFont);
        addTableRow(table, "총 결제금액", formatCurrency(settleStatement.getTotal_amount()), labelFont, valueFont);
        addTableRow(table, "Lupang 수수료", formatCurrency(settleStatement.getFee_amount()), labelFont, valueFont);
        addTableRow(table, "PG 수수료", formatCurrency(settleStatement.getPg_fee()), labelFont, valueFont);
        addTableRow(table, "최종 정산금액", formatCurrency(settleStatement.getNet_amount()), labelFont, valueFont);

        document.add(table);

        document.add(Chunk.NEWLINE);
        document.add(new Paragraph("발행일: " + new SimpleDateFormat("yyyy-MM-dd").format(new Date()), valueFont));

        document.close();
        
        return file;
    }
	private static void addTableRow(PdfPTable table, String label, String value, Font labelFont, Font valueFont) {
	    PdfPCell cell1 = new PdfPCell(new Phrase(label + ":", labelFont));
	    PdfPCell cell2 = new PdfPCell(new Phrase(value, valueFont));
	    cell1.setBorder(Rectangle.NO_BORDER);
	    cell2.setBorder(Rectangle.NO_BORDER);
	    table.addCell(cell1);
	    table.addCell(cell2);
	}

	private static String formatCurrency(int amount) {
	    return String.format("%,d원", amount);
	}
}
