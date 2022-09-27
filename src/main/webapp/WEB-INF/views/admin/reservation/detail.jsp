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
              <!-- <a href="#"><i class="fas fa-angle-left"></i></a> -->
              <h1>예약 관리</h1>
          </div>

          <article class="infoBox">
              <div class="reser_info">
                  <h1>예약 정보</h1>
                  <div class="accom_info">
                      <a href="#"><img src="https://picsum.photos/id/684/80/80" alt="accom image"></a>
                      <div class="accom_info_letter">
                          <h3><a href="#">숙소명</a></h3>
                          <p><a href="#">Room Type</a></p>
                      </div>
                  </div>
                  <div class="date_info">
                      <h3>날짜</h3>
                      <p>2000.00.00 ~ 2000.00.00</p>
                  </div>
                  <h3>인원</h3>
                  <p>성인 2명</p>
              </div>
              <div class="member_info">
                  <h1>예약자 정보</h1>
                  <h3>예약자 이름</h3><p>홍길동</p>
                  <h3>연락처</h3><p>010-0000-0000</p>
                  <h3>이메일 주소</h3><p>gabojago12345678@gabojago.com</p>
              </div>
              <div class="payment_info">
                  <h1>결제 정보</h1>
                  <h3>주문금액</h3><p><span>200,000</span> 원</p>
                  <h3>포인트 사용</h3><p><span>-3,000</span> P</p>
                  <h3>총 결제 금액</h3><p class="total"><span>197,000</span> 원</p>
                  <div class="card_info">
                      <div>카드결제(결제방법)</div>
                      <div>신한(0000-0000-0000-0000) 일시불(카드정보)</div>
                      <div>(<span>2000.00.00 AM 00:00(결제일시)</span>)</div>
                  </div>
              </div>
              
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


