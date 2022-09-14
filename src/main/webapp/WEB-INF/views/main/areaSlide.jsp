<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <title>Swiper demo</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1" />

    <script src="https://kit.fontawesome.com/39d2c0da6a.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
   
    <!-- Link Swiper's CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.css" />
    
    

</head>

<body>
    <!-- Swiper -->
    <div class="slideWrapper">
        <div class="swiper-container">
            <div class="swiper mySwiper">
                <div class="swiper-wrapper">
                    <div class="swiper-slide current" data-area="area1"><img src="/resources/main/img/gyeongju.jpg">
                        <p>경주</p>
                    </div>
                    <div class="swiper-slide" data-area="area2"><img src="/resources/main/img/busan.jpg">
                        <p>부산</p>
                    </div>
                    <div class="swiper-slide" data-area="area3"><img src="/resources/main/img/sokcho.jpg">
                        <p>속초</p>
                    </div>
                    <div class="swiper-slide" data-area="area4"><img src="/resources/main/img/jeju.jpg">
                        <p>제주</p>
                    </div>
                    <div class="swiper-slide" data-area="area5"><img src="/resources/main/img/seoul.jpg">
                        <p>서울</p>
                    </div>
                    <div class="swiper-slide" data-area="area6"><img src="/resources/main/img/yeosu.jpg">
                        <p>여수</p>
                    </div>

                </div>
            </div>
            <button class="fas fa-angle-right nextBtn "></button>
            <button class="fas fa-angle-left prevBtn "></button>
            <div></div>
        </div>
    </div>
    <!-- Swiper JS -->
    <script src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script>

    <!-- Initialize Swiper -->
    <script>
        var swiper = new Swiper(".mySwiper", {
            slidesPerView: 3,
            spaceBetween: 30,
            // slidesPerGroup: 3,
            loop: true,
            loopFillGroupWithBlank: true,

            navigation: {
                nextEl: ".nextBtn",
                prevEl: ".prevBtn"
            }
        });
    </script>
</body>

</html>