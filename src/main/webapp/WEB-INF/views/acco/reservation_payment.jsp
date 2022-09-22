<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html lang="ko">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>가보자GO</title>

        <!-- 폰트 -->
        <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700;900&display=swap"
            rel="stylesheet" />

        <link rel="preconnect" href="https://fonts.googleapis.com" />
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />


        <!--파비콘 -->
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

        <!-- 아이콘 -->
        <script src="https://kit.fontawesome.com/79c63cc024.js" crossorigin="anonymous"></script>

        <!-- css연결 -->
        <link rel="stylesheet" href="/resources/acco/css/reset.css">
        <link rel="stylesheet" href="/resources/acco/css/payment.css">

        <!-- 부트스트랩아이콘 -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">

        <!-- 제이쿼리 -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.4.0/jquery-migrate.min.js"></script>


        <!-- js -->
        
        <script>
            $(function () {
                $('.header').load("header.html")

                $('.card_icon_box').click(function () {
                    $('.card_icon_box').toggleClass('act');
                });

                $(".term_arrow_first").click(function () {
                    $("#terms_modal").css({ display: "block" });
                }); // 약관 1

                $(".okBtn").click(function () {
                    $("#terms_modal").css({ display: "none" });
                }); // 약관 1 닫기

                $(".term_arrow_second").click(function () {
                    $("#terms_modal_person").css({ display: "block" });
                }); // 약관 2

                $(".okBtn").click(function () {
                    $("#terms_modal_person").css({ display: "none" });
                }); // 약관 2 닫기


                $(".term_arrow_third").click(function () {
                    $("#terms_modal_sale").css({ display: "block" });
                }); // 약관 3
                $(".okBtn").click(function () {
                    $("#terms_modal_sale").css({ display: "none" });
                }); // 약관3 닫기

                $(".btn_payment").click(function () {
                    $("#pay_modal").css({ display: "block" });
                }); // 약관 3
                $(".okBtn").click(function () {
                    $("#terms_modal_sale").css({ display: "none" });
                });

                $(".btn_payment").click(function () {
                    $("#pay_modal").css({ display: "block" });
                }); // 결제창 모달
                $(".pay_okbtn").click(function () {
                    $("#pay_modal").css({ display: "none" });
                });

                $(".check_group").on('click', '#all_check', function () {
                    console.log(this);
                    const checked = $(this).is(':checked');
                    if (checked) {
                        $(this).parents('.check_group').find('input').prop('checked', true);
                    } else {
                        $(this).parents('.check_group').find('input').prop('checked', false);
                    }
                })//결제체크박스

                $("#point_input").on("propertychange change keyup paste", function(){

                    const maxPoint = parseInt('${member.POINT}');
                    let inputValue = parseInt($(this).val());

                    setPaymentPoint(isNaN(inputValue) ? 0 : inputValue);
                    if(inputValue < 0 ){
                        $(this).val(0);
                    } else if(inputValue > maxPoint){
                        $(this).val(maxPoint);
                    }
                });//포인트 범위

                function setPaymentPoint(point) {
                    $("#payment_point").text(point);
                };

                $(".point_all").on('click',function(){
                	
                    const maxPoint = parseInt('${member.POINT}');
                    $("#point_input").val(maxPoint);
                    setPaymentPoint(isNaN(maxPoint) ? 0 : maxPoint);
                    
                }); //전액사용 버튼 클릭시 포인트 변경



                function setTotalInfo(){

                    let hotelPrice = 0; //호텔 원래 가격
                    let usePoint = 0; //포인트
                    let finalPrice = 0; //포인트 반영된 호텔가격

                    usePoint = $("#point_input").val();
                    finalPrice = hotelPrice - usePoint;

                    //호텔 원래 가격
                    $(".hotel_price").text(hotelPrice);
                    //최종 가격
                    $(".final_price").text(finalPrice);




                }

            });

        </script>

    </head>


    <body>
         <jsp:include page="/WEB-INF/views/common/header.jsp" flush="false" />

        <div class="title">
            <div class="book_check">
                <i class="bi bi-chevron-left"></i>
                <h1>예약 확인 및 결제</h1>
            </div>
        </div>

        <div class="main_wrapper">
            <div class="wrap">

                <h2 class="book_info">예약정보</h2>

                <div class="select_room">
                    <div class="room_thum">
                        <img src="/resources/acco/img/rimg/${accom.FILE_NAME}" alt="">
                    </div>

                    <div class="room_detail">
                        <div class="room_name">${accom.ACCOM_NAME}</div>
                        <span class="book_date">${check_in_date} ~ ${check_out_date}</span>
                    </div>
                </div>

                <div class="room_type_box">
                    <span class="room_type">
                        ${accom.ROOM_NAME}
                    </span>
                    <span class="room_price">
                        ${accom.PRICE}원
                    </span>
                </div>


                <h2 class="point_info">포인트 사용</h2>

                <div class="point">
                    <input type="text" class="point_input" id="point_input" placeholder="0P" value="0"/>
                    <button type="button" class="point_all">
                        전액사용
                    </button>
                </div>
                <div class="use_point">
                    사용가능한 포인트
                    <div class="point_number">${member.POINT}P</div>
                </div>

                <h2 class="book_info">예약자 정보</h2>

                <div class="book_person">
                    <div class="book_name">
                        <span>예약자 이름</span>
                        <span>${member.NAME}</span>
                    </div>
                    <div class="book_email">
                        <span>이메일 주소</span>
                        <span>${member.EMAIL}</span>
                    </div>
                    <div class="book_phone">
                        <span>휴대전화 번호</span>
                        <span>${member.PHONE}</span>
                    </div>
                </div>


                <h2 class="payment_info">결제수단 선택</h2>

                <button type="button" class="card_icon_box">
                    <i class="bi bi-credit-card"></i>
                    <div class="credit_card">신용카드</div>
                </button>

            </div>


            <div class="payment_section">
                <div class="payment_green_box">

                    <div class="wrapper">
                        <div class="payment_name">결제정보</div>

                        <div class="green_pay">
                            <div class="green_payment">
                                <span>주문금액</span>
                                <span class="hotel_price">${accom.PRICE}원</span>
                            </div>
                            <div class="green_payment">
                                <span>포인트 사용금액</span>
                                <span class="point"><span id="payment_point">0</span>P</span>
                            </div>
                        </div>
                    </div>

                    <div class="deep_green_box">

                        <div class="wrapper">
                            <div class="total_pay">
                                <div>총 결제금액</div>
                                <div class="final_price">231,000원</div>
                            </div>
                        </div>
                    </div>

                    <div class="wrapper check_group">
                        <div class="payment_name">약관안내</div>
                        <label class="terms_all">
                            <input type="checkbox" name="all" id="all_check" />
                            전체 약관 동의
                        </label>
                        <div class="white_box">
                            <label>

                                <input type="checkbox" name="terms_traveler" id="check_01" />
                                <span class="btn_view_more">여행자 약관(필수)</span>
                                <button type="button" class="term_arrow_first"><i
                                        class="bi bi-chevron-right"></i></button>

                            </label>
                            <label>
                                <input type="checkbox" name="terms_private_info" id="check_02" />
                                <span class="btn_view_more">개인정보 제공 동의(필수)</span>
                                <button type="button" class="term_arrow_second"><i
                                        class="bi bi-chevron-right"></i></button>
                            </label>
                            <label>
                                <input type="checkbox" name="terms_discount_info" id="check_03" />
                                <span class="btn_view_more">할인혜택 안내(선택)</span>
                                <button type="button" class="term_arrow_third"><i
                                        class="bi bi-chevron-right"></i></button>
                            </label>
                        </div>
                        <button type="button" class="btn_payment">231,000원 결제하기</button>
                    </div>

                </div>

            </div>
        </div>

        <div class="modal" id="terms_modal">
            <div class="modal_Content">

                <div class="term_wrap">
                    <p>여행자 약관</p>

                    <div class="term_box">
                        <p>
                            1. 개인위치정보의 처리

                            가보자GO는 위치정보의 보호 및 이용 등에 관한 법률에 따라 이용자의 개인위치정보를 안전하게 관리합니다.

                            개인위치정보의 처리목적 및 보유기간

                            : 가보자GO는 위치정보 이용약관에서 정한 목적 범위 내에서 개인위치정보를 수집‧이용하며, 개인위치정보를 일회성으로 이용 후 지체 없이 파기합니다.

                            개인위치정보 수집ㆍ이용ㆍ제공사실 확인자료의 보유근거 및 보유기간

                            : 마이리얼트립은 위치정보의 보호 및 이용 등에 관한 법률 제16조 제2항에 근거하여 이용자의 위치정보 수집ㆍ이용ㆍ제공사실 확인자료를 기록, 보존하며, 1년간
                            보관합니다.

                            개인위치정보 파기 절차 및 방법

                            : 가보자GO는 개인위치정보의 처리목적이 달성된 경우, 개인위치정보를 재생이 불가능한 방법으로 안전하게 파기하고 있습니다. 전자적 파일 형태는 복구 및 재생이
                            불가능한
                            기술적인
                            방법으로
                            파기하며, 출력물 등은
                            분쇄하거나 소각하는 방식으로 파기합니다.

                            개인위치정보의 제3자 제공 및 통보에 관한 사항

                            : 가보자GO는 이용자의 사전 동의 없이 개인위치정보를 제3자에게 제공하지 않으며, 이용자가 지정한 제3자에게 개인위치정보를 제공하는 경우 매회 개인위치정보주체에게
                            제공받는 자,
                            제공일시 및 제공목적을 즉시
                            통보합니다.

                            보호의무자의 권리ㆍ의무 및 그 행사방법

                            : 가보자GO는 아래의 경우에 해당하는 자(이하 “8세 이하의 아동 등”)의 위치정보의 보호 및 이용 등에 관한 법률 제26조2항에 해당하는 자(이하
                            “보호의무자”)가
                            8세
                            이하의 아동
                            등의 생명 또는 신체보호를
                            위하여 개인위치정보의 이용 또는 제공에 동의하는 경우에는 본인의 동의가 있는 것으로 봅니다.
                        </p>
                    </div>
                </div>
                <!-- <p class="center simpleTextSpaceAdd">중복 확인이 완료되었습니다.</p> -->
                <div class="okBtn">확인</div>
            </div>
        </div>

        <div class="modal" id="terms_modal_person">
            <div class="modal_Content">

                <div class="term_wrap">
                    <p>개인정보 제공 동의</p>

                    <div class="term_box">
                        <p>
                            1. 개인위치정보의 처리

                            가보자GO는 위치정보의 보호 및 이용 등에 관한 법률에 따라 이용자의 개인위치정보를 안전하게 관리합니다.

                            개인위치정보의 처리목적 및 보유기간

                            : 가보자GO는 위치정보 이용약관에서 정한 목적 범위 내에서 개인위치정보를 수집‧이용하며, 개인위치정보를 일회성으로 이용 후 지체 없이 파기합니다.

                            개인위치정보 수집ㆍ이용ㆍ제공사실 확인자료의 보유근거 및 보유기간

                            : 마이리얼트립은 위치정보의 보호 및 이용 등에 관한 법률 제16조 제2항에 근거하여 이용자의 위치정보 수집ㆍ이용ㆍ제공사실 확인자료를 기록, 보존하며, 1년간
                            보관합니다.

                            개인위치정보 파기 절차 및 방법

                            : 가보자GO는 개인위치정보의 처리목적이 달성된 경우, 개인위치정보를 재생이 불가능한 방법으로 안전하게 파기하고 있습니다. 전자적 파일 형태는 복구 및 재생이
                            불가능한
                            기술적인
                            방법으로
                            파기하며, 출력물 등은
                            분쇄하거나 소각하는 방식으로 파기합니다.

                            개인위치정보의 제3자 제공 및 통보에 관한 사항

                            : 가보자GO는 이용자의 사전 동의 없이 개인위치정보를 제3자에게 제공하지 않으며, 이용자가 지정한 제3자에게 개인위치정보를 제공하는 경우 매회 개인위치정보주체에게
                            제공받는 자,
                            제공일시 및 제공목적을 즉시
                            통보합니다.

                            보호의무자의 권리ㆍ의무 및 그 행사방법

                            : 가보자GO는 아래의 경우에 해당하는 자(이하 “8세 이하의 아동 등”)의 위치정보의 보호 및 이용 등에 관한 법률 제26조2항에 해당하는 자(이하
                            “보호의무자”)가
                            8세
                            이하의 아동
                            등의 생명 또는 신체보호를
                            위하여 개인위치정보의 이용 또는 제공에 동의하는 경우에는 본인의 동의가 있는 것으로 봅니다.
                        </p>
                    </div>
                </div>
                <!-- <p class="center simpleTextSpaceAdd">중복 확인이 완료되었습니다.</p> -->
                <div class="okBtn">확인</div>
            </div>
        </div>

        <div class="modal" id="terms_modal_sale">
            <div class="modal_Content">

                <div class="term_wrap">
                    <p>할인혜택안내</p>

                    <div class="term_box">
                        <p>
                            개인위치정보의 제3자 제공 및 통보에 관한 사항

                            : 가보자GO는 이용자의 사전 동의 없이 개인위치정보를 제3자에게 제공하지 않으며, 이용자가 지정한 제3자에게 개인위치정보를 제공하는 경우 매회 개인위치정보주체에게
                            제공받는 자,
                            제공일시 및 제공목적을 즉시
                            통보합니다.

                            보호의무자의 권리ㆍ의무 및 그 행사방법

                            : 가보자GO는 아래의 경우에 해당하는 자(이하 “8세 이하의 아동 등”)의 위치정보의 보호 및 이용 등에 관한 법률 제26조2항에 해당하는 자(이하
                            “보호의무자”)가
                            8세
                            이하의 아동
                            등의 생명 또는 신체보호를
                            위하여 개인위치정보의 이용 또는 제공에 동의하는 경우에는 본인의 동의가 있는 것으로 봅니다.
                        </p>
                    </div>
                </div>
                <!-- <p class="center simpleTextSpaceAdd">중복 확인이 완료되었습니다.</p> -->
                <div class="okBtn">확인</div>
            </div>
        </div>

        <div class="modal" id="pay_modal">
            <div class="modal_Content">
                <h3><i class="fas fa-check"></i>결제가 완료되었습니다</h3>
                <p>예약 번호 202200803001</p>
                <p>아래 예약내역 확인 버튼을 눌러 상세 예약 내역을 확인하세요</p>

                <div class="pay_wrap">
                    <a href="/mypage/reservation/detail">
                        <div class="check_btn">예약내역확인</div>
                    </a>
                    <a href="/reservation/">
                        <div class="pay_okbtn">확인</div>
                    </a>
                </div>
            </div>
        </div>


         <jsp:include page="/WEB-INF/views/common/footer.jsp" flush="false" />

    </body>



    </html>