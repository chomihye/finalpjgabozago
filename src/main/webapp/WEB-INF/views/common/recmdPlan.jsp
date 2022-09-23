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
    <form class="recmdaOuter">
      <div class="userInfo">
        <ul>
          <li class="title">${planList1[0].largeAreaVO.largeAreaName}여행</li>
          <li class="username">${planList1[0].memberVO.nickname}</li>
        </ul>
        <!-- 좋아요 수 -->
        
        <p class="likeBtn bi bi-suit-heart">&nbsp;20</p>
      </div>

      <div class="swiper mySwiper">
        <div class="swiper-wrapper">
          <div class="swiper-slide day1">

            <div class="areaListOuter">
              <h1>DAY1</h1>

              <ul class="areaList">

                <c:forEach items="${planList1}" var="planList1">
                  <c:if test="${planList1.travelPlanDetailVO.day==1}">

                    <li>${planList1.travelPlanDetailVO.placeName}</li>

                  </c:if>
                </c:forEach>
              </ul>


            </div>
          </div>
          <div class="swiper-slide day2">

            <div class="areaListOuter">
              <h1>DAY2</h1>

              <ul class="areaList">
                <c:forEach items="${planList1}" var="planList1">
                  <c:if test="${planList1.travelPlanDetailVO.day==2}">

                    <li>${planList1.travelPlanDetailVO.placeName}</li>

                  </c:if>
                </c:forEach>

              </ul>
            </div>
          </div>
          <div class="swiper-slide day3">

            <div class="areaListOuter">
              <h1>DAY3</h1>

              <ul class="areaList">
                <c:forEach items="${planList1}" var="planList1">
                  <c:if test="${planList1.travelPlanDetailVO.day==3}">

                    <li>${planList1.travelPlanDetailVO.placeName}</li>

                  </c:if>
                </c:forEach>

              </ul>
            </div>
          </div>
          <div class="swiper-slide day4">

            <div class="areaListOuter">
              <h1>DAY4</h1>

              <ul class="areaList">
                <c:forEach items="${planList1}" var="planList1">
                  <c:if test="${planList1.travelPlanDetailVO.day==4}">

                    <li>${planList1.travelPlanDetailVO.placeName}</li>

                  </c:if>
                </c:forEach>

              </ul>
            </div>
          </div>
          <div class="swiper-slide day5">

            <div class="areaListOuter">
              <h1>DAY5</h1>

              <ul class="areaList">
                <c:forEach items="${planList1}" var="planList1">
                  <c:if test="${planList1.travelPlanDetailVO.day==5}">

                    <li>${planList1.travelPlanDetailVO.placeName}</li>

                  </c:if>
                </c:forEach>

              </ul>
            </div>
          </div>
          <div class="swiper-slide day6">

            <div class="areaListOuter">
              <h1>DAY6</h1>

              <ul class="areaList">
                <c:forEach items="${planList1}" var="planList1">
                  <c:if test="${planList1.travelPlanDetailVO.day==6}">

                    <li>${planList1.travelPlanDetailVO.placeName}</li>

                  </c:if>
                </c:forEach>

              </ul>
            </div>
          </div>
          <div class="swiper-slide day7">

            <div class="areaListOuter">
              <h1>DAY7</h1>

              <ul class="areaList">
                <c:forEach items="${planList1}" var="planList1">
                  <c:if test="${planList1.travelPlanDetailVO.day==7}">

                    <li>${planList1.travelPlanDetailVO.placeName}</li>

                  </c:if>
                </c:forEach>

              </ul>
            </div>
          </div>
        </div>

        <div class="swiper-button-next bi bi-arrow-right-circle-fill nextBtn"></div>
        <div class="swiper-button-prev bi bi-arrow-left-circle-fill prevBtn"></div>
      </div>
      <button class="planAdd" type="button">일정에 추가</button>
    </form>


    <!-- Swiper 2 -->
    <div class="recmdaOuter">
      <div class="userInfo">
        <ul>
          <li class="title">${planList2[0].largeAreaVO.largeAreaName}여행</li>
          <li class="username">${planList2[0].memberVO.nickname}</li>
        </ul>
        <!-- 좋아요 수 -->
        <p class="likeBtn bi bi-suit-heart">&nbsp;20</p>
      </div>

      <div class="swiper mySwiper">
        <div class="swiper-wrapper">

          
            <div class="swiper-slide day1">

              <div class="areaListOuter">
                <h1>DAY1</h1>


                <ul class="areaList">

                  <c:forEach items="${planList2}" var="planList2">
                    <c:if test="${planList2.travelPlanDetailVO.day==1}">

                      <li>${planList2.travelPlanDetailVO.placeName}</li>

                    </c:if>
                  </c:forEach>
                </ul>


              </div>
            </div>
          





          <div class="swiper-slide day2">

            <div class="areaListOuter">
              <h1>DAY2</h1>

              <ul class="areaList">
                <c:forEach items="${planList2}" var="planList2">
                  <c:if test="${planList2.travelPlanDetailVO.day==2}">

                    <li>${planList2.travelPlanDetailVO.placeName}</li>

                  </c:if>
                </c:forEach>

              </ul>
            </div>
          </div>
          <div class="swiper-slide day3">

            <div class="areaListOuter">
              <h1>DAY3</h1>

              <ul class="areaList">
                <c:forEach items="${planList2}" var="planList2">
                  <c:if test="${planList2.travelPlanDetailVO.day==3}">

                    <li>${planList2.travelPlanDetailVO.placeName}</li>

                  </c:if>
                </c:forEach>

              </ul>
            </div>
          </div>
          <div class="swiper-slide day4">

            <div class="areaListOuter">
              <h1>DAY4</h1>

              <ul class="areaList">
                <c:forEach items="${planList2}" var="planList2">
                  <c:if test="${planList2.travelPlanDetailVO.day==4}">

                    <li>${planList2.travelPlanDetailVO.placeName}</li>

                  </c:if>
                </c:forEach>

              </ul>
            </div>
          </div>
          <div class="swiper-slide day5">

            <div class="areaListOuter">
              <h1>DAY5</h1>

              <ul class="areaList">
                <c:forEach items="${planList2}" var="planList2">
                  <c:if test="${planList2.travelPlanDetailVO.day==5}">

                    <li>${planList2.travelPlanDetailVO.placeName}</li>

                  </c:if>
                </c:forEach>

              </ul>
            </div>
          </div>
          <div class="swiper-slide day6">

            <div class="areaListOuter">
              <h1>DAY6</h1>

              <ul class="areaList">
                <c:forEach items="${planList2}" var="planList2">
                  <c:if test="${planList2.travelPlanDetailVO.day==6}">

                    <li>${planList2.travelPlanDetailVO.placeName}</li>

                  </c:if>
                </c:forEach>
              </ul>
            </div>
          </div>
          <div class="swiper-slide day7">

            <div class="areaListOuter">
              <h1>DAY7</h1>

              <ul class="areaList">
                <c:forEach items="${planList2}" var="planList2">
                  <c:if test="${planList2.travelPlanDetailVO.day==7}">

                    <li>${planList2.travelPlanDetailVO.placeName}</li>

                  </c:if>
                </c:forEach>

              </ul>
            </div>
          </div>
        </div>

        <div class="swiper-button-next bi bi-arrow-right-circle-fill nextBtn"></div>
        <div class="swiper-button-prev bi bi-arrow-left-circle-fill prevBtn"></div>
      </div>

      <button class="planAdd" type="button">일정에 추가</button>
    </div>


    <!-- Swiper 3 -->
    <div class="recmdaOuter">
      <div class="userInfo">
        <ul>
          <li class="title">${planList3[0].largeAreaVO.largeAreaName}여행</li>
          <li class="username">${planList3[0].memberVO.nickname}</li>
        </ul>
        <!-- 좋아요 수 -->
        <p class="likeBtn bi bi-suit-heart">&nbsp;20</p>
      </div>

      <div class="swiper mySwiper">
        <div class="swiper-wrapper">
          <div class="swiper-slide day1">

            <div class="areaListOuter">
              <h1>DAY1</h1>


              <ul class="areaList">

                <c:forEach items="${planList3}" var="planList3">
                  <c:if test="${planList3.travelPlanDetailVO.day==1}">

                    <li>${planList3.travelPlanDetailVO.placeName}</li>

                  </c:if>
                </c:forEach>
              </ul>


            </div>
          </div>
          <div class="swiper-slide day2">

            <div class="areaListOuter">
              <h1>DAY2</h1>

              <ul class="areaList">
                <c:forEach items="${planList3}" var="planList3">
                  <c:if test="${planList3.travelPlanDetailVO.day==2}">

                    <li>${planList3.travelPlanDetailVO.placeName}</li>

                  </c:if>
                </c:forEach>

              </ul>
            </div>
          </div>
          <div class="swiper-slide day3">

            <div class="areaListOuter">
              <h1>DAY3</h1>

              <ul class="areaList">
                <c:forEach items="${planList3}" var="planList3">
                  <c:if test="${planList3.travelPlanDetailVO.day==3}">

                    <li>${planList3.travelPlanDetailVO.placeName}</li>

                  </c:if>
                </c:forEach>

              </ul>
            </div>
          </div>
          <div class="swiper-slide day4">

            <div class="areaListOuter">
              <h1>DAY4</h1>

              <ul class="areaList">
                <c:forEach items="${planList3}" var="planList3">
                  <c:if test="${planList3.travelPlanDetailVO.day==4}">

                    <li>${planList3.travelPlanDetailVO.placeName}</li>

                  </c:if>
                </c:forEach>

              </ul>
            </div>
          </div>
          <div class="swiper-slide day5">

            <div class="areaListOuter">
              <h1>DAY5</h1>

              <ul class="areaList">
                <c:forEach items="${planList3}" var="planList3">
                  <c:if test="${planList3.travelPlanDetailVO.day==5}">

                    <li>${planList3.travelPlanDetailVO.placeName}</li>

                  </c:if>
                </c:forEach>

              </ul>
            </div>
          </div>
          <div class="swiper-slide day6">

            <div class="areaListOuter">
              <h1>DAY6</h1>

              <ul class="areaList">
                <c:forEach items="${planList3}" var="planList3">
                  <c:if test="${planList3.travelPlanDetailVO.day==6}">

                    <li>${planList3.travelPlanDetailVO.placeName}</li>

                  </c:if>
                </c:forEach>
              </ul>
            </div>
          </div>
          <div class="swiper-slide day7">

            <div class="areaListOuter">
              <h1>DAY7</h1>

              <ul class="areaList">
                <c:forEach items="${planList3}" var="planList3">
                  <c:if test="${planList3.travelPlanDetailVO.day==7}">

                    <li>${planList3.travelPlanDetailVO.placeName}</li>

                  </c:if>
                </c:forEach>

              </ul>
            </div>
          </div>
        </div>

        <div class="swiper-button-next bi bi-arrow-right-circle-fill nextBtn"></div>
        <div class="swiper-button-prev bi bi-arrow-left-circle-fill prevBtn"></div>
      </div>

      <button class="planAdd" type="button">일정에 추가</button>
    </div>
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

    function ajaxtest() {
      $.ajax({
        url:"main",
        type:"GET",
        success:function(){alert("성공")},
        error:function(){alert("실패")}
      })
    }
    
    $(function () {
      $('.likeBtn').click(function () {

        ajaxtest();
        // if ($(this).hasClass('bi-suit-heart')) {
        //   $(this).removeClass('bi-suit-heart');
        //   $(this).addClass('bi-suit-heart-fill');
        // } else {
        //   $(this).removeClass('bi-suit-heart-fill');
        //   $(this).addClass('bi-suit-heart');
        // }
      })//click

      // 모달 js
      $('.planAdd').click(function () {
        $("#planAddModal").fadeIn();
      })
      $('.closeBtn').click(function () {
        $("#planAddModal").fadeOut();
      })

    })


  </script>
</body>

</html>