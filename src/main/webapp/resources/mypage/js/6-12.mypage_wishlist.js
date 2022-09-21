let cnt = 0;
let optionValue = null;

/**
 * @desc 초기 수행
 */
$(function(){
	$("#wishlist").css("font-weight", "bold");
    $(".simpleTextSpaceAdd").css('margin', '68px 0');       // 로딩 모달

    getAccomWishlist('1');     // 숙소 위시리스트 불러오는 ajax(default)

    changeOption();     // 옵션 선택시 메소드 호출

    // 삭제 버튼 클릭시
    $(".selectDelete").off().on("click", function(){

        // 현재 페이지 값 가져오기
        let currPage = $(".currPage strong").text();

        // idx 값 담을 배열 선언
        let itemIdxArray = new Array();

        optionValue = $("select[name=wishlist_type]").val();
        let checkItems = $("input[name='selectParticle']:checked"); 

        if(optionValue == "accom"){           // 숙소라면,

            $.each(checkItems, function(index, value) {       
                let idx = $(value).attr("idx");
                itemIdxArray.push(idx);
            }); // each

            deleteAccomWishlist(itemIdxArray, currPage);

        }else if(optionValue == "plan"){     // 일정이라면,

            $.each(checkItems, function(index, value) {       
                let idx = $(value).attr("idx");
                itemIdxArray.push(idx);
            }); // each

            deletePlanWishlist(itemIdxArray, currPage);

        } // if-else

    }); // delete click
    
}); // 초기함수


/**
 * @desc 위시리스트 체크박스 전체 선택 관련 로직
 */
function selectAllCheckBox(cnt){
    $("input[type='checkbox']").off().on("click", function(){
        if ($("input[name='selectParticle']:checked").length == cnt) {
            $("#selectAll").prop("checked", true);
        } else {
            $("#selectAll").prop("checked", false);  
        }
    });

    $("#selectAll").off().on("click", function(){
        let checkYn = $("#selectAll").is(":checked");
        if (checkYn == true) {
            $("input[type='checkbox']").prop("checked", true);
        } else {
            $("input[type='checkbox']").prop("checked", false); 
        }
    });
} // selectAllCheckBox

/**
 * @desc Select Option 선택시 변경
 */
function changeOption(){
    $("select[name=wishlist_type]").on("change", function(){
        console.log($(this).val());
        optionValue = $(this).val(); //value값 가져오기

        if(optionValue == "accom"){
            $("#plan_list").empty();
            $("input[type='checkbox']").prop("checked", false);
            getAccomWishlist('1');
        }else if(optionValue == "plan"){
            $("#accom_list").empty();
            $("input[type='checkbox']").prop("checked", false);
            getPlanWishlist('1');
        } // if-else
    });
} // changeOption


/**
 * @desc 숙소 위시리스트 불러오기
 */
function getAccomWishlist(currPage){

    $.ajax({
        type: "POST",
        url: "wishlist/accom",
        data:{
            "currPage" : currPage
        },
        cache : false,
        error : function(error) {
            console.log("error");
        },
        success : function(resp) {
            console.log("success");

            const map = JSON.parse(resp);
            const list = map.list;
            const pageDTO = map.pageDTO;

            $("input[type='checkbox']").prop("checked", false);
            $("#accom_list").empty();

            for(var i = 0 ; i < list.length ; i++){
                // console.log(list[i]);

                wishAccomIdx = list[i].IDX;
                file_name = list[i].FILE_NAME;
                accom_idx = list[i].ACCOM_IDX;
                accom_name = list[i].ACCOM_NAME;
                large_area_name = list[i].LARGE_AREA_NAME;

                let num = i + 1;

                let particleStr = "";
                particleStr += '<li id="item' + num + '">';
                particleStr += '<input type="checkbox" id="select' + num + '" name="selectParticle" idx="' + wishAccomIdx + '">';
                particleStr += '<label for="select' + num + '"></label>';
                particleStr += '<a href="/reservation/datail?accom_idx=' + accom_idx + '" class="accomBox">';
                particleStr += '<img src="/resources/acco/img/himg/' + file_name + '" alt="accom image">';
                particleStr += '<div class="accom_info">';
                particleStr += '<h3>' + accom_name + '</h3>';
                particleStr += '<p><i class="fas fa-location-dot"></i>&nbsp;' + large_area_name + '</p>';
                particleStr += '</div>';
                particleStr += '<button type="button" class="payment">결제하기</button>';
                particleStr += '</a>';
                particleStr += '</li>';

                $("#accom_list").append(particleStr);
            } // for

            cnt = $("#accom_list li").length;           // 숙소의 체크박스 갯수
            console.log("cnt : " + cnt);
            selectAllCheckBox(cnt);

            // ================================================================

            $(".pageBtn").empty();

            let initialPageStr = "";
            initialPageStr += '<form action="#" id="paginationForm">';
            initialPageStr += '<input type="hidden" name="currPage">';
            initialPageStr += '<ul id="pagingBtn">';
            initialPageStr += '<li class="frontPage"><a href="javascript:void(0);" onclick="getAccomWishlist(' + 1 + ')"><i class="bi bi-chevron-double-left"></i></a></li>';
            initialPageStr += '<li class="prev yesPrev"><a href="javascript:void(0);"><i class="bi bi-chevron-left"></i></a></li>';
            initialPageStr += '<li class="pageNumber"></li>';
            initialPageStr += '<li class="next yesNext"><a href="javascript:void(0);"><i class="bi bi-chevron-right"></i></a></li>';
            initialPageStr += '<li class="backPage"><a href="javascript:void(0);"><i class="bi bi-chevron-double-right"></i></a></li>';
            initialPageStr += '</ul>';
            initialPageStr += '</form>';

            $(".pageBtn").append(initialPageStr);

            for(let i = pageDTO.startPage ; i <= pageDTO.endPage ; i++){
                let pageStr = "";

                if (pageDTO.cri.currPage == i) {
                    pageStr += '<li class="currPage" onclick="getAccomWishlist(' + i + ')">';
                } else{
                    pageStr += '<li class="" onclick="getAccomWishlist(' + i + ')">';
                } // if-else

                pageStr += '<a href="javascript:void(0);">';
                pageStr += '<strong>' + i + '</strong>';
                pageStr += '</a>';
                pageStr += '</li>';

                $(".pageNumber").append(pageStr);
            } // for
            
            $(".yesPrev > a").off().on('click', function(){
                if(pageDTO.startPage - 1 < 1){ getAccomWishlist(pageDTO.startPage); }
                else{ getAccomWishlist(pageDTO.startPage - 1); }
            });   

            $(".yesNext > a").off().on('click', function(){
                if(pageDTO.endPage + 1 > pageDTO.realEndPage){ getAccomWishlist(pageDTO.endPage); }
                else{ getAccomWishlist(pageDTO.endPage + 1); }
            });     

            $(".backPage > a").off().on('click', function(){
                getAccomWishlist(pageDTO.realEndPage);
            });     

        } // success
    }); // ajax
} // getAccomWishlist


/**
 * @desc 일정 위시리스트 불러오기
 */
function getPlanWishlist(currPage){

    showLoadingModal();

    $.ajax({
        type: "POST",
        url: "wishlist/plan",
        data:{
            "currPage" : currPage
        },
        cache : false,
        error : function(error) {
            console.log("error");
            hideLoadingModal();
        },
        success : function(resp) {
            console.log("success");

            const map = JSON.parse(resp);
            const list = map.list;
            const pageDTO = map.pageDTO;

            $("input[type='checkbox']").prop("checked", false);
            $("#plan_list").empty();

            let particleStr = "";
            particleStr += '<div class="planBoxWrap">';

            for(var i = 0 ; i < list.length ; i++){
                // console.log(list[i]);

                wishPlanIdx = list[i].wishlistIdx;
                travelPlanIdx = list[i].travelPlanIdx;
                largeAreaName = list[i].largeAreaName;
                nickname = list[i].nickname;
                likes = list[i].likes;
                totalDays = list[i].totalDays;
                DAY1 = list[i].DAY1;
                DAY2 = list[i].DAY2;
                DAY3 = list[i].DAY3;
                DAY4 = list[i].DAY4;
                DAY5 = list[i].DAY5;
                DAY6 = list[i].DAY6;
                DAY7 = list[i].DAY7;

                let num = i + 1;
                
                particleStr += '<div class="planBox">';
                particleStr += '<input type="checkbox" id="select' + num + '" name="selectParticle" idx="' + wishPlanIdx + '">';
                particleStr += '<label for="select' + num + '"></label>';
                particleStr += '<div class="slideContainer">';
                particleStr += '<div id="plan' + num + '" class="carousel slide" data-touch="false" data-interval="false">';
                particleStr += '<div class="userInfo">';
                particleStr += '<ul>';
                particleStr += '<li class="title">' + largeAreaName + '</li>';
                particleStr += '<li class="username">' + nickname + '</li>';
                particleStr += '</ul>';
                particleStr += '<p><i class="bi bi-suit-heart-fill"></i> ' + likes + '</p>';
                particleStr += '</div>';
                particleStr += '<div class="carousel-inner">';

                for(var j = 1 ; j <= totalDays ; j++){      // day
                    particleStr += '<div class="carousel-item">';
                    particleStr += '<div class="dayList">';
                    particleStr += '<h1>DAY' + j + '</h1>';
                    particleStr += '<div class="areaList">';
                    particleStr += '<img src="/resources/common/img/list.png" width="">';
                    particleStr += '<ul>';

                    let temp = eval("DAY" + j);
                    let seqCount = temp.length; 

                    for(var k = 0 ; k < seqCount ; k++){   //  시퀀스
                        if(temp[k].PLACE_TYPE == 'T'){
                            particleStr += '<li>' + temp[k].PLACE_NAME + '</li>';
                        }else if(temp[k].PLACE_TYPE == 'A'){
                            particleStr += '<li>' + temp[k].ACCOM_NAME + '</li>';
                        }else{
                            particleStr += '<li></li>';
                        } // if-else
                    } // for
                    
                    particleStr += '</ul>';
                    particleStr += '</div>';
                    particleStr += '</div>';
                    particleStr += '</div>';     
                } // inner-for
                
                particleStr += '</div>';
                particleStr += '<button id="leftArrow" class="carousel-control-prev arrows" type="button"';
                particleStr += 'data-target="#plan' + num + '" data-slide="prev">';
                particleStr += '<span class="bi bi-arrow-left-circle-fill" aria-hidden="true"></span>';
                particleStr += '</button>';
                particleStr += '<button id="rightArrow" class="carousel-control-next arrows" type="button"';
                particleStr += 'data-target="#plan' + num + '" data-slide="next">';
                particleStr += '<span class="bi bi-arrow-right-circle-fill" aria-hidden="true"></span>';
                particleStr += '</button>';
                particleStr += '<button class="planAdd" onclick="">일정에 추가</button>';
                particleStr += '</div>';
                particleStr += '</div>';
                particleStr += '</div>';
            } // for

            particleStr += '</div>';
            $("#plan_list").append(particleStr);
            $("#plan1 .carousel-inner").children().first().addClass('active');
            $("#plan2 .carousel-inner").children().first().addClass('active');
            $("#plan3 .carousel-inner").children().first().addClass('active');
            $("#plan4 .carousel-inner").children().first().addClass('active');

            cnt = $("#plan_list .planBoxWrap > div").length;           // 일정의 체크박스 갯수
            console.log("cnt : " + cnt);
            selectAllCheckBox(cnt);

            // ================================================================

            $(".pageBtn").empty();

            let initialPageStr = "";
            initialPageStr += '<form action="#" id="paginationForm">';
            initialPageStr += '<input type="hidden" name="currPage">';
            initialPageStr += '<ul id="pagingBtn">';
            initialPageStr += '<li class="frontPage"><a href="javascript:void(0);" onclick="getPlanWishlist(' + 1 + ')"><i class="bi bi-chevron-double-left"></i></a></li>';
            initialPageStr += '<li class="prev yesPrev"><a href="javascript:void(0);"><i class="bi bi-chevron-left"></i></a></li>';
            initialPageStr += '<li class="pageNumber"></li>';
            initialPageStr += '<li class="next yesNext"><a href="javascript:void(0);"><i class="bi bi-chevron-right"></i></a></li>';
            initialPageStr += '<li class="backPage"><a href="javascript:void(0);"><i class="bi bi-chevron-double-right"></i></a></li>';
            initialPageStr += '</ul>';
            initialPageStr += '</form>';

            $(".pageBtn").append(initialPageStr);

            for(let i = pageDTO.startPage ; i <= pageDTO.endPage ; i++){
                let pageStr = "";

                if (pageDTO.cri.currPage == i) {
                    pageStr += '<li class="currPage" onclick="getPlanWishlist(' + i + ')">';
                } else{
                    pageStr += '<li class="" onclick="getPlanWishlist(' + i + ')">';
                } // if-else

                pageStr += '<a href="javascript:void(0);">';
                pageStr += '<strong>' + i + '</strong>';
                pageStr += '</a>';
                pageStr += '</li>';

                $(".pageNumber").append(pageStr);
            } // for
            
            $(".yesPrev > a").off().on('click', function(){
                if(pageDTO.startPage - 1 < 1){ getPlanWishlist(pageDTO.startPage); }
                else{ getPlanWishlist(pageDTO.startPage - 1); }
            });   

            $(".yesNext > a").off().on('click', function(){
                if(pageDTO.endPage + 1 > pageDTO.realEndPage){ getPlanWishlist(pageDTO.endPage); }
                else{ getPlanWishlist(pageDTO.endPage + 1); }
            });     

            $(".backPage > a").off().on('click', function(){
                getPlanWishlist(pageDTO.realEndPage);
            });   
            
            hideLoadingModal();
        } // success
    }); // ajax
} // getPlanWishlist


/**
 * @desc 숙소 위시리스트 삭제
 */
function deleteAccomWishlist(itemIdxArray, currPage){

    $.ajax({
        type: "POST",
        url: "wishlist/accom/delete",
        data: { "itemIdxArray" : itemIdxArray },
        traditional: true,
        cache : false,
        error : function(error) {
            console.log("error");
        },
        success : function(resp) {
            console.log("success");
            getAccomWishlist(currPage);
        } // success
    }); // ajax
    
} // getAccomWishlist


/**
 * @desc 일정 위시리스트 삭제
 */
 function deletePlanWishlist(itemIdxArray, currPage){

    $.ajax({
        type: "POST",
        url: "wishlist/plan/delete",
        data: { "itemIdxArray" : itemIdxArray },
        traditional: true,
        cache : false,
        error : function(error) {
            console.log("error");
        },
        success : function(resp) {
            console.log("success");
            getPlanWishlist(currPage);
        } // success
    }); // ajax
    
} // getAccomWishlist


/**
 * @desc 로딩 모달
 */
function showLoadingModal() {
    $("#loadingModal").css('display', 'block');
}
    
function hideLoadingModal() {
    $("#loadingModal").css('display', 'none');
}