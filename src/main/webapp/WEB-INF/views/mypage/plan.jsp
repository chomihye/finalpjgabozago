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

    <!-- 제이쿼리 -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.4.0/jquery-migrate.min.js"></script>
 
    <!-- 부트스트랩 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">

    <!-- 폰트어썸, 부트스트랩 폰트 -->
    <!-- <script src="https://kit.fontawesome.com/39d2c0da6a.js" crossorigin="anonymous"></script> -->
    <!-- <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css"> -->

    <!-- 부트스트랩 css, js -->
    <link rel="stylesheet" href="/resources/common/css/bootstrap.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.min.js"
    integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
    crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct"
    crossorigin="anonymous"></script>
 
    <!-- CSS -->
    <link rel="stylesheet" href="/resources/mypage/css/6-5.mypage_plan.css">
    <link rel="stylesheet" href="/resources/common/css/pagination.css">
    <link rel="stylesheet" href="/resources/mypage/css/modal.css">
    <link rel="stylesheet" href="/resources/common/css/best_plan_reset.css">
    <link rel="stylesheet" href="/resources/common/css/slide_plan.css">
    <link rel="stylesheet" href="/resources/mypage/css/myplan_slide_plan.css">

    <!-- script -->
    <script src="/resources/mypage/js/6-5.mypage_plan.js"></script>
    <script src="/resources/mypage/js/modal.js"></script>
</head>

<body>
    <jsp:include page="/WEB-INF/views/common/header.jsp" flush="false" />

    <div class="wrap">
        <jsp:include page="/WEB-INF/views/mypage/ProfileAndMenu.jsp" flush="false" />
        
        <section class="myPlan">
            <div class="plan_header">
                <h1>여행일정</h1>
            </div>

            <c:choose>
                <c:when test="${__PAGINATION__.totalAmount != 0}">
                    <article class="planBoxWrap">
                        <c:forEach var="list" items="${__LIST__}">
                            <!-- 아이템 list의 개수에 따라 반복되는 부분 -->
                            <div class="planBox"> 
                                <div class="slideContainer">              
                                    <div id="plan${list.itemNumber}" class="carousel slide" data-touch="false" data-interval="false">
                                        <div class="userInfo">
                                            <ul>
                                                <div class="firstLine">
                                                    <c:choose>
                                                        <c:when test="${list.travelPlan.IS_PUBLIC == 'Y'}"> 
                                                            <li class="title">${list.travelPlan.LARGE_AREA_NAME}여행</li>
                                                        </c:when>    
                                                        <c:otherwise>
                                                            <li class="title"><i class="bi bi-lock"></i> ${list.travelPlan.LARGE_AREA_NAME}여행</li>
                                                        </c:otherwise>
                                                    </c:choose>
                                                    
                                                    <div class="modifyBtn modifyBtn${list.itemNumber}">
                                                        <input type="hidden" id="tempIdx" value="${list.travelPlan.TRAVEL_PLAN_IDX}">
                                                        <!-- <a href="javascript:void(0);"><i class="bi bi-pencil"></i></a> -->
                                                        <a href="javascript:void(0);" class="btnCancel"><i class="bi bi-trash3"></i></a>
                                                    </div>
                                                </div>
                                    
                                                <li class="travelDays">
                                                    여행기간 : 
                                                    <span>
                                                        ${list.travelPlan.START_DATE} ~ ${list.travelPlan.END_DATE}
                                                    </span>
                                                </li>
                                            </ul>
                                        </div>
                                
                                        <!-- 슬라이드 영역 -->
                                        <div class="carousel-inner">
                                            <c:forEach  var="eachDays" items="${list.eachDays}">
        
                                                <c:choose>
                                                    <c:when test="${eachDays == 1}"> 
                                                        <div class="carousel-item active">
                                                            <div class="dayList">
                                                                <h1>DAY1</h1>
                                                                <div class="areaList">
                                                                    <img src="/resources/common/img/list.png" width="">
                                                                    <ul>
                                                                        <c:forEach var="travelPlanDetail" items="${list.travelPlanDetail}">
                                                                            <c:if test="${travelPlanDetail.DAY == eachDays}">
                                                                                <c:choose>
                                                                                    <c:when test="${travelPlanDetail.PLACE_TYPE == 'T'}"> 
                                                                                        <li>${travelPlanDetail.PLACE_NAME}</li>
                                                                                    </c:when> 
                                                                                    
                                                                                    <c:otherwise>
                                                                                        <li>${travelPlanDetail.ACCOM_NAME}</li>
                                                                                    </c:otherwise>
                                                                                </c:choose>
                                                                            </c:if>
                                                                        </c:forEach>
                                                                    </ul>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </c:when>    
        
                                                    <c:otherwise>
                                                        <div class="carousel-item">
                                                            <div class="dayList">
                                                                <h1>DAY${eachDays}</h1>
                                                                <div class="areaList">
                                                                    <img src="/resources/common/img/list.png">
                                                                    <ul>
                                                                        <c:forEach var="travelPlanDetail" items="${list.travelPlanDetail}">
                                                                            <c:if test="${travelPlanDetail.DAY == eachDays}">
                                                                                <c:choose>
                                                                                    <c:when test="${travelPlanDetail.PLACE_TYPE == 'T'}"> 
                                                                                        <li>${travelPlanDetail.PLACE_NAME}</li>
                                                                                    </c:when> 
                                                                                    
                                                                                    <c:otherwise>
                                                                                        <li>${travelPlanDetail.ACCOM_NAME}</li>
                                                                                    </c:otherwise>
                                                                                </c:choose>
                                                                            </c:if>
                                                                        </c:forEach>
                                                                    </ul>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </c:otherwise>
                                                </c:choose>
                                            </c:forEach>
                                        </div>
                                
                                        <button id="leftArrow" class="carousel-control-prev arrows" type="button" data-target="#plan${list.itemNumber}" data-slide="prev">
                                            <span class="bi bi-arrow-left-circle-fill" aria-hidden="true"></span>
                                        </button>
                                    
                                        <button id="rightArrow" class="carousel-control-next arrows" type="button" data-target="#plan${list.itemNumber}" data-slide="next">
                                            <span class="bi bi-arrow-right-circle-fill" aria-hidden="true"></span>
                                        </button>
        
                                        <div class="lastModify">마지막 수정일자 : <span><fmt:formatDate pattern="yyyy.MM.dd" value="${list.lastUpdate}" /></span></div>
                            
                                    </div> 
                                </div>
                            </div>
                        </c:forEach>
                    </article>
        
                    <!-- 페이지버튼 -->
                    <div id="pagination">
                        <form action="#" id="paginationForm">
                            <!-- 1. 3가지 기준정보(criteria)는 hidden 정보로 제공 -->
                            <input type="hidden" name="currPage">
            
                            <!-- 2. PageDTO 객체의 정보를 이용해서, Pagenation 출력 -->
                            <ul>
                                <!-- Prev 처리 -->
                                <li class="frontPage"><a href="/mypage/plan?currPage=1"><i class="bi bi-chevron-double-left"></i></a></li>
        
                                <c:choose>
                                    <c:when test="${__PAGINATION__.prev}">
                                        <li class="prev"><a href="/mypage/plan?currPage=${__PAGINATION__.startPage - 1}"><i class="bi bi-chevron-left"></i></a></li>
                                    </c:when>
                                    <c:otherwise>
                                        <li class="prev"><a href="javascript:void(0);"><i class="bi bi-chevron-left"></i></a></li>
                                    </c:otherwise>
                                </c:choose>
        
                                <!-- 현재 Pagination 범위에 속한 페이지 번호 목록 출력 -->
                                <!-- begin부터 end까지 forEach(반복문) -->
                                <c:forEach var="pageNum" begin="${__PAGINATION__.startPage}" end="${__PAGINATION__.endPage}">
                                    <li class="${pageNum == __PAGINATION__.cri.currPage ? 'currPage' : ''}">
                                        <a href="/mypage/plan?currPage=${pageNum}">
                                            <strong>${pageNum}</strong>
                                        </a>
                                    </li>
                                </c:forEach>
            
                                <!-- Next 처리 -->
                                <c:choose>
                                    <c:when test="${__PAGINATION__.next}">
                                        <li class="next"><a href="/mypage/plan?currPage=${__PAGINATION__.endPage + 1}"><i class="bi bi-chevron-right"></i></a></li>
                                    </c:when>
                                    <c:otherwise>
                                        <li class="next"><a href="javascript:void(0);"><i class="bi bi-chevron-right"></i></a></li>
                                    </c:otherwise>
                                </c:choose>
        
                                <li class="backPage"><a href="/mypage/plan?currPage=${__PAGINATION__.realEndPage}"><i class="bi bi-chevron-double-right"></i></a></li>
                            </ul>
                        </form>
                    </div>
                </c:when>

                <c:otherwise>
                    <div id="no_get">여행일정이 없습니다.</div>
                </c:otherwise>
            </c:choose>
        </section>
    </div>

    <jsp:include page="/WEB-INF/views/common/footer.jsp" flush="false" />

    <!-- 일정 삭제 확인 모달 -->
    <form 
        action="/mypage/plan/delete?currPage=${__PAGINATION__.cri.currPage}" 
        method="post"
        class="modal" 
        id="PlanRemoveModal">
        <div class="modal_Content">
            <input type="hidden" id="finalIdx" name="idx" value="">
            <p class="center simpleTextSpaceAdd">정말 삭제하시겠습니까?</p>
            <div class="btnWrap">
                <button type="button" class="cancelBtn">취소</button>
                <button type="submit" class="okBtn">확인</button>
            </div>
        </div>
    </form>
</body>

</html>