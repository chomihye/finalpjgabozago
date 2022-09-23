let optionValue = null;

/**
 * @desc 초기 수행
 */
$(function(){
	console.log("6-14.mypage_write.js invoked.");
	$("#write").css("font-weight", "bold");

    getWriteList('1');

    changeOption();     // 옵션 선택시 메소드 호출
});

/**
 * @desc Select Option 선택시 변경
 */
 function changeOption(){
    $("select[name=write_type]").change(function(){
        console.log($(this).val());
        optionValue = $(this).val(); //value값 가져오기

        $("#no_get").remove();
        $(".pageBtn").empty();

        if(optionValue == "board"){
            $("#write_comment").empty();
            getWriteList('1');
        }else if(optionValue == "comment"){
            $("#write_board").empty();
            getCommentList('1');
        } // if-else
    });
} // changeOption


/**
 * @desc 작성 글 내역 불러오기
 */
 function getWriteList(currPage){

    $.ajax({
        type: "POST",
        url: "write/community",
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

            $("#write_board").empty();
            $(".pageBtn").empty();

            let particleStr = "";

            // 아무것도 없는 회원 처리
            if(pageDTO.totalAmount == 0){       // 레코드가 아무것도 없다면,
                particleStr = '<div id="no_get">작성 글이 없습니다.</div>';
                $(".myWrite").append(particleStr);
                return;
            }else{                              // 레코드가 1개 이상이면,
                particleStr += '<ul>';

                for(var i = 0 ; i < list.length ; i++){
                    idx = list[i].idx;
                    img = list[i].img;
                    title = list[i].title;
                    content = list[i].content;
                    insertTs = list[i].insertTs;  
                    updateTs = list[i].updateTs;

                    let tempDate;

                    if(!updateTs){      // 업데이트 날짜가 없는 경우
                        tempDate = new Date(insertTs);
                    }else{
                        tempDate = new Date(updateTs);
                    } // if-else

                    let lastUpdate = dateFormat(tempDate);

                    let imgPath;    // 이미지 경로

                    if(!img){       // 이미지가 null이면,
                        imgPath = "/resources/common/img/logo_Green_2.png";
                    }else{
                        imgPath = "/resources/mypage/img/write/" + img;
                    } // if-else

                    particleStr += '<li>';
                    particleStr += '<a href="javascript:void(0);" class="writeBox">';
                    particleStr += '<img src="' + imgPath + '" alt="travel image">';
                    particleStr += '<div class="write_info">';
                    particleStr += '<h3>' + title + '</h3>';
                    particleStr += '<p>' + content + '</p>';
                    particleStr += '</div>';
                    particleStr += '<div class="write_date">' + lastUpdate + '</div>';
                    particleStr += '</a>';
                    particleStr += '</li>';
                } // for

                particleStr += '</ul>';

                $("#write_board").append(particleStr);

                // ================================================================

                let initialPageStr = "";
                initialPageStr += '<form action="#" id="paginationForm">';
                initialPageStr += '<input type="hidden" name="currPage">';
                initialPageStr += '<ul id="pagingBtn">';
                initialPageStr += '<li class="frontPage"><a href="javascript:void(0);" onclick="getWriteList(' + 1 + ')"><i class="bi bi-chevron-double-left"></i></a></li>';
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
                        pageStr += '<li class="currPage" onclick="getWriteList(' + i + ')">';
                    } else{
                        pageStr += '<li class="" onclick="getWriteList(' + i + ')">';
                    } // if-else

                    pageStr += '<a href="javascript:void(0);">';
                    pageStr += '<strong>' + i + '</strong>';
                    pageStr += '</a>';
                    pageStr += '</li>';

                    $(".pageNumber").append(pageStr);
                } // for
                
                $(".yesPrev > a").off().on('click', function(){
                    if(pageDTO.startPage - 1 < 1){ getWriteList(pageDTO.startPage); }
                    else{ getWriteList(pageDTO.startPage - 1); }
                });   

                $(".yesNext > a").off().on('click', function(){
                    if(pageDTO.endPage + 1 > pageDTO.realEndPage){ getWriteList(pageDTO.endPage); }
                    else{ getWriteList(pageDTO.endPage + 1); }
                });     

                $(".backPage > a").off().on('click', function(){
                    getWriteList(pageDTO.realEndPage);
                });     
            } // outer if-else    
        } // success
    }); // ajax
} // getWriteList


/**
 * @desc 작성 댓글 내역 불러오기
 */
 function getCommentList(currPage){

    $.ajax({
        type: "POST",
        url: "write/comment",
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

            $("#write_comment").empty();
            $(".pageBtn").empty();

            let particleStr = "";

            // 아무것도 없는 회원 처리
            if(pageDTO.totalAmount == 0){       // 레코드가 아무것도 없다면,
                particleStr = '<div id="no_get">작성 댓글이 없습니다.</div>';
                $(".myWrite").append(particleStr);
                return;
            }else{                              // 레코드가 1개 이상이면,
                particleStr += '<ul>';

                for(var i = 0 ; i < list.length ; i++){
                    idx = list[i].IDX;
                    content = list[i].CONTENT;
                    title = list[i].TITLE;
                    commentCount = list[i].COMMENT_COUNT;
                    insertTs = list[i].INSERT_TS;  
                    updateTs = list[i].UPDATE_TS;

                    let tempDate;

                    if(!updateTs){      // 업데이트 날짜가 없는 경우
                        tempDate = new Date(insertTs);
                    }else{
                        tempDate = new Date(updateTs);
                    } // if-else

                    let lastUpdate = dateFormat(tempDate);

                    particleStr += '<li>';
                    particleStr += '<a href="javascript:void(0);" class="writeBox">';
                    particleStr += '<div class="comment_info">';
                    particleStr += '<h3>' + content + '</h3>';
                    particleStr += '<p>원글제목 : <span>' + title + '</span>&nbsp;[<span>' + commentCount + '</span>]</p>';
                    particleStr += '</div>';
                    particleStr += '<div class="write_date">' + lastUpdate + '</div>';
                    particleStr += '</a>';
                    particleStr += '</li>';
                } // for

                particleStr += '</ul>';

                $("#write_comment").append(particleStr);

                // ================================================================

                let initialPageStr = "";
                initialPageStr += '<form action="#" id="paginationForm">';
                initialPageStr += '<input type="hidden" name="currPage">';
                initialPageStr += '<ul id="pagingBtn">';
                initialPageStr += '<li class="frontPage"><a href="javascript:void(0);" onclick="getCommentList(' + 1 + ')"><i class="bi bi-chevron-double-left"></i></a></li>';
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
                        pageStr += '<li class="currPage" onclick="getCommentList(' + i + ')">';
                    } else{
                        pageStr += '<li class="" onclick="getCommentList(' + i + ')">';
                    } // if-else

                    pageStr += '<a href="javascript:void(0);">';
                    pageStr += '<strong>' + i + '</strong>';
                    pageStr += '</a>';
                    pageStr += '</li>';

                    $(".pageNumber").append(pageStr);
                } // for
                
                $(".yesPrev > a").off().on('click', function(){
                    if(pageDTO.startPage - 1 < 1){ getCommentList(pageDTO.startPage); }
                    else{ getCommentList(pageDTO.startPage - 1); }
                });   

                $(".yesNext > a").off().on('click', function(){
                    if(pageDTO.endPage + 1 > pageDTO.realEndPage){ getCommentList(pageDTO.endPage); }
                    else{ getCommentList(pageDTO.endPage + 1); }
                });     

                $(".backPage > a").off().on('click', function(){
                    getCommentList(pageDTO.realEndPage);
                });     
            } // outer if-else
        } // success
    }); // ajax
} // getCommentlist


/**
 * @desc 날짜 포맷팅 함수
 */
 function dateFormat(date){
    let month = date.getMonth() + 1;
    let day = date.getDate();
    let hour = date.getHours();
    let minute = date.getMinutes();
    let second = date.getSeconds();

    month = month >= 10 ? month : '0' + month;
    day = day >= 10 ? day : '0' + day;
    hour = hour >= 10 ? hour : '0' + hour;
    minute = minute >= 10 ? minute : '0' + minute;
    second = second >= 10 ? second : '0' + second;

    return date.getFullYear() + '-' + month + '-' + day + ' ' + hour + ':' + minute + ':' + second;
 } // dateFormat