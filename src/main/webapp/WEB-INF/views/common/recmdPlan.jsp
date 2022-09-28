<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8" />
  <title>Swiper demo</title>
  <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1" />

  <!-- 제이쿼리 -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.4.0/jquery-migrate.min.js"></script>

  <script src="https://kit.fontawesome.com/39d2c0da6a.js" crossorigin="anonymous"></script>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">


  <link rel="stylesheet" href="/resources/common/css/recmdPlan.css">


  <!-- Link Swiper's CSS -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.css" />


</head>

<body>


  <div class="listOuter">
    <!-- Swiper 1 -->
    <c:forEach var="list" items="${__LIST__}">
      <form class="recmdaOuter" id="plan${list.itemNumber}">
        <div class="userInfo">
          <ul>
            <li class="title">${list.largeAreaName}여행</li>
            <li class="username">${list.nickname}</li>
          </ul>

          <!-- 좋아요 수 -->
          <c:if test="${idx == null}">
            
          </c:if>
          <p class="likeBtn bi bi-suit-heart">&nbsp;${list.likes}</p>
        </div>

        <div class="swiper mySwiper">
          <div class="swiper-wrapper">
            <c:forEach var="eachDays" items="${list.eachDays}">
              <c:set var="DAY" value="DAY${eachDays}" />
              <div class="swiper-slide">
                <div class="areaListOuter">
                  <h1>DAY${eachDays}</h1>
                  <ul class="areaList">
                    <c:forEach var="dayNum" items="${list[DAY]}">
                      <li>${dayNum.PLACE_NAME}</li>
                    </c:forEach>
                  </ul>
                </div>
              </div>
            </c:forEach>


          </div>

          <div class="swiper-button-next bi bi-arrow-right-circle-fill nextBtn"></div>
          <div class="swiper-button-prev bi bi-arrow-left-circle-fill prevBtn"></div>
        </div>
        <button class="planAdd" type="button">일정에 추가</button>
      </form>
    </c:forEach>


  </div>


  <div id="planAddModal">
    
    <div class="modalInner">
      <p>해당 일정을 추가하시겠습니까?</p>
      <div class="addController">
        <button class="closeBtn">취소</button>
        <button class="addOkBtn" type="submit">확인</button>
      </div>
    </div>


  </div>



  <!-- Swiper JS -->
  <script src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script>

  <!-- Initialize Swiper -->
  <script>
    var swiper = new Swiper(".mySwiper", {
      navigation: {
        nextEl: ".swiper-button-next",
        prevEl: ".swiper-button-prev",
      },
    });

    $(function () {
      $('.likeBtn').click(function () {

        ajaxtest();
        if ($(this).hasClass('bi-suit-heart')) {
          $(this).removeClass('bi-suit-heart');
          $(this).addClass('bi-suit-heart-fill');
        } else {
          $(this).removeClass('bi-suit-heart-fill');
          $(this).addClass('bi-suit-heart');
        }
      })//click

      // 모달 js
      $('.planAdd').click(function () {
        $("#planAddModal").css('display','block');


      })
      $('.closeBtn').click(function () {
        $("#planAddModal").fadeOut();
      })

    })


  </script>
</body>

</html>