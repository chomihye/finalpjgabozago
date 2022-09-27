<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>공지사항 글</title>

    <link rel="stylesheet" href="/resources/board/css/nread.css">

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link
        href="https://fonts.googleapis.com/css2?family=Fredoka+One&family=Jua&family=Noto+Sans+KR:wght@100;400&display=swap"
        rel="stylesheet">

    <!-- js -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.4.0/jquery-migrate.min.js"></script>

    <!--fabozago favicon -->
    <link rel="shortcut icon" href="/resources/common/ico/favicon.ico">
    <link rel="icon" href="../ico/favicon.ico" type="image/x-icon">
    <link rel="icon" type="image/png" sizes="192x192" href="/resources/commonico/android-icon-192x192.png">
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

</head>

<body>
    <jsp:include page="/WEB-INF/views/common/header.jsp" flush="false" />
    <section>
        <div class="head">
            <h2 class="title">NOTICE</h2>
            <h3 class="desc">가보자GO의 최신소식을 확인해주세요.</h3>

            <div class="w_box">
                <h2>[한국관광공사] 관광데이터에도 인공지능 도입한다</h2>
                <div class="I_box">
                    <div class="date">2022-09-16</div>
                    <div class="name">조회수 39</div>
                </div>
                <hr width="900px">
                <div class="R">
                    <img src="/resources/board/img/travel.jpg" alt="">
                    <p>한국관광공사(사장직무대행 신상용)는 관광분야 공공데이터를 활용한 AI 알고리즘 개발을 위한 ‘2022 관광데이터 AI 경진대회’를 오늘부터 10월 31일까지 국내 최대
                        데이터분석 플랫폼인 데이콘에서 온라인으로 진행한다.

                        이번 경진대회의 과제는 공사가 보유한 2만 3천여 개의 국문 관광지점정보(POI : Point Of Interest)의 텍스트와 이미지 데이터를 인공지능 학습데이터로 활용,
                        관광지점의 유형을 자동 분류하는 최적의 알고리즘을 개발하는 것이다. 현재 ‘대한민국 구석구석’ 등 공사의 누리집을 통해 공개되는 관광지 정보의 유형 분류는 사람 손을 거치고
                        있으나, 이를 자동화함으로써 더 많은 데이터 생성과 향상된 처리 효율, 검색능력의 개선이 기대된다.

                        심사는 분류 성능을 평가하는 산식과 전문가의 엄정한 코드심사로 진행되며, 대상 1팀(한국관광공사 사장상), 우수상 1팀, 장려상 2팀을 선정한다. 상금은 총 1천만 원
                        규모로 1등 5백만 원, 2등 3백만 원, 3등 각 1백만 원이 수여된다.

                        AI 알고리즘 개발과 데이터 분석에 관심 있는 사람이라면 개인 또는 5인 이하의 팀을 구성해 누구나 참가할 수 있다. 경진대회 참가와 관련된 자세한 사항은 데이콘 누리집(
                        dacon.io )에서 확인할 수 있다.

                        공사 조윤미 관광빅데이터전략팀장은 “공사의 관광지점정보를 적용한 다양한 여행 어플리케이션이 만들어지고 있다”며, “이번 경진대회를 통해 AI를 활용한 우수한 알고리즘이
                        만들어져, 효율적인 관광정보 관리체계 구축과 개방형 혁신이 이루어지기를 기대한다”고 밝혔다.
                    </p>
                </div>
                <hr width="900px">
                <div class="L">
                    <input type="button" value="목록으로" id="B" onclick="location.href='/board/notice'">
                </div>
            </div>
        </div>
    </section>
    <jsp:include page="/WEB-INF/views/common/footer.jsp" flush="false" />
</body>

</html>