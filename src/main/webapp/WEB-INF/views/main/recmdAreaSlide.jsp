<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <title>demo</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1" />
    <!-- Link Swiper's CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.css" />

    <!-- Demo styles -->
    <link rel="stylesheet" href="/resources/main/css/recmdAreaSlide.css">
</head>

<body>
    <!-- Swiper -->
    <div class="recmdAreaOuter">
        <div class="swiper-container recmdAreaSwiper">
            <div class="swiper-wrapper areainfoWrapper">
                <div class="swiper-slide areainfo current" data-area="area1">
                    <img src="/resources/main/img/gyeongju/gyeongju.jpg">
                    <p>경주</p>
                </div>
                <div class="swiper-slide areainfo" data-area="area2">
                    <img src="/resources/main/img/busan/busan.jpg">
                    <p>부산</p>
                </div>
                <div class="swiper-slide areainfo" data-area="area3" >
                    <img src="/resources/main/img/sokcho/sokcho.jpg" data-area="area1">
                    <p>속초</p>
                </div>
                <div class="swiper-slide areainfo" data-area="area4">
                    <img src="/resources/main/img/jeju/jeju.jpg">
                    <p>제주</p>
                </div>
                <div class="swiper-slide areainfo" data-area="area5">
                    <img src="/resources/main/img/seoul/seoul.jpg">
                    <p>서울</p>
                </div>
                <div class="swiper-slide areainfo" data-area="area6">
                    <img src="/resources/main/img/yeosu/yeosu.jpg">
                    <p>여수</p>
                </div>

            </div>
            <div class="swiper-pagination"></div>
        </div>
    </div>


    <!-- Swiper JS -->
    <script src="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.js"></script>

    <!-- Initialize Swiper -->
    <script>
        var swiper = new Swiper('.recmdAreaSwiper', {
            slidesPerView: 3,
            slidesPerColumn: 2,
            spaceBetween: 30,
            pagination: {
                el: '.swiper-pagination',
                clickable: true,
            },
        });
    </script>
</body>

</html>