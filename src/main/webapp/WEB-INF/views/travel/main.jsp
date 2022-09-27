<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Main Page</title>

    <!-- <script src="/Final/js/jquery.js"></script> -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  
    <!-- bootstrap -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
    
    <!-- map -->
    <!-- <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=31ac49eb45c2f47546120a0ea0a28dbe"></script> -->
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=31ac49eb45c2f47546120a0ea0a28dbe&libraries=services"></script>
    <!-- <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=APIKEY&libraries=services"></script> -->

    <!-- Favicon -->
    <link href="img/favicon.ico" rel="icon">

    <!-- Font Awesome -->
    <script src="https://kit.fontawesome.com/77c780416b.js" crossorigin="anonymous"></script>
   
    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
    
    <!-- Calender -->
    <!-- <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css"> -->
    <script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
    <link rel="stylesheet" type="text/css" href="https://npmcdn.com/flatpickr/dist/themes/material_green.css">
    <script src="https://npmcdn.com/flatpickr/dist/l10n/ko.js"></script>
    
    <!-- Customized Stylesheet -->
    <link rel="stylesheet" type="text/css" href="${path}/resources/travel/css/main.css?ver=1.1">

    <!-- JSTL -->
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    <!--fabozago favicon -->
    <link rel="shortcut icon" href="/resources/common/ico/favicon.ico">
    <link rel="icon" href="../ico/favicon.ico" type="image/x-icon">
    <link rel="icon" type="image/png" sizes="192x192" href="/resources/commonico/android-icon-192x192.png">
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
    
    
    <style>
        .selected { background-color : #6DCC76}
        .q {
            display: flexbox;
            color: green;
            box-sizing: border-box;
            width: 33.1px;
            height: 29.13px;

            background: #4E944F;
            box-shadow: 0px 0.661972px 0.661972px rgba(0, 14, 51, 0.05);
            border-radius: 33px;

            margin-left: -20px;
        }
        .r {
            position: absolute;
            z-index: 3;
            left: 25px;
            top: 38px;

        }
        
    </style>

    <script>
        //여행지 버튼 이벤트 
        console.clear();

        $(function() {
            $('.btn_small_area').click(function() {
                $("#setupPop").show();
            }) 
            $('.btn_small_area_cs').click(function() {
                $("#setupPop").hide();
            })
        });

        //내 숙소 버튼 이벤트
        $(function() {
            $('#btn_reservation').click(function() {
                $("#setupPop2").show();
            }) 
            $('#btn_reservation_cs').click(function() {
                $("#setupPop2").hide();
            })
        });

        //일정 생성 모달 alert 
        $(function() {
            $('#btn_plan_create').click(function() {
                $("#myModal").show();
            }) 
        });

        //big_area 변경
        $(function() {
            $(".card-link").click (function(){
                var big_area_id = $(this).html();
                bigAreaCode = $(this).attr('value');
                bigAreaName = $(this).text();
                $(".btn_small_area").text(big_area_id);
            }) 
        });

         //small_area 버튼 클릭 색상 변경 , 아래의 확인 버튼 호버링시 색상 변경, keyword parameter
         //시군구 선택시에 장소 저장 
         //Open api로부터 장소 리스트 받아와서 maplist에 등록하고 -> 중심 좌표 지정하기  
         $(function() {
            $('.small_area').click(function() {
                smallAreaName = $(this).attr('value');
                $('.small_area').removeClass("selected");
                $(this).addClass("selected");
                //  $(this).siblings().removeClass("selected");
                setPlaceList();
                getPlaceList();
                // setCenter();
            })
        });


        //여행지 확인 버튼시 팝업 숨기기 
        $(function() {
            $('.btn_small_area_set').click(function() {
                $(".wrap_layerpop").hide();
            }) 
        });

        //예약 내역 팝업 
        // $(function() {  
        //     for(let i=0; i<2; i++) {
        //         let element = $(".carousel-item").html();
        //         $(".carousel-item").append(element);
        //     }
        // });


        // $(function() {
        //     $(".row_num").addClass("selected2");
        // })

        //여행 일정 parameter 전송 
        $(function() { 

            $('.modal_button').click(function(){   //modal_btn_yes 버튼을 클릭하였을 때
    
                let isPublic = $(this).attr('value');
    
               
                // let data = []
                // let dataMain = {
                //     'memberIdx' : 44,
                //     'startDate' : startDate,
                //     'endDate' : endDate,
                //     'isPublic' : isPublic,
                //     'largeAreaIdx' : areaCode
                // };
                // data.push(dataMain)

                // for(let i=1; i<=day; i++) {
                //     let row = "#Day" + i + " .row";
                //     let rowImg = "#Day" + i + " .row img";
                //     let rowInfo = "#Day" + i + " .row .col-2";
                //     let rowCnt = $(row).length;

                //     for(let j=1; j<=rowCnt; j++) {

                //         let dataDetail = {
                //         "day" : i,
                //         "placeType" : "T",
                //         "reservationIdx" : 32423,
                //         "placeName" : $(rowInfo).text(),
                //         "placeSeq" : j,
                //         "latitude" : $(rowInfo).attr("latitude"),
                //         "longitude" : $(rowInfo).attr("longitude"),
                //         "img" : $(rowImg).attr("src")
                //         };

                //         data.push(dataDetail)

                //     }//for


                // let data = []
                let plandetail = []
               

                for(let i=1; i<=day; i++) {
                    let row = "#Day" + i + " .row";
                    let rowImg = "#Day" + i + " .row img";
                    let rowInfo = "#Day" + i + " .row .col-6";
                    let rowCnt = $(row).length;

                    $(rowInfo).each(function(index,item){
                        let dataDetail = {
                        "day" : i,
                        "placeType" : "T",
                        "reservationIdx" : 32423,
                        "placeName" : $.trim($(this).first().text()),
                        "placeSeq" : index+1,
                        "latitude" : $(this).attr("latitude"),
                        "longitude" : $(this).attr("longitude"),
                        "img" : $(this).prev().find("img").attr("src")
                        };

                        plandetail.push(dataDetail)
                   
                    });
                };

                let data = {
                    'memberIdx' : 44,
                    'startDate' : startDate,
                    'endDate' : endDate,
                    'isPublic' : isPublic,
                    'largeAreaIdx' : areaCode,
                    'days' : day,
                    'detailDto' : plandetail
                };

                
                console.log("data:{}",data)
                $.ajax({
                    type :'post',   //post 방식
                    url :'register',//controller name 
                    async : false,
                    // traditional : true,  //json string
                    data : JSON.stringify (data),  //위의 변수에 담긴 데이터를 전송해준다.
                    // data :  data,  //위의 변수에 담긴 데이터를 전송해준다.
                    // dataType : "json", 
                    contentType: "application/json;charset=UTF-8",
                    success : function(data,textStatus){   
                        alert("일정 생성을 완료하였습니다.",data);
                     
                        self.location = "/travel/plan?planIdx=" 

                    },
                    error : function(request,error) {
                    	 alert("일별당 일정 하나 이상 선택해주세요.");
                         $("#myModal").hide();
                    }
                }); //ajax 

                

            });//c e

        });

       
        


    </script>


    <script>
        //============kakao 지도 Api ================

        var markerPositions = new Array();      //마커를 출력할 주소객체 배열 
        var markers = [];                       //마커를 관리할 마커 배열 
       
        $(function (){   
            $(".btn_small_area_set").click(function () {
                // if(markers.length!=0) {
                //     console.log("setMarkers");
                //     setMarkers();
                //     map.clear();                }
                
                addMarker();
            });    
        });//여행지 확인 눌렀을시 클릭이벤트 등록 


        //invoke 3 
        function setMarkers() {
            for (var i = 0; i < markers.length; i++) {
                
                markers[i].setMap(null);
                markers.pop();
            }            
        }

        //invoke 2 
        function addMarker() {
            if(markers.length!=0) {
            for (var i = 0; i < markers.length; i++) {
                
                markers[i].setMap(null);
                
            }     
        }   
            var bounds = new kakao.maps.LatLngBounds();   // 지도를 재설정할 범위정보를 가지고 있을 LatLngBounds 객체

                for(let i=0; i<markerPositions.length; i++) {
                    var markerPositionP = new kakao.maps.LatLng( markerPositions[i].latlng.La,markerPositions[i].latlng.Ma);

                    //마커를 지도에 추가 
                    var marker = new kakao.maps.Marker({
                        position: markerPositionP,  // 마커 위치
                    });

                     // 인포윈도우 추가
                    var infowindow = new kakao.maps.InfoWindow({
                        position : markerPositionP, //인포윈도우 위치 
                        content : markerPositions[i].content    //인포윈도우 info 
                        
                    });
                   
                    marker.setMap(map);      // 마커가 지도 위에 표시되도록 설정
                    markers.push(marker);    // 마커 관리배열에 추가 
                    
                    infowindow.open(map, marker); 
                    bounds.extend(markerPositionP);  // LatLngBounds 객체에 좌표 추가
                }//for : 마커 등록 , LatLngBounds에 좌표객체 추가 

                map.setBounds(bounds);  //지도 범위 재설정

        }//addMarker

        //=========공공데이터포털 Open Api=============
        //invoke 1 
        var firstimage = "";
        var title = "";
        var mapx = "";
        var mapy = "";
        
        function getPlaceList(){   
            var xhrStatus = 0;
            var promise = $.ajax({
            type: "GET",
            url: "http://apis.data.go.kr/B551011/KorService/searchKeyword?serviceKey=2sYfoLbELJvXLAzwuf4vVGLhXboUAsGTSan2fB1b5Y7XFsKxOQexxhq6vYS%2Bita8byIhVYLj0w%2BPlIqINrMsIw%3D%3D&numOfRows=10&pageNo=1&MobileOS=ETC&MobileApp=AppTest&listYN=Y&arrange=B&areaCode=" + areaCode + "&keyword=" + keyword , 
            async: "false",
                success: function (response, Status, xhr) {
                    let idCnt = 0;
                   
                    $(response).find("item").each((i,row) => {
                        if($(row).find("firstimage").text() == "") {
                            console.log("사진이 없으므로 다음 장소")
                            return true;     
                        } 
                        idCnt += 1;
                        firstimage = $(row).find("firstimage").text()
                        title = $(row).find("title").text();
                        mapx = $(row).find("mapx").text()                 //지도 출력할 주소 
                        mapy = $(row).find("mapy").text()                 //지도 출력할 주소 
                       
                        let targetTitle = "place" + idCnt;
                        // console.log("targetTitle",targetTitle)
                        // let ApiData = document.getElementById(targetTitle);

                        document.getElementById(targetTitle).querySelector("img").src = firstimage
                        $("#" + targetTitle).contents()[2].textContent = title
                        $("#" + targetTitle).attr("locationX",mapy)
                        $("#" + targetTitle).attr("locationY",mapx)
                        console.log("넣음")

                        // 마커를 표시할 위치와 내용을 가지고 있는 객체 배열 생성 
                        let item = {content:'<div style=padding:5px; margin:5px;align-items : center; font-size: 2px;>' + title + '</div>', 
                                    latlng: new kakao.maps.LatLng(mapx, mapy)};
                        markerPositions.push(item);
                        
                        xhr.abort();
                        console.log("요청 취소");
                    });
                    xhr.abort();
                }//success 
            });//ajax
        }//getPlaceList
        
        function setPlaceList() {
                    areaCode = bigAreaCode      //areaCode parameter 지정 
                    keyword = smallAreaName.substr(0,smallAreaName.length-1)
                    console.log("setPlaceList invoked")
                    console.log("keyword" , keyword)
                    console.log("smallAreaName" , smallAreaName)
                    console.log("bigAreaName" , bigAreaName)
        } //setPlaceList

       
    </script>

</head>
<body>

    <!-- *** header *** -->
    <header>
        <jsp:include page="/WEB-INF/views/common/header.jsp" flush="false" />
    </header>
    
    <!-- *** navigation *** -->
    <nav>


        <!-- left button line 1-->
        <div>
            <!-- 여행지 버튼  -->
            <button onclick="" class="btn_small_area"><p id="result">여행지</p></button>
            <!-- 여행지 팝업 -->

            <div id="setupPop" class="wrap_layerpop">
                <div class="layerpop" >
                    <h3>지역별 여행지</h3> 
                    <div id="accordion">
                        <div class="card">
                            
                            <div class="card-header">
                                <a class="card-link" data-toggle="collapse" href="#collapse1" value="1">서울</a>
                                <a class="card-link" data-toggle="collapse" href="#collapse2" value="6">부산</a>
                                <a class="card-link" data-toggle="collapse" href="#collapse3" value="4">대구</a>
                                <a class="card-link" data-toggle="collapse" href="#collapse4" value="2">인천</a>
                            </div>
                            <div class="card-header">
                                <a class="card-link" data-toggle="collapse" href="#collapse5" value="">광주</a>
                                <a class="card-link" data-toggle="collapse" href="#collapse6" value="3">대전</a>
                                <a class="card-link" data-toggle="collapse" href="#collapse7" value="7">울산</a>
                                <a class="card-link" data-toggle="collapse" href="#collapse8" value="31">경기</a>
                            </div>
                            <div class="card-header">
                                <a class="card-link" data-toggle="collapse" href="#collapse9" value="32">강원</a>
                                <a class="card-link" data-toggle="collapse" href="#collapse10" value="33">충북</a>
                                <a class="card-link" data-toggle="collapse" href="#collapse11" value="34">충남</a>
                                <a class="card-link" data-toggle="collapse" href="#collapse12" value="35">전북</a>
                            </div>
                            <div class="card-header">
                                <a class="card-link" data-toggle="collapse" href="#collapse13" value="38">전남</a>
                                <a class="card-link" data-toggle="collapse" href="#collapse14" value="35">경북</a>
                                <a class="card-link" data-toggle="collapse" href="#collapse15" value="36">경남</a>
                                <a class="card-link" data-toggle="collapse" href="#collapse16" value="39">제주</a>
                            </div>

                            <!-- 서울 -->
                            <div id="collapse1" class="collapse hide" data-parent="#accordion">
                                <hr> <h7>상세지역 선택 </h7>
                                <div class="card-body">
                                    <input type="button" class="small_area" value="강남구"><br>
                                    <input type="button" class="small_area" value="도봉구"><br>
                                    <input type="button" class="small_area" value="동대문구"><br>
                                    <input type="button" class="small_area" value="동작구"><br>
                                </div>
                                <div class="card-body">
                                    <input type="button" class="small_area" value="마포구"><br>
                                    <input type="button" class="small_area" value="서대문구"><br>
                                    <input type="button" class="small_area" value="서초구"><br>
                                    <input type="button" class="small_area" value="성동구"><br>
                                </div>
                                <div class="card-body">
                                    <input type="button" class="small_area" value="성북구"><br>
                                    <input type="button" class="small_area" value="송파구"><br>
                                    <input type="button" class="small_area" value="양천구"><br>
                                    <input type="button" class="small_area" value="강동구"><br>
                                </div>
                            </div>
                            <!-- 부산 -->
                            <div id="collapse2" class="collapse hide" data-parent="#accordion">
                                <hr> <h7>상세지역 선택 </h7>
                                <div class="card-body">
                                    <input type="button" class="small_area" value="강서구"><br>
                                    <input type="button" class="small_area" value="사하구"><br>
                                    <input type="button" class="small_area" value="서구"><br>
                                    <input type="button" class="small_area" value="수영구"><br>
                                </div>
                                <div class="card-body">
                                    <input type="button" class="small_area" value="연제구"><br>
                                    <input type="button" class="small_area" value="영도구"><br>
                                    <input type="button" class="small_area" value="중구"><br>
                                    <input type="button" class="small_area" value="해운대구"><br>
                                </div>
                                <div class="card-body">
                                    <input type="button" class="small_area" value="금정구"><br>
                                    <input type="button" class="small_area" value="기장군"><br>
                                    <input type="button" class="small_area" value="남구"><br>
                                    <input type="button" class="small_area" value="동구"><br>
                                </div>
                            </div>
                            <!-- 대구 -->
                            <div id="collapse3" class="collapse hide" data-parent="#accordion">
                                <hr> <h7>상세지역 선택 </h7>
                                <div class="card-body">
                                    <input type="button" class="small_area" value="남구"><br>
                                    <input type="button" class="small_area" value="달서구"><br>
                                    <input type="button" class="small_area" value="달성군"><br>
                                    <input type="button" class="small_area" value="동구"><br>
                                </div>
                                <div class="card-body">
                                    <input type="button" class="small_area" value="북구"><br>
                                    <input type="button" class="small_area" value="서구"><br>
                                    <input type="button" class="small_area" value="수성구"><br>
                                    <input type="button" class="small_area" value="중구"><br>
                                </div>
                            </div>
                            <!-- 인천 -->
                            <div id="collapse4" class="collapse hide" data-parent="#accordion">
                                <hr> <h7>상세지역 선택 </h7>
                                <div class="card-body">
                                    <input type="button" class="small_area" value="강화군"><br>
                                    <input type="button" class="small_area" value="중구"><br>
                                    <input type="button" class="small_area" value="계양구"><br>
                                    <input type="button" class="small_area" value="미추홀구"><br>
                                </div>
                                <div class="card-body">
                                    <input type="button" class="small_area" value="남동구"><br>
                                    <input type="button" class="small_area" value="동구"><br>
                                    <input type="button" class="small_area" value="부평구"><br>
                                    <input type="button" class="small_area" value="서구"><br>
                                </div>
                                <div class="card-body">
                                    <input type="button" class="small_area" value="연수구"><br>
                                    <input type="button" class="small_area" value="옹진군"><br>
                                </div>
                            </div>
                            <!-- 광주 -->
                            <div id="collapse5" class="collapse hide" data-parent="#accordion">
                                <hr> <h7>상세지역 선택 </h7>
                                <div class="card-body">
                                    <input type="button" class="small_area" value="광산구"><br>
                                    <input type="button" class="small_area" value="남구"><br>
                                    <input type="button" class="small_area" value="동구"><br>
                                    <input type="button" class="small_area" value="북구"><br>
                                </div>
                                <div class="card-body">
                                    <input type="button" class="small_area" value="서구"><br>
                                </div>
                            </div>
                            <!-- 대전 -->
                            <div id="collapse6" class="collapse hide" data-parent="#accordion">
                                <hr> <h7>상세지역 선택 </h7>
                                <div class="card-body">
                                    <input type="button" class="small_area" value="대덕구"><br>
                                    <input type="button" class="small_area" value="동구"><br>
                                    <input type="button" class="small_area" value="서구"><br>
                                    <input type="button" class="small_area" value="유성구"><br>
                                </div>
                                <div class="card-body">
                                    <input type="button" class="small_area" value="중구"><br>
                                </div>
                            </div>
                            <!-- 울산 -->
                            <div id="collapse7" class="collapse hide" data-parent="#accordion">
                                <hr> <h7>상세지역 선택 </h7>
                                <div class="card-body">
                                    <input type="button" class="small_area" value="중구"><br>
                                    <input type="button" class="small_area" value="남구"><br>
                                    <input type="button" class="small_area" value="동구"><br>
                                    <input type="button" class="small_area" value="북구"><br>
                                </div>
                                <div class="card-body">
                                    <input type="button" class="small_area" value="울주군"><br>
                                </div>
                            </div>
                            <!-- 경기 -->
                            <div id="collapse8" class="collapse hide" data-parent="#accordion">
                                <hr> <h7>상세지역 선택 </h7>
                                <div class="card-body">
                                    <input type="button" class="small_area" value="가평군"><br>
                                    <input type="button" class="small_area" value="동두천시"><br>
                                    <input type="button" class="small_area" value="부천시"><br>
                                    <input type="button" class="small_area" value="성남시"><br>
                                </div>
                                <div class="card-body">
                                    <input type="button" class="small_area" value="수원시"><br>
                                    <input type="button" class="small_area" value="시흥시"><br>
                                    <input type="button" class="small_area" value="안산시"><br>
                                    <input type="button" class="small_area" value="안성시"><br>
                                </div>
                                <div class="card-body">
                                    <input type="button" class="small_area" value="안양시"><br>
                                    <input type="button" class="small_area" value="양주시"><br>
                                    <input type="button" class="small_area" value="양평군"><br>
                                    <input type="button" class="small_area" value="고양시"><br>
                                </div>
                            </div>
                            <!-- 강원 -->
                            <div id="collapse9" class="collapse hide" data-parent="#accordion">
                                <hr> <h7>상세지역 선택 </h7>
                                <div class="card-body">
                                    <input type="button" class="small_area" value="강릉시"><br>
                                    <input type="button" class="small_area" value="인제군"><br>
                                    <input type="button" class="small_area" value="정선군"><br>
                                    <input type="button" class="small_area" value="철원군"><br>
                                </div>
                                <div class="card-body">
                                    <input type="button" class="small_area" value="춘천시"><br>
                                    <input type="button" class="small_area" value="태백시"><br>
                                    <input type="button" class="small_area" value="평창군"><br>
                                    <input type="button" class="small_area" value="홍천군"><br>
                                </div>
                                <div class="card-body">
                                    <input type="button" class="small_area" value="화천군"><br>
                                    <input type="button" class="small_area" value="횡성군"><br>
                                    <input type="button" class="small_area" value="고성군"><br>
                                    <input type="button" class="small_area" value="동해시"><br>
                                </div>
                            </div>
                            <!-- 충북 -->
                            <div id="collapse10" class="collapse hide" data-parent="#accordion">
                                <hr> <h7>상세지역 선택 </h7>
                                <div class="card-body">
                                    <input type="button" class="small_area" value="괴산군"><br>
                                    <input type="button" class="small_area" value="청주시"><br>
                                    <input type="button" class="small_area" value="충주시"><br>
                                    <input type="button" class="small_area" value="증평군"><br>
                                </div>
                                <div class="card-body">
                                    <input type="button" class="small_area" value="단양군"><br>
                                    <input type="button" class="small_area" value="보은군"><br>
                                    <input type="button" class="small_area" value="영동군"><br>
                                    <input type="button" class="small_area" value="옥천군"><br>
                                </div>
                                <div class="card-body">
                                    <input type="button" class="small_area" value="음성군"><br>
                                    <input type="button" class="small_area" value="제천시"><br>
                                    <input type="button" class="small_area" value="진천군"><br>
                                </div>
                            </div>
                            <!-- 충남 -->
                            <div id="collapse11" class="collapse hide" data-parent="#accordion">
                                <hr> <h7>상세지역 선택 </h7>
                                <div class="card-body">
                                    <input type="button" class="small_area" value="공주시"><br>
                                    <input type="button" class="small_area" value="예산군"><br>
                                    <input type="button" class="small_area" value="천안시"><br>
                                    <input type="button" class="small_area" value="청양군"><br>
                                </div>
                                <div class="card-body">
                                    <input type="button" class="small_area" value="태안군"><br>
                                    <input type="button" class="small_area" value="홍성군"><br>
                                    <input type="button" class="small_area" value="게룡시"><br>
                                    <input type="button" class="small_area" value="금산군"><br>
                                </div>
                                <div class="card-body">
                                    <input type="button" class="small_area" value="논산시"><br>
                                    <input type="button" class="small_area" value="당진시"><br>
                                    <input type="button" class="small_area" value="보령시"><br>
                                    <input type="button" class="small_area" value="부여군"><br>
                                </div>
                            </div>
                            <!-- 경븍 -->
                            <div id="collapse12" class="collapse hide" data-parent="#accordion">
                                <hr> <h7>상세지역 선택 </h7>
                                <div class="card-body">
                                    <input type="button" class="small_area" value="경산시"><br>
                                    <input type="button" class="small_area" value="성주군"><br>
                                    <input type="button" class="small_area" value="안동시"><br>
                                    <input type="button" class="small_area" value="영덕군"><br>
                                </div>
                                <div class="card-body">
                                    <input type="button" class="small_area" value="영양군"><br>
                                    <input type="button" class="small_area" value="영주시"><br>
                                    <input type="button" class="small_area" value="영천시"><br>
                                    <input type="button" class="small_area" value="예천군"><br>
                                </div>
                                <div class="card-body">
                                    <input type="button" class="small_area" value="울릉군"><br>
                                    <input type="button" class="small_area" value="울진군"><br>
                                    <input type="button" class="small_area" value="의성군"><br>
                                    <input type="button" class="small_area" value="경주시"><br>
                                </div>
                            </div>
                            <!-- 경남 -->
                            <div id="collapse13" class="collapse hide" data-parent="#accordion">
                                <hr> <h7>상세지역 선택 </h7>
                                <div class="card-body">
                                    <input type="button" class="small_area" value="거제시"><br>
                                    <input type="button" class="small_area" value="양산시"><br>
                                    <input type="button" class="small_area" value="의령군"><br>
                                    <input type="button" class="small_area" value="진주시"><br>
                                </div>
                                <div class="card-body">
                                    <input type="button" class="small_area" value="창녕군"><br>
                                    <input type="button" class="small_area" value="창원시"><br>
                                    <input type="button" class="small_area" value="통영시"><br>
                                    <input type="button" class="small_area" value="하동군"><br>
                                </div>
                                <div class="card-body">
                                    <input type="button" class="small_area" value="함안군"><br>
                                    <input type="button" class="small_area" value="거창군"><br>
                                    <input type="button" class="small_area" value="함양군"><br>
                                    <input type="button" class="small_area" value="합천군"><br>
                                </div>
                            </div>
                            <!-- 전북 -->
                            <div id="collapse14" class="collapse hide" data-parent="#accordion">
                                <hr> <h7>상세지역 선택 </h7>
                                <div class="card-body">
                                    <input type="button" class="small_area" value="고창군"><br>
                                    <input type="button" class="small_area" value="임실군"><br>
                                    <input type="button" class="small_area" value="장수군"><br>
                                    <input type="button" class="small_area" value="전주시"><br>
                                </div>
                                <div class="card-body">
                                    <input type="button" class="small_area" value="정읍시"><br>
                                    <input type="button" class="small_area" value="진안군"><br>
                                    <input type="button" class="small_area" value="군산시"><br>
                                    <input type="button" class="small_area" value="김제시"><br>
                                </div>
                                <div class="card-body">
                                    <input type="button" class="small_area" value="남원시"><br>
                                    <input type="button" class="small_area" value="무주군"><br>
                                    <input type="button" class="small_area" value="부안군"><br>
                                    <input type="button" class="small_area" value="순창군"><br>
                                </div>
                            </div>
                            <!-- 전남 -->
                            <div id="collapse15" class="collapse hide" data-parent="#accordion">
                                <hr> <h7>상세지역 선택 </h7>
                                <div class="card-body">
                                    <input type="button" class="small_area" value="강진군"><br>
                                    <input type="button" class="small_area" value="보성군"><br>
                                    <input type="button" class="small_area" value="순천시"><br>
                                    <input type="button" class="small_area" value="신안군"><br>
                                </div>
                                <div class="card-body">
                                    <input type="button" class="small_area" value="여수시"><br>
                                    <input type="button" class="small_area" value="영광군"><br>
                                    <input type="button" class="small_area" value="영암군"><br>
                                    <input type="button" class="small_area" value="완도군"><br>
                                </div>
                                <div class="card-body">
                                    <input type="button" class="small_area" value="장성군"><br>
                                    <input type="button" class="small_area" value="고흥군"><br>
                                    <input type="button" class="small_area" value="장흥군"><br>
                                    <input type="button" class="small_area" value="진도군"><br>
                                </div>
                            </div>
                            <!-- 제주 -->
                            <div id="collapse16" class="collapse hide" data-parent="#accordion">
                                <hr> <h7>상세지역 선택 </h7>
                                <div class="card-body">
                                    <input type="button" class="small_area" value="서귀포시"><br>
                                    <input type="button" class="small_area" value="제주시"><br>
                                </div>
                            </div>

                        </div>  
                    </div>

                    <div class="btn_small_area_set">확인</div>
                </div>
            </div>
                     
            

            <!-- 날짜 선택 버튼 -->
            <div class="dimmed"></div></div>
            <div class="btn_date">
            <input class="dateSelector" placeholder="날짜 선택"
                type="text" id="travelDate">
            </div>
        </div>


        <!-- left button line 2-->
        <div>
            <div class="left_button_line2"></div>
            <!-- 내 숙소 버튼  -->
            <button onclick="" class="button" id="btn_reservation">나의 숙소 찾기</button>
            <!-- 일정 구경 버튼 -->
            <button onclick="" class="button" id="btn_plan">일정 구경하기</button>
           

        </div>
            
            <!-- 내 숙소 팝업  -->
            <div id="setupPop2" class="wrap_layerpop2">
                <div class="layerpop2" >
                    <h3>나의 예약 내역</h3>

                    <div id="myCarousel" class="carousel slide" data-ride="carousel" data-interval="false">
                        
                        <!-- The slideshow -->
                        <div class="carousel-inner">
                            <div class="carousel-item active">
                               <div class="card_reservation" id="rs_item">
                                <img src="https://lh3.googleusercontent.com/proxy/mo2S7suoEWndBIxeZrtlej_zi2EPfrp7J3RJ-dxjzKWfhns9UpRaQMQCMjML5IhofG3feaXJjBdcVipY60cjFKsCrbMcSU7edA67o2sFe7uExQ76jAq3mLpGu3pYwROcDXyAV5gCQ_JAmI3AEcScLRmshwkOMdM=w960-h720-n-k-rw-no-v1" alt="예약이미지">
                                <p>
                                    <span>그랜드 워커힐 서울</span> 
                                    <span>2020-01-11 ~ 2020-01-15</span>
                                </p>
                            </div>   
                            <div class="card_reservation" id="rs_item">
                                <img src="https://pix8.agoda.net/hotelImages/1810284/-1/5963e6d453ffcd17d4593e3d75c7f986.jpg?ca=28&ce=0&s=1024x768" alt="예약이미지">
                                <p>
                                    <span>나인트리 프리미어 호텔 명동</span> 
                                    <span>2020-02-11 ~ 2020-02-14</span>
                                </p>
                            </div>   
                            <div class="card_reservation" id="rs_item">
                                <img src="https://images.trvl-media.com/hotels/1000000/980000/975000/974958/e572aebd.jpg?impolicy=resizecrop&rw=1200&ra=fit" alt="예약이미지">
                                <p>
                                    <span>호텔 피제이 명동</span> 
                                    <span>2020-02-15 ~ 2020-02-16</span>
                                </p>
                            </div>   
                            </div>
                            <div class="carousel-item">
                                <div class="card_reservation" id="rs_item">
                                    <img src="https://images.trvl-media.com/hotels/9000000/8750000/8749800/8749747/221d5eb9.jpg?impolicy=resizecrop&rw=1200&ra=fit" alt="예약이미지">
                                    <p>
                                        <span>목시 서울 인사동</span> 
                                        <span>2020-01-11 ~ 2020-01-15</span>
                                    </p>
                                </div>   
                                <div class="card_reservation" id="rs_item">
                                    <img src="https://images.trvl-media.com/hotels/13000000/12620000/12615800/12615733/4f522439.jpg?impolicy=resizecrop&rw=1200&ra=fit" alt="예약이미지">
                                    <p>
                                        <span>롯데시티 호텔 명동</span> 
                                        <span>2020-02-11 ~ 2020-02-14</span>
                                    </p>
                                </div>   
                                <div class="card_reservation" id="rs_item">
                                    <img src="https://images.trvl-media.com/hotels/13000000/12520000/12511700/12511672/54514914.jpg?impolicy=resizecrop&rw=1200&ra=fit" alt="예약이미지">
                                    <p>
                                        <span>L7 명동 바이 롯데</span> 
                                        <span>2020-02-15 ~ 2020-02-16</span>
                                    </p>
                                </div>
                            </div>
                            <div class="carousel-item">
                                <div class="card_reservation" id="rs_item">
                                    <img src="https://lh3.googleusercontent.com/proxy/mo2S7suoEWndBIxeZrtlej_zi2EPfrp7J3RJ-dxjzKWfhns9UpRaQMQCMjML5IhofG3feaXJjBdcVipY60cjFKsCrbMcSU7edA67o2sFe7uExQ76jAq3mLpGu3pYwROcDXyAV5gCQ_JAmI3AEcScLRmshwkOMdM=w960-h720-n-k-rw-no-v1" alt="예약이미지">
                                    <p>
                                        <span>그랜드 워커힐 서울</span> 
                                        <span>2020-01-11 ~ 2020-01-15</span>
                                    </p>
                                </div>   
                                <div class="card_reservation" id="rs_item">
                                    <img src="https://images.trvl-media.com/hotels/45000000/44220000/44216700/44216632/13fe0158.jpg?impolicy=resizecrop&rw=1200&ra=fit" alt="예약이미지">
                                    <p>
                                        <span>나인트리 호텔 동대문</span> 
                                        <span>2020-02-11 ~ 2020-02-14</span>
                                    </p>
                                </div>   
                                <div class="card_reservation" id="rs_item">
                                    <img src="https://images.trvl-media.com/hotels/22000000/21520000/21518500/21518483/2b6295d7.jpg?impolicy=resizecrop&rw=1200&ra=fit" alt="예약이미지">
                                    <p>
                                        <span>ENA 스위트 호텔 남대문</span> 
                                        <span>2020-02-15 ~ 2020-02-16</span>
                                    </p>
                                </div>
                            </div>
                          </div>
    
                   
                        </div>
                        
                        <!-- Left and right controls -->
                        <a class="carousel-control-prev" href="#myCarousel" data-slide="prev">
                          <span class="carousel-control-prev-icon"></span>
                        </a>
                        <a class="carousel-control-next" href="#myCarousel" data-slide="next">
                          <span class="carousel-control-next-icon"></span>
                        </a>

                        <button type="button" id="btn_reservation_cs" onclick="CategoryChange(this,10)">닫기</button>
                </div>
                      
                   
                   
                </div>
            <div class="dimmed"></div></div>
        </div>


        <!-- DAY 일정  -->
        <div class="wrap_day">
            <div class="day_box">

                <!-- DAY1
                <div class="day_text" id="dayTitle">DAY 1</p>

                   <ol class="row_index">
                        <div class="row" id="row1_1">
                            <div class="col-1"><li class="row_num"></li></div>
                            <div class="col-4"><img src="https://picsum.photos/id/400/600/400" alt=""></div>
                            <div class="col-2">Guttannen1</div>
                            <div class="col-2"><button onlick="" class="row_btn" id="row_btn_1_1">-</button></div>
                        </div>

                        <div class="row" id="row1_2">
                            <div class="col-1"><li class="row_num"></li></div>
                            <div class="col-4"><img src="https://picsum.photos/id/400/600/400" alt=""></div>
                            <div class="col-2">Guttannen1</div>
                            <div class="col-2"><button onlick="" class="row_btn" id="row_btn_1_2">-</button></div>
                        </div>

                        <div class="row" id="row1_3">
                            <div class="col-1"><li class="row_num"></li></div>
                            <div class="col-4"><img src="https://picsum.photos/id/400/600/400" alt=""></div>
                            <div class="col-2">Guttannen1</div>
                            <div class="col-2"><button onlick="" class="row_btn" id="row_btn_1_3">-</button></div>
                        </div>
                    </ol>
                </div> -->

               
            

            </div>
        </div>

         <!-- 일정 생성 버튼  -->
         <button type="button" class="button" id="btn_plan_create">일정 생성</button>
         <!-- 일정 생성 Modal -->
         <div class="modal" id="myModal">
         <div class="modal_Content">
             <h3><i class="fas fa-check"></i>일정 공유</h3>
             <p>다른 이용자에게 내 일정을 함께 공유하시겠습니까 ?<br>
                 ( 첫 일정 공유시 1,000P 지급 혜택 )</p>
                 
             <div class="modal_button_container">
                 <div class="modal_button" id="modal_btn_no" value="N">아니오</a></div>
                 <div class="modal_button" id="modal_btn_yes" value="Y">예</a></div>
             </div>
           
         </div>
         </div>
    </nav>

    <!-- *** main section *** -->
    <section>

        <!-- map -->
        <div id="map"></div>

        <!-- maplist -->
        <div id="maplist">
         
            <div class="row">
                <div class="col-sm-1" id="place1" draggable="true">
                    <img src="http://tong.visitkorea.or.kr/cms/resource/24/2853024_image2_1.jpg" alt="">
                    2022 강남페스티벌
                </div>
                <div class="col-sm-1" id="place2"draggable="true">
                    <img src="http://tong.visitkorea.or.kr/cms/resource/48/705248_image2_1.jpg" alt="">
                    노보텔 앰배서더 강남
                </div>
                <div class="col-sm-1" id="place3" draggable="true">
                    <img src="http://tong.visitkorea.or.kr/cms/resource/86/2020186_image2_1.jpg" alt="">
                    고투몰(강남터미널 지하도상가)
                </div>
                <div class="col-sm-1" id="place4" draggable="true">
                    <img src="http://tong.visitkorea.or.kr/cms/resource/13/2024213_image2_1.jpg" alt="">
                    세븐럭카지노(강남코엑스점)
                </div>
                <div class="col-sm-1" id="place5" draggable="true">
                    <img src="http://tong.visitkorea.or.kr/cms/resource/08/1984608_image2_1.jpg" alt="">
                    강남
                </div>
                <div class="col-sm-1" id="place6" draggable="true">
                    <img src="http://tong.visitkorea.or.kr/cms/resource/62/1923662_image2_1.jpg" alt="">
                    서울특별시교육청 강남도서관
                </div>
                <div class="col-sm-1" id="place7" draggable="true">
                    <img src="http://tong.visitkorea.or.kr/cms/resource/23/2462023_image2_1.jpg" alt="">
                    강남청소년수련관
                </div>
                <div class="col-sm-1" id="place8" draggable="true">
                    <img src="http://tong.visitkorea.or.kr/cms/resource/15/1807915_image2_1.jpg" alt="">
                    바바인디아 강남역점
                </div>
            </div>
        </div>

        
        <!-- othersPlanModel -->
        <div id="othersPlanModal">
            <div id="opWrapper">
                <jsp:include page="../travel/others_plan.jsp" flush="true" /> 
            </div>
        </div> 



    </section>


    <!-- *** footer *** -->
    <footer>
         <jsp:include page="/WEB-INF/views/common/footer.jsp" flush="false" />
    </footer>

    <!-- *** JS *** -->
    <!-- flatpickr -->
    <script>
        console.clear();
        
        function createElementFromHTML(htmlString) {
            var div = document.createElement('div');
            div.innerHTML = htmlString.trim();
            // Change this to div.childNodes to support multiple top-level nodes.
            return div.firstChild;
        } //createElementFromHTML : String을 html로 리턴 
        

        var startDate;
        var endDate
        function returnDay() {
            let [a,b] = document.querySelector('.dateSelector').value.split('to');
            startDate = a.replaceAll('.','-').trim();               // 여행 시작일 저장용 
            endDate = b.replaceAll('.','-').trim()                  // 여행 종료일 저장용 
            let newDate1 = new Date( a.replaceAll('.','-').trim() );
            let newDate2 = new Date( b.replaceAll('.','-').trim() );
            day = (newDate2-newDate1) / (1000 * 60 * 60 * 24) + 1;      // 여행일수
            console.log("day : ", day);

            dayBox = document.querySelector(".day_box") ;               //day들의 부모 박스 
            rowIndex = document.querySelector(".row_index");
            for(let i=1; i<day+1; i++) {

            let dayText= ' <div class="day_text" id="Day' + i + '">DAY ' + i + '</p> <ol class="row_index"> </ol> </div>';
            console.log("i:",i);
                
            dayBox.appendChild(createElementFromHTML(dayText));
            console.log("day추가 완료"); 

            } //for 

            DropBoxEvent(); //드롭 인식될 박스에 이벤트 등록  
            
            return day;
        } //returnDay : 여행일수 리턴하고, DAY n 생성 , 이벤트 등록 

       
        var dateSelector = document.querySelector('.dateSelector');
        const fp = flatpickr("#myID", {});
        dateSelector.flatpickr({  
            monthSelectorType: "dropdown",
            mode: "range",    
            dateFormat: "Y.m.d", 
            minDate: "today",
            maxDate: new Date().fp_incr(6),
            // enable: [
            //     function(date) {
            //         // return true to enable
            //         return (date.getDate() < 8);
            //     }
            // ]
            onClose: function(){
                console.log("returnDay() invoked.");
                returnDay();
            },
            onOpen: function(){
                $('.day_text').remove();
            }
        });
   
        // =========================================================

        // <!-- drag & drop -->

        //dragItem 이벤트 리스너 등록 
        let dragItem = document.querySelector(".row");
        

        dragItem.addEventListener("dragstart", (e) => {

            // console.log(e);
            // console.log("드래그를 시작하면 발생하는 이벤트");

            ItemId = e.target.id;
        
            // console.log("target:" , e.target);
            // console.log("target.id:" , e.target.id);
            // console.log("target.html:" , e.target.innerHTML);
        });

        dragItem.addEventListener("dragend", (e) => {
            console.log(e);
            e.preventDefault();
            console.log("드래그가 끝나면 발생하는 이벤트");

        });

        //dragBox 이벤트 리스너  
        function DropBoxEvent() {
            dragBox = document.querySelector(".day_box")

            dragBox.addEventListener("dragenter", (e) => {
                console.log(e);
                // console.log("드래그되는 요소가 이곳에 닿으면 출력돼요.");
            });

           
            dragBox.addEventListener("dragover", (e) => {
                e.preventDefault();
                // console.log("드래그 요소가 이 영역에 위에 계속 위치하면 발생하는 이벤트");
            }); 

            dragBox.addEventListener("drop", (e) => {
                e.preventDefault();
            
                let data = document.getElementById(ItemId);
                let dataImg = data.querySelector("img").src;
                let dataText = data.textContent;
                let latitude = data.getAttribute("locationY");
                let longitude = data.getAttribute("locationX");
                

                $("#place1").attr("locationX")
            
                console.log("data:",data);
                console.log("dataImg:",dataImg);
                console.log("dataText:",dataText);
                
                let rowIndex = '<div class="row">' + 
                                '<div class="col-1"><li class="row_num"></li></div>' + 
                                '<div class="col-5"><button onlick="" class="row_btn">-</button><img src="' + dataImg + ' " alt=""></div>' +
                                '<div class="col-6" style="white-space:pre-line" latitude=' + latitude + ' longitude=' + longitude + '>' + dataText + 
                                '</div></div>';
                    
                containerId = e.target.id;
                console.log("containerId:",containerId)

                height = $("#"+containerId).height()
                height += 115;
                $("#"+containerId).height(height);
                height = 0;
                
                e.target.querySelector(".row_index").append(createElementFromHTML(rowIndex));
                $("button.row_btn").css({'position': 'absolute', 'z-index': '3', 'left': '25px', 'top': '38px'})

                // $("button.row_btn").addClass("r");
                // e.target.querySelector(".row_index").html(rowIndex);
                
            
                // $(function() {
                //     $(".row_num").css("color" , "white");
                //     $(".row_num").addClass("selected2");
                // })
                // containerId = e.target.id;
                
                console.log("드래그 요소가 박스 영역에 드롭");

                //row_btn >> button delete 삭제 이벤트 
                $(function() {
                    $(".row button").click(function() {
                        console.log("클릭햇습니다",$(this));
                        // $(this).remove();
                        let dayTextClassID = "#" + $(this).closest(".day_text").attr("id");
                        height2 = $(this).closest(".day_text").height();
            
                        $(dayTextClassID).height(height2-115);
                        $(this).closest(".row").remove();
                        console.log("dayTextClassID",dayTextClassID);
                        height2 = 0;
                    }) 
                }); // rowDelete();


            });  //dragover과 같이 써야함
        } //dragBoxEvent 


        
    // <!-- kakao map  -->

        var mapContainer = document.getElementById('map');
            var mapOptions = {
                center: new kakao.maps.LatLng(33.450701, 126.570667),
                level: 2
            };
        var map = new kakao.maps.Map(mapContainer, mapOptions);

	</script>

    <!-- include -->
    <!-- <script>
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
    </script> -->
    

</body>
</html>
