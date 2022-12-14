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
    
        <title>Profile And Menu</title>
    
         <!-- 부트스트랩 -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">

        <!-- 제이쿼리 -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.4.0/jquery-migrate.min.js"></script>
    
        <!-- CSS -->
        <link rel="stylesheet" href="/resources/mypage/css/ProfileAndMenu.css">

        <!-- script -->
        <script>
            $(function(){
                $(".profileAndMenu .profile h2").append('${sessionScope.__MEMBER__.nickname}');

                let profileImg = null;
                profileImg = '${sessionScope.__MEMBER__.profileImg}';

                if(profileImg != ''){
                    $(".profileAndMenu .profile img").attr('src', profileImg);        // 프로필 이미지가 있으면, 프로필 이미지 경로
                }else{
                    $(".profileAndMenu .profile img").attr('src', '/resources/common/img/logo_Green_2.png');    // 프로필 이미지가 없으면, 기본이미지
                } // if-else
            });
        </script>
    </head>
    
    <body>
        <div class="navBox">
            <nav class="profileAndMenu">
                <article class="profile">
                    <img src="" alt="profile image">
                    <h2></h2>
                    <a href="/mypage/myInfo/pwdCheck" class="btnEdit">Edit my profile</a>
                </article>
            
                <a href="/mypage/main"><h3>마이페이지</h3></a>
            
                <ul class="menu">
                    <li><a href="/mypage/plan" 		  id="plan">여행일정</a></li>
                    <li><a href="/mypage/reservation" id="reservation">숙소예약내역</a></li>
                    <li><a href="/mypage/wishlist" 	  id="wishlist">위시리스트</a></li>
                    <li><a href="/mypage/point" 	  id="point">마이포인트</a></li>
                    <li><a href="/mypage/write" 	  id="write">작성 글/댓글</a></li>
                </ul>
            
                <div class="drop">
                    <a href="/mypage/withdrawal/pwdCheck"><span>회원탈퇴</span>&nbsp;<i class="bi bi-caret-right-fill"></i></a>
                </div>
            </nav>
        </div>
    </body>
    
    </html>