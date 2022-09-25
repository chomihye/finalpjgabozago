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
        <jsp:include page="/WEB-INF/views/common/header.jsp" flush="false" />
    </header>

    <!-- section -->
    <div class="wrap">
        
        <div id="accordion">

            <div class="card">
            <div class="card-header" id="headingOne">
                <h5 class="mb-0">
                <button class="btn btn-link" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                    <a href="/admin/dashboard">대시보드</a>
                </button>
                </h5>
            </div>
    

            <div class="card-header" id="headingTwo">
                <h5 class="mb-0">
                <button class="btn btn-link collapsed" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                    <a href="/admin/customer">회원관리</a>
                </button>
                </h5>
          	 </div>
    
    
              <div class="card-header" id="headingThree">
                <h5 class="mb-0">
                  <button class="btn btn-link collapsed" data-toggle="collapse" data-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                    예약관리
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
                    컨텐츠관리
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
                        <td class="num">1</td>
                        <td class="title">
                            <a href="#!">Lorem, ipsum dolor.</a>
                        </td>
                        <td class="writer">아아</td>
                        <td class="date">2022/07/07</td>
            
                    <tr>
                        <td class="num">2</td>
                        <td class="title">
                            <a href="#!">Lorem ipsum dolor sit amet.</a>
                        </td>
                        <td class="writer">라떼</td>
                        <td class="date">2022/07/07</td>
                    </tr>
            
                    <tr>
                        <td class="num">3</td>
                        <td class="title">
                            <a href="#!">Lorem ipsum dolor sit amet.</a>
                        </td>
                        <td class="writer">핫초코</td>
                        <td class="date">2022/07/07</td>
                    </tr>
            
                    <tr>
                        <td class="num">4</td>
                        <td class="title">
                            <a href="#!">Lorem ipsum dolor sit amet consectetur adipisicing elit.</a>
                        </td>
                        <td class="writer">홍차</td>
                        <td dateclass="writer">2022/07/07</td>
                    </tr>
            
                    <tr>
                        <td class="num">5</td>
                        <td class="title">
                            <a href="#!">Lorem ipsum dolor sit amet.</a>
                        </td>
                        <td class="writer">아이스초코</td>
                        <td class="date">2022/07/07</td>
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
                            <td><a href="#!">Lorem ipsum dolor sit amet consectetur adipisicing.</a></td>  
                            <td><a href="#!">Lorem ipsum dolor sit amet consectetur.</a></td> 
                            <td><a href="#!">Lorem ipsum dolor sit amet consectetur.</a></td>
                            <td><a href="#!">Lorem ipsum dolor sit amet.</a></td> 
                            <td><a href="#!">Lorem ipsum dolor sit amet.</a></td>
                        </tbody>
                    </table>
                </div>
        
                <div id="admin-post">
                    <table class="board-table3">
                        <thead>
                            <th class="admin-title">관리자 작성 글</th>
                        </thead>
                        <tbody>
                            <td><a href="#!">Lorem ipsum dolor sit amet consectetur.</a></td>
                            <td><a href="#!">Lorem ipsum dolor sit amet consectetur.</a></td>
                            <td><a href="#!">Lorem ipsum dolor sit, amet consectetur adipisicing elit. Quaerat?</a></td>
                            <td><a href="#!">Lorem ipsum dolor sit amet.</a></td>
                            <td><a href="#!">Lorem ipsum dolor sit amet.</a></td>
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


