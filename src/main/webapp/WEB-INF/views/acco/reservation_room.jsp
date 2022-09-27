<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>가보자GO</title>
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />

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

    <!-- 폰트 -->
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700;900&display=swap"
        rel="stylesheet" />

    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />

    <!-- css연결 -->
    <link rel="stylesheet" href="/resources/acco/css/reset.css">
    <link rel="stylesheet" href="/resources/acco/css/reservationroom.css" />
    

    <!-- 제이쿼리 -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.4.0/jquery-migrate.min.js"></script>

    <!-- 부트스트랩아이콘 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">

    <!-- 부트스트랩 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://getbootstrap.com/docs/5.2/assets/css/docs.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"></script>



    <script src="../js/reservation_main.js"></script>


    <!-- 헤더 html가져오기 -->
    <!-- <script>
        $(function () {

            $('.header').load("header.html");
            $('.footer').load("footer.html");

            $(".person_btn").click(function () {
                $("#personModal").css({ display: "block" });
            }); //인원 선택시 모달창 열림

            $(".person_apply_btn").click(function () {
                $("#personModal").css({ display: "none" });
            }); //인원 적용하기 선택시 모달창 닫기

            $(".room_img_first").click(function () {
                $("#change_info_img").attr("src", "../img/room1.jpg")
            })

            $(".room_img_second").click(function () {
                $("#change_info_img").attr("src", "../img/room2.jpg")
            })
      });
    </script> -->

</head>

<body>
      <jsp:include page="/WEB-INF/views/common/header.jsp" flush="false" />

    <div class="wrap">

        <div class="info_detail">
            <div class="info_exp">
                <div class="info_exp_left">
                    <i>ROOM INFORMATION</i>
                    <h4>${_ACCOM_.ROOM_NAME}</h4>
                    <span>${_ACCOM_.ROOM_DESC}</span>
                </div>
                <div class="np-box">
                    <!-- <a href="/reservation/payment?room_idx=${_ACCOM_.IDX}">
                        <button type="button" class="detail_reserve_btn">예약하기</button>
                    </a> -->
                    <p>체크인 ${_ACCOM_.CHECK_IN} / 체크아웃 ${_ACCOM_.CHECK_OUT}</p>
                    <p>기준 인원 ${_ACCOM_.DEFAULT_COUNT}명 (최대 인원 ${_ACCOM_.MAX_COUNT}명)</p>
                    <p>객실면적 ${_ACCOM_.ROOM_AREA}㎡</p>
                    <p>${_ACCOM_.ROOM_OPTION}</p>
                </div>



            </div>

            <div class="container" id="change_info_img">
                <div id="carouselExampleIndicators" class="carousel slide" data-interval="false">
                    <div class="carousel-indicators">
                      <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0"
                        class="active" aria-current="true" aria-label="Slide 1"></button>
                        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1"
                            aria-label="Slide 2"></button>
                        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2"
                            aria-label="Slide 3"></button>
                    </div>

                    <div class="carousel-inner">
                        <div class="carousel-item active">
                            <img src="/resources/acco/img/rimg/${_ACCOM_.FILE_NAME}" class="d-block w-100" alt="...">
                        </div>
                        <div class="carousel-item">
                            <img src="/resources/acco/img/slide.jpg" class="d-block w-100" alt="...">
                        </div>
                        <div class="carousel-item">
                            <img src="/resources/acco/img/slide2.jpg" class="d-block w-100" alt="...">
                        </div>
                    </div>
                    <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators"
                        data-bs-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Previous</span>
                    </button>
                    <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators"
                        data-bs-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Next</span>
                    </button>
                </div>
            </div>
        </div>
    </div>




    <jsp:include page="/WEB-INF/views/common/footer.jsp" flush="false" />

    <!-- JavaScript Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2"
        crossorigin="anonymous"></script>


</body>

</html>