<%@page 
    language="java" 
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>RESERVATION-DETAIL</title>

    <script src="https://kit.fontawesome.com/ba256c1670.js" crossorigin="anonymous"></script>
    
    <!-- bootstrap -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
	<script>
        $(function(){
           $("button.btn").css("color", "#333333");
       });
    </script>
    <link rel="stylesheet" href="/resources/admin/css/admin_reservation_detail.css" />

</head>

<body>
    <!-- header -->
    <header>
    	<jsp:include page="/WEB-INF/views/common/header.jsp" flush="false" />
    </header>

    
    <!-- section -->
    <div class="wrap">
      
      <div id="accordion">

        <div class="card">
            <div class="card-header" id="headingOne">
                <h5 class="mb-0">
                <button class="btn btn-link" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                    <a href="/admin/dashboard">대시보드</a>
                </button>
                </h5>
            </div>
    

            <div class="card-header" id="headingTwo">
                <h5 class="mb-0">
                <button class="btn btn-link collapsed" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                    <a href="/admin/customer">회원관리</a>
                </button>
                </h5>
          	 </div>
    
    
              <div class="card-header" id="headingThree">
                <h5 class="mb-0">
                  <button class="btn btn-link collapsed" data-toggle="collapse" data-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                    예약관리
                  </button>
                </h5>
              </div>
              <div id="collapseThree" class="collapse" aria-labelledby="headingThree" data-parent="#accordion">
                <div class="card-body">
                    <button type="button"><a href="/admin/reservation">예약관리</a></button>
                    <button type="button"><a href="/admin/reservation/cancel">취소/환불 관리</a></button>
                </div>
              </div>
    
    
              <div class="card-header" id="headingFour">
                <h5 class="mb-0">
                  <button class="btn btn-link collapsed" data-toggle="collapse" data-target="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
                    컨텐츠관리
                  </button>
                </h5>
              </div>
              <div id="collapseFour" class="collapse" aria-labelledby="headingFour" data-parent="#accordion">
                <div class="card-body">
                    <button type="button"><a href="/admin/content">게시글</a></button>
                    <button type="button"><a href="/admin/content/notice">공지사항</a></button>
                    <button type="button"><a href="/admin/content/question">문의 관리</a></button>
                </div>
              </div>
              
            </div>

      </div>



      <section class="reservation_info">
          <div class="header">
               <a href="#"><i class="fas fa-angle-left"></i></a>
              <h1>예약 관리</h1>
          </div>

		  <c:set var="item" value="${__MAP__}" />
          <article class="infoBox">
              <div class="reser_info">
                  <h1>예약 정보</h1>
                  <div class="accom_info">
                      <a href="/reservation/datail?accom_idx=${item.ACCOM_IDX}"><img src="/resources/acco/img/himg/${item.FILE_NAME}" alt="accom image"></a>
                        <div class="accom_info_letter">
                          <h3><a href="/reservation/datail?accom_idx=${item.ACCOM_IDX}">${item.ACCOM_NAME}</a></h3>
                          <p><a href="/reservation/room?room_idx=${item.ACCOM_ROOM_IDX}">${item.ROOM_NAME}</a></p>
                      </div>
                  </div>
                  <div class="date_info">
                      <h3>날짜</h3>
                        <p>${item.CHECK_IN_DATE} ~ ${item.CHECK_OUT_DATE}</p>
                  </div>
                  <h3>인원</h3>
                  <p>
                      성인 ${item.ADULT_COUNT}인
                      <c:if test="${item.CHILD_COUNT != 0}">
                          , 유아 ${item.CHILD_COUNT}인
                      </c:if>
                    </p>
              </div>
              <div class="member_info">
                  <h1>예약자 정보</h1>
                  <h3>예약자 이름</h3><p>${item.NAME}</p>
                  <h3>연락처</h3><p>${item.PHONE}</p>
                  <h3>이메일 주소</h3><p>${item.EMAIL}</p>
              </div>
              <div class="payment_info">
                  <h1>결제 정보</h1>
                  <h3>주문금액</h3><p><fmt:formatNumber pattern="#,###,###,###" value="${item.ORDER_PRICE}" /> 원</p>
                  <h3>포인트 사용</h3><p>-<fmt:formatNumber pattern="#,###,###,###" value="${item.USE_POINT}" /> P</p>
                  <h3>총 결제 금액</h3><p class="total"><fmt:formatNumber pattern="#,###,###,###" value="${item.PAYMENT_PRICE}" /> 원</p>
                  <div class="card_info">
                      <div>카드결제</div>
                      <div><fmt:formatDate pattern="(yyyy-MM-dd HH:mm:ss)" value="${item.INSERT_TS}" /></div>
                  </div>
              </div>
              
              <c:choose>
                    <c:when test="${item.STATUS eq 'CA'}">
                        <!-- status가 CA(취소가능)인 경우, 예약취소 버튼 활성화 -->
                        <div class="cancel">
                            <button type="button" class="btnCancel">예약 취소</button>
                        </div>
                    </c:when>
                    <c:when test="${item.STATUS eq 'CD'}">
                        <!-- status가 CD(취소완료)인 경우, 환불정보 활성화 -->
                        <div class="refund_info">
                            <h1>환불 정보</h1>
                            <h3>환불 일자</h3><p><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${__RESULT__.insertTs}" /></p>
                            <h3>환불 금액</h3><p class="total"><fmt:formatNumber pattern="#,###,###,###" value="${__RESULT__.refundPrice}" /> 원</p>
                            <h3>환불 수단</h3><p>신용카드 결제 취소</p>
                            <h3>환불 처리 상태</h3><p>환불 완료</p>
                            <h3>포인트 복원 내역</h3><p><fmt:formatNumber pattern="#,###,###,###" value="${__RESULT__.refundPoint}" /> P</p>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <!-- 정상적으로 이용완료된 상태이면 아무것도 표시하지 않는다. -->
                    </c:otherwise>
                </c:choose>
              
              <div class="back">
                  <a href="/admin/reservation" class="btnBack">돌아가기</a>
              </div>

          </article>            
      </section>
  </div>
  
    
    <!-- footer -->
    <footer>
        <%@include file="/WEB-INF/views/common/footer.jsp" %>
    </footer>
</body>

</html>


