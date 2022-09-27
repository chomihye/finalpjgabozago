<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>질문글</title>

    <link rel="stylesheet" href="/resources/board/css/qread.css">

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
    <jsp:include page="/WEB-INF/views/common/header_admin.jsp" flush="false" />
    <section>
        <div class="head">
            <h2 class="title">Q&A</h2>
            <h3 class="desc">궁금한 점을 질문해주세요.</h3>

            <div class="w_box">
                <h2>문의드립니다.</h2>
                <div class="I_box">
                    <div class="date">2022-09-15</div>
                    <div class="name">정*현</div>
                </div>
                <hr width="990px">
                <div class="R">
                    <p>결제중에 오류가 났는데 다시 결제하려고 보니 적립금이 사라졌어요 다시 들어오나요??</p>
                </div>
            
                <div class="F">
                    <input type="button" value="삭제" id="D">
                </div>

                <hr width="990px">
                <div class="A">
                    <p>
                        답변:) <br><br><br>
                        결제 중 멈춤 혹은 결제인증실패로 인해 정상결제가 되지 않았을 경우, 사용했던 적립금은 자동으로 복원됩니다.<br><br>
                        혹시라도 복원이 되지 않고 포인트가 사라졌다면, 고객지원실(1670-8208) 혹은 1:1 채팅상담, [문의하기]를 통해 고객지원실로 문의를 접수해주시면 적립금의 활성화 여부를 확인해드리도록 하겠습니다.<br>
                    </p>
                </div>
                <div class="L">
                    <input type="button" value="목록으로" id="B" onclick="location.href='/admin/content/question'">
                </div>
            </div>
        </div>
    </section>
    <jsp:include page="/WEB-INF/views/common/footer.jsp" flush="false" />
</body>

</html>