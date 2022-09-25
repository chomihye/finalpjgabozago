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
    <title>CUSTOMER-DETAIL</title>

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
    <link rel="stylesheet" href="/resources/admin/css/admin_customer_detail.css" />

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
        
        
        <div id="customer">
            <div class="title">전체 회원</div>
                <div class="board-table-top">
                    <div class="profile_img">
                        <img src="https://picsum.photos/id/550/150/150" alt="profile img">
                    </div>

                    <ul id="detail-list">
                        <li>[회원번호] 이름</li>
                        <li>&nbsp;&nbsp;&nbsp;</li>
                        <li>닉네임</li>
                        <li>&nbsp;&nbsp;&nbsp;</li>
                        <li>이메일(아이디)</li>
                        <li>&nbsp;&nbsp;&nbsp;</li> 
                        <li>연락처</li>
                        <li>&nbsp;&nbsp;&nbsp;</li>  
                        <li>생년월일</li>
                        <li>&nbsp;&nbsp;&nbsp;</li>
                        <li>적립금</li>
                        <li>&nbsp;&nbsp;&nbsp;</li>
                        <li>회원가입일</li>
                    </ul>

                    <ul id="detailed">
                    <!-- var : 임시 EL 변수명, items : 공유속성 이름 -->
                    	<c:forEach var="item" items= "${result.model}">
	                        <li>[${item.IDX}] ${item.NAME}</li>
	                        <li>&nbsp;&nbsp;&nbsp;</li>
	                        <li>${item.NICKNAME}</li>
	                        <li>&nbsp;&nbsp;&nbsp;</li>
	                        <li>${item.EMAIL}</li>
	                        <li>&nbsp;&nbsp;&nbsp;</li> 
	                        <li>${item.PHONE}</li>
	                        <li>&nbsp;&nbsp;&nbsp;</li>
	                        <li><fmt:formatDate pattern="yyyy-MM-dd" value="${item.BIRTHDAY}" /></li>
	                        <li>&nbsp;&nbsp;&nbsp;</li>
	                        <li><fmt:formatNumber pattern="#,###,###,###" value="${item.POINT}" />P</li>
	                        <li>&nbsp;&nbsp;&nbsp;</li>
	                        <li><fmt:formatDate pattern="yyyy-MM-dd" value="${item.INSERT_TS}" /></li>
                        </c:forEach>
                    </ul>

                    <div class="back">
                        <a href="/admin/customer" class="btnBack">돌아가기</a>
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


