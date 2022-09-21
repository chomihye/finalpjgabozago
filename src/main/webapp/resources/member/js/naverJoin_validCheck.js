 // ================================================
 //  primary variable configuration
 // ================================================
 // 아래 boolean 타입의 모든 변수가 true인 경우 최종 회원가입 가능
// 1. 닉네임 관련 변수
let isValidNick = false; // 닉네임 형식 확인
let isDoubleCheckNickname = false; // 닉네임 중복 여부

// 2. 이메일 관련 변수
let isValidEmail = false; // 이메일 형식 확인
let isDoubleCheckEmail = false; // 이메일 중복 여부
let isVerifiedEmail = false; // 인증 완료 여부
let sentEmailUid = ""; // 사용자에게 발송한 UID

// 3. 휴대폰 관련 변수
let isValidPhone = false; // 휴대폰 번호 형식 확인
let isDoubleCheckPhone = false; // 휴대폰 번호 중복 여부
let isVerifiedPhone = false; // 인증 완료 여부
let sentSmsUid = ""; // 사용자에게 발송한 UID

// 4. MISC
let isPersonalAgree = false; // 개인정보 수집 및 이용 약관 동의 여부
let isUsageAgree = false; // 이용약관 동의 여부
let isPasswordInsertedCorrect = false; // 비밀번호&비밀번호 재입력 일치 여부
let isValidPassword = false; // 비밀번호 형식 확인


 // ================================================
 //  1. 닉네임
 // ================================================
function doubleCheckNickname(){
	console.log("doubleCheckNickname() invoked.");
	
    let nickname = $("#nickname").val();

    const reg_nickname = /^[가-힣|a-z|A-Z|0-9]+$/; // 한글, 영문 대소문자, 숫자

    if(!(reg_nickname.test(nickname))){ 
        isValidNick = false;
        $("#nicknameRulesError").css({display: "block"});

    }else{ 
        isValidNick = true;

        $.ajax({
            url: "http://localhost:8080/join/nicknameCheck",
            type: "POST",
            data: nickname,
            cache : false,
            contentType: "application/json; charset=UTF-8",
            success : function(resp) {
                const result = JSON.parse(resp);
                console.log("result:" + result);
                
                if(result >= 1) { // 이미 유효 회원
					$("#doubleCheckFailedModal").css({display: "block"});
                	isDoubleCheckNickname = false;
				} else if(result == 0) { // 가입할 수 있는 닉네임
					$("#doubleCheckSucceedModal").css({display: "block"});
					$("#nicknameRulesError").css({display: "none"});
                	isDoubleCheckNickname = true;
				}// if-else

            }, // success
            error : function(error) {
                console.log("데이터를 받아오지 못했습니다.");
            }// error
        }); // .ajax
    } // if
} // doubleCheckNickname


 // ================================================
 //  2. 이메일
 // ================================================
function doubleCheckAndVerifyEmail(){
	console.log("doubleCheckAndVerifyEmail() invoked.");
	
    let email = $("#email").val();
	console.log("email: " + email);

	const reg_email =/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
	
    if(!(reg_email.test(email))){ 
        isValidEmail = false;
        $("#emailRulesError").css({display: "block"}); 
    }else{ 
        isValidEmail = true;

		document.querySelector('#printEmail').innerText = email;

        $.ajax({
            url: "http://localhost:8080/join/emailCheck",
            type: "POST",
            data: email,
            cache : false,
            contentType: "application/json; charset=UTF-8",
            success : function(resp) {                
                const map = JSON.parse(resp);
                
                console.log(map.result);
                console.log(map.email);
                console.log(map.uid);
                
                sentEmailUid = map.uid;

				if(isVerifiedEmail == false){
	                if(map.result >= 1) {
						$("#doubleCheckFailedModal").css({display: "block"});
						$("#failedText").text("이미 가입된 이메일입니다.");
						
	                	isDoubleCheckEmail = false;
					} else if(map.result == 0) {
						$("#emailModal").css({display: "block"});
						$("#emailRulesError").css({display: "none"});
	                	isDoubleCheckEmail = true;
					}// if-else					
				}// if

            }, // success
            error : function(error) {
                console.log("데이터를 받아오지 못했습니다.");
            }// error
        }); // .ajax
    } // if
} // doubleCheckAndVerifyEmail

function emailVerify(){
	console.log("emailVerify() invoked.");

	let insertedUid = $("#emailVerificationNumInput").val();
	
	console.log(insertedUid);
	console.log(sentEmailUid);

	if(sentEmailUid == insertedUid){
		$("#VerifyingSucceedModal").css({display: "block"}); // 인증 성공 모달
		$("#emailModal").css({display: "none"});
		$("#emailVerificationNumInput").val("");
		$("#emailVerificationBtn").text("인증 완료");
		$("#emailVerificationBtn").css({border: "1px solid #444"});
		$("#emailVerificationBtn").attr({disabled: "disabled"});
		isVerifiedEmail = true;
	} else {
		$("#VerifyingFailedModal").css({display: "block"}); // 인증 실패 모달
		$("#emailModal").css({display: "none"});
		$("#emailVerificationNumInput").val("");
	}// if-else
}// emailVerify

function resendEmail(){
	console.log("resendEmail() invoked.");
	alert("인증번호가 재전송되었습니다.");
		
    let email = $("#email").val();
    
	 $.ajax({
            url: "http://localhost:8080/join/emailCheck",
            type: "POST",
            data: email,
            cache : false,
            contentType: "application/json; charset=UTF-8",
            success : function(resp) {                
                const map = JSON.parse(resp);
                console.log("map: " + map);
                
                sentEmailUid = map.uid;

            }, // success
            error : function(error) {
                console.log("데이터를 받아오지 못했습니다.");
            }// error
        }); // .ajax
}// resendEmail


 // ================================================
 //  3. 휴대폰
 // ================================================
function doubleCheckAndVerifyPhone(){
	console.log("doubleCheckAndVerifyPhone() invoked.");
	
    let phone = $("#phone").val();

	const reg_phone = /^\d{3}-\d{4}-\d{4}$/;
	
    if(!(reg_phone.test(phone))){ 
        isValidPhone = false;
        $("#phoneRulesError").css({display: "block"}); 
    }else{
        isValidPhone = true;
		document.querySelector('#printPhone').innerText = phone;

        $.ajax({
            url: "http://localhost:8080/join/phoneCheck",
            type: "POST",
            data: phone,
            cache: false,
            contentType: "application/json; charset=UTF-8",
            success: function(resp) {                
                const map = JSON.parse(resp);
                
                console.log(map.result);
                console.log(map.phone);
                console.log(map.uid);
                
                sentSmsUid = map.uid;

                if(map.result >= 1) { 
					$("#doubleCheckFailedModal").css({display: "block"});
					$("#failedText").text("이미 가입된 휴대폰 번호입니다.");
				} else if(map.result == 0) {
					$("#phoneModal").css({display: "block"});
					$("#phoneRulesError").css({display: "none"});
                	isDoubleCheckPhone = true;
				}// if-else

            }, // success
            error: function(error) {
                console.log("데이터를 받아오지 못했습니다.");
            } // error
        }); // .ajax
    } // if
} // doubleCheckAndVerifyPhone

function phoneVerify(){
	console.log("phoneVerify() invoked.");

	let insertedUid = $("#phoneVerificationNumInput").val();
	
	console.log(insertedUid);
	console.log(sentSmsUid);

	if(sentSmsUid == insertedUid){
		$("#phoneModal").css({display: "none"});
		$("#VerifyingSucceedModal").css({display: "block"}); // 인증 성공 모달
		$("#phoneVerificationNumInput").val("");
		$("#phoneVerificationBtn").text("인증 완료");
		$("#phoneVerificationBtn").css({border: "1px solid #444"});
		$("#phoneVerificationBtn").attr({disabled: "disabled"});
		
		isVerifiedPhone = true;
	} else {
		$("#phoneModal").css({display: "none"});
		$("#VerifyingFailedModal").css({display: "block"}); // 인증 실패 모달
		$("#phoneVerificationNumInput").val("");
	}// if-else
	
}// phoneVerify

function resendSms(){
	console.log("resendSms() invoked.");
	alert("인증번호가 재전송되었습니다.");
		
    let phone = $("#phone").val();
    
	 $.ajax({
            url: "http://localhost:8080/join/phoneCheck",
            type: "POST",
            data: phone,
            cache : false,
            contentType: "application/json; charset=UTF-8",
            success : function(resp) {                
                const map = JSON.parse(resp);
                console.log("map: " + map);
                
                sentSmsUid = map.uid;

            }, // success
            error : function(error) {
                console.log("데이터를 받아오지 못했습니다.");
            }// error
        }); // .ajax
}// resendSms


 // ================================================
 //  4. MISC + 최종 회원가입 검증
 // ================================================
 $(function(){
	
	 $('#pwcheck').on('input', function(){
	    var pw = $('#pw').val();
	    var pwcheck = $('#pwcheck').val();
	
	    if (pw != '' || pwcheck == ''){
		
	        if(pw == pwcheck){ // 비밀번호 일치
	        	$('#pwcheckError').css({display: 'none'});
	        	isPasswordInsertedCorrect = true;
	        } else { // 비밀번호 불일치
	        	$('#pwcheckError').css({display: 'block'});
	        	isPasswordInsertedCorrect = false;
	        } // if-else
	        
	    }// if
	 });// 비밀번호 일치 확인
	 
	 $('#name').on('input', function(){		
		let name = $("#name").val();
	
		const reg_name = /^[가-힣a-zA-Z]+$/;
		
	    if(!(reg_name.test(name))){
	        isValidName = false;
	        $("#nameRulesError").css({display: "block"}); 
	    }else{ 
	        isValidName = true;
	        $("#nameRulesError").css({display: "none"}); 
	    }// if-else 
	}); // oninput

	 $('#pw').on('input', function(){		
		let password = $("#pw").val();
	
		const reg_password = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,12}$/;
		
	    if(!(reg_password.test(password))){ // 검사 실패
	        isValidPassword = false;
	        $("#pwRulesError").css({display: "block"}); 
	    }else{ // 검사 성공
	        isValidPassword = true;
	        $("#pwRulesError").css({display: "none"}); 
	    }// if-else 
	}); // oninput
});

function finalCheckBeforeSubmit(){
	console.log("finalCheckBeforeSubmit() invoked.");

	// 약관 동의 여부 확인
	isPersonalAgree = $("input:radio[name='personalTextAgree']:checked").val() == "agree";
	isUsageAgree = $("input:radio[name='usageTextAgree']:checked").val() == "agree";
	
	console.log(">> isPersonalAgree: " + isPersonalAgree);
	console.log(">> isUsageAgree: " + isUsageAgree);

	if(!isPersonalAgree){
		$("#personalTextAgreeRulesError").css({display: "block"});
	}else{
		$("#personalTextAgreeRulesError").css({display: "none"});
	}// if-else
	
	if(!isUsageAgree){
		$("#usageTextAgreeRulesError").css({display: "block"});
	}else {
		$("#usageTextAgreeRulesError").css({display: "none"});
	}// if-else
	
	// 아래 항목 중 하나라도 false인 경우 return false;
	if( !isPersonalAgree || !isUsageAgree || !isValidNick || !isDoubleCheckNickname || !isValidEmail 
	|| !isDoubleCheckEmail || !isVerifiedEmail || !isValidPhone || !isDoubleCheckPhone || !isVerifiedPhone 
	|| !isPasswordInsertedCorrect || !isValidPassword){
		
		console.log("isPersonalAgree: " + isPersonalAgree);
		console.log("isUsageAgree: " + isUsageAgree);
		console.log("isValidNick: " + isValidNick);
		console.log("isDoubleCheckNickname: " + isDoubleCheckNickname);
		console.log("isValidEmail: " + isValidEmail);
		console.log("isDoubleCheckEmail: " + isDoubleCheckEmail);
		console.log("isVerifiedEmail: " + isVerifiedEmail);
		console.log("isValidPhone: " + isValidPhone);
		console.log("isDoubleCheckPhone: " + isDoubleCheckPhone);
		console.log("isVerifiedPhone: " + isVerifiedPhone);
		console.log("isPasswordInsertedCorrect: " + isPasswordInsertedCorrect);
		console.log("isValidPassword: " + isValidPassword);

		$("#joinFailedModal").css({display: "block"});
		return false; // submit 처리 안되게끔
	}// if

	$("#joinSucceedModal").css({display: "block"});
}// finalCheckBeforeSubmit
