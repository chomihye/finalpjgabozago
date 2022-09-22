<!DOCTYPE html>
<%@page import="com.pj.gabozago.domain.MemberVO"%>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>header</title>

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
    <script src="/main/js/header.js"></script>

    <!-- 폰트어썸, 부트스트랩 -->
    <script src="https://kit.fontawesome.com/39d2c0da6a.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">




</head>

<body>
    <header>
        <div class="headerContainer">
            <div id="leftMenu">
                <a href="/main"><img src="/resources/common/img/logo_Green_2.png" id="logo"></a>
                <ul>
                    <li><a href="/travel/main">일정관리</a></li>
                    <li><a href="/reservation/">숙박예약</a></li>
                    <li><a href="/board/community">커뮤니티</a></li>
                    <li><a href="/board/notice">고객센터</a> </li>
                </ul>
            </div>

            <div id="rightMenu">
                <div class="searchContainer">
                    <div class="dropdown">
                        <input class="searchBar btn btn-secondary dropdown-toggle" id="dropdownMenuButton1"
                            data-bs-toggle="dropdown" aria-expanded="false">
                        <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
                            <li><a class="dropdown-item" href="#">
                                    <img src="/resources/common/img/sokcho.jpg">속초</a>
                            </li>
                            <li><a class="dropdown-item" href="#">
                                    <img src="/resources/common/img/gyeongju.jpg">경주</a>
                            </li>
                            <li><a class="dropdown-item" href="#">
                                    <img src="/resources/common/img/seoul.jpg">서울</a>
                            </li>

                        </ul>
                        <button class="searchBtn"><i class="bi bi-search"></i></button>
                    </div>


                </div>

                <button class="myPage" onclick="location.href ='/mypage'"><i class="bi bi-person"></i></button>
                <% 
                	MemberVO vo = (MemberVO) session.getAttribute("__MEMBER__");

					if(vo == null){
				%>
                <button class="loginBtn" onclick="location.href ='/login'" id="loginBtn">LOGIN</button>
                <% } else { %>
                <button class="loginBtn" onclick="location.href ='/login/logoutProcess'" id="logoutBtn">LOGOUT</button>
            	<% } %>
            </div>
        </div>
    </header>
</body>

</html>