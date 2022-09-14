<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>main</title>
    
    <!-- favicon -->
    <link rel="shortcut icon" href="/resources/common/ico/favicon.ico" type="image/x-icon">
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

    <!-- 제이쿼리 -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.4.0/jquery-migrate.min.js"></script>
    <!--css,js -->

    <link rel="stylesheet" href="/resources/common/css/bootstrap.css">
    <link rel="stylesheet" href="/resources/main/css/reset.css">
    <link rel="stylesheet" href="/resources/main/css/main.css">
    
    <script src="/resources/main/js/area_select.js"></script>
    <script src="/resources/common/js/plan_add_btn.js"> </script> 

    <!-- 폰트어썸, 부트스트랩 폰트 -->
    <script src="https://kit.fontawesome.com/39d2c0da6a.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">

    <script>
      	$(function(){
			var resultMsg = '${__RESULT__}'
			
			if(resultMsg != null && resultMsg.length > 0){
				alert(resultMsg);
			}// if
        });
    </script>

</head>

<body>

    <% 
    String msg = null; // if session scope이 null 아닌지 뭐가 있는지 확인 후 수행
    if( ( msg = (String) session.getAttribute("__RESULT__")) != null ){
        if(msg.equals("로그아웃 되었습니다.") || msg.equals("회원 전용 서비스입니다. 먼저 로그인을 해주세요.")){ // 로그아웃 성공한 경우 or 로그인이 안됐는데 회원서비스 접근한 경우 Session Scope 삭제
            session.removeAttribute("__RESULT__");
            System.out.println("세션 삭제");
        }// if
    }// if
    %>
    
    <jsp:include page="../common/header.jsp" flush="true" />
    <div class="mainContainer">

        <div class="mainContainer">
            <!-- 이 달의 여행지 part -->
            <div class="mainImgContainer"><img src="/resources/main/img/jeju.jpg"></div>
            <h6>이 달의 여행지 <span>제주</span></h6>
            <a href="#list-item-1" class="downBtr"><i class="bi bi-caret-down-fill"></i></a>
            <!-- <button class="downBtr"><i class="bi bi-caret-down-fill"></i></button> -->
        </div><!-- 이 달의 여행지 part -->


        <article>

            <div class="largeContainer" data-bs-spy="scroll" data-bs-target="#list-example" data-bs-offset="0"
                class="scrollspy-example" tabindex="0">
                <h1 id="list-item-1">추천 여행지</h1>
                <div class="areaSlideContainer">
                    <jsp:include page="../main/areaSlide.jsp" flush="true" />
                </div>

            </div>

            <div class="recommendContainer">
                <div class="recommendContents current" id="area1">
                    <div class="placeList">
                        <div class="decContainer">
                            <img src="/resources/main/img/gyeongju.jpg">
                            <h2>경주</h2>
                            <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Ab itaque, nobis numquam
                                assumenda
                                temporibus laborum quasi cumque qui odio nisi suscipit consectetur veritatis obcaecati?
                                Alias
                                placeat, numquam error enim veniam accusamus quibusdam voluptatem facilis praesentium
                                atque.
                                Consequatur excepturi voluptatem vitae temporibus, pariatur ex rem. Quisquam quam
                                adipisci
                                iusto, repudiandae error, saepe accusamus ipsam quod eveniet sunt facere, dolorum id
                                quasi unde.
                                Ipsam pariatur cumque dolore suscipit laboriosam aliquam labore. Architecto rerum
                                sapiente eum
                                minus dolorem! Debitis ullam non maiores deleniti itaque quis vel voluptatem, totam a
                                adipisci
                                laboriosam. Animi, rem? Nulla illo fugiat ea magnam inventore maxime culpa eveniet
                                numquam
                                minus, consequuntur facere rerum adipisci repudiandae quaerat dicta aliquam et!
                                Repellendus
                                mollitia nobis quidem non minima perspiciatis quo fugit incidunt blanditiis corporis
                                provident,
                                itaque sequi. Quaerat quidem ex molestias mollitia, quod quia quas numquam totam
                                similique
                                voluptates fugiat deserunt porro! Nulla fugiat cupiditate provident suscipit officiis
                                tenetur,
                                nam dolor laboriosam!</p>
                        </div>

                        <div class="subArea">
                            <div>
                                <img src="/resources/main/img/gj2.jpg" alt="">
                                <p>경주월드</p>
                            </div>

                            <div>
                                <img src="/resources/main/img/gj3.jpg">
                                <p>첨성대</p>
                            </div>

                            <div>
                                <img src="/resources/main/img/gj4.jpg">
                                <p>경주대릉원</p>
                            </div>

                            <div>
                                <img src="/resources/main/img/gj5.jpg">
                                <p>동궁과월지</p>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="recommendContents" id="area2">
                    <div class="placeList">
                        <div class="decContainer">
                            <img src="/resources/main/img/gyeongju.jpg">
                            <h2>부산</h2>
                            <p>부산은 정말 멋져</p>
                        </div>

                        <div class="subArea">
                            <div>
                                <img src="/resources/main/img/gj2.jpg" alt="">
                                <p>부산</p>
                            </div>

                            <div>
                                <img src="/resources/main/img/gj3.jpg">
                                <p>정말</p>
                            </div>

                            <div>
                                <img src="/resources/main/img/gj4.jpg">
                                <p>멋진</p>
                            </div>

                            <div>
                                <img src="/resources/main/img/gj5.jpg">
                                <p>도시</p>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="recommendContents" id="area3">
                    <div class="placeList">
                        <div class="decContainer">
                            <img src="/resources/main/img/gyeongju.jpg">
                            <h2>속초</h2>
                            <p>속초도 정말 멋져</p>
                        </div>

                        <div class="subArea">
                            <div>
                                <img src="/resources/main/img/gj2.jpg" alt="">
                                <p>속초</p>
                            </div>

                            <div>
                                <img src="/resources/main/img/gj3.jpg">
                                <p>정말</p>
                            </div>

                            <div>
                                <img src="/resources/main/img/gj4.jpg">
                                <p>멋진</p>
                            </div>

                            <div>
                                <img src="/resources/main/img/gj5.jpg">
                                <p>도시</p>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="recommendContents" id="area4">
                    <div class="placeList">
                        <div class="decContainer">
                            <img src="/resources/main/img/gyeongju.jpg">
                            <h2>제주</h2>
                            <p>제주도 정말 멋져</p>
                        </div>

                        <div class="subArea">
                            <div>
                                <img src="/resources/main/img/gj2.jpg" alt="">
                                <p>제주도</p>
                            </div>

                            <div>
                                <img src="/resources/main/img/gj3.jpg">
                                <p>정말</p>
                            </div>

                            <div>
                                <img src="/resources/main/img/gj4.jpg">
                                <p>멋진</p>
                            </div>

                            <div>
                                <img src="/resources/main/img/gj5.jpg">
                                <p>도시</p>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="recommendContents" id="area5">
                    <div class="placeList">
                        <div class="decContainer">
                            <img src="/resources/main/img/gyeongju.jpg">
                            <h2>서울</h2>
                            <p>서울도 정말 멋져</p>
                        </div>

                        <div class="subArea">
                            <div>
                                <img src="/resources/main/img/gj2.jpg" alt="">
                                <p>서울</p>
                            </div>

                            <div>
                                <img src="/resources/main/img/gj3.jpg">
                                <p>정말</p>
                            </div>

                            <div>
                                <img src="/resources/main/img/gj4.jpg">
                                <p>멋진</p>
                            </div>

                            <div>
                                <img src="/resources/main/img/gj5.jpg">
                                <p>도시</p>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="recommendContents" id="area6">
                    <div class="placeList">
                        <div class="decContainer">
                            <img src="/resources/main/img/gyeongju.jpg">
                            <h2>여수</h2>
                            <p>여수도 정말 멋져</p>
                        </div>

                        <div class="subArea">
                            <div>
                                <img src="/resources/main/img/gj2.jpg" alt="">
                                <p>여수</p>
                            </div>

                            <div>
                                <img src="/resources/main/img/gj3.jpg">
                                <p>정말</p>
                            </div>

                            <div>
                                <img src="/resources/main/img/gj4.jpg">
                                <p>멋진</p>
                            </div>

                            <div>
                                <img src="/resources/main/img/gj5.jpg">
                                <p>도시</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- ==================best plan=========================== -->

            <div class="bestPlanOutter">
                <h1>인기 일정</h1>

                <div class="best_plan">
                    <jsp:include page="../common/slide_seoul.jsp" flush="true" />
                    <jsp:include page="../common/slide_busan.jsp" flush="true" />
                    <jsp:include page="../common/slide_jeju.jsp" flush="true" />
                </div>
            </div>

            <div class="bestPost">
                <h1>인기 게시글</h1>
                <div class="postInfoBox">
                    <div class="postInfo">
                        <a href=""><img src="/resources/main/img/gj2.jpg"></a>
                        <ul>
                            <li>제목</li>
                            <li>닉네임</li>
                        </ul>
                    </div>

                    <div class="postInfo">
                        <a href=""><img src="/resources/main/img/gj2.jpg"></a>
                        <ul>
                            <li>제목</li>
                            <li>닉네임</li>
                        </ul>
                    </div>

                    <div class="postInfo">
                        <a href=""><img src="/resources/main/img/gj2.jpg"></a>
                        <ul>
                            <li>제목</li>
                            <li>닉네임</li>
                        </ul>
                    </div>

                    <div class="postInfo">
                        <a href=""><img src="/resources/main/img/gj2.jpg"></a>
                        <ul>
                            <li>제목</li>
                            <li>닉네임</li>
                        </ul>
                    </div>

                    <div class="postInfo">
                        <a href=""><img src="/resources/main/img/gj2.jpg""></a>
                        <ul>
                            <li>제목</li>
                            <li>닉네임</li>
                        </ul>
                    </div>

                    <div class=" postInfo">
                            <a href=""><img src="/resources/main/img/gj2.jpg"></a>
                            <ul>
                                <li>제목</li>
                                <li>닉네임</li>
                            </ul>
                    </div>



                </div>
            </div>
        </article>
    </div> <!-- wrapper -->
    <jsp:include page="../common/footer.jsp" flush="true" />
</body>

</html>