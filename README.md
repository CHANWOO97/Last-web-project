# 🛒 Lupang - 쿠팡 클론 프로젝트

> **안산 그린컴퓨터 아카데미 풀스택 개발과정 최종 프로젝트 (2025)**  
> 실사용자 경험을 고려한 쇼핑몰 통합 시스템 구현

---

## 📌 프로젝트 개요

Lupang은 실제 이커머스 플랫폼 "쿠팡"의 구조와 기능을 참고하여 만든 **쇼핑몰 클론 프로젝트**입니다.  
**Spring Boot + JSP 기반의 MVC 아키텍처**를 중심으로, **관리자/판매자/사용자** 기능을 통합한 **풀스택 웹 애플리케이션**입니다.

---

## 🛠️ 개발 환경

- **운영체제**: Windows 10  
- **개발 툴**: Spring Tool Suite 3.9.12.RELEASE  
- **형상관리**: Git / GitHub  
- **배포 서버**: Apache Tomcat 9.0  
- **DBMS**: MySQL 9.2.0  
- **ERD 설계 도구**: ERD Cloud

---

## 💻 사용 기술 스택

### Backend
- Java 17
- Spring Boot 3.4
- MyBatis (Mapper 기반 ORM)
- JSP (View)
- JSTL / EL
- Apache Commons IO
- Iamport (결제 API 연동)

### Frontend
- HTML5 / CSS3 / Bootstrap5
- JavaScript / jQuery
- AJAX (비동기 처리)
- Chart.js (관리자용 통계 시각화)

---

## 🗂️ 주요 기능별 구성

### ✅ 사용자 (User)
- 회원가입, 로그인, 마이페이지(정보 수정, 찜 목록 등)
- 상품 목록 조회 및 검색
- 장바구니 담기, 주문/결제 (Toss, 카카오페이 연동)
- 주문 내역 및 상세 조회

### ✅ 판매자 (Seller)
- 판매자 신청 및 관리자 승인 후 상품 등록 가능
- 본인 상품 관리 및 판매 현황 조회
- 정산 요청 기능

### ✅ 관리자 (Admin)
- 회원 목록 및 삭제/승인 기능
- 구매 목록 및 
- 판매자 승인 관리
- 정산 명세서 발행 및 메일 전송 (PDF 파일 첨부 포함)
- 매출 통계 차트(월별 매출, 인기 상품 등)

### ✅ 이벤트
- 아이묭 굿즈 룰렛 이벤트 기능
- 계정당 1회 참여 제한
- 당첨 결과 DB 저장 및 상품 지급

---

## 📸 주요 구현 화면
- 메인 페이지
  <p align="center">
    <img src="https://github.com/user-attachments/assets/a4edee3a-d7e0-4404-880f-0d47251918e6" width="100%"/>
  </p>
- 회원가입 및 로그인
  <p align="center">
    <img src="https://github.com/user-attachments/assets/33055e0f-9ded-49a5-a617-49cd23d7def0" width="45%"/>
    <img src="https://github.com/user-attachments/assets/371975a9-798d-406b-90c1-d748505a3339" width="45%"/>
  </p>![image]()
- 상품 목록 및 상세 페이지
  <p>
    <img src="https://github.com/user-attachments/assets/8300a342-9ec3-4bd1-afed-b126b955f8d8">    
    <img src="https://github.com/user-attachments/assets/204fdaf0-501b-4fae-8f6d-80deb60abac5">
  </p>
- 장바구니 및 주문 프로세스
- 관리자 통계 대시보드
- 판매자 상품 등록 폼
- 정산 명세서 발행 및 PDF 다운로드

---

## 📌 ERD
https://www.erdcloud.com/d/3eWXvgssHCCTvfHoh

## ✉️ 이메일 기능

- PDF 형식 정산서 발송 (`itextpdf` 사용)
- 암호화된 PDF 파일 첨부
- 수신자: 판매자 이메일

---

## ⚙️ Git 커밋 전략 (예시)

- `feat:` 기능 추가  
- `fix:` 버그 수정  
- `refactor:` 코드 리팩토링  
- `docs:` 문서 작성 및 수정  
- `style:` UI 스타일링 및 CSS

---

## 🙌 팀원 및 담당 역할

| 이름 | 역할 | 주요 업무 |
|------|------|-----------|
| [본인 이름] | 전체 개발 | DB 설계, 기능 구현, UI 구성, 관리자 기능, 정산 프로세스 등 |

---

## 📚 후기

> "처음엔 막막했지만, 실전 프로젝트를 통해 MVC 구조와 데이터 흐름, UI/UX 설계까지 직접 구현하며 성장할 수 있었습니다. 단순 구현이 아닌 **기획부터 배포까지**의 전 과정을 경험했습니다."

---

## ✅ 향후 개선점

- Spring Security 도입 통한 보안 강화
- AWS 기반 배포 및 CI/CD 연동
- 반응형 웹 (Responsive Web Design) 적용

---
