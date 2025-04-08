package com.green.Lupang.service;

import org.springframework.http.*;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

@Service
public class IamportService {
    private final String API_KEY = "4104545837310458";
    private final String API_SECRET = "STux9CpmuoFm5oqzyqIYMvvxhViCkTsdcuPcsfFrl30GzddcZp1b8dmhXsrJYhjXaqkf0StZNUzPolpx";

    private final RestTemplate restTemplate = new RestTemplate();

    // ✅ 1. 아임포트 토큰 발급
    public String getAccessToken() {
        String url = "https://api.iamport.kr/users/getToken";

        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);

        String requestJson = String.format("{\"imp_key\":\"%s\",\"imp_secret\":\"%s\"}", API_KEY, API_SECRET);
        HttpEntity<String> request = new HttpEntity<>(requestJson, headers);

        ResponseEntity<String> response = restTemplate.postForEntity(url, request, String.class);
        try {
            ObjectMapper mapper = new ObjectMapper();
            JsonNode root = mapper.readTree(response.getBody());
            return root.path("response").path("access_token").asText();
        } catch (Exception e) {
            throw new RuntimeException("❌ 토큰 발급 실패", e);
        }
    }

    // ✅ 2. 결제 정보 조회
    public JsonNode getPaymentInfo(String impUid, String accessToken) {
        String url = "https://api.iamport.kr/payments?imp_uid[]=" + impUid;
        HttpHeaders headers = new HttpHeaders();
        headers.set("Authorization", accessToken);
        HttpEntity<Void> request = new HttpEntity<>(headers);

        ResponseEntity<String> response = restTemplate.exchange(url, HttpMethod.GET, request, String.class);
        try {
            ObjectMapper mapper = new ObjectMapper();
            JsonNode root = mapper.readTree(response.getBody());

            // 🟢 응답은 배열로 오므로 첫 번째 객체 추출
            return root.path("response").get(0);
        } catch (Exception e) {
            throw new RuntimeException("❌ 결제 정보 조회 실패", e);
        }
    }

    // ✅ 3. 결제 검증 (상태 + 금액 확인)
    public boolean verifyPayment(String impUid, String merchantUid, int expectedAmount) {
        String token = getAccessToken();
        JsonNode paymentInfo = getPaymentInfo(impUid, token);

        String status = paymentInfo.path("status").asText();
        String merchant = paymentInfo.path("merchant_uid").asText();
        int amount = paymentInfo.path("amount").asInt();

        return "paid".equals(status) && merchantUid.equals(merchant) && expectedAmount == amount;
    }

}
