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
    <title>DASH-BOARD</title>

    <script src="https://kit.fontawesome.com/ba256c1670.js" crossorigin="anonymous"></script>
    
    <!-- bootstrap -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
	<script>
        $(function(){
           $("button.btn").css("color", "#333333");
       });
    </script>
    
    <link rel="stylesheet" href="/resources/admin/css/admin_dash-board.css" />

</head>

<body>
    <!-- header -->
    <header>
    	<jsp:include page="/WEB-INF/views/common/header_admin.jsp" flush="false" />
    </header>

    <!-- section -->
    <div class="wrap">
        
        <div id="accordion">

            <div class="card">
            <div class="card-header" id="headingOne">
                <h5 class="mb-0">
                <button class="btn btn-link" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                    <a href="/admin/dashboard"><i class="bi bi-grid"></i>대시보드</a>
                </button>
                </h5>
            </div>
    

            <div class="card-header" id="headingTwo">
                <h5 class="mb-0">
                <button class="btn btn-link collapsed" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                    <a href="/admin/customer"><i class="bi bi-person"></i>회원관리</a>
                </button>
                </h5>
          	 </div>
    
    
              <div class="card-header" id="headingThree">
                <h5 class="mb-0">
                  <button class="btn btn-link collapsed" data-toggle="collapse" data-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                    <i class="bi bi-calendar-date"></i>예약관리
                  </button>
                </h5>
              </div>
              <div id="collapseThree" class="collapse" aria-labelledby="headingThree" data-parent="#accordion">
                <div class="card-body">
                    <button type="button"><a href="/admin/reservation">예약관리</a></button>
                    <button type="button"><a href="/admin/reservation/cancel">취소/환불 관리</a></button>
                </div>
              </div>
    
    
              <div class="card-header" id="headingFour">
                <h5 class="mb-0">
                  <button class="btn btn-link collapsed" data-toggle="collapse" data-target="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
                    <i class="bi bi-card-text"></i>컨텐츠관리
                  </button>
                </h5>
              </div>
              <div id="collapseFour" class="collapse" aria-labelledby="headingFour" data-parent="#accordion">
                <div class="card-body">
                    <button type="button"><a href="/admin/content">게시글</a></button>
                    <button type="button"><a href="/admin/content/notice">공지사항</a></button>
                    <button type="button"><a href="/admin/content/question">문의 관리</a></button>
                </div>
              </div>
              
            </div>
  
        </div>
        
        
        <div id="dash-board">
            <div class="recent-post">최근 글</div>
            <table class="board_list board-table">
                    <thead>
                        <tr class="tr-list">
                            <th class="num">번호</th>
                            <th class="title">제목</th>
                            <th class="writer">닉네임</th>
                            <th class="date">작성일</th>
                        </tr>
                    </thead>
            
                <tbody>
                    <tr>
                        <td class="num">7</td>
                        <td class="title">
                            <a href="/board/community/read">서울의 랜드마크를 만나다</a>
                        </td>
                        <td class="writer">백설기</td>
                        <td class="date">2022-09-13</td>
            
                    <tr>
                        <td class="num">6</td>
                        <td class="title">
                            <a href="/board/community/read">춘천에서 청정 & 낭만 에너지를 채우다</a>
                        </td>
                        <td class="writer">골멩이</td>
                        <td class="date">2022-09-11</td>
                    </tr>
            
                    <tr>
                        <td class="num">5</td>
                        <td class="title">
                            <a href="/board/community/read">자전거와 함께하는 풍경여행</a>
                        </td>
                        <td class="writer">납평치</td>
                        <td dateclass="writer">2022-09-10</td>
                    </tr>
            
                    <tr>
                        <td class="num">4</td>
                        <td class="title">
                            <a href="/board/community/read">온몸으로 즐기는 대구 2박 3일 코스 여행</a>
                        </td>
                        <td class="writer">토런스</td>
                        <td class="date">2022-09-06</td>
                    </tr>
                    
                    <tr>
                        <td class="num">3</td>
                        <td class="title">
                            <a href="/board/community/read">3/1 운동의 정신을 느껴보는 서울 여행</a>
                        </td>
                        <td class="writer">모도리</td>
                        <td class="date">2022-09-03</td>
                    </tr>
            
                </tbody>
            </table>

        
            <div id="dash-board-bottom">
                <div id="ask">
                    <table class="board-table2">
                        <thead>
                            <th class="ask-title">문의</th>
                        </thead>
                        <tbody>
                            <td><a href="/board/qna/read">문의드립니다.</a></td>  
                            <td><a href="/board/qna/read2">문의드립니다.</a></td> 
                            <td><a href="/board/qna/read2">문의드립니다.</a></td>
                            <td><a href="/board/qna/read2">문의드립니다.</a></td> 
                            <td><a href="/board/qna/read2">문의드립니다.</a></td>
                        </tbody>
                    </table>
                </div>
        
                <div id="admin-post">
                    <table class="board-table3">
                        <thead>
                            <th class="admin-title">관리자 작성 글</th>
                        </thead>
                        <tbody>
                        <c:forEach var="item" items="${result.model}">
                            <td><a href="/board/notice/read">${item.TITLE}</a></td>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        
        </div>
    </div>


    <!-- footer -->
    <footer>
        <%@include file="/WEB-INF/views/common/footer.jsp" %>
    </footer>
</body>

</html>


