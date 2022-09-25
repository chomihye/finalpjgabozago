<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"
%><%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Plan_All</title>

    <!-- <script src="/Final/js/jquery.js"></script> -->
    <!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script> -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" referrerpolicy="no-referrer"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.4.0/jquery-migrate.min.js" integrity="sha512-QDsjSX1mStBIAnNXx31dyvw4wVdHjonOwrkaIhpiIlzqGUCdsI62MwQtHpJF+Npy2SmSlGSROoNWQCOFpqbsOg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
  
    <!-- bootstrap -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

    <!-- Favicon -->
    <link href="img/favicon.ico" rel="icon">

    <!-- Font Awesome -->
    <script src="https://kit.fontawesome.com/77c780416b.js" crossorigin="anonymous"></script>
   
    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">

    <!-- Customized Stylesheet -->
    <link rel="stylesheet" type="text/css" href="${path}/resources/travel/css/plan.css?ver=1.3">

    <!-- map -->
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=31ac49eb45c2f47546120a0ea0a28dbe&libraries=services,clusterer,drawing"></script>
    <!-- <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=APIKEY&libraries=services"></script> -->
    

    <script>
    console.clear();
    // DAY버튼 
   

    //<<경로>> 버튼 클릭시 
    $(function() {
        $('#btn_plan_1').click(function() {
            $("#map_all").hide();  
            $(".plan_days").show();    
        })  
    });
    //<<지도>> 버튼 클릭시 
    $(function() {
        $('#btn_plan_2').click(function() {
            $(".plan_days").hide();
            var container = document.getElementById('map_all');
            var options = {
                center: new kakao.maps.LatLng(33.450701, 126.570667),
                level: 2
            };

            var map = new kakao.maps.Map(container, options);

            var linePath = [
                new kakao.maps.LatLng(33.452344169439975, 126.56878163224233),
                new kakao.maps.LatLng(33.452739313807456, 126.5709308145358),
                new kakao.maps.LatLng(33.45178067090639, 126.5726886938753) 
            ];

            // 지도에 표시할 선을 생성합니다
            var polyline = new kakao.maps.Polyline({
                path: linePath, // 선을 구성하는 좌표배열 입니다
                strokeWeight: 5, // 선의 두께 입니다
                strokeColor: '#FFAE00', // 선의 색깔입니다
                strokeOpacity: 0.7, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
                strokeStyle: 'solid' // 선의 스타일입니다
            });

            // 지도에 선을 표시합니다 
            polyline.setMap(map); 

            $("#map_all").show();  
        })  
    });
    //ALL 버튼 클릭 시 
    $(function() {
        $('#btn_all').click(function() {
            $(".plan_days").hide();

            
           
        })  
    });
    //DAY 버튼 클릭시 
    $(function() {
        $('#btn_day').click(function() {
            $("#map_all").hide();
            var container = document.getElementById('map_part');
            var options = {
                center: new kakao.maps.LatLng(33.450701, 126.570667),
                level: 2
            };

            var map = new kakao.maps.Map(container, options);
            $("#map_part").show();  
        })  
    });

   </script>

</head>
<body>

    <!-- *** header *** -->
    <header>
         <jsp:include page="/WEB-INF/views/common/header.jsp" flush="false" />
    </header>
    
    <!-- *** navigation *** -->
    <nav>
        <!-- day버튼 -->
        <button onclick="" class="btn_circle" id="btn_all">ALL</button>
        <c:forEach items="${__LIST__}" begin="1" end="${__LIST__[0].days}" step="1" varStatus="status"> 
            <button onclick="" class="btn_circle" id="btn_day">DAY${status.count}</button>
        </c:forEach>
        
    </nav>

    <!-- *** main section *** -->
    <section>
        <div class="plan_all_list">
            <!-- 경로, 지도 버튼 -->
            <div class="btn_container">
                <button onclick="" class="btn_plan_all" id="btn_plan_1">경로</button>
                <button onclick="" class="btn_plan_all" id="btn_plan_2">지도</button>
            </div>

            
            <!-- 경로, 지도버튼 전환 컨테이너 -->
            <div class="plan_items">
                <!-- 경로 버튼 눌럿을때 >> DAY item list  -->
                <div class="plan_days">
                   
                    <c:forEach var="i" begin="1" end="${__LIST__[0].days}" varStatus="days">
                    <c:set var="day" value="${days.count}"/>

                    <fmt:parseDate value="${__LIST__[0].start_date}" var="date" pattern="yyyy-MM-dd"/>
                    <c:set var="day1" value="0"/>
                    <c:set var="day2" value="0"/>
                    <c:set var="day3" value="0"/>
                    <c:set var="day4" value="0"/>
                    <c:set var="day5" value="0"/>
                    <c:set var="day6" value="0"/>
                    <c:set var="day7" value="0"/>
                    <c:set var="listCnt" value="0"/>
                    
                    <!-- day N 별로 몇개의 ..장소가있는지 Cnt할 변수,,,,  -->
                        <c:forEach var="planList" items="${__LIST__}"> 
                            <c:choose>
                                <c:when test="${planList.day == 1}">
                                    <c:set var="day1" value="${day1 + 1}" />
                                </c:when> 
                                
                                <c:when test="${planList.day == 2}">
                                    <c:set var="day2" value="${day2 + 1}" />
                                </c:when> 

                                <c:when test="${planList.day == 3}">
                                    <c:set var="day3" value="${day3 + 1}" />
                                </c:when> 

                                <c:when test="${planList.day == 4}">
                                    <c:set var="day4" value="${day4 + 1}" />
                                </c:when> 

                                <c:when test="${planList.day == 5}">
                                    <c:set var="day5" value="${day5 + 1}" />
                                </c:when> 

                                <c:when test="${planList.day == 6}">
                                    <c:set var="day6" value="${day6 + 1}" />
                                </c:when> 

                                <c:when test="${planList.day == 7}">
                                    <c:set var="day7" value="${day7 + 1}" />
                                </c:when>
                            </c:choose> 
                        </c:forEach>

                        <!-- DAY n 별로 장소출력,,,,, -->
                        <div class="row">
                            <c:set var="dayPlus" value="${dayIndex * 86400000}" />
                            <c:set var="now" value="${date}" />
                            <c:set target="${now}" property="time" value="${now.time + dayPlus}" />

                            <div class="col-sm-4"><fmt:formatDate value="${now}" pattern="MM월 dd일" /> DAY ${day}</div>

                                <c:choose>
                                    <c:when test="${day == 1}">
                                        <div class="col-sm-8">
                                            <c:forEach var="j" begin="${listCnt}" end="${day1-1}" varStatus="status">
                                            <c:set var="index" value="${status.index}"/>
                                            <c:set var="latitude" value="0."/>
                                            <div class="place">
                                                <div class="place_img"><img src=${__LIST__[index].img} width="120px" height="120px"></div>
                                                <div class="place_name" latitude="${__LIST__[index].latitude}" longitude="${__LIST__[index].longitude}">
                                                    <fmt:formatNumber value="${__LIST__[index].latitude}" minFractionDigits="5" pattern="#,###.####"/>
                                                    ${__LIST__[index].place_name},${__LIST__[index].latitude}</div>
                                            </div>
                                            </c:forEach>
                                        </div>
                                    </c:when>

                                    <c:when test="${day == 2}">
                                        <div class="col-sm-8">
                                            <c:forEach var="j" begin="${day1}" end="${day1+day2-1}" varStatus="status">
                                            <c:set var="index" value="${status.index}"/>
                                            <div class="place">
                                                <div class="place_img"><img src=${__LIST__[index].img} width="120px" height="120px"></div>
                                                <div class="place_name" latitude="${__LIST__[index].latitude}" longitude="${__LIST__[index].longitude}">${__LIST__[index].place_name}</div>
                                            </div>
                                            </c:forEach>
                                            <c:set var="listCnt" value="${day1+day2-1}" />
                                        </div>
                                    </c:when>

                                    <c:when test="${day == 3}">
                                        <div class="col-sm-8">
                                            <c:forEach var="j" begin="${day1+day2}" end="${day1+day2+day3-1}" varStatus="status">
                                            <c:set var="index" value="${status.index}"/>
                                            <div class="place">
                                                <div class="place_img"><img src=${__LIST__[index].img} width="120px" height="120px"></div>
                                                <div class="place_name" latitude="${__LIST__[index].latitude}" longitude="${__LIST__[index].longitude}">${__LIST__[index].place_name}</div>
                                            </div>
                                            </c:forEach>
                                            <c:set var="listCnt" value="${day1+day2-1}" />
                                        </div>
                                    </c:when>

                                    <c:when test="${day == 4}">
                                        <div class="col-sm-8">
                                            <c:forEach var="j" begin="${day1+day2+day3}" end="${day1+day2+day3+day4-1}" varStatus="status">
                                            <c:set var="index" value="${status.index}"/>
                                            <div class="place">
                                                <div class="place_img"><img src=${__LIST__[index].img} width="120px" height="120px"></div>
                                                <div class="place_name" latitude="${__LIST__[index].latitude}", longitude="${__LIST__[index].longitude}">${__LIST__[index].place_name}</div>
                                            </div>
                                            </c:forEach>
                                            <c:set var="listCnt" value="${listCnt+day1-1}" />
                                        </div>
                                    </c:when>

                                    <c:when test="${day == 5}">
                                        <div class="col-sm-8">
                                            <c:forEach var="j" begin="${day1+day2+day3+day4}" end="${day1+day2+day3+day4+day5-1}" varStatus="status">
                                            <c:set var="index" value="${status.index}"/>
                                            <div class="place">
                                                <div class="place_img"><img src=${__LIST__[index].img} width="120px" height="120px"></div>
                                                <div class="place_name" latitude="${__LIST__[index].latitude}", longitude="${__LIST__[index].longitude}">${__LIST__[index].place_name}</div>
                                            </div>
                                            </c:forEach>
                                            <c:set var="listCnt" value="${listCnt+day1-1}" />
                                        </div>
                                    </c:when>

                                    <c:when test="${day == 6}">
                                        <div class="col-sm-8">
                                            <c:forEach var="j" begin="${day1+day2+day3+day4+day5}" end="${day1+day2+day3+day4+day5+day6-1}" varStatus="status">
                                            <c:set var="index" value="${status.index}"/>
                                            <div class="place">
                                                <div class="place_img"><img src=${__LIST__[index].img} width="120px" height="120px"></div>
                                                <div class="place_name" latitude="${__LIST__[index].latitude}", longitude="${__LIST__[index].longitude}">${__LIST__[index].place_name}</div>
                                            </div>
                                            </c:forEach>
                                            <c:set var="listCnt" value="${listCnt+day1-1}" />
                                        </div>
                                    </c:when>

                                    <c:when test="${day == 7}">
                                        <div class="col-sm-8">
                                            <c:forEach var="j" begin="${day1+day2+day3+day4+day5+day6}" end="${day1+day2+day3+day4+day5+day6+day7-1}" varStatus="status">
                                            <c:set var="index" value="${status.index}"/>
                                            <div class="place">
                                                <div class="place_img"><img src=${__LIST__[index].img} width="120px" height="120px"}></div>
                                                <div class="place_name" latitude="${__LIST__[index].latitude}", longitude="${__LIST__[index].longitude}">${__LIST__[index].place_name}</div>
                                            </div>
                                            </c:forEach>
                                            <c:set var="listCnt" value="${listCnt+day1-1}" />
                                        </div>
                                    </c:when>
                                </c:choose>   

                        </div>
                    </c:forEach>
                </div>

                <!-- 지도 버튼 눌럿을때  -->
                <div class="map_map">
                <!-- 지도 버튼 눌럿을때 >> ALL 버튼 클릭시 default노출-->
                    <div id="map_all">
                    </div>

                    <!-- 지도 버튼 눌렀을때  >> DAY 버튼 클릭시 각각 노출-->
                    <div id="map_part">
                    </div>
                </div>

            </div>
        </div>
    </section>


    <!-- *** footer *** -->
    <footer>
        <div data-include-path="footer.html"></div>
    </footer>



    <!-- *** JS *** -->
    <!-- kakao map  -->
    <!-- kakao map  -->
    <script>
		// var container = document.getElementById('map_all');
		// var options = {
		// 	center: new kakao.maps.LatLng(33.450701, 126.570667),
		// 	level: 2
		// };

        // var linePath = [
        //     new kakao.maps.LatLng(33.452344169439975, 126.56878163224233),
        //     new kakao.maps.LatLng(33.452739313807456, 126.5709308145358),
        //     new kakao.maps.LatLng(33.45178067090639, 126.5726886938753) 
        // ];

        // // 지도에 표시할 선을 생성합니다
        // var polyline = new kakao.maps.Polyline({
        //     path: linePath, // 선을 구성하는 좌표배열 입니다
        //     strokeWeight: 5, // 선의 두께 입니다
        //     strokeColor: '#FFAE00', // 선의 색깔입니다
        //     strokeOpacity: 0.7, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
        //     strokeStyle: 'solid' // 선의 스타일입니다
        // });

        // // 지도에 선을 표시합니다 
        // polyline.setMap(map);  


		// var map = new kakao.maps.Map(container, options);




        var container = document.getElementById('map_part');
		var options = {
			center: new kakao.maps.LatLng(33.450701, 126.570667),
			level: 2
		};

		var map = new kakao.maps.Map(container, options);
	</script>

    <!-- include -->
    <script>
 
        window.addEventListener('load', function() {
            var allElements = document.getElementsByTagName('*');
            Array.prototype.forEach.call(allElements, function(el) {
                var includePath = el.dataset.includePath;
                if (includePath) {
                    var xhttp = new XMLHttpRequest();
                    xhttp.onreadystatechange = function () {
                        if (this.readyState == 4 && this.status == 200) {
                            el.outerHTML = this.responseText;
                        }
                    };
                    xhttp.open('GET', includePath, true);
                    xhttp.send();
                }
            });
        });
 
    </script>

</body>
</html>
