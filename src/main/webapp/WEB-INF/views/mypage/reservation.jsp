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

    <title>MyPage</title>

    <!-- 파비콘 -->
    <link rel="shortcut icon" href="/resources/common/ico/favicon.ico">
    <link rel="icon" href="/resources/common/ico/favicon.ico" type="image/x-icon">
    <link rel="icon" type="image/png" sizes="192x192"  href="/resources/common/ico/android-icon-192x192.png">
    <link rel="icon" type="image/png" sizes="32x32" href="/resources/common/ico/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="96x96" href="/resources/common/ico/favicon-96x96.png">
    <link rel="icon" type="image/png" sizes="16x16" href="/resources/common/ico/favicon-16x16.png">
    <link rel="apple-touch-icon" sizes="57x57" href="/resources/common/ico/apple-icon-57x57.png">
    <link rel="apple-touch-icon" sizes="60x60" href="/resources/common/ico/apple-icon-60x60.png">
    <link rel="apple-touch-icon" sizes="72x72" href="/resources/common/ico/apple-icon-72x72.png">
    <link rel="apple-touch-icon" sizes="76x76" href="/resources/common/ico/apple-icon-76x76.png">
    <link rel="apple-touch-icon" sizes="114x114" href="/resources/common/ico/apple-icon-114x114.png">
    <link rel="apple-touch-icon" sizes="120x120" href="/resources/common/ico/apple-icon-120x120.png">
    <link rel="apple-touch-icon" sizes="144x144" href="/resources/common/ico/apple-icon-144x144.png">
    <link rel="apple-touch-icon" sizes="152x152" href="/resources/common/ico/apple-icon-152x152.png">
    <link rel="apple-touch-icon" sizes="180x180" href="/resources/common/ico/apple-icon-180x180.png">
    <link rel="manifest" href="/resources/common/ico/manifest.json">
    <meta name="msapplication-TileColor" content="#ffffff">
    <meta name="msapplication-TileImage" content="/resources/common/ico/ms-icon-144x144.png">
    <meta name="theme-color" content="#ffffff">

    <!-- 부트스트랩 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">

    <!-- 폰트어썸 -->
    <script src="https://kit.fontawesome.com/648bb0142f.js" crossorigin="anonymous"></script>

    <!-- 제이쿼리 -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.4.0/jquery-migrate.min.js"></script>

    <!-- CSS -->
    <link rel="stylesheet" href="/resources/mypage/css/6-6.mypage_reservation.css">
    <link rel="stylesheet" href="/resources/common/css/pagination.css">
    <link rel="stylesheet" href="/resources/mypage/css/modal.css">

    <!-- script -->
    <script src="/resources/mypage/js/6-6.mypage_reservation.js"></script>
    <script>
        $(function(){
            // 포인트 적립 완료
            let prevStepResult = "${__RESULT__}";

            if(prevStepResult == "Success"){        // 포인트 적립 완료창
                $("#reviewSuccessModal").css({display: "block"});
                setTimeout('closeModal()', 2000); // 2초 후에 함수 실행
            }else if(prevStepResult == "Done"){     // 이미 리뷰를 작성했다는 안내창
                $("#reviewDoneModal").css({display: "block"});
            } // if-else

            $('#doneCheck').click(function(){
                $("#reviewDoneModal").css({display: "none"});
            }); // 확인시 모달창 닫힘
        });

        // 모달창 닫힘
        function closeModal(){
            $("#reviewSuccessModal").css({display: "none"});
        } // closeModal
    </script>
</head>

<body>
    <jsp:include page="/WEB-INF/views/common/header.jsp" flush="false" />

    <div class="wrap">
        <jsp:include page="/WEB-INF/views/mypage/ProfileAndMenu.jsp" flush="false" />
        
        <section class="reservation">
            <div class="header">
                <h1>숙소예약내역</h1>
            </div>

            <c:choose>
                <c:when test="${__PAGINATION__.totalAmount != 0}"> 
                    <article class="reser_context">
                        <ul>
                            <c:forEach var="item" items="${result.model}">
                                <li>
                                    <a href="/mypage/reservation/detail?status=${item.STATUS}&idx=${item.IDX}">
                                        <img src="https://picsum.photos/id/231/600/400" alt="accom image">
                                        <div class="accom_info">
                                            <div class="accom_name">${item.ACCOM_NAME}(${item.ROOM_NAME})</div>
                                            <div class="accom_num">
                                                <i class="bi bi-person"></i>&nbsp; 
                                                성인 ${item.ADULT_COUNT}인
                                                <c:if test="${item.CHILD_COUNT != 0}">
                                                    , 유아 ${item.CHILD_COUNT}인
                                                </c:if>
                                            </div>
                                            <div class="accom_date"><i class="bi bi-calendar"></i>&nbsp; ${item.CHECK_IN_DATE} ~ ${item.CHECK_OUT_DATE}</div>
                                            <div class="accom_location"><i class="bi bi-geo-alt"></i>&nbsp; ${item.LARGE_AREA_NAME}</div>
                                        </div>
                                        <form action="/mypage/reservation/review" method="get" class="btn">
                                            <input type="hidden" value="${item.STATUS}" class="status">
                                            <input type="hidden" name="currPage" value="${__PAGINATION__.cri.currPage}">
                                            <input type="hidden" name="idx" value="${item.IDX}">
                                        </form>
                                    </a>
                                </li>
                            </c:forEach>
                        </ul>
                    </article>

                    <!-- 페이지버튼 -->
                    <div id="pagination">
                        <form action="#" id="paginationForm">
                            <!-- 1. 3가지 기준정보(criteria)는 hidden 정보로 제공 -->
                            <input type="hidden" name="currPage">
            
                            <!-- 2. PageDTO 객체의 정보를 이용해서, Pagenation 출력 -->
                            <ul>
                                <!-- Prev 처리 -->
                                <li class="frontPage"><a href="/mypage/reservation?currPage=1"><i class="bi bi-chevron-double-left"></i></a></li>

                                <c:choose>
                                    <c:when test="${__PAGINATION__.prev}">
                                        <li class="prev"><a href="/mypage/reservation?currPage=${__PAGINATION__.startPage - 1}"><i class="bi bi-chevron-left"></i></a></li>
                                    </c:when>
                                    <c:otherwise>
                                        <li class="prev"><a href="#"><i class="bi bi-chevron-left"></i></a></li>
                                    </c:otherwise>
                                </c:choose>

                                <!-- 현재 Pagination 범위에 속한 페이지 번호 목록 출력 -->
                                <!-- begin부터 end까지 forEach(반복문) -->
                                <c:forEach var="pageNum" begin="${__PAGINATION__.startPage}" end="${__PAGINATION__.endPage}">
                                    <li class="${pageNum == __PAGINATION__.cri.currPage ? 'currPage' : ''}">
                                        <a href="/mypage/reservation?currPage=${pageNum}">
                                            <strong>${pageNum}</strong>
                                        </a>
                                    </li>
                                </c:forEach>
            
                                <!-- Next 처리 -->
                                <c:choose>
                                    <c:when test="${__PAGINATION__.next}">
                                        <li class="next"><a href="/mypage/reservation?currPage=${__PAGINATION__.endPage + 1}"><i class="bi bi-chevron-right"></i></a></li>
                                    </c:when>
                                    <c:otherwise>
                                        <li class="next"><a href="#"><i class="bi bi-chevron-right"></i></a></li>
                                    </c:otherwise>
                                </c:choose>

                                <li class="backPage"><a href="/mypage/reservation?currPage=${__PAGINATION__.realEndPage}"><i class="bi bi-chevron-double-right"></i></a></li>
                            </ul>
                        </form>
                    </div>
                </c:when> 

                <c:otherwise>
                    <div id="no_get">숙소예약내역이 없습니다.</div>
                </c:otherwise>
            </c:choose>
        </section>
    </div>

    <jsp:include page="/WEB-INF/views/common/footer.jsp" flush="false" />

    <!-- 리뷰 작성 성공 모달 -->
    <form class="modal" id="reviewSuccessModal">
        <div class="modal_Content">
            <div class="center simpleTextSpaceAdd">
                <h3 class="center">
                    리뷰 작성이 완료 되었습니다.<br><br>
                    (포인트 적립 완료)
                </h3>
            </div>
        </div>
    </form>

    <!-- 작성된 리뷰가 있다는 모달 -->
    <form class="modal" id="reviewDoneModal">
        <div class="modal_Content">
            <div class="center simpleTextSpaceAdd">
                <h3 class="center">이미 작성 완료된 리뷰입니다.</h3>
            </div>
            <button type="button" class="okBtn onlyOk" id="doneCheck">확인</button>
        </div>
    </form>
</body>

</html>