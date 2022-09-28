 // ================================================
 //  flatpickr configuration
 // ================================================
 $(function(){
    var minDate = new Date();
    var maxDate = new Date();
    
    var range = minDate.getDate() - 36500;
    minDate.setDate(range);
    
    var pickr = document.querySelector('#flatpickr');
    
    flatpickr.localize(flatpickr.l10ns.ko);
    flatpickr(pickr);
    
    pickr.flatpickr({  
        local: 'ko',
        minDate: minDate,
        maxDate: maxDate,
        dateFormat: 'Y-m-d',
        
        allowInput: true,
        onOpen: function(selectedDates, dateStr, instance) {
            $(instance.altInput).prop('readonly', true);
        },
        onClose: function(selectedDates, dateStr, instance) {
            $(instance.altInput).prop('readonly', false);
            $(instance.altInput).blur();
        }
    });
});// flatpickr

 // ================================================
 //    timer configuration
 // ================================================
var timer = null;
var isRunning = false;

$(function(){

	// timer for Email
    $("#emailVerificationBtn").click(function(e){
    	var display = $('#timerForEmail');
    	var leftSec = 180; // 남은 시간

    	// 이미 타이머가 작동 중인 경우 중지
    	if (isRunning){
    		clearInterval(timer);
    		display.html("");
    		startTimer(leftSec, display);
    	}else{
    		startTimer(leftSec, display);
    	}// if-else
	});
	
	$("#resendEmail").click(function(e){
    	var display = $('#timerForEmail');
    	var leftSec = 180; // 남은 시간

    	// 이미 타이머가 작동 중인 경우 중지
    	if (isRunning){
    		clearInterval(timer);
    		display.html("");
    		startTimer(leftSec, display);
    	}else{
    		startTimer(leftSec, display);
    	}// if-else
	});
	
	// timer for Phone
    $("#phoneVerificationBtn").click(function(e){
		var display = $('#timerForPhone');
		var leftSec = 180; // 남은 시간
	
		// 이미 타이머가 작동 중인 경우 중지
		if (isRunning){
			clearInterval(timer);
			display.html("");
			startTimer(leftSec, display);
		}else{
			startTimer(leftSec, display);
		}// if-else
	});

	$("#resendSms").click(function(e){
		var display = $('#timerForPhone');
		var leftSec = 180; // 남은 시간

		// 이미 타이머가 작동 중인 경우 중지
		if (isRunning){
			clearInterval(timer);
			display.html("");
			startTimer(leftSec, display);
		}else{
			startTimer(leftSec, display);
		}// if-else
	});
})

function startTimer(count, display) {
            
    		var minutes;
    		var seconds;
    		
            timer = setInterval(function () {
	            minutes = parseInt(count / 60, 10);
	            seconds = parseInt(count % 60, 10);
	     
	            minutes = minutes < 10 ? "0" + minutes : minutes;
	            seconds = seconds < 10 ? "0" + seconds : seconds;
	     
	            display.html(minutes + ":" + seconds);
	     
	            // 타이머 끝
	            if (--count < 0) {
		    	   clearInterval(timer);
		    	   alert("인증 제한 시간 3분이 초과되었습니다. 인증번호를 재전송해주세요.");
		    	   display.html("시간 초과");
		    	   display.css({color: "red"});
		    	   $('.verificationNumBtn').attr({disabled: "disabled"});
		    	   isRunning = false;
	        	}// if
	        }, 1000);
	        
             isRunning = true;
}// startTimer
    	
 // ================================================
 //    primary configuration
 // ================================================
$(function(){
    $('.okBtn').click(function(){
        $('.modal').css({display: 'none'});
    }); // 확인 혹은 취소 버튼 클릭 시 모달창 꺼짐
    
    $('#joinSucceed').click(function(){
    	self.location = '/main';
    }); // 회원가입 완료 모달 확인 버튼 클릭 시 메인페이지 이동

    function readImage(input) {
		if (input.files && input.files[0].size > (1 * 1024 * 1024)) {
        	alert("이미지 사이즈가 1MB를 넘습니다.");
        	input.value = null;
        	return false;
    	} else if (input.files && input.files[0]) {
            const reader = new FileReader();
            
            reader.onload = e => {                
                $('#profileImgSample').attr('src', e.target.result);
            }
            reader.readAsDataURL(input.files[0]);
            return true;
        }// if-else
	}// readImage
    
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
                if(readImage(e.target)){
	                var lastIndex = filePath.lastIndexOf('\\');
	                var fileName = filePath.substring(lastIndex + 1, filePath.length);
	        
	                $('#imageUploadPlaceHolder').attr('placeholder', fileName); 				
				} // if
            }// if-else
        }// if
   	}); // 프로필 이미지 첨부 시 파일명 & 샘플 이미지 표시

});