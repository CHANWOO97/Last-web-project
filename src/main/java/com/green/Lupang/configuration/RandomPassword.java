package com.green.Lupang.configuration;

import java.security.SecureRandom;

public class RandomPassword {
	// 랜덤 비밀번호 생성 메서드
	public static String genRandomPassword(int length) {
        String upperCase = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
        String lowerCase = "abcdefghijklmnopqrstuvwxyz";
        String digits = "0123456789";
        String allCharacters = upperCase + lowerCase + digits;

        SecureRandom random = new SecureRandom();
        StringBuilder password = new StringBuilder();

        for (int i = 0; i < length; i++) {
            int index = random.nextInt(allCharacters.length());
            password.append(allCharacters.charAt(index));
        }
        return password.toString();
	}
}

