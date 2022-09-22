$(document).ready(function () {
    var i = 0;
    $('.bi-hand-thumbs-up').on('click', function () {
        if (i == 0) {
            $(this).attr('class', 'bi-hand-thumbs-up-fill');
            i++;
        } else if (i == 1) {
            $(this).attr('class', 'bi-hand-thumbs-up');
            i--;
        }

    });
});

$(function () {

    $(".bi-map").click(function () {
        $(".modal").fadeIn();
    });

    $(".okBtn").click(function () {
        $(".modal").fadeOut();
    });

});

$(function () {

    $(".bi-share").click(function () {
        $(".share_modal").fadeIn();
    });

    $(".share_modal").click(function () {
        $(".share_modal").fadeOut();
    });

});

$(function () {

    $("#S").click(function () {
        $(".delete_modal").fadeIn();
    });

    $(".my_plan").click(function () {
        $(".delete_modal").fadeOut();
    });

});

//<![CDATA[
        // // 사용할 앱의 JavaScript 키를 설정해 주세요.
        // Kakao.init('YOUR APP KEY');
        // // // 카카오링크 버튼을 생성합니다. 처음 한번만 호출하면 됩니다.
        // Kakao.Link.createDefaultButton({
        //   container: '#kakao-link-btn',
        //   objectType: 'feed',
        //   content: {
        //     title: '딸기 치즈 케익',
        //     description: '#케익 #딸기 #삼평동 #카페 #분위기 #소개팅',
        //     imageUrl: 'http://mud-kage.kakao.co.kr/dn/Q2iNx/btqgeRgV54P/VLdBs9cvyn8BJXB3o7N8UK/kakaolink40_original.png',
        //     link: {
        //       mobileWebUrl: 'https://developers.kakao.com',
        //       webUrl: 'https://developers.kakao.com'
        //     }
        //   },
        //   social: {
        //     likeCount: 286,
        //     commentCount: 45,
        //     sharedCount: 845
        //   },
        //   buttons: [
        //     {
        //       title: '웹으로 보기',
        //       link: {
        //         mobileWebUrl: 'https://developers.kakao.com',
        //         webUrl: 'https://developers.kakao.com'
        //       }
        //     },
        //     {
        //       title: '앱으로 보기',
        //       link: {
        //         mobileWebUrl: 'https://developers.kakao.com',
        //         webUrl: 'https://developers.kakao.com'
        //       }
        //     }
        //   ]
        // });
      //]]>