<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>부산</title>

  <!-- 폰트어썸, 부트스트랩 폰트 -->
  <script src="https://kit.fontawesome.com/39d2c0da6a.js" crossorigin="anonymous"></script>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">

  <!-- 부트스트랩 css, js -->
  <link rel="stylesheet" href="/resources/common/css/bootstrap.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
    integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
    crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct"
    crossorigin="anonymous"></script>

  <!-- css -->
  <link rel="stylesheet" href="/resources/common/css/best_plan_reset.css">
  <link rel="stylesheet" href="/resources/common/css/slide_plan.css">
  
</head>

<body>


  <div class="slideContainer">

    <div id="plan4" class="carousel slide" data-touch="false" data-interval="false">

      <!-- 여행제목 + 닉네임 -->
      <div class="userInfo">
        <ul>
          <li class="title">여행이름</li>
          <li class="username">닉네임</li>
        </ul>
        <!-- 좋아요 수 -->
        <p><i class="bi bi-suit-heart-fill"></i> 20</p>
      </div>


      <!-- 슬라이드 영역 -->
      <div class="carousel-inner">

        <div class="carousel-item active">

          <div class="dayList">
            <h1>DAY1</h1>
            <div class="areaList">
              <img src="/resources/common/img/list.png" width="">
              <ul>
                <li>롯데월드</li>
                <li>흰여울 문화마을</li>
                <li>수변공원</li>
                <li>광안리 해수욕장</li>
                <li>비프광장</li>
                <li>감천문화마을</li>
                <li>해운대</li>
              </ul>
            </div>
          </div>
        </div>

        <div class="carousel-item">
          <div class="dayList">
            <h1>DAY2</h1>
            <div class="areaList">
              <img src="/resources/common/img/list.png">
              <ul>
                <li>롯데월드</li>
                <li>흰여울 문화마을</li>
                <li>수변공원</li>
                <li>광안리 해수욕장</li>
                <li>장소5</li>
                <li>장소6</li>
                <li>장소7</li>
              </ul>
            </div>
          </div>
        </div>

        <div class="carousel-item">
          <div class="dayList">
            <h1>DAY3</h1>
            <div class="areaList">
              <img src="/resources/common/img/list.png">
              <ul>
                <li>장소1</li>
                <li>장소2</li>
                <li>장소3</li>
                <li>장소4</li>
                <li>장소5</li>
                <li>장소6</li>
                <li>장소7</li>
              </ul>
            </div>
          </div>
        </div>

        <div class="carousel-item">
          <div class="dayList">
            <h1>DAY4</h1>
            <div class="areaList">
              <img src="/resources/common/img/list.png">
              <ul>
                <li>장소1</li>
                <li>장소2</li>
                <li>장소3</li>
                <li>장소4</li>
                <li>장소5</li>
                <li>장소6</li>
                <li>장소7</li>
              </ul>
            </div>
          </div>
        </div>

        <div class="carousel-item">
          <div class="dayList">
            <h1>DAY5</h1>
            <div class="areaList">
              <img src="/resources/common/img/list.png">
              <ul>
                <li>장소1</li>
                <li>장소2</li>
                <li>장소3</li>
                <li>장소4</li>
                <li>장소5</li>
                <li>장소6</li>
                <li>장소7</li>
              </ul>
            </div>
          </div>
        </div>

        <div class="carousel-item">
          <div class="dayList">
            <h1>DAY6</h1>
            <div class="areaList">
              <img src="/resources/common/img/list.png">
              <ul>
                <li>장소1</li>
                <li>장소2</li>
                <li>장소3</li>
                <li>장소4</li>
                <li>장소5</li>
                <li>장소6</li>
                <li>장소7</li>
              </ul>
            </div>
          </div>
        </div>

        <div class="carousel-item">
          <div class="dayList">
            <h1>DAY7</h1>
            <div class="areaList">
              <img src="/resources/common/img/list.png">
              <ul>
                <li>장소1</li>
                <li>장소2</li>
                <li>장소3</li>
                <li>장소4</li>
                <li>장소5</li>
                <li>장소6</li>
                <li>장소7</li>
              </ul>
            </div>
          </div>
        </div>


      </div>


      <button id="leftArrow" class="carousel-control-prev arrows" type="button"
        data-target="#plan4" data-slide="prev">
        <span class="bi bi-arrow-left-circle-fill" aria-hidden="true"></span>
      </button>

      <button id="rightArrow" class="carousel-control-next arrows" type="button"
        data-target="#plan4" data-slide="next">
        <span class="bi bi-arrow-right-circle-fill" aria-hidden="true"></span>
      </button>


      <button class="planAdd" onclick="location.href='/travel/main'">일정에 추가</button>


    </div> <!-- carousel-inner -->
  </div>

</body>

</html>