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
    <link rel="stylesheet" href="/resources/mypage/css/6-17.mypage_withdrawal_confirm.css">

    <!-- script -->
    <script>
        $(function(){
            $(".profileAndMenu .profile h2").append('${sessionScope.__MEMBER__.nickname}');
            
            let result = "${__RESULT__}";
            console.log(result);

            if(result == "Failed"){
                alert("오류가 발생하였습니다. 다시 시도해주십시오. 계속해서 오류가 발생하는 경우 고객센터로 문의해주시기 바랍니다.");
            } // if
        });
    </script>
</head>

<body>
    <jsp:include page="/WEB-INF/views/common/header.jsp" flush="false" />

    <div class="wrap">
        <jsp:include page="/WEB-INF/views/mypage/ProfileAndMenu.jsp" flush="false" />
        
        <section class="withdrawal">
            
            <div id="body">        
                <div class="midHr">&nbsp;&nbsp;&nbsp;회원탈퇴&nbsp;&nbsp;&nbsp;</div>
    
                <form action="/mypage/withdrawal/completed" method="POST">
                    
                    <div class="guide_text">회원탈퇴 후에는 삭제된 정보를 복구할 수 없습니다.<br>그래도 탈퇴하시겠습니까?</div>
                    
                    <div class="btnBox">
                        <input type="button" value="취소" onclick="location.href='/mypage/main'">
                        <input type="submit" value="확인" id="confirmBtn">
                    </div>
                </form>
    
            </div>
    
        </section>
   
    </div>

    <jsp:include page="/WEB-INF/views/common/footer.jsp" flush="false" />
</body>

</html>