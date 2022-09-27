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
    <title>QUESTION</title>

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
    <link rel="stylesheet" href="/resources/admin/css/admin_question.css" />
    <link rel="stylesheet" href="/resources/common/css/pagination.css">

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

        <div id="question_post">
            <div class="title">문의 관리</div>
            
            <div class="board-table-top">
                <table class="board_list notice_table">

                    <caption>공지사항 목록</caption>
                    <thead>
                        <tr>
                            <th class="num">번호</th>
                            <th class="title_N">제목</th>
                            <th class="name">작성자</th>
                            <th class="date">등록일</th>
                            <th class="status">상태</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td class="num">15</td>
                            <td class="title_N">
                                <a href="/board/qna/read">문의드립니다.</a>
                            </td>
                            <td class="name">김*수</td>
                            <td class="date">2022-07-10</td>
                            <td class="status">
                                <div class="box_f">접수중</div>
                            </td>
                        </tr>

                        <tr>
                            <td class="num">14</td>
                            <td class="title_N">
                                <a href="/board/qna/read2">문의드립니다.</a>
                            </td>
                            <td class="name">정*현</td>
                            <td class="date">2022-07-10</td>
                            <td class="status">
                                <div class="box">답변완료</div>
                            </td>
                        </tr>
                        <tr>
                            <td class="num">13</td>
                            <td class="title_N">
                                <a href="/board/qna/read2">문의드립니다.</a>
                            </td>
                            <td class="name">김*우</td>
                            <td class="date">2022-07-10</td>
                            <td class="status">
                                <div class="box">답변완료</div>
                            </td>
                        </tr>
                        <tr>
                            <td class="num">12</td>
                            <td class="title_N">
                                <a href="/board/qna/read2">문의드립니다.</a>
                            </td>
                            <td class="name">이*혁</td>
                            <td class="date">2022-07-10</td>
                            <td class="status">
                                <div class="box">답변완료</div>
                            </td>
                        </tr>
                        <tr>
                            <td class="num">11</td>
                            <td class="title_N">
                                <a href="/board/qna/read2">문의드립니다.</a>
                            </td>
                            <td class="name">문*정</td>
                            <td class="date">2022-07-10</td>
                            <td class="status">
                                <div class="box">답변완료</div>
                            </td>
                        </tr>
                        <tr>
                            <td class="num">10</td>
                            <td class="title_N">
                                <a href="/board/qna/read2">문의드립니다.</a>
                            </td>
                            <td class="name">손*연</td>
                            <td class="date">2022-07-10</td>
                            <td class="status">
                                <div class="box">답변완료</div>
                            </td>
                        </tr>
                        <tr>
                            <td class="num">9</td>
                            <td class="title_N">
                                <a href="/board/qna/read2">문의드립니다.</a>
                            </td>
                            <td class="name">이*일</td>
                            <td class="date">2022-07-10</td>
                            <td class="status">
                                <div class="box">답변완료</div>
                            </td>
                        </tr>
                        <tr>
                            <td class="num">8</td>
                            <td class="title_N">
                                <a href="/board/qna/read2">문의드립니다.</a>
                            </td>
                            <td class="name">박*빈</td>
                            <td class="date">2022-07-10</td>
                            <td class="status">
                                <div class="box">답변완료/div>
                            </td>
                        </tr>
                        <tr>
                            <td class="num">7</td>
                            <td class="title_N">
                                <a href="/board/qna/read2">문의드립니다.</a>
                            </td>
                            <td class="name">김*정</td>
                            <td class="date">2022-07-10</td>
                            <td class="status">
                                <div class="box">답변완료</div>
                            </td>
                        </tr>
                        <tr>
                            <td class="num">6</td>
                            <td class="title_N">
                                <a href="/board/qna/read2">문의드립니다.</a>
                            </td>
                            <td class="name">김*연</td>
                            <td class="date">2022-07-10</td>
                            <td class="status">
                                <div class="box">답변완료</div>
                            </td>
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


