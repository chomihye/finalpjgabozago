<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>커뮤니티 글쓰기</title>

    <link rel="stylesheet" href="/resources/board/css/cwrite.css">
    
    <!--fabozago favicon -->
    <link rel="shortcut icon" href="/resources/common/ico/favicon.ico">
    <link rel="icon" href="../ico/favicon.ico" type="image/x-icon">
    <link rel="icon" type="image/png" sizes="192x192" href="/resources/commonico/android-icon-192x192.png">
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
    
</head>

<body>

</body>
<jsp:include page="/WEB-INF/views/common/header.jsp" flush="false" />
<section>
    <div class="article_head">
        <h2 class="title">COMMUNITY</h2>
        <h3 class="desc">나만의 여행일정을 공유해주세요.</h3>
    </div>

    <div class="W_box">
        <form action="">
            <fieldset style="border-radius: 2px;">
                <legend style="font-size: 40px;"><img src="free-icon-writing-7995418.png" alt="">일정 후기쓰기</legend>
                <div class="I">
                    <div class="se">
                        여행지역 <select name="area" class="area">
                            <option value="none">여행지역을 선택해주세요</option>
                            <option value="seoul">서울</option>
                            <option value="Incheon">인천</option>
                            <option value="Daejeon">대전</option>
                            <option value="Dae-gu">대구</option>
                            <option value="gwangju">광주</option>
                            <option value="busan">부산</option>
                            <option value="Ulsan">울산</option>
                            <option value="gyeonggi">경기</option>
                            <option value="Gangwon">강원</option>
                            <option value="Chungbuk">충북</option>
                            <option value="Chungnam">충남</option>
                            <option value="Gyeongbuk">경북</option>
                            <option value="Gyeongnam">경남</option>
                            <option value="Jeonbuk">전북</option>
                            <option value="Jeonnam">전남</option>
                            <option value="Jeju">제주</option>
                        </select><br><br>
                        여행일정 <select name="plan" class="plan">
                            <option value="choo">일정선택</option>
                        </select><br><br>
                    </div>

                    <input type="text" name="title" placeholder="제목을 입력해주세요" id="title"><br><br>
                    <input type="text" name="writing" placeholder="내용을 입력해주세요" id="writing"
                        style="vertical-align: text-top;"><br><br>
                    <input type="file" name="upload[]" multiple id="file"><br><br>
                </div><br><br>
                <div class="button">
                    <input type="button" name="취소" value="취소" id="C">
                    <input type="submit" name="저장" value="저장" id="S">
                </div>
            </fieldset>
    </div>

</section>

<jsp:include page="/WEB-INF/views/common/footer.jsp" flush="false" />

</html>