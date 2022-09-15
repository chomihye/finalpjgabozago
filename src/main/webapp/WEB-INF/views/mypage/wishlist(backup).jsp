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
 
    <!-- 제이쿼리 -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.4.0/jquery-migrate.min.js"></script>
 
    <!-- CSS -->
    <link rel="stylesheet" href="/resources/mypage/css/6-12.mypage_wishlist.css">

    <!-- script -->
    <script src="/resources/mypage/js/6-12.mypage_wishlist.js"></script>
    <!-- 페이지가 로딩되자마자 호출되는 함수 -->
    <script>
        $(function() {
            console.log("wishlist script invoked!");

            $.ajax({
                type: "GET",
                url: "wishlist/accom",
                cache : false,
                error : function(error) {
                    console.log("error");
                },
                success : function(data) {
                    console.log("success");
                    console.log(data);
                }
            })
        });
    </script>
</head>

<body>
    <jsp:include page="/WEB-INF/views/common/header.jsp" flush="false" />

    <div class="wrap">
        <jsp:include page="/WEB-INF/views/mypage/ProfileAndMenu.jsp" flush="false" />

        <section class="wishlist">
            <div class="header">
                <h1>위시리스트</h1>
                <div>
                    <label for="wishlist_type">숙소/일정</label>
                    <select name="wishlist_type" id="wishlist_type">
                        <option value="accom" selected>숙소</option>
                        <option value="plan">일정</option>
                    </select>
                </div>
            </div>

            <!-- 숙소 선택 영역(default) -->
            <article class="wishlist_accom">
                <div class="select">
                    <input type="checkbox" id="selectAll" name="selectAll" onclick="fncAllCheck();">
                    <label for="selectAll"></label>
                    <label for="selectAll" class="selectAll">전체선택</label>
                    <a href="#" class="selectDelete">선택삭제</a>
                </div>

                <ul>
                    <li>
                        <input type="checkbox" id="select1" name="selectParticle">
                        <label for="select1"></label>
                        <a href="/reservation/datail" class="accomBox">
                            <img src="https://picsum.photos/id/231/600/400" alt="accom image">
                            <div class="accom_info">
                                <h3>숙소이름</h3>
                                <p><i class="fas fa-location-dot"></i>&nbsp;숙소위치(시군구)</p>
                            </div>
                            <button type="button" class="payment">결제하기</button>
                        </a>
                    </li>
                    <li>
                        <input type="checkbox" id="select2" name="selectParticle">
                        <label for="select2"></label>
                        <a href="/reservation/datail" class="accomBox">
                            <img src="https://picsum.photos/id/231/600/400" alt="accom image">
                            <div class="accom_info">
                                <h3>숙소이름</h3>
                                <p><i class="fas fa-location-dot"></i>&nbsp;숙소위치(시군구)</p>
                            </div>
                            <button type="button" class="payment">결제하기</button>
                        </a>
                    </li>
                    <li>
                        <input type="checkbox" id="select3" name="selectParticle">
                        <label for="select3"></label>
                        <a href="/reservation/datail" class="accomBox">
                            <img src="https://picsum.photos/id/231/600/400" alt="accom image">
                            <div class="accom_info">
                                <h3>숙소이름</h3>
                                <p><i class="fas fa-location-dot"></i>&nbsp;숙소위치(시군구)</p>
                            </div>
                            <button type="button" class="payment">결제하기</button>
                        </a>
                    </li>
                    <li>
                        <input type="checkbox" id="select4" name="selectParticle">
                        <label for="select4"></label>
                        <a href="/reservation/datail" class="accomBox">
                            <img src="https://picsum.photos/id/231/600/400" alt="accom image">
                            <div class="accom_info">
                                <h3>숙소이름</h3>
                                <p><i class="fas fa-location-dot"></i>&nbsp;숙소위치(시군구)</p>
                            </div>
                            <button type="button" class="payment">결제하기</button>
                        </a>
                    </li>
                    <li>
                        <input type="checkbox" id="select5" name="selectParticle">
                        <label for="select5"></label>
                        <a href="/reservation/datail" class="accomBox">
                            <img src="https://picsum.photos/id/231/600/400" alt="accom image">
                            <div class="accom_info">
                                <h3>숙소이름</h3>
                                <p><i class="fas fa-location-dot"></i>&nbsp;숙소위치(시군구)</p>
                            </div>
                            <button type="button" class="payment">결제하기</button>
                        </a>
                    </li>
                    <li>
                        <input type="checkbox" id="select6" name="selectParticle">
                        <label for="select6"></label>
                        <a href="/reservation/datail" class="accomBox">
                            <img src="https://picsum.photos/id/231/600/400" alt="accom image">
                            <div class="accom_info">
                                <h3>숙소이름</h3>
                                <p><i class="fas fa-location-dot"></i>&nbsp;숙소위치(시군구)</p>
                            </div>
                            <button type="button" class="payment">결제하기</button>
                        </a>
                    </li>
                    <li>
                        <input type="checkbox" id="select7" name="selectParticle">
                        <label for="select7"></label>
                        <a href="/reservation/datail" class="accomBox">
                            <img src="https://picsum.photos/id/231/600/400" alt="accom image">
                            <div class="accom_info">
                                <h3>숙소이름</h3>
                                <p><i class="fas fa-location-dot"></i>&nbsp;숙소위치(시군구)</p>
                            </div>
                            <button type="button" class="payment">결제하기</button>
                        </a>
                    </li>
                    <li>
                        <input type="checkbox" id="select8" name="selectParticle">
                        <label for="select8"></label>
                        <a href="/reservation/datail" class="accomBox">
                            <img src="https://picsum.photos/id/231/600/400" alt="accom image">
                            <div class="accom_info">
                                <h3>숙소이름</h3>
                                <p><i class="fas fa-location-dot"></i>&nbsp;숙소위치(시군구)</p>
                            </div>
                            <button type="button" class="payment">결제하기</button>
                        </a>
                    </li>
                    <li>
                        <input type="checkbox" id="select9" name="selectParticle">
                        <label for="select9"></label>
                        <a href="/reservation/datail" class="accomBox">
                            <img src="https://picsum.photos/id/231/600/400" alt="accom image">
                            <div class="accom_info">
                                <h3>숙소이름</h3>
                                <p><i class="fas fa-location-dot"></i>&nbsp;숙소위치(시군구)</p>
                            </div>
                            <button type="button" class="payment">결제하기</button>
                        </a>
                    </li>
                    <li>
                        <input type="checkbox" id="select10" name="selectParticle">
                        <label for="select10"></label>
                        <a href="/reservation/datail" class="accomBox">
                            <img src="https://picsum.photos/id/231/600/400" alt="accom image">
                            <div class="accom_info">
                                <h3>숙소이름</h3>
                                <p><i class="fas fa-location-dot"></i>&nbsp;숙소위치(시군구)</p>
                            </div>
                            <button type="button" class="payment">결제하기</button>
                        </a>
                    </li>
                </ul>
            </article>

            <!-- 일정 선택 영역 -->
            <article class="wishlist_plan">
                <div class="select">
                    <input type="checkbox" id="selectAll" name="selectAll" onclick="fncAllCheck();">
                    <label for="selectAll"></label>
                    <label for="selectAll" class="selectAll">전체선택</label>
                    <a href="#" class="selectDelete">선택삭제</a>
                </div>

                <div class="planBoxWrap">
                    <div class="planBox">
                        <input type="checkbox" id="select1" name="selectParticle">
                        <label for="select1"></label>
                        <jsp:include page="/WEB-INF/views/mypage/wishlist/slide_plan1.jsp" flush="false"/>
                    </div>
                    
                    <div class="planBox">
                        <input type="checkbox" id="select2" name="selectParticle">
                        <label for="select2"></label>
                        <jsp:include page="/WEB-INF/views/mypage/wishlist/slide_plan2.jsp" flush="false"/>
                    </div>
                    
                    <div class="planBox">
                        <input type="checkbox" id="select3" name="selectParticle">
                        <label for="select3"></label>
                        <jsp:include page="/WEB-INF/views/mypage/wishlist/slide_plan3.jsp" flush="false"/>
                    </div>
                    
                    <div class="planBox">
                        <input type="checkbox" id="select4" name="selectParticle">
                        <label for="select4"></label>
                        <jsp:include page="/WEB-INF/views/mypage/wishlist/slide_plan4.jsp" flush="false"/>
                    </div>
                </div>
            </article>

            <!-- 페이지버튼 임시 -->
            <div class="btnPage">페이지버튼</div>
        </section>
    </div>

    <jsp:include page="/WEB-INF/views/common/footer.jsp" flush="false" />
</body>
</html>