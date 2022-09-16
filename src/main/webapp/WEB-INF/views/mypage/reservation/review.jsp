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
    <link rel="stylesheet" href="/resources/mypage/css/6-10.mypage_reservation_review.css">
    <link rel="stylesheet" href="/resources/mypage/css/modal.css">

    <!-- script -->
    <script src="/resources/mypage/js/6-10.mypage_reservation_review.js"></script>
    <script src="/resources/mypage/js/clickStars.js"></script>

    <script>
        $(function(){       
            $("#reservation").css("font-weight", "bold");
            // $(".profileAndMenu .profile h2").append('${sessionScope.__MEMBER__.nickname}');

            window.history.forward();

            $(document).on("click", ".btnWrite", function(){
                var grade1 = $('input[name=g1]').val();
                var grade2 = $('input[name=g2]').val();
                var grade3 = $('input[name=g3]').val();

                // 별점에 0점이 있으면, 실패 모달창 
                if(grade1 == 0 || grade2 == 0 || grade3 == 0){
                    $("#reviewFailedModal").css({display: "block"});
                }else {     // 그렇지 않은 경우, 최종 확인 모달창
                    // 선택한 별점 값 가져오기
                    $("#reviewCheckModal h3.center").html("선택하신 별점은 청결도 "+ grade1 + "점, 위치 " + grade2 + "점, 전체적인 만족도 " + grade3 + "점입니다.<br>리뷰를 작성하시겠습니까?<br>(리뷰 작성시 포인트 500점이 적립됩니다.)");

                    // 최종 input grade에 값 넣어주기
                    $('#reviewCheckModal input[name=grade1]').attr('value', grade1);
                    $('#reviewCheckModal input[name=grade2]').attr('value', grade2);
                    $('#reviewCheckModal input[name=grade3]').attr('value', grade3);

                    $("#reviewCheckModal").css({display: "block"});
                } // if
            });

            $("#failCheck").click(function(){
                $(".modal").css({display: "none"});
            }); // 확인 버튼 클릭

            $(".cancelBtn").click(function(){
                $(".modal").css({display: "none"});
            }); // 취소 버튼 클릭
        });
    </script>
</head>

<body>
    <jsp:include page="/WEB-INF/views/common/header.jsp" flush="false" />

    <div class="wrap">
        <jsp:include page="/WEB-INF/views/mypage/ProfileAndMenu.jsp" flush="false" />
        
        <section class="accom_review">
            <div class="header">
                <a href="#"><i class="fas fa-angle-left"></i></a>
                <h1>후기 작성</h1>
            </div>

            <form class="reviewBox">
                 <div class="withOutBtn">
                    <ul class="review_check">
                        <li>
                            <h3>청결도</h3>
                            <div class="starScore" id="cleanliness">
                                <i class="bi bi-star" id="1"></i>
                                <i class="bi bi-star" id="2"></i>
                                <i class="bi bi-star" id="3"></i>
                                <i class="bi bi-star" id="4"></i>
                                <i class="bi bi-star" id="5"></i>
                                <input type="hidden" name="g1" value="0">
                            </div>
                        </li>
                        <li>
                            <h3>위치</h3>
                            <div class="starScore" id="location">
                                <i class="bi bi-star" id="1"></i>
                                <i class="bi bi-star" id="2"></i>
                                <i class="bi bi-star" id="3"></i>
                                <i class="bi bi-star" id="4"></i>
                                <i class="bi bi-star" id="5"></i>
                                <input type="hidden" name="g2" value="0">
                            </div>
                        </li>
                        <li>
                            <h3>전체적인 만족도</h3>
                            <div class="starScore" id="satisfaction">
                                <i class="bi bi-star" id="1"></i>
                                <i class="bi bi-star" id="2"></i>
                                <i class="bi bi-star" id="3"></i>
                                <i class="bi bi-star" id="4"></i>
                                <i class="bi bi-star" id="5"></i>
                                <input type="hidden" name="g3" value="0">
                            </div>
                        </li>
                    </ul>
                    <div class="accom_info">
                        <img src="/resources/acco/img/himg/${__MAP__.FILE_NAME}" alt="">
                        <div class="accom_info_letter">
                            <h2>${__MAP__.ACCOM_NAME}</h2>
                            <p>${__MAP__.ROOM_NAME}</p>
                        </div>
                    </div>
                </div>
                <div class="btnReview">
                    <button type="button" class="btnCancel" onclick="location.href='/mypage/reservation?currPage=${__cri__.currPage}'">취소</button>
                    <button type="button" class="btnWrite">작성하기</button>
                </div>
            </form>            
        </section>
    </div>

    <jsp:include page="/WEB-INF/views/common/footer.jsp" flush="false" />

    <!-- 리뷰 작성 체크 모달 -->
    <form
        action="/mypage/reservation/review?currPage=${__cri__.currPage}&reservationIdx=${__MAP__.IDX}&memberIdx=${__MAP__.MEMBER_IDX}&accomRoomIdx=${__MAP__.ACCOM_ROOM_IDX}" 
        method="post"  
        class="modal" 
        id="reviewCheckModal">

        <div class="modal_Content">
            <div class="center simpleTextSpaceAdd">
                <h3 class="center"></h3>
                <input type="hidden" name="grade1" value="0">
                <input type="hidden" name="grade2" value="0">
                <input type="hidden" name="grade3" value="0">
            </div>
            <div class="btnWrap">
                <button type="button" class="cancelBtn">취소</button>
                <button type="summit" class="okBtn" id="sucCheck">확인</button>
            </div>
        </div>
    </form>

    <!-- 리뷰 작성 실패 모달 -->
    <form class="modal" id="reviewFailedModal">
        <div class="modal_Content">
            <div class="center simpleTextSpaceAdd">
                <h3 class="center">별점은 각 항목 최소 1점 이상 선택해주시기 바랍니다.</h3>
            </div>
            <button type="button" class="okBtn onlyOk" id="failCheck">확인</button>
        </div>
    </form>
</body>

</html>