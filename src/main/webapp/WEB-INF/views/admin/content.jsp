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
    <title>CONTENT</title>

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
    <link rel="stylesheet" href="/resources/admin/css/admin_content.css" />
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

      <div id="content">
        <div class="title">게시글 관리</div>

        <div class="board-table-top">
          <table class="board_list content_table">
            <thead>
                <tr>
                    <th class="num">번호</th>
                    <th class="title_N">제목</th>
                    <th class="name">작성자</th>
                    <th class="date">등록일</th>
                    <th class="views">조회수</th>
                </tr>
            </thead>

            <tbody>
                <tr>
                    <td class="num">7</td>
                    <td class="title_N">
                        <a href="/admin/content/read">서울의 랜드마크를 만나다</a>
                    </td>
                    <td class="name">백설기</td>
                    <td class="date">2022-07-10</td>
                    <td class="views">81</td>
                </tr>
                <tr>
                    <td class="num">6</td>
                    <td class="title_N">
                        <a href="/admin/content/read">춘천에서 청정 & 낭만 에너지를 채우다</a>
                    </td>
                    <td class="name">골멩이</td>
                    <td class="date">2022-07-10</td>
                    <td class="views">119</td>
                </tr>
                <tr>
                    <td class="num">5</td>
                    <td class="title_N">
                        <a href="/admin/content/read">자전거와 함께하는 풍경여행</a>
                    </td>
                    <td class="name">납평치</td>
                    <td class="date">2022-07-10</td>
                    <td class="views">87</td>
                </tr>
                <tr>
                    <td class="num">4</td>
                    <td class="title_N">
                        <a href="/admin/content/read">온몸으로 즐기는 대구 2박 3일 코스 여행</a>
                    </td>
                    <td class="name">토런스</td>
                    <td class="date">2022-07-10</td>
                    <td class="views">253</td>
                </tr>
                <tr>
                    <td class="num">3</td>
                    <td class="title_N">
                        <a href="/admin/content/read">3/1 운동의 정신을 느껴보는 서울 여행</a>
                    </td>
                    <td class="name">모도리</td>
                    <td class="date">2022-07-10</td>
                    <td class="views">26</td>
                </tr>
                <tr>
                    <td class="num">2</td>
                    <td class="title_N">
                        <a href="/admin/content/read">안산과 강화도를 한 번에 즐길 수 있는 경기도 1박 2일 여행코스</a>
                    </td>
                    <td class="name">홍합죽</td>
                    <td class="date">2022-07-10</td>
                    <td class="views">156</td>
                </tr>
                <tr>
                    <td class="num">1</td>
                    <td class="title_N">
                        <a href="/admin/content/read">시원하고 짜릿하게 즐기는 동해 1박 2일 여행코스</a>
                    </td>
                    <td class="name">목구구</td>
                    <td class="date">2022-07-10</td>
                    <td class="views">216</td>
                </tr>
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
                    <li class="frontPage"><a href="/admin/customer?currPage=1"><i class="bi bi-chevron-double-left"></i></a></li>

                    <c:choose>
                        <c:when test="${__PAGINATION__.prev}">
                            <li class="prev"><a href="/admin/customer?currPage=${__PAGINATION__.startPage - 1}"><i class="bi bi-chevron-left"></i></a></li>
                        </c:when>
                        <c:otherwise>
                            <li class="prev"><a href="#"><i class="bi bi-chevron-left"></i></a></li>
                        </c:otherwise>
                    </c:choose>

                    <!-- 현재 Pagination 범위에 속한 페이지 번호 목록 출력 -->
                    <!-- begin부터 end까지 forEach(반복문) -->
                    <c:forEach var="pageNum" begin="${__PAGINATION__.startPage}" end="${__PAGINATION__.endPage}">
                        <li class="${pageNum == __PAGINATION__.cri.currPage ? 'currPage' : ''}">
                            <a href="/admin/customer?currPage=${pageNum}">
                                <strong>${pageNum}</strong>
                            </a>
                        </li>
                    </c:forEach>

                    <!-- Next 처리 -->
                    <c:choose>
                        <c:when test="${__PAGINATION__.next}">
                            <li class="next"><a href="/admin/customer?currPage=${__PAGINATION__.endPage + 1}"><i class="bi bi-chevron-right"></i></a></li>
                        </c:when>
                        <c:otherwise>
                            <li class="next"><a href="#"><i class="bi bi-chevron-right"></i></a></li>
                        </c:otherwise>
                    </c:choose>

                    <li class="backPage"><a href="/admin/customer?currPage=${__PAGINATION__.realEndPage}"><i class="bi bi-chevron-double-right"></i></a></li>
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


