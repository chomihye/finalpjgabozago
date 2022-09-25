/**
 * @desc 데이터 유효성 검사 관련 변수
 */
 let nameSuccess = true;
 let pwdSuccess = true;
 let pwdCheckSuccess = true;
 let validNick = true;              // 유효한 닉네임인지
 let doubleCheckSuccess = true;     // 중복확인 했는지
 let phoneVerifySuccess = true;    // 폰인증 여부


/**
 * @desc 초기 수행
 */
$(function(){
	console.log("6-3.mypage_myInfo_modify.js invoked.");

    modifyName();       // 이름(성함) 수정 관련

    $("#pwError").css({display: "none"});       // 비밀번호 수정 관련
    $("#pwcheckError").css({display: "none"}); 

    modifyProfileImg();     // 프로필 이미지 변경 관련

    // 최초 submit 버튼 비활성화
    $("#form").submit(function(e){
        e.preventDefault();
    });

    modal();        // 모달창
});


/**
 * @desc 이름(성함) 수정 관련
 */
function modifyName(){

    // 이름 수정 안내문구
    $("#nameExplain").css({display: "none"});
	$("#name").focus(function(){
        $("#nameExplain").css({display: "block"});
    })
    $("#name").blur(function(){
        $("#nameExplain").css({display: "none"});
    })

    // 오류 안내문구
    $("#nameError").css({display: "none"});
}

function checkName(){
    $("#nameExplain").text("실명이 아닌 경우 서비스 이용에 제한이 있을 수 있으니 참고 바랍니다.");
    $("#nameError").text("최대 10자 이내, 공백과 특수문자가 없어야 합니다.");

    let changeName = null;
    changeName = $("#name").val();

    // 유효성 검사(이름에 한글과 영문만 있는지 확인, 글자수 확인)
    // let nameRegex = /^[ㄱ-ㅎ|가-힣|a-z|A-Z]+$/;
    let nameRegex = /^[가-힣|a-z|A-Z]+$/;

    if(!changeName){        // 바뀐 값이 없으면,
        nameSuccess = true;
    }else{
        if(!(nameRegex.test(changeName)) || changeName.length > 10 || changeName.length < 2){
            nameSuccess = false;
        }else{
            nameSuccess = true;
        } // inner-if
    } // outer-if
    

    if(!nameSuccess){
        $("#nameError").css({display: "block"});
    }else{
        $("#nameError").css({display: "none"});
    }
} // checkName


/**
 * @desc 비밀번호 수정 관련
 */
 function checkPwd(){
    $("#pwError").text("비밀번호 양식 불일치");
    $("#pwError").css({display: "block"});

    let changePwd = null;
    changePwd = $("#pw").val();

    // 유효성 검사

    // 1. 공백검사
    let blankCheck = changePwd.match(/[ ]/g);    
    // 2. 영문 대소문자 포함 여부
    let hasStirng = changePwd.match(/[a-z]/gi);
    // 3. 숫자 포함 여부
    let hasNumber = changePwd.match(/[0-9]/gi);
    // 4. 특수문자 포함 여부
    let hasSpecialChar = changePwd.match(/[~!@\#$%^&*\()\-=+_'\"]/gi);

    if(!changePwd){        // 바뀐 값이 없으면,
        pwdSuccess = true;
    }else{
        if(blankCheck != null || !hasStirng || !hasNumber || !hasSpecialChar || changePwd.length < 8){       // 양식에 일치하지 않으면,
            pwdSuccess = false;
        }else{
            pwdSuccess = true;
        } // inner-if
    } // outer-if

    if(!pwdSuccess){
        $("#pwError").css({display: "block"});
    }else{
        $("#pwError").css({display: "none"});
    }

    reCheckPwd();
    $("#pwcheckError").css({display: "none"});
} // checkPwd

function reCheckPwd(){
    $("#pwcheckError").text("비밀번호가 일치하지 않습니다.");
    $("#pwcheckError").css({display: "block"});

    let changePwd = null;
    changePwd = $("#pw").val();

    let pwcheck = null;
    pwcheck = $("#pwcheck").val();

    // 동일한지 검사
    if(changePwd == pwcheck){        
        pwdCheckSuccess = true;
    }else{
        pwdCheckSuccess = false;
    } // if-else

    if(!pwdCheckSuccess){
        $("#pwcheckError").css({display: "block"});
    }else{
        $("#pwcheckError").css({display: "none"});
    }
} // reCheckPwd


/**
 * @desc 닉네임 수정 관련
 */
function changeNickFnc(){
    let changeNickname = null;
    changeNickname = $("#nickname").val();

    if(!changeNickname){        // 바뀐 값이 없으면,
        doubleCheckSuccess = true;
    }else{                      // 바뀐 값이 있으면,
        doubleCheckSuccess = false;     // 중복확인 필요
    } // if-else
} // 닉네임 변경값이 있는지 체크

function checkDoucle(){
    let changeNickname = null;
    changeNickname = $("#nickname").val();

    // 유효성 검사
    let nicknameRegex = /^[가-힣|a-z|A-Z|0-9]+$/;

    if(!(nicknameRegex.test(changeNickname))){      // 변경할 닉네임이 유효하지 않은 경우
        validNick = false;
        $("#nicknameErrorModal").css({display: "block"});
    }else{                                          // 변경할 닉네임이 유효한 경우
        validNick = true;

        // 중복 검사 ajax
        $.ajax({
            type: "POST",
            url: "modify/nickCheck",
            data:{
                "nickname" : changeNickname
            },
            cache : false,
            error : function(error) {
                console.log("error");
            },
            success : function(resp) {
                console.log("success");

                const isDouble = JSON.parse(resp);
                
                if(isDouble){
                    $("#doubleCheckFailedModal").css({display: "block"});
                    doubleCheckSuccess = false;
                }else{
                    $("#doubleCheckSucceedModal").css({display: "block"});
                    doubleCheckSuccess = true;
                } // if-else
            } // success
        }); // ajax
    } // if
} // 중복확인 버튼 클릭시 닉네임 유효성 및 중복검사


/**
 * @desc 휴대폰 번호 수정 관련
 */
function changePhoneNumFnc(){
    let newNumber = null;
    newNumber = $("#phone").val();

    if(!newNumber){             // 들어온 값이 없으면,
        phoneVerifySuccess = true;
    }else{                      // 들어온 값이 있으면,
        phoneVerifySuccess = false;   
    } // if-else
} // 휴대폰 번호 입력값 있는지 체크

let randomNumber;
function clickVerifyBtn(){
    $("#phoneValidationNumInput").val('');      // 기존 인증번호 값 초기화

    let changePhoneNum = null;
    changePhoneNum = $("#phone").val();

    if(changePhoneNum.length != 13){
        return;
    }else{      // 13자리 휴대폰 번호 입력이 들어온 경우에만,
        $.ajax({
            type: "POST",
            url: "modify/phoneCheck",
            data:{
                "newNumber" : changePhoneNum
            },
            cache : false,
            error : function(error) {
                console.log("error");
            },
            success : function(resp) {
                console.log("success");

                const map = JSON.parse(resp);
                const isDouble = map.isDouble;
                randomNumber = map.randomNumber;
                
                // console.log("isDouble : ", isDouble);
                // console.log("randomNumber", randomNumber);

                if(isDouble){       // 중복이면,
                    $("#phoneDoubleModal").css({display: "block"});
                }else{              // 중복이 아니면,
                    $("#phoneNum").text(changePhoneNum);
                    $("#phoneModal").css({display: "block"});
                    CountDownTimer('#verifyTime');     // 인증창 실행
                } // if-else
            } // success
        }); // ajax    
    } // outer if-else
} // 인증버튼 클릭시

let timer;
let limitTime;
function CountDownTimer(id) {
    // 초기화 부분
    clearInterval(timer);
    $(id).css('font-size', '24px').css('color', '#333333');

    let setTime = 180;     // 3분을 초단위로
    // let setTime = 10;     // 임시확인용
    limitTime = setTime;
    
    function showRemaining() {
        let secondsStr = "초문자열";
        
        limitTime -= 1;
        let minutes = parseInt(limitTime / 60);
        let seconds = limitTime - (minutes * 60);   

        if(limitTime < 0) {
            $(id).css('font-size', '14px').css('color', 'red');
            $(id).html("인증 시간이 만료되었습니다.<br> 재전송 버튼을 눌러 다시 인증해주세요.");
            clearInterval(timer);
            return;
        } // if

        if(seconds < 10){ secondsStr = "0" + seconds.toString(); }
        else{ secondsStr = seconds.toString(); }
        
        $(id).text("0" + minutes + " : " + secondsStr);

        // console.log("showRemaining() 함수");
    } // showRemaining

    timer = setInterval(showRemaining, 1000);
    $(id).empty();
    // console.log("CountDownTimer() 함수");

    $("#closeBtn").click(function(){
        clearInterval(timer);
    });  // 취소버튼 클릭시 카운트 종료 

} // 인증 시간 카운트 함수(3분)
   
function repeat(){
    CountDownTimer('#verifyTime');
} // 재전송

function checkVerifyNum(){

    let verifyNum = null;
    verifyNum = $("#phoneValidationNumInput").val();

    // 인증번호가 들어왔는지 여부 체크
    if(!verifyNum){    // 인증번호가 없으면,
        return;         // 해당 함수 끝냄
    } // if

    if(verifyNum == randomNumber && limitTime >= 0){       // 제한시간 안에 인증 번호가 일치하면,
        $("#phoneValidationSucceedModal").css({display: "block"});
        phoneVerifySuccess = true;
        console.log("success");
    }else{                                      
        $("#phoneValidationFailedModal").css({display: "block"});
        phoneVerifySuccess = false;
        console.log("failed");
    } // if-else

    clearInterval(timer);       // 타이머 중지
    
} // 인증번호 체크(인증창 확인버튼 클릭시 이벤트)


/**
 * @desc 프로필 이미지 변경
 */
 function modifyProfileImg(){
    
    $('#uploadFile').on('change',function(e){
        var filePath = $('#uploadFile').val();
        
        if(filePath != ''){
            var ext = filePath.split('.').pop().toLowerCase(); // 파일 업로드 확장자 체크

            if($.inArray( ext, ['png','jpg','jpeg'] ) == -1) {
                alert('업로드할 수 없는 파일 확장자입니다. png, 혹은 jpg 파일을 선택해주세요.');
                $('#imageUploadPlaceHolder').attr('placeholder', '이미지를 업로드하세요.');  // input 파일명 지우기
                $('#profileImgSample').attr('src', '/resources/member/img/userprofile.jpg'); // input 파일 썸네일 지우기
                return;
            } else{
                var lastIndex = filePath.lastIndexOf('\\');
                var fileName = filePath.substring(lastIndex + 1, filePath.length);      // 프로필 파일명
        
                $('#imageUploadPlaceHolder').attr('placeholder', fileName); 
                readImage(e.target); 
            }// if-else
        }// if

    }); // 프로필 이미지 첨부 시 파일명 & 샘플 이미지 표시

} // modifyProfileImg

function readImage(input) {
    if (input.files && input.files[0]) {
        const reader = new FileReader();
        
        reader.onload = e => {                
            $('#profileImgSample').attr('src', e.target.result);
        }
        reader.readAsDataURL(input.files[0]);
    }// if
}// readImage


/**
 * @desc 모달창 관련
 */
function modal(){
    $("#updateBtn").click(function(){

        // 유효성 검사 모달창
        if(!nameSuccess){   
            $("#nameCheckFailedModal").css({display: "block"});
        }else if(!pwdSuccess){
            $("#pwdFormCheckModal").css({display: "block"});
        }else if(!pwdCheckSuccess){
            $("#pwdMismatchModal").css({display: "block"});
        }else if(!doubleCheckSuccess){
            $("#requestDoubleCheckModal").css({display: "block"});
        }else if(!phoneVerifySuccess){
            $("#phoneValidationModal").css({display: "block"});
        }else{
            $("#form").unbind();    // 최종으로 아무것도 문제가 없으면, 버튼 활성화
        } // if
		
	}); // 수정 확인 버튼 클릭

    $(".continue").click(function(){
		$(".modal").css({display: "none"});
	}); // 모달창 내 확인버튼 공통
} // modal