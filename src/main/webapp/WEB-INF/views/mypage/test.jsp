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
    <link rel="stylesheet" href="/resources/mypage/css/6-12.mypage_wishlist.css">
    <link rel="stylesheet" href="/resources/common/css/pagination.css">

    <!-- script -->
    <script src="/resources/mypage/js/6-12.mypage_wishlist.js"></script>
</head>

<body>
    <jsp:include page="/WEB-INF/views/common/header.jsp" flush="false" />

    <div class="wrap">
        <jsp:include page="/WEB-INF/views/mypage/ProfileAndMenu.jsp" flush="false" />

        <section class="wishlist">
            <div class="header">
                <h1>위시리스트</h1>
                <div>
                    <label for="wishlist_type">숙소/일정</label>
                    <select name="wishlist_type" id="wishlist_type">
                        <option value="accom" selected>숙소</option>
                        <option value="plan">일정</option>
                    </select>
                </div>
            </div>

            <!-- 숙소 선택 영역(default) -->
            <article class="wishlist_accom">
                <div class="select">
                    <input type="checkbox" id="selectAll" name="selectAll">
                    <label for="selectAll"></label>
                    <label for="selectAll" class="selectAll">전체선택</label>
                    <a href="javascript:void(0);" class="selectDelete">선택삭제</a>
                </div>

                <ul id="accom_list"></ul>
            </article>

            <!-- 페이지버튼 -->
            <div id="pagination" class="accomPage">
                <form action="#" id="paginationForm">
                    <!-- 1. 3가지 기준정보(criteria)는 hidden 정보로 제공 -->
                    <input type="hidden" name="currPage">
    
                    <!-- 2. PageDTO 객체의 정보를 이용해서, Pagenation 출력 -->
                    <ul id="pagingBtn">
                        <!-- Prev 처리 -->
                        <li class="frontPage"><a href="javascript:void(0);" onclick="getAccomWishlist('1')"><i class="bi bi-chevron-double-left"></i></a></li>
                        <li class="prev yesPrev"><a href="javascript:void(0);"><i class="bi bi-chevron-left"></i></a></li>

                        <div class="pageNumber"></div>

                        <!-- Next 처리 -->
                        <li class="next yesNext"><a href="javascript:void(0);"><i class="bi bi-chevron-right"></i></a></li>
                        <li class="backPage"><a href="javascript:void(0);"><i class="bi bi-chevron-double-right"></i></a></li>
                    </ul>
                </form>
            </div>
        </section>
    </div>

    <jsp:include page="/WEB-INF/views/common/footer.jsp" flush="false" />
</body>
</html>