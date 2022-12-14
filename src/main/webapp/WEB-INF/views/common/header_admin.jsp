<!DOCTYPE html>
<%@page import="com.pj.gabozago.domain.MemberVO" %>
    <html lang="ko">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <title>admin header</title>

        <!-- 부트스트랩 css,js -->
        <!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous"> -->


        <link rel="stylesheet" href="/resources/common/css/bootstrap.css">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
            crossorigin="anonymous"></script>

        <!-- 외부 css,js -->
        <link rel="stylesheet" href="/resources/common/css/headerReset.css">
        <link rel="stylesheet" href="/resources/common/css/header.css">


        <!-- 폰트어썸, 부트스트랩 -->
        <script src="https://kit.fontawesome.com/39d2c0da6a.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">




    </head>

    <body>
        <header>
            <div class="headerContainer">
                <div id="leftMenu">
                    <a href="/admin"><img src="/resources/common/img/logo_Green_2.png" id="logo"></a>
                    <ul>
                        <li><a href="/admin/customer/">회원관리</a></li>
                        <li><a href="/admin/reservation/">숙박예약</a></li>
                        <li><a href="/admin/content">커뮤니티</a></li>
                        <li><a href="/admin/content/notice">고객센터</a> </li>
                    </ul>
                </div>

                <div id="rightMenu">

                    <% MemberVO vo=(MemberVO) session.getAttribute("__MEMBER__"); if(vo==null){ %>
                        <button class="loginBtn" onclick="location.href ='/admin/login'" id="loginBtn">LOGIN</button>
                        <% } else { %>
                            <button class="loginBtn" onclick="location.href ='/admin/logoutProcess'"
                                id="logoutBtn">LOGOUT</button>
                            <% } %>
                </div>
            </div>
        </header>
    </body>

    </html>