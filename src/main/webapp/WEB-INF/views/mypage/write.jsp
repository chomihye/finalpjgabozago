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
    <link rel="stylesheet" href="/resources/mypage/css/6-14.mypage_write.css">

    <!-- script -->
    <script src="/resources/mypage/js/6-14.mypage_write.js"></script>
    <!-- <script>
        $(function(){
            $(".profileAndMenu .profile h2").append('${sessionScope.__MEMBER__.nickname}');
        });
    </script> -->
</head>

<body>
    <jsp:include page="/WEB-INF/views/common/header.jsp" flush="false" />

    <div class="wrap">
        <jsp:include page="/WEB-INF/views/mypage/ProfileAndMenu.jsp" flush="false" />
        
        <section class="myWrite">
            <div class="header">
                <h1>작성 글/댓글</h1>
                <div>
                    <label for="write_type"></label>
                    <select name="write_type" id="write_type" onchange="showValue(this)">
                        <option value="board" selected>글</option>
                        <option value="comment">댓글</option>
                    </select>
                </div>
            </div>

            <!-- 작성 글 -->
            <article id="write_board" class="write_context">
                <ul>
                    <li>
                        <a href="#" class="writeBox">
                            <img src="https://picsum.photos/id/231/600/400" alt="travel image">
                            <div class="write_info">
                                <h3>글제목</h3>
                                <p>글 내용 미리보기</p>
                            </div>
                            <div class="write_date">2000-00-00 00:00 AM</div>
                        </a>
                    </li>
                    <li>
                        <a href="#" class="writeBox">
                            <img src="https://picsum.photos/id/231/600/400" alt="travel image">
                            <div class="write_info">
                                <h3>글제목</h3>
                                <p>글 내용 미리보기</p>
                            </div>
                            <div class="write_date">2000-00-00 00:00 AM</div>
                        </a>
                    </li>
                    <li>
                        <a href="#" class="writeBox">
                            <img src="https://picsum.photos/id/231/600/400" alt="travel image">
                            <div class="write_info">
                                <h3>글제목</h3>
                                <p>글 내용 미리보기</p>
                            </div>
                            <div class="write_date">2000-00-00 00:00 AM</div>
                        </a>
                    </li>
                    <li>
                        <a href="#" class="writeBox">
                            <img src="https://picsum.photos/id/231/600/400" alt="travel image">
                            <div class="write_info">
                                <h3>글제목</h3>
                                <p>글 내용 미리보기</p>
                            </div>
                            <div class="write_date">2000-00-00 00:00 AM</div>
                        </a>
                    </li>
                    <li>
                        <a href="#" class="writeBox">
                            <img src="https://picsum.photos/id/231/600/400" alt="travel image">
                            <div class="write_info">
                                <h3>글제목</h3>
                                <p>글 내용 미리보기</p>
                            </div>
                            <div class="write_date">2000-00-00 00:00 AM</div>
                        </a>
                    </li>
                </ul>
            </article>

            <!-- 작성 댓글 -->
            <article id="write_comment" class="write_context">
                <ul>
                    <li>
                        <a href="#" class="writeBox">
                            <div class="comment_info">
                                <h3>댓글내용</h3>
                                <p>원글제목 : <span>원글제목부분입니다.</span>&nbsp;[<span>댓글수</span>]</p>
                            </div>
                            <div class="write_date">2000-00-00 00:00 AM</div>
                        </a>
                    </li>
                    <li>
                        <a href="#" class="writeBox">
                            <div class="comment_info">
                                <h3>댓글내용</h3>
                                <p>원글제목 : <span>원글제목부분입니다.</span>&nbsp;[<span>댓글수</span>]</p>
                            </div>
                            <div class="write_date">2000-00-00 00:00 AM</div>
                        </a>
                    </li>
                    <li>
                        <a href="#" class="writeBox">
                            <div class="comment_info">
                                <h3>댓글내용</h3>
                                <p>원글제목 : <span>원글제목부분입니다.</span>&nbsp;[<span>댓글수</span>]</p>
                            </div>
                            <div class="write_date">2000-00-00 00:00 AM</div>
                        </a>
                    </li>
                    <li>
                        <a href="#" class="writeBox">
                            <div class="comment_info">
                                <h3>댓글내용</h3>
                                <p>원글제목 : <span>원글제목부분입니다.</span>&nbsp;[<span>댓글수</span>]</p>
                            </div>
                            <div class="write_date">2000-00-00 00:00 AM</div>
                        </a>
                    </li>
                    <li>
                        <a href="#" class="writeBox">
                            <div class="comment_info">
                                <h3>댓글내용</h3>
                                <p>원글제목 : <span>원글제목부분입니다.</span>&nbsp;[<span>댓글수</span>]</p>
                            </div>
                            <div class="write_date">2000-00-00 00:00 AM</div>
                        </a>
                    </li>
                </ul>
            </article>

            <!-- 페이지버튼 임시 -->
            <div class="btnPage">페이지버튼</div>
        </section>
    </div>

    <jsp:include page="/WEB-INF/views/common/footer.jsp" flush="false" />
</body>

</html>