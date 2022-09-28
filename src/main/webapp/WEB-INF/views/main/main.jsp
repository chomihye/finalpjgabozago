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
    <link rel="icon" type="image/png" sizes="192x192" href="/resources/common/ico/android-icon-192x192.png">
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
  	
        $(function () {

            var state =1;
            $('.addOkBtn').click(function () {
                $('#planAddModal').css("display","none");
                location.href = "travel/main"
                history.pushState('state'+state,'State'+state);
                state++;
            })
        })
    </script>

</head>

<body>

    <% 
    	String msg = null; // session scope null 확인 후 수행
    
   		if( ( msg = (String) session.getAttribute("__RESULT__")) != null ){
   			// redirection으로 들어오는 경우 session scope에 메세지 담기 때문에 메세지 alert 후 세션 삭제
        	if(msg.equals("로그아웃 되었습니다.") || msg.equals("회원 전용 서비스입니다. 먼저 로그인을 해주세요.") || msg.equals("로그인에 성공하였습니다.")){ 
            	session.removeAttribute("__RESULT__");
        	}// if
    	}// if
    %>

    <jsp:include page="../common/header.jsp" flush="true" />
    <div class="mainContainer">

        <div class="mainContainer">
            <!-- 이 달의 여행지 part -->
            <div class="mainImgContainer"><img src="/resources/main/img/jeju/jeju.jpg"></div>
            <h6>이 달의 여행지 <span>제주</span></h6>
            <a href="#list-item-1" class="downBtr"><i class="bi bi-caret-down-fill"></i></a>
            <!-- <button class="downBtr"><i class="bi bi-caret-down-fill"></i></button> -->
        </div><!-- 이 달의 여행지 part -->


        <article>

            <div class="largeContainer" data-bs-spy="scroll" data-bs-target="#list-example" data-bs-offset="0"
                class="scrollspy-example" tabindex="0">

                <h1 id="list-item-1">추천 여행지</h1>
                <div class="areaSlideContainer">
                    <jsp:include page="../main/recmdAreaSlide.jsp" flush="true" />
                </div>

            </div>

            <div class="recommendContainer">
                <div class="recommendContents current" id="area1">
                    <div class="placeList">
                        <div class="decContainer">
                            <img src="/resources/main/img/gyeongju/gyeongju.jpg">
                            <h2>경주</h2>
                            <p> 지붕 없는 박물관 경주. 경주는 그만큼 발길이 닿는 어느 곳이든 문화 유적지를 만날 수 있는 곳이다. 밤이면 더 빛나는 안압지를 비롯해 허허벌판에 자리를
                                굳건히 지키고 있는 첨성대. 뛰어난 건축미를 자랑하는 불국사 석굴암까지 어느 하나 빼놓을 수 없다. 경주 여행의 기록을 남기고 싶다면 스탬프 투어를 이용해보는
                                것도 좋다. 16곳의 명소를 탐방할 때마다 찍히는 도장 모으는 재미가 쏠쏠하다. 모바일 앱으로도 스탬프 투어 참여가 가능하다.</p>
                        </div>

                        <div class="subArea">
                            <div>
                                <img src="/resources/main/img/gyeongju/gj2.jpg" alt="">
                                <p>경주월드</p>
                            </div>

                            <div>
                                <img src="/resources/main/img/gyeongju/gj3.jpg">
                                <p>첨성대</p>
                            </div>

                            <div>
                                <img src="/resources/main/img/gyeongju/gj4.jpg">
                                <p>경주대릉원</p>
                            </div>

                            <div>
                                <img src="/resources/main/img/gyeongju/gj5.jpg">
                                <p>동궁과월지</p>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="recommendContents" id="area2">
                    <div class="placeList">
                        <div class="decContainer">
                            <img src="/resources/main/img/busan/busan.jpg">
                            <h2>부산</h2>
                            <p>우리나라 제2의 수도 부산광역시. 부산 대표 관광지로 손꼽히는 해운대는 밤에는 마린시티의 야경이 더해져 더욱 화려한 해변이 된다. 감천문화마을은 사진 찍기에 좋으며, 매해 가을마다 개최되는 아시아 최대 규모의 영화제인 부산국제영화제와 함께 부산의 구석구석을 즐겨보는 것도 좋다. 전통시장 투어가 있을 만큼 먹거리가 가득한 부산의 맛기행은 필수!</p>
                        </div>

                        <div class="subArea">
                            <div>
                                <img src="/resources/main/img/busan/bs1.jpg">
                                <p>감천문화마을</p>
                            </div>

                            <div>
                                <img src="/resources/main/img/busan/bs2.jpg">
                                <p>광안리 해수욕장</p>
                            </div>

                            <div>
                                <img src="/resources/main/img/busan/bs3.jpg">
                                <p>흰여울 문화마을</p>
                            </div>

                            <div>
                                <img src="/resources/main/img/busan/bs4.jpg">
                                <p>태종대</p>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="recommendContents" id="area3">
                    <div class="placeList">
                        <div class="decContainer">
                            <img src="/resources/main/img/sokcho/sokcho.jpg">
                            <h2>속초</h2>
                            <p>약 50m 길이의 구름다리를 건너면 바다와 마주할 수 있는 속초 영금정. 일출 명소로도 알려진 이곳은 동해안의 시원한 절경을 감상할 수 있는 최적의 장소이다. 옛날 항구의 고유 분위기는 사라졌지만, '새우튀김 골목'으로 재탄생한 대포항은 여전히 속초 대표 방문 코스! 아바이 순대로 유명한 아바이마을도 빼놓을 수 없는 인기 여행지이다.</p>
                        </div>

                        <div class="subArea">
                            <div>
                                <img src="/resources/main/img/sokcho/sc1.jpg">
                                <p>속초아이</p>
                            </div>

                            <div>
                                <img src="/resources/main/img/sokcho/sc2.jpg">
                                <p>속초 해수용장</p>
                            </div>

                            <div>
                                <img src="/resources/main/img/sokcho/sc3.jpg">
                                <p>울산바위</p>
                            </div>

                            <div>
                                <img src="/resources/main/img/sokcho/sc4.jpg">
                                <p>영금대</p>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="recommendContents" id="area4">
                    <div class="placeList">
                        <div class="decContainer">
                            <img src="/resources/main/img/jeju/jeju.jpg">
                            <h2>제주</h2>
                            <p>섬 전체가 하나의 거대한 관광자원인 제주도. 에메랄드빛 물빛이 인상적인 협재 해수욕장은 제주 대표 여행지며, 파도가 넘보는 주상절리와 바다 위 산책로인 용머리 해안은 제주에서만 볼 수 있는 천혜의 자연경관으로 손꼽힌다. 드라마 촬영지로 알려진 섭지코스는 꾸준한 사랑을 받고 있으며 한라봉과 흑돼지, 은갈치 등은 제주를 대표하는 음식이다.</p>
                        </div>
                        <div class="subArea">
                            <div>
                                <img src="/resources/main/img/jeju/jj1.jpg">
                                <p>천지연폭포</p>
                            </div>

                            <div>
                                <img src="/resources/main/img/jeju/jj2.jpg">
                                <p>금능해수욕장</p>
                            </div>

                            <div>
                                <img src="/resources/main/img/jeju/jj3.jpg">
                                <p>우도</p>
                            </div>

                            <div>
                                <img src="/resources/main/img/jeju/jj4.jpg">
                                <p>용머리해안</p>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="recommendContents" id="area5">
                    <div class="placeList">
                        <div class="decContainer">
                            <img src="/resources/main/img/seoul/seoul.jpg">
                            <h2>서울</h2>
                            <p>과거와 현재가 공존하며 하루가 다르게 변하는 서울을 여행하는 일은 매일이 새롭다. 도시 한복판에서 600년의 역사를 그대로 안고 있는 아름다운 고궁들과 더불어 대한민국의 트렌드를 이끌어나가는 예술과 문화의 크고 작은 동네들을 둘러볼 수 있는 서울은 도시 여행에 최적화된 장소다.</p>
                        </div>

                        <div class="subArea">
                            <div>
                                <img src="/resources/main/img/seoul/su1.jpg" alt="">
                                <p>북촌 한옥마을</p>
                            </div>

                            <div>
                                <img src="/resources/main/img/seoul/su2.jpg">
                                <p>덕수궁</p>
                            </div>

                            <div>
                                <img src="/resources/main/img/seoul/su3.jpg">
                                <p>서울숲</p>
                            </div>

                            <div>
                                <img src="/resources/main/img/seoul/su4.jpg">
                                <p>하늘공원</p>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="recommendContents" id="area6">
                    <div class="placeList">
                        <div class="decContainer">
                            <img src="/resources/main/img/yeosu/yeosu.jpg">
                            <h2>여수</h2>
                            <p>국제 해양관광의 중심 전남 여수시. 3천여 그루의 동백나무로 가득 찬 붉은 섬 오동도는 웰빙 트래킹 코스를 갖추고 있어 한층 더 운치 있다. 해상 케이블카를 타면 마치 바다 위를 걷는 듯한 느낌이 들며 탁 트인 바다 전망을 감상할 수 있다. 노래 가사에도 나오는 낭만적이고 황홀한 여수의 밤바다는 돌산대교와 음악분수가 함께 어우러져 멋진 야경을 선사한다. 공식 밥도둑 게장백반과 돌산 갓김치, 갈치조림 등 풍부한 먹거리까지 갖춘 인기 만점 관광지!</p>
                        </div>

                        <div class="subArea">
                            <div>
                                <img src="/resources/main/img/yeosu/ys1.jpg" alt="">
                                <p>오동도</p>
                            </div>

                            <div>
                                <img src="/resources/main/img/yeosu/ys2.jpg">
                                <p>유월드 루지 테마파크</p>
                            </div>

                            <div>
                                <img src="/resources/main/img/yeosu/ys3.jpg">
                                <p>여수 해상 케이블카</p>
                            </div>

                            <div>
                                <img src="/resources/main/img/yeosu/ys4.jpg">
                                <p>여수 예술랜드</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- ==================best plan=========================== -->

            <div class="bestPlanOutter">
                <h1>인기 일정</h1>

                <div class="best_plan">
                    <jsp:include page="../common/recmdPlan.jsp" flush="true" />
                </div>
            </div>

            <div class="bestPost">
                <h1>인기 게시글</h1>
                <div class="postInfoBox">
                    <div class="postInfo">
                        <a href=""><img src="/resources/main/img/board/6.jpg"></a>
                        <ul>
                            <li>직접 다녀온 숨겨진 캠핑 명소들</li>
                            <li>찬찬</li>
                        </ul>
                    </div>

                    <div class="postInfo">
                        <a href=""><img src="/resources/main/img/board/gj.jpg"></a>
                        <ul>
                            <li>서울 템플스테이 1박 후기</li>
                            <li>냠냠</li>
                        </ul>
                    </div>

                    <div class="postInfo">
                        <a href=""><img src="/resources/main/img/board/gjd.jpg"></a>
                        <ul>
                            <li>거제도 드라이브 코스 추천!</li>
                            <li>크리링</li>
                        </ul>
                    </div>

                    <div class="postInfo">
                        <a href=""><img src="/resources/main/img/board/gr.jpg"></a>
                        <ul>
                            <li>강릉 아르떼뮤지엄 다녀왔어요!</li>
                            <li>도톨</li>
                        </ul>
                    </div>

                    <div class="postInfo">
                        <a href=""><img src="/resources/main/img/board/jj.jpg""></a>
                        <ul>
                            <li>작년 5월 제주 여행 사진들</li>
                            <li>주니준</li>
                        </ul>
                    </div>

                    <div class="postInfo">
                            <a href=""><img src="/resources/main/img/board/jj2.jpg"></a>
                            <ul>
                                <li>전주 당일치기 후기 </li>
                                <li>산해진미</li>
                            </ul>
                    </div>



                </div>
            </div>
        </article>
    </div> <!-- wrapper -->
    <jsp:include page="../common/footer.jsp" flush="true" />
</body>

</html>