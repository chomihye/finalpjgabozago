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

    <!-- 제이쿼리 -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.4.0/jquery-migrate.min.js"></script>

    <!-- CSS -->
    <link rel="stylesheet" href="/resources/mypage/css/6-3.mypage_myInfo_modify.css">
    <link rel="stylesheet" href="/resources/mypage/css/modal.css">

    <!-- script -->
    <script src="/resources/mypage/js/6-3.mypage_myInfo_modify.js"></script>
</head>

<body>
    <jsp:include page="/WEB-INF/views/common/header.jsp" flush="false" />

    <div class="wrap">
        <jsp:include page="/WEB-INF/views/mypage/ProfileAndMenu.jsp" flush="false" />
        
        <section class="memberInfoUpdate">
            
            <div id="body">        
                <div class="midHr">회원정보수정</div>
    
                <form action="modify.do" method="POST" id="form">
                    <div class="sections">
                        <h4>이름</h4>
                        <input type="text" name="name" id="name" placeholder="${__MEMBER__.name}" onchange="checkName()"><br>
                        <div id="nameExplain"></div>
                        <div id="nameError"></div>
                    </div >
                    
                    <div class="sections">
                        <h4>아이디(이메일)</h4>
                        <div class="no_update"><span>${__MEMBER__.email}</span> (변경불가)</div>
                    </div class="sections">
                    
                    <div class="sections">
                        <h4>비밀번호</h4>
                        <p class="ruleTexts">영문 대소문자, 숫자, 특수문자 포함 8자 이상 12자 이하</p>
                        <input type="password" name="pw" id="pw" placeholder="●●●●●●●●" min="8" maxlength="12" onchange="checkPwd()">
                        <div id="pwError"></div>
                    </div class="sections">
                    
                    <div class="sections">
                        <h4>비밀번호 확인</h4>
                        <input type="password" name="pwcheck" id="pwcheck" placeholder="●●●●●●●●" maxlength="12" onchange="reCheckPwd()">
                        <div id="pwcheckError"></div>
                    </div class="sections">
                    
                    <div class="sections">
                        <h4>닉네임</h4>
                        <p class="ruleTexts">한문, 특수문자, 공백 제외 8자 이내</p>
                        <input type="text" name="nickname" id="nickname" placeholder="${__MEMBER__.nickname}" maxlength="8" onchange="changeNickFnc()">
                        <button class="formCheckBox" id="doubleCheckBtn" onclick="checkDoucle()">중복 확인</button>
                    </div>
                    
                    <div class="sections">
                        <h4>휴대폰 번호</h4>
                        <input type="text" name="phone" id="phone" pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}" placeholder="${__MEMBER__.phone}" onchange="changePhoneNumFnc()">
                        <button class="formCheckBox" id="phoneValidationBtn" onclick="certifyPhone()">인증</button>
                    </div>
                    
                    <div class="sections">
                        <h4>생년월일</h4>
                        <div class="no_update"><span>${__MEMBER__.birthday}</span> (변경불가)</div>
                    </div class="sections">
                    
                    <div class="sections">
                        <h4>프로필 이미지</h4>
                        <p class="ruleTexts">크기 1MB 이하의 jpg, png 이미지 업로드 가능</p>
                        <img src="/resources/mypage/img/userprofile.jpg" alt="profileImgSample" id="profileImgSample">
                        <div id="imageUpload">
                            <input type="text" name="profileImg" class="uploadName" id="imageUploadPlaceHolder"
                            placeholder="이미지를 업로드 하세요" disabled>
                            <label for="uploadFile">파일 선택</label>
                        </div>
                        <input type="file" name="profileImg" id="uploadFile" accept=".jpg, .png">
                    </div>
                    
                    <div class="btnBox">
                        <input type="button" value="취소" onclick="location.href='/mypage/main'">
                        <input type="submit" value="확인" id="updateBtn">
                    </div>
                </form>
    
            </div>
    
        </section>
   
    </div>

    <jsp:include page="/WEB-INF/views/common/footer.jsp" flush="false" />

    <!-- 이름 실패 모달 -->
    <div class="modal" id="nameCheckFailedModal">
        <div class="modal_Content">
            <p class="center simpleTextSpaceAdd">이름이 양식과 일치하지 않습니다.</p>
            <div class="okBtn onlyOk continue">확인</div>
        </div>
    </div>

    <!-- 비밀번호 양식 오류 모달 -->
    <div class="modal" id="pwdFormCheckModal">
        <div class="modal_Content">
            <p class="center simpleTextSpaceAdd">비밀번호는 영문 대소문자, 숫자, 특수문자 포함<br>8자 이상 12자 이하로 입력해주세요.</p>
            <div class="okBtn onlyOk continue">확인</div>
        </div>
    </div>

    <!-- 비밀번호 확인 불일치 -->
    <div class="modal" id="pwdMismatchModal">
        <div class="modal_Content">
            <p class="center simpleTextSpaceAdd">비밀번호 확인이 일치하지 않습니다.</p>
            <div class="okBtn onlyOk continue">확인</div>
        </div>
    </div>

    <!-- 닉네임 양식 오류 모달 -->
    <div class="modal" id="nicknameErrorModal">
        <div class="modal_Content">
            <p class="center simpleTextSpaceAdd">닉네임은 한문, 특수문자, 공백 제외 8자 이내로 입력 바랍니다.</p>
            <div class="okBtn onlyOk continue">확인</div>
        </div>
    </div>

    <!-- 닉네임 중복 확인 요청 -->
    <div class="modal" id="requestDoubleCheckModal">
        <div class="modal_Content">
            <p class="center simpleTextSpaceAdd">닉네임 중복 확인이 필요합니다.</p>
            <div class="okBtn onlyOk continue">확인</div>
        </div>
    </div>

    <!-- 닉네임 중복 확인 성공 모달 -->
    <div class="modal" id="doubleCheckSucceedModal">
        <div class="modal_Content">
            <p class="center simpleTextSpaceAdd">사용 가능한 닉네임입니다.</p>
            <div class="okBtn onlyOk continue">확인</div>
        </div>
    </div>

    <!-- 닉네임 중복 확인 실패 모달 -->
    <div class="modal" id="doubleCheckFailedModal">
        <div class="modal_Content">
            <p class="center simpleTextSpaceAdd">중복된 닉네임입니다.</p>
            <div class="okBtn onlyOk continue">확인</div>
        </div>
    </div>

    <!-- 휴대폰 번호 인증 모달 -->
    <div class="modal" id="phoneModal">
        <div class="modal_Content">
            <h3><i class="fas fa-check"></i>휴대폰 번호 인증</h3>
            <p><span id="phoneNum"></span>으로 SMS 인증 번호를 발송하였습니다.<br>
            3분 이내에 인증 번호 6글자를 입력하세요.</p>
            <h2 id="certifyTime"></h2>
            <div id="phoneValidation">
                <input type="text" name="phoneValidationNum" id="phoneValidationNumInput" placeholder="인증 번호를 입력하세요." maxlength="6">
                <button id="phoneValidationNumBtn">확인</button>
            </div>
            <div id="resendLink"><a href="javascript:void(0);" onclick="repeat()">재전송</a></div>
            <div class="okBtn onlyOk continue" id="closeBtn">취소</div>
        </div>
    </div>

    <!-- 휴대폰 번호 인증 성공 모달 -->
    <div class="modal" id="phoneValidationSucceedModal">
        <div class="modal_Content">
            <p class="center simpleTextSpaceAdd">휴대폰 인증이 완료되었습니다.</p>
            <div class="okBtn onlyOk continue">확인</div>
        </div>
    </div>

    <!-- 휴대폰 번호 인증 실패 모달 -->
    <div class="modal" id="phoneValidationFailedModal">
        <div class="modal_Content">
            <p class="center simpleTextSpaceAdd">휴대폰 인증이 실패하였습니다.</p>
            <div class="okBtn onlyOk continue">확인</div>
        </div>
    </div>    

    <!-- 휴대폰 번호 인증 요청 모달 -->
    <div class="modal" id="phoneValidationModal">
        <div class="modal_Content">
            <p class="center simpleTextSpaceAdd">휴대폰 번호 인증이 필요합니다.</p>
            <div class="okBtn onlyOk continue">확인</div>
        </div>
    </div> 

    <!-- 회원수정 완료 모달 -->
    <!-- <div class="modal" id="updateSucceedModal">
        <div class="modal_Content">
            <p class="center simpleTextSpaceAdd">회원 정보 수정이 완료되었습니다.</p>
            <div class="okBtn onlyOk completed">확인</div>
        </div>
    </div> -->

</body>

</html>