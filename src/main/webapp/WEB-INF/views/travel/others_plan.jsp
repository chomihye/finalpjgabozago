<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title></title>

    <!-- Calender -->
    <!-- <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css"> -->
    <script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
    <link rel="stylesheet" type="text/css" href="https://npmcdn.com/flatpickr/dist/themes/material_green.css">
    <script src="https://npmcdn.com/flatpickr/dist/l10n/ko.js"></script>

    <!-- 외부 css,js -->
    <link rel="stylesheet" href="/resources/travel/css/others_plan.css">
    <!-- <script src="/plan/js/"></script> -->

    <!-- 폰트어썸, 부트스트랩 -->
    <script src="https://kit.fontawesome.com/39d2c0da6a.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">

    <!-- 제이쿼리 -->
    <!-- <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.css" /> -->

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.4.0/jquery-migrate.min.js"></script>

    <!-- othersPlanModel.js -->
    <script src="/resources/travel/js/othersPlan.js"></script>
 

    <script>
        $(function () {
            $('addOkBtn').click(function () {
                $('#othersPlanModalWrapper').fadeIn();
            })
        })
    </script>

    <style>
  
    </style>
</head>

<body>

    <div id="othersplaWrapper">

        <!-- 일정구경하기 -->
        <section>
            <div class="bestPlanOutter">
                <!-- <div > -->
                <h1 class="bestPlanTitle">일정 구경하기</h1>

                <div class="best_plan">
                    <jsp:include page="../common/recmdPlan.jsp" flush="true" />
                </div>
                <script>
                    $('.addOkBtn').click(function () {
                        $("#planAddModal").css("display", "none");
                        $("#othersPlanModalWrapper").fadeIn();
                    })
                </script>

                <!-- </div> -->
            </div>
        </section>


        <!-- 모달 창 -->
        <div id="othersPlanModalWrapper">

            <div class="plan_modal">

                <div class="dayList">
                    <div class="daylistOutter">

                        <div class="dayListInner">
                            <h3>DAY1</h3>

                            <ul class="areaList">
                                <c:forEach items="${planList1}" var="planList1">
                                    <c:if test="${planList1.travelPlanDetailVO.day==1}">

                                        <li>${planList1.travelPlanDetailVO.placeName}</li>
                                        <li class="bi bi-arrow-right-short"></li>

                                    </c:if>
                                </c:forEach>
                            </ul>

                            <div class="dayAddWrapper">

                                <input type="text" id="dateSelector1" class="datepicker_input" placeholder="여행하기" />
                            </div>

                        </div>
                    </div>

                    <div class="daylistOutter">

                        <div class="dayListInner">
                            <h3>DAY2</h3>

                            <ul class="areaList">
                                <c:forEach items="${planList1}" var="planList1">
                                    <c:if test="${planList1.travelPlanDetailVO.day==2}">

                                        <li>${planList1.travelPlanDetailVO.placeName}</li>
                                        <li class="bi bi-arrow-right-short"></li>

                                    </c:if>
                                </c:forEach>
                            </ul>

                            <div class="dayAddWrapper">

                                <input type="text" id="dateSelector2" class="datepicker_input" placeholder="여행하기" />
                            </div>

                        </div>
                    </div>

                    <div class="daylistOutter">

                        <div class="dayListInner">
                            <h3>DAY3</h3>

                            <ul class="areaList">
                                <c:forEach items="${planList1}" var="planList1">
                                    <c:if test="${planList1.travelPlanDetailVO.day==3}">

                                        <li>${planList1.travelPlanDetailVO.placeName}</li>
                                        <li class="bi bi-arrow-right-short"></li>

                                    </c:if>
                                </c:forEach>
                            </ul>

                            <div class="dayAddWrapper">

                                <input type="text" id="dateSelector3" class="datepicker_input" placeholder="여행하기" />
                            </div>

                        </div>
                    </div>

                    <div class="daylistOutter">

                        <div class="dayListInner">
                            <h3>DAY4</h3>

                            <ul class="areaList">
                                <c:forEach items="${planList1}" var="planList1">
                                    <c:if test="${planList1.travelPlanDetailVO.day==4}">

                                        <li>${planList1.travelPlanDetailVO.placeName}</li>
                                        <li class="bi bi-arrow-right-short"></li>

                                    </c:if>
                                </c:forEach>
                            </ul>

                            <div class="dayAddWrapper">

                                <input type="text" id="dateSelector4" class="datepicker_input" placeholder="여행하기" />
                            </div>

                        </div>
                    </div>

                    <div class="daylistOutter">

                        <div class="dayListInner">
                            <h3>DAY5</h3>

                            <ul class="areaList">
                                <c:forEach items="${planList1}" var="planList1">
                                    <c:if test="${planList1.travelPlanDetailVO.day==5}">

                                        <li>${planList1.travelPlanDetailVO.placeName}</li>
                                        <li class="bi bi-arrow-right-short"></li>

                                    </c:if>
                                </c:forEach>
                            </ul>

                            <div class="dayAddWrapper">

                                <input type="text" id="dateSelector5" class="datepicker_input" placeholder="여행하기" />
                            </div>

                        </div>
                    </div>

                    <div class="daylistOutter">

                        <div class="dayListInner">
                            <h3>DAY6</h3>

                            <ul class="areaList">
                                <c:forEach items="${planList1}" var="planList1">
                                    <c:if test="${planList1.travelPlanDetailVO.day==6}">

                                        <li>${planList1.travelPlanDetailVO.placeName}</li>
                                        <li class="bi bi-arrow-right-short"></li>

                                    </c:if>
                                </c:forEach>
                            </ul>

                            <div class="dayAddWrapper">

                                <input type="text" id="dateSelector6" class="datepicker_input" placeholder="여행하기" />
                            </div>

                        </div>
                    </div>

                    <div class="daylistOutter">

                        <div class="dayListInner">
                            <h3>DAY7</h3>

                            <ul class="areaList">
                                <c:forEach items="${planList1}" var="planList1">
                                    <c:if test="${planList1.travelPlanDetailVO.day==7}">

                                        <li>${planList1.travelPlanDetailVO.placeName}</li>
                                        <li class="bi bi-arrow-right-short"></li>

                                    </c:if>
                                </c:forEach>
                            </ul>

                            <div class="dayAddWrapper">

                                <input type="text" id="dateSelector7" class="datepicker_input" placeholder="여행하기" />
                            </div>

                        </div>
                    </div>


                </div>

                <div class=" planModelCotroller">
                    <button class="planClose" type="button">닫기</button>
                    <button class="planSave" type="submit">저장</button>
                </div>



                <div id="planSaveMmodal"></div>
            </div>

        </div>
    </div>

    </div>
 


    <script>
        var dateSelector = document.querySelector('#dateSelector1');
        dateSelector.flatpickr({
            monthSelectorType: "dropdown",
            dateFormat: "Y.m.d",
            minDate: "today",

        });
        
        var dateSelector = document.querySelector('#dateSelector2');
        dateSelector.flatpickr({
            monthSelectorType: "dropdown",
            dateFormat: "Y.m.d",
            minDate: "today",
        });

        var dateSelector = document.querySelector('#dateSelector3');
        dateSelector.flatpickr({
            monthSelectorType: "dropdown",
            dateFormat: "Y.m.d",
            minDate: "today",

        });
        var dateSelector = document.querySelector('#dateSelector4');
        dateSelector.flatpickr({
            monthSelectorType: "dropdown",
            dateFormat: "Y.m.d",
            minDate: "today",

        });
        var dateSelector = document.querySelector('#dateSelector5');
        dateSelector.flatpickr({
            monthSelectorType: "dropdown",
            dateFormat: "Y.m.d",
            minDate: "today",

        });
        var dateSelector = document.querySelector('#dateSelector6');
        dateSelector.flatpickr({
            monthSelectorType: "dropdown",
            dateFormat: "Y.m.d",
            minDate: "today",
        });
        var dateSelector = document.querySelector('#dateSelector7');
        dateSelector.flatpickr({
            monthSelectorType: "dropdown",
            dateFormat: "Y.m.d",
            minDate: "today",

        });

        $(function () {
            $('.planClose').click(function () {
                $("#othersPlanModalWrapper").fadeOut();
            })
        })

    </script>
</body>

</html>