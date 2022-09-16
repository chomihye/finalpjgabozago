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

    <!-- 폰트어썸 -->
    <script src="https://kit.fontawesome.com/648bb0142f.js" crossorigin="anonymous"></script>

    <!-- 제이쿼리 -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.4.0/jquery-migrate.min.js"></script>

    <!-- CSS -->
    <link rel="stylesheet" href="/resources/mypage/css/6-7.mypage_reservation_detail.css">
    <link rel="stylesheet" href="/resources/mypage/css/modal.css">

    <!-- script -->
    <script src="/resources/mypage/js/modal.js"></script>
    <script>
        $(function(){
            $("#reservation").css("font-weight", "bold");
            // $(".profileAndMenu .profile h2").append('${sessionScope.__MEMBER__.nickname}');
        })
    </script>
</head>

<body>
    <jsp:include page="/WEB-INF/views/common/header.jsp" flush="false" />

    <div class="wrap">
        <jsp:include page="/WEB-INF/views/mypage/ProfileAndMenu.jsp" flush="false" />
        
        <section class="reservation_info">
            <div class="header">
                <a href="#"><i class="fas fa-angle-left"></i></a>
                <h1>예약 확인</h1>
            </div>

            <c:set var="item" value="${__MAP__}" />
            <article class="infoBox">
                <div class="reser_info">
                    <h1>예약 정보</h1>
                    <div class="accom_info">
                        <a href="/reservation/datail?accom_idx=${item.ACCOM_IDX}"><img src="/resources/acco/img/himg/${item.FILE_NAME}" alt="accom image"></a>
                        <div class="accom_info_letter">
                            <h3><a href="/reservation/datail?accom_idx=${item.ACCOM_IDX}">${item.ACCOM_NAME}</a></h3>
                            <p><a href="/reservation/room?room_idx=${item.ACCOM_ROOM_IDX}">${item.ROOM_NAME}</a></p>
                        </div>
                    </div>
                    <div class="date_info">
                        <h3>날짜</h3>
                        <p>${item.CHECK_IN_DATE} ~ ${item.CHECK_OUT_DATE}</p>
                    </div>
                    <h3>인원</h3>
                    <p>
                        성인 ${item.ADULT_COUNT}인
                        <c:if test="${item.CHILD_COUNT != 0}">
                            , 유아 ${item.CHILD_COUNT}인
                        </c:if>
                    </p>
                </div>
                <div class="member_info">
                    <h1>예약자 정보</h1>
                    <h3>예약자 이름</h3><p>${item.NAME}</p>
                    <h3>연락처</h3><p>${item.PHONE}</p>
                    <h3>이메일 주소</h3><p>${item.EMAIL}</p>
                </div>
                <div class="payment_info">
                    <h1>결제 정보</h1>
                    <h3>주문금액</h3><p><fmt:formatNumber pattern="#,###,###,###" value="${item.ORDER_PRICE}" /> 원</p>
                    <h3>포인트 사용</h3><p>-<fmt:formatNumber pattern="#,###,###,###" value="${item.USE_POINT}" /> P</p>
                    <h3>총 결제 금액</h3><p class="total"><fmt:formatNumber pattern="#,###,###,###" value="${item.PAYMENT_PRICE}" /> 원</p>
                    <div class="card_info">
                        <div>카드결제</div>
                        <div><fmt:formatDate pattern="(yyyy-MM-dd HH:mm:ss)" value="${item.INSERT_TS}" /></div>
                    </div>
                </div>
                
                <c:choose>
                    <c:when test="${item.STATUS eq 'CA'}">
                        <!-- status가 CA(취소가능)인 경우, 예약취소 버튼 활성화 -->
                        <div class="cancel">
                            <button type="button" class="btnCancel">예약 취소</button>
                        </div>
                    </c:when>
                    <c:when test="${item.STATUS eq 'CD'}">
                        <!-- status가 CD(취소완료)인 경우, 환불정보 활성화 -->
                        <div class="refund_info">
                            <h1>환불 정보</h1>
                            <h3>환불 일자</h3><p><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${__RESULT__.insertTs}" /></p>
                            <h3>환불 금액</h3><p class="total"><fmt:formatNumber pattern="#,###,###,###" value="${__RESULT__.refundPrice}" /> 원</p>
                            <h3>환불 수단</h3><p>신용카드 결제 취소</p>
                            <h3>환불 처리 상태</h3><p>환불 완료</p>
                            <h3>포인트 복원 내역</h3><p><fmt:formatNumber pattern="#,###,###,###" value="${__RESULT__.refundPoint}" /> P</p>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <!-- 정상적으로 이용완료된 상태이면 아무것도 표시하지 않는다. -->
                    </c:otherwise>
                </c:choose>
            </article>            
        </section>
    </div>

    <jsp:include page="/WEB-INF/views/common/footer.jsp" flush="false" />

    <!-- 예약 취소 확인 모달 -->
    <form 
        action="/mypage/reservation/detail?status=${item.STATUS}&idx=${item.IDX}" 
        method="post"
        class="modal" 
        id="ReserCancelModal">
        <div class="modal_Content">
            <p class="center simpleTextSpaceAdd">정말 예약을 취소하시겠습니까?</p>
            <div class="btnWrap">
                <button type="button" class="cancelBtn">취소</button>
                <button type="submit" class="okBtn">확인</button>
            </div>
        </div>
    </form>




    <!-- <div class="modal" id="ReserCancelModal">
        <div class="modal_Content">
            <p class="center simpleTextSpaceAdd">정말 예약을 취소하시겠습니까?</p>
            <div class="btnWrap">
                <button type="button" class="cancelBtn">취소</button>
                <button type="button" class="okBtn">확인</button>
            </div>
        </div>
    </div> -->
</body>

</html>