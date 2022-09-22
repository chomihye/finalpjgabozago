<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>질문글</title>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">

    <!-- css -->
    <link rel="stylesheet" href="/resources/board/css/qwrite.css">


    <!-- font -->
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

            <h2 class="title">Q&A</h2>
            <h3 class="desc">궁금한 점을 질문해주세요.</h3>

            <div class="w_box">
                <form action="">
                    <fieldset style="border-radius: 2px;">
                        <legend style="font-size: 40px;">문의내용<i class="bi bi-chat-text"></i></legend>
                        <div class="I">
                            이름 <input type="text" name="name" placeholder="이름 입력" id="name" required>
                            비밀번호 <input type="password" name="pw" placeholder="4자리 비밀번호" id="pw" maxlength="4" required>
                            <br>
                            제목 <input type="text" name="title" placeholder="제목을 입력해주세요" id="title" required><br>
                            내용 <input type="text" name="writing" placeholder="내용을 입력해주세요" id="writing"
                                style="vertical-align: text-top;" required>
                        </div><br>
                        <div class="button">
                            <input type="button" name="취소" value="취소" id="C">
                            <input type="submit" name="저장" value="저장" id="S">
                        </div>
                    </fieldset>
                </form>

            </div>
        </div>
    </section>

    <jsp:include page="/WEB-INF/views/common/footer.jsp" flush="false" />
</body>

</html>