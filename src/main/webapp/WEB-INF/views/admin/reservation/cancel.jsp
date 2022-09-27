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
    <title>RESERVATION</title>

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
    <link rel="stylesheet" href="/resources/admin/css/admin_reservation_cancel.css" />

</head>

<body>
    <!-- header -->
    <header>
    	<jsp:include page="/WEB-INF/views/common/header_admin.jsp" flush="false" />s
    </header>

    
    <!-- section -->
    <div class="wrap">
        <div id="accordion">

            <div class="card">
              <div class="card-header" id="headingOne">
                <h5 class="mb-0">
                  <button class="btn btn-link" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                     <a href="/admin/dashboard"><i class="bi bi-grid"></i>대시보드</a>
                  </button>
                </h5>
              </div>


              <div class="card-header" id="headingTwo">
                <h5 class="mb-0">
                <button class="btn btn-link collapsed" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                    <a href="/admin/customer"><i class="bi bi-person"></i>회원관리</a>
                </button>
                </h5>
          	 </div>
    
    
              <div class="card-header" id="headingThree">
                <h5 class="mb-0">
                  <button class="btn btn-link collapsed" data-toggle="collapse" data-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                    <i class="bi bi-calendar-date"></i>예약관리
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
                    <i class="bi bi-card-text"></i>컨텐츠관리
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
      
        <div id="cancel">
          <div class="title">취소/환불 관리</div>

            <table class="board_list cancel_table">
                  <thead>
                      <tr class="tr-list">
                          <th class="num">예약번호</th>
                          <th class="location">지역</th>
                          <th class="hotel">숙소명</th>
                          <th class="date">이용날짜</th>
                          <th class="name">예약자명</th>
                          <th class="number">연락처</th>
                      </tr>
                  </thead>
                
                    <tbody>
                      <tr>
                        <td class="num">
                            <a href="/admin/reservation/detail">12345678</a>
                        </td>
                        <td class="location">서울</td>
                        <td class="hotel">신라호텔</td>
                        <td class="date">07/07 ~ 07/10</td>
                        <td class="name">김혜진</td>
                        <td class="number">010-xxxx-xxxx</td>
                      </tr>
                
                      <tr>
                        <td class="num">
                            <a href="/admin/reservation/detail">23456789</a>
                        </td>
                        <td class="location">서울</td>
                        <td class="hotel">롯데호텔</td>
                        <td class="date">07/12 ~ 07/15</td>
                        <td class="name">김지수</td>
                        <td class="number">010-xxxx-xxxx</td>
                      </tr>
            
                      <tr>
                        <td class="num">
                            <a href="/admin/reservation/detail">87654321</a>
                        </td>
                        <td class="location">부산</td>
                        <td class="hotel">신라호텔</td>
                        <td class="date">07/11 ~ 07/14</td>
                        <td class="name">박성은</td>
                        <td class="number">010-xxxx-xxxx</td>
                      </tr>
            
                      <tr>
                        <td class="num">
                            <a href="/admin/reservation/detail">98765432</a>
                        </td>
                        <td class="location">부산</td>
                        <td class="hotel">롯데호텔</td>
                        <td class="date">07/27 ~ 07/28</td>
                        <td class="name">배은정</td>
                        <td class="number">010-xxxx-xxxx</td>
                      </tr>
            
                      <tr>
                        <td class="num">
                            <a href="/admin/reservation/detail">74185296</a>
                        </td>
                        <td class="location">서울</td>
                        <td class="hotel">신라호텔</td>
                        <td class="date">07/17 ~ 07/19</td>
                        <td class="name">이정선</td>
                        <td class="number">010-xxxx-xxxx</td>
                      </tr>

                      <tr>
                        <td class="num">
                            <a href="/admin/reservation/detail">14725836</a>
                        </td>
                        <td class="location">서울</td>
                        <td class="hotel">시그니엘</td>
                        <td class="date">06/12 ~ 06/13</td>
                        <td class="name">전채림</td>
                        <td class="number">010-xxxx-xxxx</td>
                      </tr>

                      <tr>
                        <td class="num">
                            <a href="/admin/reservation/detail">96385274</a>
                        </td>
                        <td class="location">서울</td>
                        <td class="hotel">워커힐</td>
                        <td class="date">05/07 ~ 05/10</td>
                        <td class="name">조미혜</td>
                        <td class="number">010-xxxx-xxxx</td>
                      </tr>

                    </tbody>
                  </table>
              </div>
          </div>

    <!-- footer -->
    <footer>
        <%@include file="/WEB-INF/views/common/footer.jsp" %>
    </footer>
</body>

</html>


