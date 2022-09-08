/**
 * @desc 초기 수행
 */
$(function(){
	clickStars();	// 별점

	
});

/**
 * @desc 별점 클릭시 바뀌는 이벤트 구현
 */
 function clickStars(){

	// 청결도 별점 관련
	$(document).on("click","#cleanliness #1",function(){
		$("#cleanliness").children().remove();
		$("#cleanliness").html('<i class="bi bi-star-fill" id="1"></i> <i class="bi bi-star" id="2"></i> <i class="bi bi-star" id="3"></i> <i class="bi bi-star" id="4"></i> <i class="bi bi-star" id="5"></i> <input type="hidden" name="g1" value="1">');
	});
	$(document).on("click","#cleanliness #2",function(){
		$("#cleanliness").children().remove();
		$("#cleanliness").html('<i class="bi bi-star-fill" id="1"></i> <i class="bi bi-star-fill" id="2"></i> <i class="bi bi-star" id="3"></i> <i class="bi bi-star" id="4"></i> <i class="bi bi-star" id="5"></i> <input type="hidden" name="g1" value="2">');
	});
	$(document).on("click","#cleanliness #3",function(){
		$("#cleanliness").children().remove();
		$("#cleanliness").html('<i class="bi bi-star-fill" id="1"></i> <i class="bi bi-star-fill" id="2"></i> <i class="bi bi-star-fill" id="3"></i> <i class="bi bi-star" id="4"></i> <i class="bi bi-star" id="5"></i> <input type="hidden" name="g1" value="3">');
	});
	$(document).on("click","#cleanliness #4",function(){
		$("#cleanliness").children().remove();
		$("#cleanliness").html('<i class="bi bi-star-fill" id="1"></i> <i class="bi bi-star-fill" id="2"></i> <i class="bi bi-star-fill" id="3"></i> <i class="bi bi-star-fill" id="4"></i> <i class="bi bi-star" id="5"></i> <input type="hidden" name="g1" value="4">');
	});
	$(document).on("click","#cleanliness #5",function(){
		$("#cleanliness").children().remove();
		$("#cleanliness").html('<i class="bi bi-star-fill" id="1"></i> <i class="bi bi-star-fill" id="2"></i> <i class="bi bi-star-fill" id="3"></i> <i class="bi bi-star-fill" id="4"></i> <i class="bi bi-star-fill" id="5"></i> <input type="hidden" name="g1" value="5">');
	});

	// 위치 별점 관련
	$(document).on("click","#location #1",function(){
		$("#location").children().remove();
		$("#location").html('<i class="bi bi-star-fill" id="1"></i> <i class="bi bi-star" id="2"></i> <i class="bi bi-star" id="3"></i> <i class="bi bi-star" id="4"></i> <i class="bi bi-star" id="5"></i> <input type="hidden" name="g2" value="1">');
	});
	$(document).on("click","#location #2",function(){
		$("#location").children().remove();
		$("#location").html('<i class="bi bi-star-fill" id="1"></i> <i class="bi bi-star-fill" id="2"></i> <i class="bi bi-star" id="3"></i> <i class="bi bi-star" id="4"></i> <i class="bi bi-star" id="5"></i> <input type="hidden" name="g2" value="2">');
	});
	$(document).on("click","#location #3",function(){
		$("#location").children().remove();
		$("#location").html('<i class="bi bi-star-fill" id="1"></i> <i class="bi bi-star-fill" id="2"></i> <i class="bi bi-star-fill" id="3"></i> <i class="bi bi-star" id="4"></i> <i class="bi bi-star" id="5"></i> <input type="hidden" name="g2" value="3">');
	});
	$(document).on("click","#location #4",function(){
		$("#location").children().remove();
		$("#location").html('<i class="bi bi-star-fill" id="1"></i> <i class="bi bi-star-fill" id="2"></i> <i class="bi bi-star-fill" id="3"></i> <i class="bi bi-star-fill" id="4"></i> <i class="bi bi-star" id="5"></i> <input type="hidden" name="g2" value="4">');
	});
	$(document).on("click","#location #5",function(){
		$("#location").children().remove();
		$("#location").html('<i class="bi bi-star-fill" id="1"></i> <i class="bi bi-star-fill" id="2"></i> <i class="bi bi-star-fill" id="3"></i> <i class="bi bi-star-fill" id="4"></i> <i class="bi bi-star-fill" id="5"></i> <input type="hidden" name="g2" value="5">');
	});

	// 전체적인 만족도 별점 관련
	$(document).on("click","#satisfaction #1",function(){
		$("#satisfaction").children().remove();
		$("#satisfaction").html('<i class="bi bi-star-fill" id="1"></i> <i class="bi bi-star" id="2"></i> <i class="bi bi-star" id="3"></i> <i class="bi bi-star" id="4"></i> <i class="bi bi-star" id="5"></i> <input type="hidden" name="g3" value="1">');
	});
	$(document).on("click","#satisfaction #2",function(){
		$("#satisfaction").children().remove();
		$("#satisfaction").html('<i class="bi bi-star-fill" id="1"></i> <i class="bi bi-star-fill" id="2"></i> <i class="bi bi-star" id="3"></i> <i class="bi bi-star" id="4"></i> <i class="bi bi-star" id="5"></i> <input type="hidden" name="g3" value="2">');
	});
	$(document).on("click","#satisfaction #3",function(){
		$("#satisfaction").children().remove();
		$("#satisfaction").html('<i class="bi bi-star-fill" id="1"></i> <i class="bi bi-star-fill" id="2"></i> <i class="bi bi-star-fill" id="3"></i> <i class="bi bi-star" id="4"></i> <i class="bi bi-star" id="5"></i> <input type="hidden" name="g3" value="3">');
	});
	$(document).on("click","#satisfaction #4",function(){
		$("#satisfaction").children().remove();
		$("#satisfaction").html('<i class="bi bi-star-fill" id="1"></i> <i class="bi bi-star-fill" id="2"></i> <i class="bi bi-star-fill" id="3"></i> <i class="bi bi-star-fill" id="4"></i> <i class="bi bi-star" id="5"></i> <input type="hidden" name="g3" value="4">');
	});
	$(document).on("click","#satisfaction #5",function(){
		$("#satisfaction").children().remove();
		$("#satisfaction").html('<i class="bi bi-star-fill" id="1"></i> <i class="bi bi-star-fill" id="2"></i> <i class="bi bi-star-fill" id="3"></i> <i class="bi bi-star-fill" id="4"></i> <i class="bi bi-star-fill" id="5"></i> <input type="hidden" name="g3" value="5">');
	});

} // clickStars