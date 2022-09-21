<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>가보자고:: 아이디/비밀번호 찾기</title>

    <!-- favicon -->
    <link rel="shortcut icon" href="/resources/common/ico/favicon.ico" type="image/x-icon">
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

    <!-- FontAwesome -->
    <script src="https://kit.fontawesome.com/c12d3c98b6.js" crossorigin="anonymous"></script>

    <!-- css styleSheet -->
    <link rel="stylesheet" href="/resources/member/css/findidstyle.css">

    <!-- jQuery Section -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.4.0/jquery-migrate.min.js"></script>

    <script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>

    <script type="text/javascript">
	    function checkValidation(){
	    	console.log("checkValidation() invoked.");
	    
    		let phone = $("#phone").val();

    		let reg_phone = /^\d{3}-\d{4}-\d{4}$/;
    		
    		if(!(reg_phone.test(phone)) || phone == ""){ // 유효성 검사 실패
                $("#phoneRulesError").css({display: "block"}); 

                return false;
            } else { // 유효성 검사 성공
                $("#phoneRulesError").css({display: "none"});	
            } // if-else	      
	    }// checkValidation
    </script>
</head>

<body>
    <div id="wrapper">
        <jsp:include page="/WEB-INF/views/common/header.jsp" flush="true"/>
        
        <div id="body">

            <section id="introSection">
                <img src="/resources/member/img/8726129_map_marker_question_icon.png" alt="" id="questionMarkImg">
                <h3>아이디 혹은 비밀번호를 잊어버리셨나요?</h3>
                <p>회원가입 시 등록한 정보로 계정 정보를 찾을 수 있습니다.</p> 
            </section>

            <section id="mainBox">
                <button type="button" onclick="location.href='/findInfo/id'">아이디 찾기</button>
                <button type="button" onclick="location.href='/findInfo/pw'">비밀번호 찾기</button>
                
                <div class="mainForm" id="idfindDefault">
                    <form action="/findInfo/findidProcess" method="POST" onsubmit="return checkValidation()">
                        <div class="leftSorting">
                            <input type="radio" name="" id="" checked>가입한 휴대폰 번호로 찾기<br>
                            <input type="text" name="phone" id="phone" placeholder="010-0000-0000" required><br>
                            <div id="phoneRulesError" class="validationRulesError">휴대폰 번호 양식(010-0000-0000)에 맞게 재작성해주세요.</div>
                        </div>
                        
                        <input type="submit" value="아이디 찾기" id="findIdBtn" >
                    </form>
                </div>
            </section>
        </div>
        
        <jsp:include page="/WEB-INF/views/common/footer.jsp" flush="true"/>
    </div>
    
</body>

</html>