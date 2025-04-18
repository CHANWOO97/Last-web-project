<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting/include.jsp" %>
<%@ include file="sidebar.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>월별 매출 통계</title>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<style>
  .content {
    padding: 30px;
  }
  table {
    margin-top: 40px;
  }
</style>
</head>
<body>
  <div class="content">       
	<!-- 탭 메뉴 -->
	<%@ include file="/WEB-INF/views/admin/graph/analyticsTab.jsp" %>
    <!-- ✅ 그래프 출력 영역 -->
    
    
    <!-- ✅ 통계 테이블 -->
    <table border="1" style="width: 100%; text-align: center; border-collapse: collapse;">
      <!-- 월 헤더 -->
      <tr style="background-color: #f0f0f0; border-bottom: 2px solid #555;">
        <c:forEach var="i" begin="1" end="12">
          <th style="padding: 10px;">${i}월</th>
        </c:forEach>
      </tr>
      <!-- 수익 금액 -->
      <tr style="border-top: 2px solid #555;">
        <c:forEach var="i" begin="1" end="12">
          <c:set var="keyMonth">
            <c:choose>
              <c:when test="${i lt 10}">2025-0${i}</c:when>
              <c:otherwise>2025-${i}</c:otherwise>
            </c:choose>
          </c:set>
          <td style="padding: 10px;">
            <c:choose>
              <c:when test="${monthTotalMap[keyMonth] != null}">
                <fmt:formatNumber value="${monthTotalMap[keyMonth]}" type="number"/>
              </c:when>
              <c:otherwise>0</c:otherwise>
            </c:choose>
          </td>
        </c:forEach>
      </tr>
    </table>
  </div>

  <!-- ✅ Chart.js 스크립트 -->
  <script>
    const labels = ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'];

    const data = [
      <c:forEach var="i" begin="1" end="12">
        <c:set var="keyMonth">
          <c:choose>
            <c:when test="${i lt 10}">2025-0${i}</c:when>
            <c:otherwise>2025-${i}</c:otherwise>
          </c:choose>
        </c:set>
        <c:choose>
          <c:when test="${monthTotalMap[keyMonth] != null}">
            ${monthTotalMap[keyMonth] / 100000}
          </c:when>
          <c:otherwise>0</c:otherwise>
        </c:choose>
        <c:if test="${i < 12}">,</c:if>
      </c:forEach>
    ];

    const ctx = document.getElementById('popularityChart').getContext('2d');
    const chart = new Chart(ctx, {
      type: 'bar',
      data: {
        labels: labels,
        datasets: [
          {
            type: 'bar',
            label : '월별 매출 (10만 원 단위)',
            data: data,
            backgroundColor: 'rgba(54, 162, 235, 0.5)',
            borderColor: 'rgba(54, 162, 235, 1)',
            borderWidth: 1
          },
          {
            type: 'line',
            label: '매출 추이 (10만 원 단위)',
            data: data,
            borderColor: 'rgba(255, 99, 132, 1)',
            backgroundColor: 'transparent',
            tension: 0.3,
            pointRadius: 4,	
            pointBackgroundColor: 'rgba(255, 99, 132, 1)'
          }
        ]
      },
      options: {
        responsive: true,
        layout: {
          padding: {
            top: 0
          }
        },
        plugins: {
          legend: {
            position: 'top'
          },
          tooltip: {
            enabled: true
          }
        },
        interaction: {
          mode: 'index',
          intersect: false
        },
        scales: {
          x: {
            ticks: {
              display: true
            }
          },
          y: {
            beginAtZero: true,
            max: 30, // 300만 원
            ticks: {
              stepSize: 5,
              callback: function(value) {
                return value * 10 + '만 원'; // 10만원 단위로 보정 출력
              }
            }
          }
        }
      }
    });
  </script>
</body>
</html>