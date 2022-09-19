<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>join</title>

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
    <link rel="stylesheet" href="/resources/member/css/joinstyle.css">

    <!-- jQuery -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" referrerpolicy="no-referrer"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.4.0/jquery-migrate.min.js" integrity="sha512-QDsjSX1mStBIAnNXx31dyvw4wVdHjonOwrkaIhpiIlzqGUCdsI62MwQtHpJF+Npy2SmSlGSROoNWQCOFpqbsOg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

	<!-- flatpicker -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
    <link rel="stylesheet" type="text/css" href="https://npmcdn.com/flatpickr/dist/themes/material_green.css">
    <script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
	<script src="https://npmcdn.com/flatpickr/dist/flatpickr.min.js"></script>
	<script src="https://npmcdn.com/flatpickr/dist/l10n/ko.js"></script> 
	
    <!-- join JS -->
    <script src="/resources/member/js/join.js"></script>
    <script src="/resources/member/js/join_validCheck.js"></script>
    
    <script type="text/javascript">
	   
    </script>
</head>

<body>

    <div id="wrapper">
        <jsp:include page="/WEB-INF/views/common/header.jsp" flush="true"/>
        
        <div id="body">        
            <div class="midHr">&nbsp;회원가입&nbsp;</div>

            <!-- action="http://localhost:5050/join/joinProcess" --> 
            <form 
            action="join/joinProcess"
            
            method="POST" id="joinForm" enctype="multipart/form-data"
            onsubmit="return finalCheckBeforeSubmit()">
                <div class="sections">
                    <h4>이름<span class="redStar">*</span></h4>
                    <input type="text" name="name" id="name" placeholder="예: 홍길동" minlength="2" maxlength="10"required><br>
                    <div id="nameRulesError" class="validationRulesError">이름을 재작성해주세요.</div>
                </div >
                
                <div class="sections">
                    <h4>아이디(이메일)<span class="redStar">*</span></h4>
                    <input type="email" name="email" id="email" placeholder="예: sample@email.com" required>
                    <button type="button" class="formCheckBox verificationBtn" id="emailVerificationBtn" onclick="doubleCheckAndVerifyEmail()">인증</button><br>
                    <div id="emailRulesError" class="validationRulesError">이메일 양식에 맞게 재작성해주세요.</div>
                </div>
                
                <div class="sections">
                    <h4>비밀번호<span class="redStar">*</span></h4>
                    <p class="ruleTexts">영문 대소문자, 숫자, 특수문자 포함 8자 이상 12자 이하</p>
                    <input type="password" name="pw" id="pw" placeholder="●●●●●●●●" minlength="8" maxlength="12" required>
                    <div id="pwRulesError" class="validationRulesError">비밀번호 양식에 맞게 재작성해주세요.</div>
                </div>
                
                <div class="sections">
                    <h4>비밀번호 확인<span class="redStar">*</span></h4>
                    <input type="password" name="password" id="pwcheck" placeholder="●●●●●●●●" minlength="8" maxlength="12" required>
                    <div id="pwcheckError">비밀번호가 일치하지 않습니다.</div>
                </div>
                
                <div class="sections">
                    <h4>닉네임<span class="redStar">*</span></h4>
                    <p class="ruleTexts">한문, 특수문자, 공백 제외 8자 이내</p>
                    <input type="text" name="nickname" id="nickname" placeholder="" maxlength="8" required>
                    <button type="button" class="formCheckBox" id="doubleCheckBtn" onclick="doubleCheckNickname()">중복 확인</button>
                    <div id="nicknameRulesError" class="validationRulesError">닉네임 양식에 맞게 재작성해주세요.</div>
                </div>
                
                <div class="sections">
                    <h4>휴대폰 번호<span class="redStar">*</span></h4>
                    <input type="text" name="phone" id="phone" pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}" placeholder="010-0000-0000" required>
                    <button type="button" class="formCheckBox verificationBtn" id="phoneVerificationBtn" onclick="doubleCheckAndVerifyPhone()">인증</button>
                    <div id="phoneRulesError" class="validationRulesError">휴대폰 번호 양식(010-0000-0000)에 맞게 재작성해주세요.</div>
                </div>
                
                <div class="sections">
                    <h4>생년월일<span class="redStar">*</span></h4>
                    <input type="text" name="birthday" id="flatpickr" placeholder="생년월일 선택" required>
                </div>
                
                <div class="sections">
                    <h4>개인정보 수집 및 이용 동의<span class="redStar">*</span></h4> <span id="personalTextAgreeRulesError" class="validationRulesError">필수 동의 항목입니다.</span>
                    <textarea name="personalText" id="personalText" rows="8" readonly disabled>
가보자고('http://gabozago.co.kr'이하 '가보자고')은(는) 「개인정보 보호법」 제30조에 따라 정보주체의 개인정보를 보호하고 이와 관련한 고충을 신속하고 원활하게 처리할 수 있도록 하기 위하여 다음과 같이 개인정보 처리방침을 수립·공개합니다.

○ 이 개인정보처리방침은 2022년 7월 1부터 적용됩니다.

제 1 조 (개인정보의 처리 목적)
가보자고('http://gabozago.co.kr'이하 '가보자고')은(는) 다음의 목적을 위하여 개인정보를 처리합니다. 처리하고 있는 개인정보는 다음의 목적 이외의 용도로는 이용되지 않으며 이용 목적이 변경되는 경우에는 「개인정보 보호법」 제18조에 따라 별도의 동의를 받는 등 필요한 조치를 이행할 예정입니다.

1. 홈페이지 회원가입 및 관리
회원제 서비스 제공에 따른 본인 식별·인증, 회원자격 유지·관리, 서비스 부정이용 방지, 만14세 미만 아동의 개인정보 처리 시 법정대리인의 동의여부 확인, 각종 고지·통지 목적으로 개인정보를 처리합니다.

2. 재화 또는 서비스 제공
서비스 제공, 콘텐츠 제공, 본인인증, 연령인증, 요금결제·정산을 목적으로 개인정보를 처리합니다.

3. 마케팅 및 광고에의 활용
이벤트 및 광고성 정보 제공 및 참여기회 제공 , 접속빈도 파악 또는 회원의 서비스 이용에 대한 통계 등을 목적으로 개인정보를 처리합니다.

제2조 (개인정보의 처리 및 보유 기간)
① 가보자고은(는) 법령에 따른 개인정보 보유·이용기간 또는 정보주체로부터 개인정보를 수집 시에 동의받은 개인정보 보유·이용기간 내에서 개인정보를 처리·보유합니다.

② 각각의 개인정보 처리 및 보유 기간은 다음과 같습니다.

<홈페이지 회원가입 및 관리>
<홈페이지 회원가입 및 관리>와 관련한 개인정보는 수집.이용에 관한 동의일로부터<준영구>까지 위 이용목적을 위하여 보유.이용됩니다.
보유근거 : 관리
관련법령 :
예외사유 :


제 3 조 (처리하는 개인정보의 항목)
① 가보자고은(는) 다음의 개인정보 항목을 처리하고 있습니다.

< 홈페이지 회원가입 및 관리 >
필수항목 : 이메일, 휴대전화번호, 비밀번호, 로그인ID, 생년월일, 이름
선택항목 :

제 4 조 (만 14세 미만 아동의 개인정보 처리에 관한 사항)
① <개인정보처리자명>은(는) 만 14세 미만 아동에 대해 개인정보를 수집할 때 법정대리인의 동의를 얻어 해당 서비스 수행에 필요한 최소한의 개인정보를 수집합니다.
• 필수항목 : 법정 대리인의 성명, 관계, 연락처

② 또한, <개인정보처리자명>의 <처리목적> 관련 홍보를 위해 아동의 개인정보를 수집할 경우에는 법정대리인으로부터 별도의 동의를 얻습니다.

③ <개인정보처리자명>은(는) 만 14세 미만 아동의 개인정보를 수집할 때에는 아동에게 법정대리인의 성명, 연락처와 같이 최소한의 정보를 요구할 수 있으며, 다음 중 하나의 방법으로 적법한 법정대리인이 동의하였는지를 확인합니다.

• 동의 내용을 게재한 인터넷 사이트에 법정대리인이 동의 여부를 표시하도록 하고 개인정보처리자가 그 동의 표시를 확인했음을 법정대리인의 휴대전화 문자 메시지로 알리는 방법
• 동의 내용을 게재한 인터넷 사이트에 법정대리인이 동의 여부를 표시하도록 하고 법정대리인의 신용카드·직불카드 등의 카드정보를 제공받는 방법
• 동의 내용을 게재한 인터넷 사이트에 법정대리인이 동의 여부를 표시하도록 하고 법정대리인의 휴대전화 본인인증 등을 통해 본인 여부를 확인하는 방법
• 동의 내용이 적힌 서면을 법정대리인에게 직접 발급하거나, 우편 또는 팩스를 통하여 전달하고 법정대리인이 동의 내용에 대하여 서명날인 후 제출하도록 하는 방법
• 동의 내용이 적힌 전자우편을 발송하여 법정대리인으로부터 동의의 의사표시가 적힌 전자우편을 전송받는 방법
• 전화를 통하여 동의 내용을 법정대리인에게 알리고 동의를 얻거나 인터넷주소 등 동의 내용을 확인할 수 있는 방법을 안내하고 재차 전화 통화를 통하여 동의를 얻는 방법
• 그 밖에 위와 준하는 방법으로 법정대리인에게 동의 내용을 알리고 동의의 의사표시를 확인하는 방법

제 5 조 (개인정보의 제3자 제공에 관한 사항)
① 가보자고은(는) 개인정보를 제1조(개인정보의 처리 목적)에서 명시한 범위 내에서만 처리하며, 정보주체의 동의, 법률의 특별한 규정 등 「개인정보 보호법」 제17조 및 제18조에 해당하는 경우에만 개인정보를 제3자에게 제공합니다.

② 가보자고은(는) 다음과 같이 개인정보를 제3자에게 제공하고 있습니다.
1. < >
개인정보를 제공받는 자 :
제공받는 자의 개인정보 이용목적 :
제공받는 자의 보유.이용기간:

제 6 조 (개인정보처리의 위탁에 관한 사항)
① 가보자고은(는) 원활한 개인정보 업무처리를 위하여 다음과 같이 개인정보 처리업무를 위탁하고 있습니다.

1. < >
위탁받는 자 (수탁자) :
위탁하는 업무의 내용 :
위탁기간 :

② 가보자고은(는) 위탁계약 체결시 「개인정보 보호법」 제26조에 따라 위탁업무 수행목적 외 개인정보 처리금지, 기술적․관리적 보호조치, 재위탁 제한, 수탁자에 대한 관리․감독, 손해배상 등 책임에 관한 사항을 계약서 등 문서에 명시하고, 수탁자가 개인정보를 안전하게 처리하는지를 감독하고 있습니다.

③ 위탁업무의 내용이나 수탁자가 변경될 경우에는 지체없이 본 개인정보 처리방침을 통하여 공개하도록 하겠습니다.

제 7 조 (개인정보의 파기절차 및 파기방법)
① 가보자고 은(는) 개인정보 보유기간의 경과, 처리목적 달성 등 개인정보가 불필요하게 되었을 때에는 지체없이 해당 개인정보를 파기합니다.

② 정보주체로부터 동의받은 개인정보 보유기간이 경과하거나 처리목적이 달성되었음에도 불구하고 다른 법령에 따라 개인정보를 계속 보존하여야 하는 경우에는, 해당 개인정보를 별도의 데이터베이스(DB)로 옮기거나 보관장소를 달리하여 보존합니다.
1. 법령 근거 :
2. 보존하는 개인정보 항목 : 계좌정보, 거래날짜

③ 개인정보 파기의 절차 및 방법은 다음과 같습니다.
1. 파기절차
가보자고 은(는) 파기 사유가 발생한 개인정보를 선정하고, 가보자고 의 개인정보 보호책임자의 승인을 받아 개인정보를 파기합니다.

제 8 조 (정보주체와 법정대리인의 권리·의무 및 그 행사방법에 관한 사항)
① 정보주체는 가보자고에 대해 언제든지 개인정보 열람·정정·삭제·처리정지 요구 등의 권리를 행사할 수 있습니다.

② 제1항에 따른 권리 행사는가보자고에 대해 「개인정보 보호법」 시행령 제41조제1항에 따라 서면, 전자우편, 모사전송(FAX) 등을 통하여 하실 수 있으며 가보자고은(는) 이에 대해 지체 없이 조치하겠습니다.

③ 제1항에 따른 권리 행사는 정보주체의 법정대리인이나 위임을 받은 자 등 대리인을 통하여 하실 수 있습니다.이 경우 “개인정보 처리 방법에 관한 고시(제2020-7호)” 별지 제11호 서식에 따른 위임장을 제출하셔야 합니다.

④ 개인정보 열람 및 처리정지 요구는 「개인정보 보호법」 제35조 제4항, 제37조 제2항에 의하여 정보주체의 권리가 제한 될 수 있습니다.

⑤ 개인정보의 정정 및 삭제 요구는 다른 법령에서 그 개인정보가 수집 대상으로 명시되어 있는 경우에는 그 삭제를 요구할 수 없습니다.

⑥ 가보자고은(는) 정보주체 권리에 따른 열람의 요구, 정정·삭제의 요구, 처리정지의 요구 시 열람 등 요구를 한 자가 본인이거나 정당한 대리인인지를 확인합니다.

제 9 조 (개인정보의 안전성 확보조치에 관한 사항)
가보자고은(는) 개인정보의 안전성 확보를 위해 다음과 같은 조치를 취하고 있습니다.

1. 정기적인 자체 감사 실시
개인정보 취급 관련 안정성 확보를 위해 정기적(분기 1회)으로 자체 감사를 실시하고 있습니다.

2. 개인정보 취급 직원의 최소화 및 교육
개인정보를 취급하는 직원을 지정하고 담당자에 한정시켜 최소화 하여 개인정보를 관리하는 대책을 시행하고 있습니다.

3. 개인정보의 암호화
이용자의 개인정보는 비밀번호는 암호화 되어 저장 및 관리되고 있어, 본인만이 알 수 있으며 중요한 데이터는 파일 및 전송 데이터를 암호화 하거나 파일 잠금 기능을 사용하는 등의 별도 보안기능을 사용하고 있습니다.

4. 접속기록의 보관 및 위변조 방지
개인정보처리시스템에 접속한 기록을 최소 1년 이상 보관, 관리하고 있으며,다만, 5만명 이상의 정보주체에 관하여 개인정보를 추가하거나, 고유식별정보 또는 민감정보를 처리하는 경우에는 2년이상 보관, 관리하고 있습니다.
또한, 접속기록이 위변조 및 도난, 분실되지 않도록 보안기능을 사용하고 있습니다.

5. 개인정보에 대한 접근 제한
개인정보를 처리하는 데이터베이스시스템에 대한 접근권한의 부여,변경,말소를 통하여 개인정보에 대한 접근통제를 위하여 필요한 조치를 하고 있으며 침입차단시스템을 이용하여 외부로부터의 무단 접근을 통제하고 있습니다.

6. 비인가자에 대한 출입 통제
개인정보를 보관하고 있는 물리적 보관 장소를 별도로 두고 이에 대해 출입통제 절차를 수립, 운영하고 있습니다.

제 10 조 (개인정보를 자동으로 수집하는 장치의 설치·운영 및 그 거부에 관한 사항)
① 가보자고 은(는) 이용자에게 개별적인 맞춤서비스를 제공하기 위해 이용정보를 저장하고 수시로 불러오는 ‘쿠키(cookie)’를 사용합니다.
② 쿠키는 웹사이트를 운영하는데 이용되는 서버(http)가 이용자의 컴퓨터 브라우저에게 보내는 소량의 정보이며 이용자들의 PC 컴퓨터내의 하드디스크에 저장되기도 합니다.
가. 쿠키의 사용 목적 : 이용자가 방문한 각 서비스와 웹 사이트들에 대한 방문 및 이용형태, 인기 검색어, 보안접속 여부, 등을 파악하여 이용자에게 최적화된 정보 제공을 위해 사용됩니다.
나. 쿠키의 설치•운영 및 거부 : 웹브라우저 상단의 도구>인터넷 옵션>개인정보 메뉴의 옵션 설정을 통해 쿠키 저장을 거부 할 수 있습니다.
다. 쿠키 저장을 거부할 경우 맞춤형 서비스 이용에 어려움이 발생할 수 있습니다.

제 11 조 (행태정보의 수집·이용·제공 및 거부 등에 관한 사항)
행태정보의 수집·이용·제공 및 거부등에 관한 사항
<개인정보처리자명>은(는) 온라인 맞춤형 광고 등을 위한 행태정보를 수집·이용·제공하지 않습니다.

제 12 조 (추가적인 이용·제공 판단기준)
가보자고 은(는) ｢개인정보 보호법｣ 제15조제3항 및 제17조제4항에 따라 ｢개인정보 보호법 시행령｣ 제14조의2에 따른 사항을 고려하여 정보주체의 동의 없이 개인정보를 추가적으로 이용·제공할 수 있습니다.
이에 따라 가보자고 가(이) 정보주체의 동의 없이 추가적인 이용·제공을 하기 위해서 다음과 같은 사항을 고려하였습니다.
▶ 개인정보를 추가적으로 이용·제공하려는 목적이 당초 수집 목적과 관련성이 있는지 여부
▶ 개인정보를 수집한 정황 또는 처리 관행에 비추어 볼 때 추가적인 이용·제공에 대한 예측 가능성이 있는지 여부
▶ 개인정보의 추가적인 이용·제공이 정보주체의 이익을 부당하게 침해하는지 여부
▶ 가명처리 또는 암호화 등 안전성 확보에 필요한 조치를 하였는지 여부
※ 추가적인 이용·제공 시 고려사항에 대한 판단기준은 사업자/단체 스스로 자율적으로 판단하여 작성·공개함

제 13 조 (가명정보를 처리하는 경우 가명정보 처리에 관한 사항)
가보자고 은(는) 다음과 같은 목적으로 가명정보를 처리하고 있습니다.

▶ 가명정보의 처리 목적
- 직접작성 가능합니다.

▶ 가명정보의 처리 및 보유기간
- 직접작성 가능합니다.

▶ 가명정보의 제3자 제공에 관한 사항(해당되는 경우에만 작성)
- 직접작성 가능합니다.

▶ 가명정보 처리의 위탁에 관한 사항(해당되는 경우에만 작성)
- 직접작성 가능합니다.

▶ 가명처리하는 개인정보의 항목
- 직접작성 가능합니다.

▶ 법 제28조의4(가명정보에 대한 안전조치 의무 등)에 따른 가명정보의 안전성 확보조치에 관한 사항
- 직접작성 가능합니다.

제 14 조 (개인정보 보호책임자에 관한 사항)
① 가보자고 은(는) 개인정보 처리에 관한 업무를 총괄해서 책임지고, 개인정보 처리와 관련한 정보주체의 불만처리 및 피해구제 등을 위하여 아래와 같이 개인정보 보호책임자를 지정하고 있습니다.

▶ 개인정보 보호책임자
성명 :가보자고
직책 :
직급 :
연락처 :02-1234-5678, gabozago@gabozago.co.kr,
※ 개인정보 보호 담당부서로 연결됩니다.

▶ 개인정보 보호 담당부서
부서명 :
담당자 :
연락처 :, ,
② 정보주체께서는 가보자고 의 서비스(또는 사업)을 이용하시면서 발생한 모든 개인정보 보호 관련 문의, 불만처리, 피해구제 등에 관한 사항을 개인정보 보호책임자 및 담당부서로 문의하실 수 있습니다. 가보자고 은(는) 정보주체의 문의에 대해 지체 없이 답변 및 처리해드릴 것입니다.

제 15 조 (개인정보의 열람청구를 접수·처리하는 부서)
정보주체는 ｢개인정보 보호법｣ 제35조에 따른 개인정보의 열람 청구를 아래의 부서에 할 수 있습니다.
가보자고은(는) 정보주체의 개인정보 열람청구가 신속하게 처리되도록 노력하겠습니다.

▶ 개인정보 열람청구 접수·처리 부서
부서명 :
담당자 :
연락처 : , ,

제 16 조 (정보주체의 권익침해에 대한 구제방법)
정보주체는 개인정보침해로 인한 구제를 받기 위하여 개인정보분쟁조정위원회, 한국인터넷진흥원 개인정보침해신고센터 등에 분쟁해결이나 상담 등을 신청할 수 있습니다. 이 밖에 기타 개인정보침해의 신고, 상담에 대하여는 아래의 기관에 문의하시기 바랍니다.

1. 개인정보분쟁조정위원회 : (국번없이) 1833-6972 (www.kopico.go.kr)
2. 개인정보침해신고센터 : (국번없이) 118 (privacy.kisa.or.kr)
3. 대검찰청 : (국번없이) 1301 (www.spo.go.kr)
4. 경찰청 : (국번없이) 182 (ecrm.cyber.go.kr)

「개인정보보호법」제35조(개인정보의 열람), 제36조(개인정보의 정정·삭제), 제37조(개인정보의 처리정지 등)의 규정에 의한 요구에 대 하여 공공기관의 장이 행한 처분 또는 부작위로 인하여 권리 또는 이익의 침해를 받은 자는 행정심판법이 정하는 바에 따라 행정심판을 청구할 수 있습니다.

※ 행정심판에 대해 자세한 사항은 중앙행정심판위원회(www.simpan.go.kr) 홈페이지를 참고하시기 바랍니다.

제 17 조 (개인정보 처리방침 변경)
① 이 개인정보처리방침은 2022년 7월 1부터 적용됩니다.

② 이전의 개인정보 처리방침은 아래에서 확인하실 수 있습니다.
                    </textarea><br>
                    <input type="radio" name="personalTextAgree" value="agree" required>동의합니다.
                    <input type="radio" name="personalTextAgree" value="disgree" >동의하지 않습니다.<br>
                </div>
                
                <div class="sections">
                    <h4>이용약관 동의<span class="redStar">*</span></h4> <span id="usageTextAgreeRulesError" class="validationRulesError">필수 동의 항목입니다.</span>
                    <textarea name="usageText" id="usageText" rows="8" readonly disabled>
제 1 장 총칙

제 1 조 (목적)
본 약관은 가보자고(http://gabozago.co.kr)의 제반 서비스의 이용조건 및 절차에 관한 사항 및 기타 필요한 사항을 규정함을 목적으로 한다.

제 2 조 (용어의 정의)
본 약관에서 사용하는 용어는 다음과 같이 정의한다.
① 회원 : 기본 회원 정보를 입력하였고, 회사와 서비스 이용계약을 체결하여 아이디를 부여받은 개인
② 아이디(ID) : 회원식별과 회원의 서비스 이용을 위해 회원이 선정하고 회사가 승인하는 문자와 숫자의 조합
③ 비밀번호(Password) : 회원이 통신상의 자신의 비밀을 보호하기 위해 선정한 문자와 숫자의 조합
④ 해지 : 회사 또는 회원에 의한 이용계약의 종료

제 3 조 (약관의 공시 및 효력과 변경)
① 본 약관은 회원가입 화면에 게시하여 공시하며 회사는 사정변경 및 영업상 중요한 사유가 있을 경우 약관을 변경할 수 있으며 변경된 약관은 공지사항을 통해 공시한다
② 본 약관 및 차후 회사사정에 따라 변경된 약관은 이용자에게 공시함으로써 효력을 발생한다.

제 4 조 (약관 외 준칙)
본 약관에 명시되지 않은 사항이 전기통신기본법, 전기통신사업법, 정보통신촉진법, ‘전자상거래등에서의 소비자 보호에 관한 법률’, ‘약관의 규제에관한법률’, ‘전자거래기본법’, ‘전자서명법’, ‘정보통신망 이용촉진등에 관한 법률’, ‘소비자보호법’ 등 기타 관계 법령에 규정되어 있을 경우에는 그 규정을 따르도록 한다.


제 2 장 이용계약

제 5 조 (이용신청)
① 이용신청자가 회원가입 안내에서 본 약관과 개인정보보호정책에 동의하고 등록절차(회사의 소정 양식의 가입 신청서 작성)를 거쳐 '확인' 버튼을 누르면 이용신청을 할 수 있다.
② 이용신청자는 반드시 실명과 실제 정보를 사용해야 하며 1개의 생년월일에 대하여 1건의 이용신청을 할 수 있다.
③ 실명이나 실제 정보를 입력하지 않은 이용자는 법적인 보호를 받을 수 없으며, 서비스 이용에 제한을 받을 수 있다.

제 6 조 (이용신청의 승낙)
① 회사는 제5조에 따른 이용신청자에 대하여 제2항 및 제3항의 경우를 예외로 하여 서비스 이용을 승낙한다.
② 회사는 아래 사항에 해당하는 경우에 그 제한사유가 해소될 때까지 승낙을 유보할 수 있다.
    가. 서비스 관련 설비에 여유가 없는 경우
    나. 기술상 지장이 있는 경우
    다. 기타 회사 사정상 필요하다고 인정되는 경우
③ 회사는 아래 사항에 해당하는 경우에 승낙을 하지 않을 수 있다.
    가. 다른 사람의 명의를 사용하여 신청한 경우
    나. 이용자 정보를 허위로 기재하여 신청한 경우
    다. 사회의 안녕질서 또는 미풍양속을 저해할 목적으로 신청한 경우
    라. 기타 회사가 정한 이용신청 요건이 미비한 경우


제 3 장 계약 당사자의 의무

제 7 조 (회사의 의무)
① 회사는 사이트를 안정적이고 지속적으로 운영할 의무가 있다.
② 회사는 이용자로부터 제기되는 의견이나 불만이 정당하다고 인정될 경우에는 즉시 처리해야 한다. 단, 즉시 처리가 곤란한 경우에는 이용자에게 그 사유와 처리일정을 공지사항 또는 전자우편을 통해 통보해야 한다.
③ 제1항의 경우 수사상의 목적으로 관계기관 및 정보통신윤리위원회의 요청이 있거나 영장 제시가 있는 경우, 기타 관계 법령에 의한 경우는 예외로 한다.

제 8 조 (이용자의 의무)
① 이용자는 본 약관 및 회사의 공지사항, 사이트 이용안내 등을 숙지하고 준수해야 하며 기타 회사의 업무에 방해되는 행위를 해서는 안된다.
② 이용자는 회사의 사전 승인 없이 본 사이트를 이용해 어떠한 영리행위도 할 수 없다.
③ 이용자는 본 사이트를 통해 얻는 정보를 회사의 사전 승낙 없이 복사, 복제, 변경, 번역, 출판, 방송 및 기타의 방법으로 사용하거나 이를 타인에게 제공할 수 없다.

제 4 장 서비스의 제공 및 이용

제 9 조 (서비스 이용)
① 이용자는 본 약관의 규정된 사항을 준수해 사이트를 이용한다.
② 본 약관에 명시되지 않은 서비스 이용에 관한 사항은 회사가 정해 '공지사항'에 게시하거나 또는 별도로 공지하는 내용에 따른다.

제 10 조 (정보의 제공)
회사는 회원이 서비스 이용 중 필요하다고 인정되는 다양한 정보에 대하여 전자메일이나 서신우편 등의 방법으로 회원에게 정보를 제공할 수 있다.

제 11 조 (광고게재)
① 회사는 서비스의 운용과 관련하여 서비스 화면, 홈페이지, 전자우편 등에 광고 등을 게재할 수 있다.
② 회사는 사이트에 게재되어 있는 광고주의 판촉활동에 회원이 참여하거나 교신 또는 거래의 결과로서 발생하는 모든 손실 또는 손해에 대해 책임을 지지 않는다.

제 12 조 (서비스 이용의 제한)
본 사이트 이용 및 행위가 다음 각 항에 해당하는 경우 회사는 해당 이용자의 이용을 제한할 수 있다.
① 공공질서 및 미풍양속, 기타 사회질서를 해하는 경우
② 범죄행위를 목적으로 하거나 기타 범죄행위와 관련된다고 객관적으로 인정되는 경우
③ 타인의 명예를 손상시키거나 타인의 서비스 이용을 현저히 저해하는 경우
④ 타인의 의사에 반하는 내용이나 광고성 정보 등을 지속적으로 전송하는 경우
⑤ 해킹 및 컴퓨터 바이러스 유포 등으로 서비스의 건전한 운영을 저해하는 경우
⑥ 다른 이용자 또는 제3자의 지적재산권을 침해하거나 지적재산권자가 지적 재산권의 침해를 주장할 수 있다고 판단되는 경우
⑦ 타인의 아이디 및 비밀번호를 도용한 경우
⑧ 기타 관계 법령에 위배되는 경우 및 회사가 이용자로서 부적당하다고 판단한 경우

제 13 조 (서비스 제공의 중지)
회사는 다음 각 호에 해당하는 경우 서비스의 전부 또는 일부의 제공을 중지할 수 있다.
① 전기통신사업법 상에 규정된 기간통신 사업자 또는 인터넷 망 사업자가 서비스를 중지했을 경우
② 정전으로 서비스 제공이 불가능할 경우
③ 설비의 이전, 보수 또는 공사로 인해 부득이한 경우
④ 서비스 설비의 장애 또는 서비스 이용의 폭주 등으로 정상적인 서비스 제공이 어려운 경우
⑤ 전시, 사변, 천재지변 또는 이에 준하는 국가비상사태가 발생하거나 발생할 우려가 있는 경우

제 14 조 (게시물 관리)
회사는 건전한 통신문화 정착과 효율적인 사이트 운영을 위하여 이용자가 게시하거나 제공하는 자료가 제12조에 해당한다고 판단되는 경우에 임의로 삭제, 자료이동, 등록거부를 할 수 있다.

제 15 조 (서비스 이용 책임)
이용자는 회사에서 권한 있는 사원이 서명한 명시적인 서면에 구체적으로 허용한 경우를 제외하고는 서비스를 이용하여 불법상품을 판매하는 영업활동을 할 수 없으며 특히 해킹, 돈벌기 광고, 음란 사이트를 통한 상업행위, 상용 S/W 불법제공 등을 할 수 없다. 이를 어기고 발생한 영업활동의 결과 및 손실, 관계기관에 의한 구속 등 법적 조치 등에 관해서는 회사가 책임을 지지 않는다.


제 5 장 (재화의 주문 및 결제 관련) 

제16조 (결제방법)
‘회원’은 ‘회사’에서 판매하는 재화에 대하여 ‘선불카드, 직불카드, 신용카드 등의 각종 카드 결제 수단’을 이용하여 결제할 수 있다. 이때 ‘회사’는 이용자의 지급방법에 대하여 재화외 어떠한 명목의 수수료를 추가 징수하지 않는다.

① ‘회사’는 이용자의 구매신청이 있는 경우 이용자에게 수신확인통지를 한다. 주문확인에 대한 내용은 해당게시판에서 확인 할 수 있다.
② 수신확인통지를 받은 이용자는 의사표시의 불일치 등이 있는 경우에는 수신확인통지를 받은 후 즉시 구매신청 변경 및 취소를 요청할 수 있고 ‘회사’는 배송전에 이용자의 요청이 있는 경우에는 지체 없이 그 요청에 따라 처리한다. 다만 이미 대금을 지불한 경우에는 제18조의 ‘반품규정’을 따른다.

제17조 (배송정책)
① ‘회사’는 이용자와 재화의 공급시기에 관하여 별도의 약정이 없는 이상, 이용자가 결재를 실시한 날부터 7일 이내에 재화 등을 배송할 수 있도록 주문제작, 포장 등 기타의 필요한 조치를 취한다. 
② ‘회사’는 이용자가 구매한 재화에 대해 배송수단, 수단별 배송비용 부담자, 수단별 배송기간 등을 제품을 구매하는 웹 페이지 하단에 명시한다. 만약 ‘회사’가 약정 배송기간을 초과한 경우에는 그로 인한 이용자의 손해를 배상한다. 하지만 ‘회사’의 고의과실이 없음을 입증한 경우에는 그러하지 아니한다.

18조 (취소 및 반품 환불 규정)
‘회사’는 이용자가 구매 신청한 재화 등이 품절 등의 사유로 인도 또는 제공을 할 수 없을 때에는 지체 없이 그 사유를 이용자에게 통지하고 사전에 재화 등의 대금을 받은 경우에는 대금을 받은 날부터 3영업일 이내에 환급하거나 환급에 필요한 조치를 한다.
① 재화가 발송 되기전 이용자가 결제를 취소할 경우 ‘회사’는 해당 주문건을 취소 처리하고 카드결제 승인을 취소한다.
② 재화가 발송 된 이후 결제 취소는 불가하다. 단, ‘회사’의 부주의 ‘배송’상의 문제로 인한 재화의 파손, 변질의 경우 ‘회사’는 이용자에게 구매 금액의 반품 및 환불 조취 및 교환 조취를 취한다.


제 6 장 기타

제 19 조 (면책 및 손해배상)
① 천재지변 또는 이에 준하는 불가항력으로 인하여 서비스를 제공할 수 없는 경우에는 회사의 서비스 제공 책임이 면제된다.
② 회사는 이용자간 또는 이용자와 제3자간의 상호거래 관계에서 발생되는 결과에 대하여 어떠한 책임도 부담하지 않는다.
③ 회사는 이용자가 게시판에 게재한 정보, 자료, 내용 등에 관하여 사실의 정확성, 신뢰도 등에 어떠한 책임도 부담하지 않으며 이용자는 본인의 책임 아래 본 사이트를 이용해야 한다.
④ 이용자가 게시 또는 전송한 자료 등에 관하여 손해가 발생하거나 자료의 취사선택, 기타 무료로 제공되는 서비스 이용과 관련해 어떠한 불이익이 발생하더라도 이에 대한 모든 책임은 이용자에게 있다.
⑤ 아이디와 비밀번호의 관리 및 이용자의 부주의로 인하여 발생되는 손해 또는 제3자에 의한 부정사용 등에 대한 책임은 이용자에게 있다.
⑥ 이용자가 본 약관의 규정을 위반함으로써 회사에 손해가 발생하는 경우 이 약관을 위반한 이용자는 회사에 발생한 모든 손해를 배상해야 하며 동 손해로부터 회사를 면책시켜야 한다.

제 20 조 (개인신용정보 제공 및 활용에 대한 동의서)
회사가 회원 가입과 관련해 취득한 개인 신용 정보는 신용정보의 이용 및 보호에 관한 법률 제23조의 규정에 따라 타인에게 제공 및 활용 시 이용자의 동의를 얻어야 한다. 이용자의 동의는 회사가 회원으로 가입한 이용자의  신용정보를 신용정보기관, 신용정보업자 및 기타 이용자 등에게 제공해 이용자의 신용을 판단하기 위한 자료로서 활용하거나 공공기관에서 정책자료로 활용하는데 동의하는 것으로 간주한다.

제 21 조 (분쟁의 해결)
① 회사와 이용자는 본 사이트 이용과 관련해 발생한 분쟁을 원만하게 해결하기 위하여 필요한 모든 노력을 해야 한다.
② 제1항의 규정에도 불구하고 동 분쟁으로 인하여 소송이 제기될 경우 동 소송은 회사의 본사 소재지를 관할하는 법원의 관할로 본다.

<부칙>
본 약관은 2022년 7월 1일부터 적용한다.                     
                    </textarea>
                    <input type="radio" name="usageTextAgree" value="agree" required>동의합니다.
                    <input type="radio" name="usageTextAgree" value="disgree" >동의하지 않습니다.<br>
                </div>
                
                <div class="sections">
                    <h4>프로필 이미지</h4>
                    <p class="ruleTexts">크기 1MB 이하의 jpg, png 이미지 업로드 가능</p>
                    <img src="/resources/member/img/userprofile.jpg" alt="profileImgSample" id="profileImgSample">
                    <div id="imageUpload">
                        <input type="text" name="profileImg" class="uploadName" id="imageUploadPlaceHolder"
                        placeholder="이미지를 업로드하세요." disabled>
                        <label for="uploadFile">파일 선택</label>
                    </div>
                    <input type="file" name="profileImg" id="uploadFile" accept=".jpg, .png">
                </div>
                
                <input type="button" value="취소" onClick="location.href='/login'">
                <input type="submit" value="회원가입" id="joinBtn" >
            </form>

        </div>
        <jsp:include page="/WEB-INF/views/common/footer.jsp" flush="true"/>
    </div>


    <!-- 이메일 주소 인증 모달 -->
    <div class="modal" id="emailModal">
        <div class="modal_Content">
            <h3><i class="fas fa-check"></i>이메일 주소 인증</h3>
            <p><span id="printEmail"></span>으로 이메일 인증 링크를 발송하였습니다.<br>
            3분 이내에 인증 번호 6글자를 입력하세요.</p>
            <h2 id="timerForEmail" class="center timer"></h2>
            <div id="emailVerification">
                <input type="text" id="emailVerificationNumInput" placeholder="인증 번호를 입력하세요." maxlength="6">
                <button type="button" class="verificationNumBtn" id="emailVerificationNumBtn" onclick="emailVerify()">확인</button>
            </div>
            <div class="center resend"><button type="button" class="resendBtn" id="resendEmail" onclick="resendEmail()">재전송</button></div>
            <div class="okBtn" id="closeBtn">취소</div>
        </div>
    </div>

    <!-- 휴대폰 번호 인증 모달 -->
    <div class="modal" id="phoneModal">
        <div class="modal_Content">
            <h3><i class="fas fa-check"></i>휴대폰 번호 인증</h3>
            <p><span id="printPhone"></span>으로 SMS 인증 번호를 발송하였습니다.<br>
            3분 이내에 인증 번호 6글자를 입력하세요.</p>
            <h2 id="timerForPhone" class="center timer"></h2>
            <div id="phoneVerification">
                <input type="text" id="phoneVerificationNumInput" placeholder="인증 번호를 입력하세요." maxlength="6">
                <button type="button" class="verificationNumBtn" id="phoneVerificationNumBtn" onclick="phoneVerify()" >확인</button>
            </div>
            <div class="center resend"><button type="button" class="resendBtn" id="resendSms" onclick="resendSms()">재전송</button></div>
            <div class="okBtn" id="closeBtn">취소</div>
        </div>
    </div>

    <!-- 인증 성공 모달 -->
    <div class="modal" id="VerifyingSucceedModal">
        <div class="modal_Content">
            <p class="center simpleTextSpaceAdd">인증이 완료되었습니다.</p>
            <div class="okBtn">확인</div>
        </div>
    </div>

    <!-- 인증 실패 모달 -->
    <div class="modal" id="VerifyingFailedModal">
        <div class="modal_Content">
            <p class="center simpleTextSpaceAdd">인증이 실패하였습니다.</p>
            <div class="okBtn">확인</div>
        </div>
    </div>

    <!-- 중복 확인 성공 모달 -->
    <div class="modal" id="doubleCheckSucceedModal">
        <div class="modal_Content">
            <p class="center simpleTextSpaceAdd">중복 확인이 완료되었습니다.</p>
            <div class="okBtn">확인</div>
        </div>
    </div>

    <!-- 중복 확인 실패 모달 -->
    <div class="modal" id="doubleCheckFailedModal">
        <div class="modal_Content">
            <p id="failedText" class="center simpleTextSpaceAdd">중복 확인이 실패하였습니다.</p>
            <div class="okBtn">확인</div>
        </div>
    </div>

    <!-- 회원가입 완료 모달 -->
    <div class="modal" id="joinSucceedModal">
        <div class="modal_Content">
            <div class="joinModalTexts">
                <h3 class="center">회원 가입이 완료되었습니다.</h3>
                <p class="center">신규 가입 기념 포인트 3,000P가 지급되었습니다.</p>
            </div>
            <div id="joinSucceed">확인</div>
        </div>
    </div>

    <!-- 회원가입 실패 모달 -->
    <div class="modal" id="joinFailedModal">
        <div class="modal_Content">
            <div class="joinModalTexts">
                <h3 class="center">회원 가입이 실패하였습니다.</h3>
                <p class="center">가입 양식을 올바르게 작성해주세요.
            </div>
            <div class="okBtn">확인</div>
        </div>
    </div>

</body>

</html>