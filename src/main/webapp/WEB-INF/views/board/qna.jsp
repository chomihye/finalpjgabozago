<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Q&A</title>

    <link rel="stylesheet" href="/resources/board/css/qna.css">

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link
        href="https://fonts.googleapis.com/css2?family=Fredoka+One&family=Jua&family=Noto+Sans+KR:wght@100;400&display=swap"
        rel="stylesheet">
<!-- <부트스트랩> -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">

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
        <h1 class="title1">고객센터</h1>

        <div class="menu">
            <ul>
                <li class="no">
                    <div>
                        <a href="/board/notice">
                            <svg xmlns="http://www.w3.org/2000/svg" width="60" height="60" fill="currentColor"
                                class="bi bi-pin-angle" viewBox="0 0 16 16">
                                <path
                                    d="M9.828.722a.5.5 0 0 1 .354.146l4.95 4.95a.5.5 0 0 1 0 .707c-.48.48-1.072.588-1.503.588-.177 0-.335-.018-.46-.039l-3.134 3.134a5.927 5.927 0 0 1 .16 1.013c.046.702-.032 1.687-.72 2.375a.5.5 0 0 1-.707 0l-2.829-2.828-3.182 3.182c-.195.195-1.219.902-1.414.707-.195-.195.512-1.22.707-1.414l3.182-3.182-2.828-2.829a.5.5 0 0 1 0-.707c.688-.688 1.673-.767 2.375-.72a5.922 5.922 0 0 1 1.013.16l3.134-3.133a2.772 2.772 0 0 1-.04-.461c0-.43.108-1.022.589-1.503a.5.5 0 0 1 .353-.146zm.122 2.112v-.002.002zm0-.002v.002a.5.5 0 0 1-.122.51L6.293 6.878a.5.5 0 0 1-.511.12H5.78l-.014-.004a4.507 4.507 0 0 0-.288-.076 4.922 4.922 0 0 0-.765-.116c-.422-.028-.836.008-1.175.15l5.51 5.509c.141-.34.177-.753.149-1.175a4.924 4.924 0 0 0-.192-1.054l-.004-.013v-.001a.5.5 0 0 1 .12-.512l3.536-3.535a.5.5 0 0 1 .532-.115l.096.022c.087.017.208.034.344.034.114 0 .23-.011.343-.04L9.927 2.028c-.029.113-.04.23-.04.343a1.779 1.779 0 0 0 .062.46z" />
                            </svg>
                            <p>공지사항</p>
                        </a>
                    </div>
                </li>
                <li class="fq">
                    <div>
                        <a href="/board/faq">
                            <svg xmlns="http://www.w3.org/2000/svg" width="60" height="60" fill="currentColor"
                                class="bi bi-file-earmark-text" viewBox="0 0 16 16">
                                <path
                                    d="M5.5 7a.5.5 0 0 0 0 1h5a.5.5 0 0 0 0-1h-5zM5 9.5a.5.5 0 0 1 .5-.5h5a.5.5 0 0 1 0 1h-5a.5.5 0 0 1-.5-.5zm0 2a.5.5 0 0 1 .5-.5h2a.5.5 0 0 1 0 1h-2a.5.5 0 0 1-.5-.5z" />
                                <path
                                    d="M9.5 0H4a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h8a2 2 0 0 0 2-2V4.5L9.5 0zm0 1v2A1.5 1.5 0 0 0 11 4.5h2V14a1 1 0 0 1-1 1H4a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h5.5z" />
                            </svg>
                            <p>자주 묻는 질문</p>
                        </a>
                    </div>
                </li>
                <li class="qn">
                    <div>
                        <a href="/board/qna">
                            <svg xmlns="http://www.w3.org/2000/svg" width="60" height="60" fill="currentColor"
                                class="bi bi-patch-question" viewBox="0 0 16 16">
                                <path
                                    d="M8.05 9.6c.336 0 .504-.24.554-.627.04-.534.198-.815.847-1.26.673-.475 1.049-1.09 1.049-1.986 0-1.325-.92-2.227-2.262-2.227-1.02 0-1.792.492-2.1 1.29A1.71 1.71 0 0 0 6 5.48c0 .393.203.64.545.64.272 0 .455-.147.564-.51.158-.592.525-.915 1.074-.915.61 0 1.03.446 1.03 1.084 0 .563-.208.885-.822 1.325-.619.433-.926.914-.926 1.64v.111c0 .428.208.745.585.745z" />
                                <path
                                    d="m10.273 2.513-.921-.944.715-.698.622.637.89-.011a2.89 2.89 0 0 1 2.924 2.924l-.01.89.636.622a2.89 2.89 0 0 1 0 4.134l-.637.622.011.89a2.89 2.89 0 0 1-2.924 2.924l-.89-.01-.622.636a2.89 2.89 0 0 1-4.134 0l-.622-.637-.89.011a2.89 2.89 0 0 1-2.924-2.924l.01-.89-.636-.622a2.89 2.89 0 0 1 0-4.134l.637-.622-.011-.89a2.89 2.89 0 0 1 2.924-2.924l.89.01.622-.636a2.89 2.89 0 0 1 4.134 0l-.715.698a1.89 1.89 0 0 0-2.704 0l-.92.944-1.32-.016a1.89 1.89 0 0 0-1.911 1.912l.016 1.318-.944.921a1.89 1.89 0 0 0 0 2.704l.944.92-.016 1.32a1.89 1.89 0 0 0 1.912 1.911l1.318-.016.921.944a1.89 1.89 0 0 0 2.704 0l.92-.944 1.32.016a1.89 1.89 0 0 0 1.911-1.912l-.016-1.318.944-.921a1.89 1.89 0 0 0 0-2.704l-.944-.92.016-1.32a1.89 1.89 0 0 0-1.912-1.911l-1.318.016z" />
                                <path d="M7.001 11a1 1 0 1 1 2 0 1 1 0 0 1-2 0z" />
                            </svg>
                            <p>1:1문의</p>
                        </a>
                    </div>
                </li>
            </ul>
        </div>
        <h2 class="title">Q&A</h2>
        <h3 class="desc">궁금한 점을 질문해주세요.</h3>

        <div class="article">
            <div class="wrap">
                <table class="board_list notice_table">

                    <caption>공지사항 목록</caption>
                    <thead>
                        <tr>
                            <th class="num">번호</th>
                            <th class="title_N">제목</th>
                            <th class="name">작성자</th>
                            <th class="date">등록일</th>
                            <th class="an">상태</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td class="num">5</td>
                            <td class="title_N">
                                <a href="/board/qna/secret">문의드립니다.</a>
                            </td>
                            <td class="name">김*수</td>
                            <td class="date">2022-09-19</td>
                            <td class="an">
                                <div class="box_f">접수중</div>
                            </td>
                        </tr>

                        <tr>
                            <td class="num">4</td>
                            <td class="title_N">
                                <a href="/board/qna/read2">문의드립니다.</a>
                            </td>
                            <td class="name">정*현</td>
                            <td class="date">2022-09-15</td>
                            <td class="an">
                                <div class="box">답변완료</div>
                            </td>
                        </tr>
                        <tr>
                            <td class="num">3</td>
                            <td class="title_N">
                                <a href="">문의드립니다.</a>
                            </td>
                            <td class="name">김*우</td>
                            <td class="date">2022-09-12</td>
                            <td class="an">
                                <div class="box">답변완료</div>
                            </td>
                        </tr>
                        <tr>
                            <td class="num">2</td>
                            <td class="title_N">
                                <a href="">문의드립니다.</a>
                            </td>
                            <td class="name">이*혁</td>
                            <td class="date">2022-09-12</td>
                            <td class="an">
                                <div class="box">답변완료</div>
                            </td>
                        </tr>
                        <tr>
                            <td class="num">1</td>
                            <td class="title_N">
                                <a href="">문의드립니다.</a>
                            </td>
                            <td class="name">문*일</td>
                            <td class="date">2022-09-10</td>
                            <td class="an">
                                <div class="box">답변완료</div>
                            </td>
                        </tr>
                    </tbody>

                </table>
                <div class="write_box">

                    <a href="/board/qna/write">글쓰기</a>
                </div>
                
            </div>
        </div>
    </section>
    <jsp:include page="/WEB-INF/views/common/footer.jsp" flush="false" />
</body>

</html>