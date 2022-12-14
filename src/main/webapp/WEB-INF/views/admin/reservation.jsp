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
    <link rel="stylesheet" href="/resources/admin/css/admin_reservation.css" />
    <link rel="stylesheet" href="/resources/common/css/pagination.css">

</head>

<body>
    <!-- header -->
    <header>
    	<jsp:include page="/WEB-INF/views/common/header_admin.jsp" flush="false" />
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
      

        <div id="reservation">
          <div class="title">예약 관리</div>

          <div class="board-table-top">
              <table class="board_list notice_table">
                  <thead>
                      <tr class="tr-list">
                          <th class="num">예약번호</th>
                          <th class="name">예약자명</th>
                          <th class="hotel">숙소명</th>
                          <th class="checkin">체크인 날짜</th>
                          <th class="checkout">체크아웃 날짜</th>
                          <th class="status">예약상태</th>
                      </tr>
                  </thead>
              
                  <tbody>
                      <!-- var : 임시 EL 변수명, items : 공유속성 이름 -->
                      <c:forEach var="item" items="${result.model}">
                            <tr>
                                <td class="num">
                                    <a href="/admin/reservation/detail?idx=${item.IDX}">${item.IDX}</a>
                                </td>
                                <td class="name">${item.NAME}</td>
                                <td class="hotel">${item.ACCOM_NAME}</td>
                                <td class="checkin">${item.CHECK_IN_DATE}</td>
                                <td class="checkout">${item.CHECK_OUT_DATE}</td>
                                <td class="status">${item.STATUS}</td>
                            </tr>
                        </c:forEach>              
                    
                  </tbody>
              </table>
          </div>

          <!-- 페이지버튼 -->
          <div id="pagination">
            <form action="#" id="paginationForm">
                <!-- 1. 3가지 기준정보(criteria)는 hidden 정보로 제공 -->
                <input type="hidden" name="currPage">

                <!-- 2. PageDTO 객체의 정보를 이용해서, Pagenation 출력 -->
                <ul>
                    <!-- Prev 처리 -->
                    <li class="frontPage"><a href="/admin/reservation?currPage=1"><i class="bi bi-chevron-double-left"></i></a></li>

                    <c:choose>
                        <c:when test="${__PAGINATION__.prev}">
                            <li class="prev"><a href="/admin/reservation?currPage=${__PAGINATION__.startPage - 1}"><i class="bi bi-chevron-left"></i></a></li>
                        </c:when>
                        <c:otherwise>
                            <li class="prev"><a href="#"><i class="bi bi-chevron-left"></i></a></li>
                        </c:otherwise>
                    </c:choose>

                    <!-- 현재 Pagination 범위에 속한 페이지 번호 목록 출력 -->
                    <!-- begin부터 end까지 forEach(반복문) -->
                    <c:forEach var="pageNum" begin="${__PAGINATION__.startPage}" end="${__PAGINATION__.endPage}">
                        <li class="${pageNum == __PAGINATION__.cri.currPage ? 'currPage' : ''}">
                            <a href="/admin/reservation?currPage=${pageNum}">
                                <strong>${pageNum}</strong>
                            </a>
                        </li>
                    </c:forEach>

                    <!-- Next 처리 -->
                    <c:choose>
                        <c:when test="${__PAGINATION__.next}">
                            <li class="next"><a href="/admin/reservation?currPage=${__PAGINATION__.endPage + 1}"><i class="bi bi-chevron-right"></i></a></li>
                        </c:when>
                        <c:otherwise>
                            <li class="next"><a href="#"><i class="bi bi-chevron-right"></i></a></li>
                        </c:otherwise>
                    </c:choose>

                    <li class="backPage"><a href="/admin/reservation?currPage=${__PAGINATION__.realEndPage}"><i class="bi bi-chevron-double-right"></i></a></li>
                </ul>
            </form>
          </div> 
        </div>
        
      </div>


    <!-- footer -->
    <footer>
        <%@include file="/WEB-INF/views/common/footer.jsp" %>
    </footer>
</body>

</html>


