/**
 * @desc 데이터 유효성 검사 관련 변수
 */
 let nameSuccess = true;
 let pwdSuccess = true;
 let pwdCheckSuccess = true;
 let validNick = true;              // 유효한 닉네임인지
 let doubleCheckSuccess = true;     // 중복확인 했는지


/**
 * @desc 초기 수행
 */
$(function(){
	console.log("6-3.mypage_myInfo_modify.js invoked.");

    modifyName();       // 이름(성함) 수정 관련

    $("#pwError").css({display: "none"});       // 비밀번호 수정 관련
    $("#pwcheckError").css({display: "none"}); 

    modifyProfileImg();     // 프로필 이미지 변경 관련


    // // 정규식 관련
    // let specialChar = /[~!@\#$%^&*\()\-=+_'\"]/gi;  // 특수문자
    // let blank = /[ ]/g;      // 공백
    // let specialChar = /[0-9a-z~!@\#$%^&*\()\-=+_'\" ]/gi;  // 특수문자
    // let number = /[^0-9]/g;  // 숫자
    // let eng = /[^a-z]/gi;     // 영문 대소문자
    // // /^[a-z|A-Z|0-9|~!@\#$%^&*\()\-=+_'\"]+$/

    // let str0 = "* abc920324";
    // let test0 = str0.match(blank);
    

    // if(test0 == null){
    //     console.log("공백문자가 없습니다.");
    // }else{
    //     console.log("공백문자가 포함되었습니다.");
    // } // 공백검사

    // let str = "*abc920324";
    // let test = str.replace(number, "");     // 숫자만 뽑는 함수
    // console.log("숫자만 : " + test);

    // let str2 = "*aNc안녕920324";
    // let test2 = str2.replace(specialChar, "");    // 특수문자만 뽑는 함수
    // console.log("특수문자만 : " + test2);

    // let str3 = "*abcABC920324";
    // let test3 = str3.replace(eng, "");    // 영문 대소문자만 뽑는 함수
    // console.log("영문자만 : " + test3);


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
        }else{
            $("#form").unbind();    // 최종으로 아무것도 문제가 없으면, 버튼 활성화
        } // if
		
	}); // 수정 확인 버튼 클릭

    $(".continue").click(function(){
		$(".modal").css({display: "none"});
	}); // 모달창 내 확인버튼 공통





    // $(".completed").click(function(){
	// 	$(".modal").css({display: "none"});
    //     location.href="/mypage/main";
	// }); // 수정완료



    // $("#doubleCheckBtn").click(function(){
	// 	$("#doubleCheckSucceedModal").css({display: "block"});
    //     // $("#doubleCheckFailedModal").css({display: "block"});
	// }); // 닉네임 중복 확인 버튼 클릭

    // $("#phoneValidationBtn").click(function(){
    //     $(" #phoneModal").css({display: "block"});
    // }); // 폰 인증 버튼 클릭

    // $("#phoneValidationNumBtn").click(function(){
    //     $(" #phoneValidationSucceedModal").css({display: "block"});
    //     // $(" #phoneValidationFailedModal").css({display: "block"});
    // }); // 폰 인증 확인 버튼 클릭
} // modal


//     window.onclick = function(event) {
//         if(event.target == emailModal || event.target == phoneModal) {
//             $("#emailModal").css({display: "none"});
//             $("#phoneModal").css({display: "none"});
//             $("#doubleCheckSucceedModal").css({display: "none"});
//         }// if
//     } // 배경 누르면 취소되는 경우 구현
