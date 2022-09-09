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
 
    <!-- 제이쿼리 -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.4.0/jquery-migrate.min.js"></script>
 
    <!-- CSS -->
    <link rel="stylesheet" href="/resources/mypage/css/6-1.mypage_main.css">

    <!-- script -->
    <script src="/resources/mypage/js/6-1.mypage_main.js"></script>
</head>

<body>
    <jsp:include page="/WEB-INF/views/common/header.jsp" flush="false" />

    <div class="wrap">
        <jsp:include page="/WEB-INF/views/mypage/ProfileAndMenu.jsp" flush="false" />
        
        <section class="main">
            <div class="menuBox">
                <ul class="menu">
                    <li><a href="/mypage/plan"><i class="bi bi-calendar-check"></i><span>여행일정</span></a></li>
                    <li><a href="/mypage/wishlist"><i class="bi bi-heart"></i><span>위시리스트</span></a></li>
                    <li><a href="/mypage/point"><i class="bi bi-p-circle"></i><span>마이포인트</span></a></li>
                    <li><a href="/mypage/write"><i class="bi bi-card-list"></i><span>작성 글/댓글</span></a></li>
                </ul>
            </div>

            <article class="reservation">
                <div class="header">
                    <h1>숙소예약내역</h1>
                        
                    <div class="more">
                        <a href="/mypage/reservation"><span>더보기</span> <i class="bi bi-caret-right-fill"></i></a>
                    </div>
                </div>

                <c:choose>
                    <c:when test="${__PAGINATION__.totalAmount != 0}"> 
                        <ul class="accom">
                            <c:forEach var="item" items="${result.model}">
                                <li>
                                    <a href="/mypage/reservation/detail?status=${item.STATUS}&idx=${item.IDX}" class="accomInfoBox">
                                        <img src="https://picsum.photos/id/684/80/80" alt="accom image">
                                        <div class="accom_info">
                                            <div class="accom_name">${item.ACCOM_NAME}</div>
                                            <div class="accom_name">(${item.ROOM_NAME})</div>
                                            <div class="reser_date"><i class="bi bi-calendar"></i> <span>${item.CHECK_IN_DATE} ~ ${item.CHECK_OUT_DATE}</span></div>
                                        </div>
                                    </a>
                                </li>
                            </c:forEach>
                        </ul>
                    </c:when> 

                    <c:otherwise>
                        <div id="no_get">숙소예약내역이 없습니다.</div>
                    </c:otherwise>
                </c:choose>
            </article>
        </section>
    </div>

    <jsp:include page="/WEB-INF/views/common/footer.jsp" flush="false" />
</body>
</html>