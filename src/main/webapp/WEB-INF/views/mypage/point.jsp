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
    <link rel="stylesheet" href="/resources/mypage/css/6-13.mypage_point.css">
    <link rel="stylesheet" href="/resources/common/css/pagination.css">

    <!-- script -->
    <script src="/resources/mypage/js/6-13.mypage_point.js"></script>
</head>

<body>
    <jsp:include page="/WEB-INF/views/common/header.jsp" flush="false" />

    <div class="wrap">
        <jsp:include page="/WEB-INF/views/mypage/ProfileAndMenu.jsp" flush="false" />
        
        <section class="point">
            <div class="pointHeader">
                <h1>마이포인트</h1>
                <p><i class="bi bi-p-circle"></i> 현재 포인트 : <fmt:formatNumber pattern="#,###,###" value="${__RESULT__}" /> P</p>
            </div>

            <table class="pointBody">
                <thead>
                    <tr>
                        <th>일자</th>
                        <th>내용</th>
                        <th>포인트</th>
                    </tr>
                </thead>
        
                <tbody>
                    <!-- var : 임시 EL 변수명, items : 공유속성 이름 -->
                    <c:forEach var="point" items="${__LIST__}">
                        <tr>
                            <td><fmt:formatDate pattern="yyyy.MM.dd" value="${point.insertTs}" /></td>
                            <td>${point.pointReason}</td>
                            <td class="pointAmount">
                                <fmt:formatNumber pattern="##,###" value="${point.pointAmount}" /> P ${point.isPlus}
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>

            <div id="pagination">
                <form action="#" id="paginationForm">
                    <!-- 1. 3가지 기준정보(criteria)는 hidden 정보로 제공 -->
                    <input type="hidden" name="currPage">
    
                    <!-- 2. PageDTO 객체의 정보를 이용해서, Pagenation 출력 -->
                    <ul>
                        <!-- Prev 처리 -->
                        <li class="frontPage"><a href="/mypage/point?currPage=1"><i class="bi bi-chevron-double-left"></i></a></li>

                        <c:choose>
                            <c:when test="${__PAGINATION__.prev}">
                                <li class="prev"><a href="/mypage/point?currPage=${__PAGINATION__.startPage - 1}"><i class="bi bi-chevron-left"></i></a></li>
                            </c:when>
                            <c:otherwise>
                                <li class="prev"><a href="#"><i class="bi bi-chevron-left"></i></a></li>
                            </c:otherwise>
                        </c:choose>

                        <!-- 현재 Pagination 범위에 속한 페이지 번호 목록 출력 -->
                        <!-- begin부터 end까지 forEach(반복문) -->
                        <c:forEach var="pageNum" begin="${__PAGINATION__.startPage}" end="${__PAGINATION__.endPage}">
                            <li class="${pageNum == __PAGINATION__.cri.currPage ? 'currPage' : ''}">
                                <a href="/mypage/point?currPage=${pageNum}">
                                    <strong>${pageNum}</strong>
                                </a>
                            </li>
                        </c:forEach>
    
                        <!-- Next 처리 -->
                        <c:choose>
                            <c:when test="${__PAGINATION__.next}">
                                <li class="next"><a href="/mypage/point?currPage=${__PAGINATION__.endPage + 1}"><i class="bi bi-chevron-right"></i></a></li>
                            </c:when>
                            <c:otherwise>
                                <li class="next"><a href="#"><i class="bi bi-chevron-right"></i></a></li>
                            </c:otherwise>
                        </c:choose>

                        <li class="backPage"><a href="/mypage/point?currPage=${__PAGINATION__.realEndPage}"><i class="bi bi-chevron-double-right"></i></a></li>
                    </ul>
                </form>
            </div>
        </section>
    </div>

    <jsp:include page="/WEB-INF/views/common/footer.jsp" flush="false" />
</body>

</html>