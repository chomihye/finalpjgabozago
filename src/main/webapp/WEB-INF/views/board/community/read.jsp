<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>게시글</title>

    <link rel="stylesheet" href="/resources/board/css/cread.css">

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">

    <!-- js -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.4.0/jquery-migrate.min.js"></script>

    <script src="/resources/board/js/cread.js"></script>

    <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

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
        <div id="contents">
            <div class="C_head">
                <div class="T_box">
                    <span class="img">
                        <img src="/resources/board/img/프로필사진1.jpg" alt="">
                    </span>
                    <span class="nname">감자</span>
                </div>
                <div class="titl">
                    <h2>
                        서울의 랜드마크를 만나다
                    </h2>
                </div>
                <div class="icon_area">
                    <button type="button" class="like" style="font-size: 22px; margin-right: 3px;">
                        <i class="bi bi-hand-thumbs-up" title="일정이 마음에 들었다면 좋아요를 눌러주세요."></i>
                    </button>
                    <div class="num_1">521</div>
                    <div class="views">
                        <em class="tit">조회수</em>
                        <span class="num_2">684</span>
                    </div>
                    <div class="R">
                        <button type="button" class="share">
                            <i class="bi bi-share" style="font-size: 22px; margin-right: 5px;"></i>
                        </button>
                        <button type="button" class="cos">
                            <i class="bi bi-map" style="font-size: 22px;" title="내 일정으로 담아 편집해보세요."></i>
                        </button>
                    </div>
                </div>
            </div>
            <!-- 일정담기 모달 -->
            <div class="modal">
                <div class="modal_Content">
                    <p class="center simpleTextSpaceAdd">일정담기가 완료되었습니다</p>
                    <div class="wish_btn">
                        <a href="/travel/main" class="my_plan"> 여행일정으로 가기</a>
                        <div class="okBtn">닫기</div>
                    </div>
                </div>
            </div>

            <!-- 공유하기 모달 -->
            <div class="share_modal">
                <div class="modal_Content1">
                    <p class="center simpleTextSpaceAdd">SNS공유하기</p>
                    <a id="kakao-link-btn" href="javascript:sendLink()">
                        <img src="//developers.kakao.com/assets/img/about/logos/kakaolink/kakaolink_btn_medium.png" />
                    </a>

                </div>

            </div>

            <!-- 삭제하기모달 -->
            <div class="delete_modal">
                <div class="modal_Content2">
                    <p class="center simpleTextSpaceAdd">삭제하시겠습니까?</p>
                    <div class="wish_btn">
                        <div class="my_plan">취소</div>
                        <a href="/board/community" class="okBtn"> 확인</a>
                    </div>
                </div>
            </div>


            <div class="contview">
                <p>
                    Lorem ipsum dolor sit amet consectetur adipisicing elit. Modi, quod!
                </p><br>
                <img src="/resources/board/img/서울.jpg" alt="" width="600px;" height="400px;"><br>
                <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Incidunt excepturi distinctio facere quod,
                    repudiandae nisi ab! Corporis dolor recusandae laborum, praesentium ducimus tenetur quisquam quaerat
                    maiores sapiente tempora, ratione odio?</p><br>
                <img src="/resources/board/img/경복궁.jpg" alt="" width="700px;" height="400px;"><br>
                <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Tenetur corporis fugiat nobis reprehenderit
                    cumque esse eius laudantium ipsum asperiores ad quisquam doloremque ab, minima vitae illum, optio
                    natus aliquid modi impedit eum neque. Ab ipsum sint, officia provident dicta, rem ducimus fuga
                    suscipit ipsam officiis vel est expedita, ex consequatur.</p>
            </div>

            <!-- 카카오지도 -->
            <div id="map" style="width:700px;height:400px; margin: 0 auto; text-align: center;"></div>
            <script type="text/javascript"
                src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1bf7dab3489217502cebde8adf15b293"></script>

            <div class="bottom">
                <div class="B">
                    <div class="comment">
                        <span class="comm">댓글</span>
                        <span class="num">(0)</span>
                        <i class="bi bi-chat-dots"></i>
                    </div>
                    <div class="button">
                        <input type="button" name="수정" value="수정" id="C">
                        <input type="submit" name="삭제" value="삭제" id="S">
                    </div>
                </div>

                <div class="comm_box">
                    <input type="text" placeholder="댓글을 입력해주세요">
                    <div class="sa_b">
                        <input type="button" name="등록" value="등록" id="save">
                    </div>
                </div>
                <div class="L">
                    <input type="button" value="목록으로" id="B" onclick="location.href='/board/community'">
                </div>
            </div>
        </div>
    </section>

    <jsp:include page="/WEB-INF/views/common/footer.jsp" flush="false" />

</body>

</html>
<script>
    var mapContainer = document.getElementById('map'), // 지도를 표시할 div

        mapOption = {

            center: new kakao.maps.LatLng(37.57755021522997, 126.97688034075432), // 지도의 중심좌표

            level: 4 // 지도의 확대 레벨

        };


    var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다


    //첫번째 띄울 좌표

    var first_positions = [

        {

            content: '<div>경복궁</div>',

            latlng: new kakao.maps.LatLng(37.57755021522997, 126.97688034075432)

        },

        {

            content: '<div>근정전</div>',

            latlng: new kakao.maps.LatLng(37.57857288328094, 126.97708379957913)

        },

        {

            content: '<div>경복궁 박광일 참치</div>',

            latlng: new kakao.maps.LatLng(37.57832852004439, 126.9720064966232)

        }

    ];


   
    // 첫번째 마커 생성

    for (var i = 0; i < first_positions.length; i++) {

        // 마커를 생성합니다

        var marker = new kakao.maps.Marker({

            map: map, // 마커를 표시할 지도

            position: first_positions[i].latlng // 마커의 위치// 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다

        });


        // 마커에 표시할 인포윈도우를 생성합니다

        var infowindow = new kakao.maps.InfoWindow({

            content: first_positions[i].content, // 인포윈도우에 표시할 내용

            removable: true

        });


        kakao.maps.event.addListener(marker, 'click', marker_click(map, marker, infowindow));

    }


    function marker_click(map, marker, infowindow) {

        return function () {

            infowindow.open(map, marker);

        };

    }


    // 선을 구성하는 좌표 배열입니다. 이 좌표들을 이어서 선을 표시합니다

    var first_polyline = [

        new kakao.maps.LatLng(37.57755021522997, 126.97688034075432),

        new kakao.maps.LatLng(37.57857288328094, 126.97708379957913),

        new kakao.maps.LatLng(37.57832852004439, 126.9720064966232)

    ];


    // 지도에 표시할 선을 생성합니다

    var first_linePath = new kakao.maps.Polyline({

        path: first_polyline, // 선을 구성하는 좌표배열 입니다

        strokeWeight: 3, // 선의 두께 입니다

        strokeColor: 'blue', // 선의 색깔입니다

        strokeOpacity: 0.7, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다

        strokeStyle: 'solid' // 선의 스타일입니다

    });

    // 지도에 선을 표시합니다

    first_linePath.setMap(map);

    second_polyline.setMap(map);

</script>