<%@ page isELIgnored="false" contentType="text/html; charset=UTF-8" %>



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

    <!-- 부트스트랩아이콘 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">

    <!-- 부트스트랩 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://getbootstrap.com/docs/5.2/assets/css/docs.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"></script>

    <!-- css연결 -->
    <link rel="stylesheet" href="/resources/acco/css/reset.css">
    <link rel="stylesheet" href="/resources/acco/css/reservationdetail.css" />
    <link rel="stylesheet" href="../css/rating.css">
    <!-- 달력 -->
    <link rel="stylesheet" href="/resources/acco/css/datepicker.css">

    <!-- 제이쿼리 -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.4.0/jquery-migrate.min.js"></script>
    <!-- 달력  -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
    <link rel="stylesheet" type="text/css" href="https://npmcdn.com/flatpickr/dist/themes/material_green.css">
    <script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
    <script src="https://npmcdn.com/flatpickr/dist/l10n/ko.js"></script>

    <!-- 룸 선택 슬라이드  -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.css" />
    <script src="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.js"></script>

    <!-- 자바스크립트 -->
    <script src="/resources/acco/js/reservation_main.js"></script>


    <!-- 헤더 html가져오기 -->
    <script>
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


    </script>

  </head>

  <body>


    <jsp:include page="/WEB-INF/views/common/header.jsp" flush="false" />

    <div class="header_box">
      <img src="/resources/acco/img/banner_room.jpg" alt="" />
    </div>




    <div class="wrap">
      <div class="select_box">

        <div class="acco_name">${_ACCOM_.ACCOM_NAME}</div>

        <div class="small_search_box">
          <ul class="np-box">
            <li>
              <i class="bi bi-calendar-check"></i>
              <div>
                <p class="title">체크인</p>
             
                	<input type="text" id="dateSelector" class="datepicker_input" name="checkInDate" value="" placeholder="체크인 날짜를 선택하세요" />
              	
              </div>
            </li>
            <li>
              <i class="bi bi-calendar-check"></i>
              <div>
                <p class="title">체크아웃</p>
                <input type="text" id="dateSelector2" class="datepicker_input" name="checkOutDate" value=""
                  placeholder="체크아웃 날짜를 선택하세요" />
              </div>
            </li>
            <li>
              <i class="bi bi-person-plus"></i>
              <div>
                <p class="title">인원</p>
                <button type="button" class="person_btn" id="person_btn">인원을 선택하세요</button>
              </div>
            </li>
          </ul>

          <button type="button"><i class="bi bi-search"></i></button>


        </div>
      </div>
    </div>




    <div class="green_box">
      <div class="wrap">

        <div class="acco_rooms">ROOMS</div>

        <!-- 룸선택 슬라이드  -->
        <div class="swiper first-swiper">
          <div class="swiper-wrapper">
            <c:forEach items="${_ACCOM_.room_list}" var="list">
              <div class="swiper-slide room_card">
                <div class="room_card_warp">
                  <div class="img_box">
                    <a href="/reservation/room?room_idx=${list.IDX}">
                      <img src="/resources/acco/img/rimg/${list.FILE_NAME}" alt="${list.ROOM_NAME} 이미지"
                        class="room_img_first">
                    </a>
                  </div>
                  <div class="room_type">${list.ROOM_NAME}</div>
                  <div class="room_price">₩${list.PRICE}</div>
                  
                  <a href="javascript:void(0);" class="book_btn" onclick="moveToPaymentPage('${list.IDX}');">예약하기</a>
                </div>
              </div>
            </c:forEach>


          </div>

          <div class="swiper-pagination"></div>

          <div class="swiper-button-prev">
            <i class="bi bi-chevron-left"></i>
          </div>
          <div class="swiper-button-next">
            <i class="bi bi-chevron-right"></i>
          </div>
        </div>
      </div>
    </div>

    <div class="map_area">
      <div class="map">
        <iframe src="https://map.google.com/maps?q=${_ACCOM_.LATITUDE},${_ACCOM_.LONGITUDE}&hl=kr&z=14&amp;output=embed"
          width="100%" height="500" style="border:0;" allowfullscreen="" loading="lazy"
          referrerpolicy="no-referrer-when-downgrade">
        </iframe>
      </div>

      <div class="map_location">
        <div class="map_icon">
          <!-- <i class="bi bi-geo-alt-fill"></i> -->
        </div>
        <div class="location_info">
          <span>위치안내</span>
          <div>${_ACCOM_.ADDRESS}</div>
        </div>
      </div>
    </div>
   

    <div class="wrap">
      <div class="acco_review">후기</div>
    </div>

    <div class="gray_box">


      <div class="wrap">
        <div class="avg_box">

          <div class="top_review">
            <div class="review_detail">
              <span>${_REVIEW_.GRADE1}</span>
              <div class="avg_star">
                <div>청결도</div>
              </div>
            </div>

            <div class="review_detail">
              <span>${_REVIEW_.GRADE2}</span>
              <div class="avg_star">
                <div>위치</div>
              </div>
            </div>

            <div class="review_detail">
              <span>${_REVIEW_.GRADE3}</span>
              <div class="avg_star">
                <div>만족도</div>
              </div>
            </div>

            <!-- <span>4.0</span>
                <div class="avg_star">
                  <i class="bi bi-star-fill"></i>
                  <i class="bi bi-star-fill"></i>
                  <i class="bi bi-star-fill"></i>
                  <i class="bi bi-star-fill"></i>
                  <i class="bi bi-star"></i>
                </div> -->
          </div>



        </div>

        <!-- 리뷰슬라이드 -->
        <div class="swiper second-swiper">
          <div class="swiper-wrapper">
            <c:forEach items="${_ACCOM_.review_list}" var="list">
              <div class="swiper-slide star_box">

                <div class="star_box_wrap">
                  <div class="star_name ">${list.NICKNAME}</div>
                  <div class="review_room_type">룸 타입 : ${list.ROOM_NAME}</div>
                  <div class="np-box">
                    <p class="star_review">청결도 ${list.GRADE1}</p>
                    <p class="star_review">위치&nbsp;&nbsp;&nbsp;&nbsp; ${list.GRADE2}</p>
                    <p class="star_review">만족도 ${list.GRADE3}</p>
                  </div>
                </div>
              </div>
            </c:forEach>
          </div>

          <div class="swiper-pagination"></div>

          <div class="swiper-button-prev">
            <i class="bi bi-chevron-left"></i>
          </div>
          <div class="swiper-button-next">
            <i class="bi bi-chevron-right"></i>
          </div>
        </div>
      </div>
    </div>


    <!-- 인원선택모달 -->

    <div class="modal" id="personModal">
      <div class="modal_content_people">
        <h3><i class="bi bi-person-plus"></i>인원을 선택하세요</h3>


        <div class="person_btn_wrap">

          <div class="adult_btn">
            성인

            <button type="button" class="minus" onclick="decrease('adult_count')">-</button>
            <span class="setting_number" id="adult_count">2</span>
            <!-- <input type="text" class="number_input" id="a" value="2"> -->
            <button type="button" class="plus" onclick="increase('adult_count')">+</button>

          </div>

          <div class="child_btn">
            유아
            <button type="button" class="minus" onclick="decrease('child_count')">-</button>
            <!-- <input type="text" class="number_input"> -->
            <span class="setting_number" id="child_count">0</span>
            <button type="button" class="plus" onclick="increase('child_count')">+</button>
          </div>
        </div>

        <div class="person_apply_btn">
          <div class="cancel_btn">취소</div>
          <div class="okBtn" id="person_okbtn">적용하기</div>
        </div>

      </div>
    </div>

    <jsp:include page="/WEB-INF/views/common/footer.jsp" flush="false" />

    <!-- JavaScript Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous">

      </script>

    <script>
      const swiper = new Swiper('.first-swiper', {
        autoplay: {
          delay: 5000
        },
        loop: true,
        slidesPerView: 2,
        // spaceBetween: 0,
        centeredSlides: false,
        pagination: {
          el: '.swiper-pagination',
          clickable: true
        },
        navigation: {
          prevEl: '.swiper-button-prev',
          nextEl: '.swiper-button-next'
        },
        // slidesOffsetBefore: ,
        // slidesOffsetAfter: 10
        // mousewheel: true
      });

      const second_swiper = new Swiper('.second-swiper', {
        autoplay: {
          delay: 5000
        },
        loop: true,
        slidesPerView: 3,
        spaceBetween: -10,
        centeredSlides: false,
        pagination: {
          el: '.swiper-pagination',
          clickable: true
        },
        navigation: {
          prevEl: '.swiper-button-prev',
          nextEl: '.swiper-button-next'
        },
        // mousewheel: true

      });

      var dateSelector = document.querySelector('#dateSelector');
      dateSelector.flatpickr({
    	local:"ko",
        monthSelectorType: "dropdown",
        dateFormat: "Y-m-d",
        minDate: "today"
      });

      var dateSelector = document.querySelector('#dateSelector2');
      dateSelector.flatpickr({
    	local:"ko",
        monthSelectorType: "dropdown",
        dateFormat: "Y-m-d",
        minDate: "today",
        maxDate: new Date().fp_incr(730)
      });
    </script>

    <script>
      function moveToPaymentPage(idx) {
        let check_in_date = $('[name=checkInDate]').val();
        let check_out_date = $('[name=checkOutDate]').val();
        const url = "/reservation/payment?room_idx="+idx+"&check_in_date="+check_in_date+"&check_out_date="+check_out_date;
        
        location.href = url;
      }
      
      $(function () {
    	 $('input[name=checkInDate]').attr('value','${check_in_date}'); 
    	 $('input[name=checkOutDate]').attr('value','${check_out_date}');
    	 
      });
    </script>
  </body>

  </html>