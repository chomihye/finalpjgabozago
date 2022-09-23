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
    <link rel="stylesheet" type="text/css" href="${path}/resources/travel/css/plan.css?after">

    <!-- map -->
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=31ac49eb45c2f47546120a0ea0a28dbe&libraries=services"></script>
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
            $("#map_all").show();  
        })  
    });
    //ALL 버튼 클릭 시 
    $(function() {
        $('#btn_all').click(function() {
            $(".plan_days").hide();

            var container = document.getElementById('map_all');
            var options = {
                center: new kakao.maps.LatLng(33.450701, 126.570667),
                level: 2
            };

            var map = new kakao.maps.Map(container, options);
           
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
                    <c:set var="dayCnt" value="day${i}"/>
                    <c:set var="listCnt" value="0"/>
                    

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

                        <div class="row">
                            <div class="col-sm-2"><fmt:formatDate value="${date}" pattern="yyyy년 MM월 dd일"/>DAY ${day}</div>

                           
                           
                                
                            
                                    <div class="col-sm-4">
                                        <c:forEach var="j" begin="${listCnt}" end="{${dayCnt}-1}" varStatus="status">
                                        <c:set var="index" value="${status.index}"/>
                                            <img src=${__LIST__[index].img} width="100px;" height="85px;">${__LIST__[index].place_name}
                                        </c:forEach>
                                    </div>

                                    <c:set var="listCnt" value="${listCnt+dayCnt-1}" />
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
		var container = document.getElementById('map_all');
		var options = {
			center: new kakao.maps.LatLng(33.450701, 126.570667),
			level: 2
		};

		var map = new kakao.maps.Map(container, options);




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
