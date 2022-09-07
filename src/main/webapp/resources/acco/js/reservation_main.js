let selectedLocation = ''; //텍스트
let selectedLocationIdx = ''; //IDX
let selectedPeople = '';

function decrease(element_id) {
  let count = document.querySelector('#' + element_id).innerHTML;
  count = parseInt(count);
  if (count > 0) {
    count = count - 1;
    document.querySelector('#' + element_id).innerHTML = count;
  }
}

function increase(element_id) {
  let count = document.querySelector('#' + element_id).innerHTML;
  count = parseInt(count);
  if (count < 10) count = count + 1;
  document.querySelector('#' + element_id).innerHTML = count;
}

// 위시리스트
document.addEventListener('DOMContentLoaded', () => {
  const icons = document.querySelectorAll('.heart_icon');

  function handleClick(event) {
    if (event.target.closest('.heart_icon').classList.contains('act')) {
      event.target.closest('.heart_icon').classList.remove('act');
    } else {
      event.target.closest('.heart_icon').classList.add('act');
      document.getElementById('wishlist_modal').style.display = 'block';
      // 하트 버튼 클릭 시 모달창 나타남(display: none → block)
    }
  }
  for (let i = 0; i < icons.length; i++) {
    let icon = icons[i];
    icon.addEventListener('click', handleClick);
  }
});

$(function () {
  // $('.header').load('header.html');
  // $('.footer').load('footer.html');

  $('.okBtn').click(function () {
    $('#wishlist_modal').css({ display: 'none' });
  }); // 확인 버튼 클릭 시 모달창 사라짐(display: block → none)

  $('.travel_btn').click(function () {
    $('#location_modal').css({ display: 'block' });
  }); //여행지 선택시 모달창 열림

  $('.person_btn').click(function () {
    $('#personModal').css({ display: 'block' });
  }); //인원 선택시 모달창 열림

  $('.person_apply_btn').click(function () {
    $('#personModal').css({ display: 'none' });
  }); //인원취소 선택시 모달창 닫기

  $('.location_select').click(function () {
    // console.log(selectedLocation);
    $('#travel_btn').text(selectedLocation);
    $('#travel_btn').val(selectedLocationIdx);
    $('#location_modal').css({ display: 'none' });
  }); //여행지 > 선택완료시 닫힘

  $('.location_cancel').click(function () {
    $('#location_modal').css({ display: 'none' });
  }); //여행지 > 취소 > 닫힘

  $('#location_list li button').on('click', function (e) {
    selectedLocation = e.target.innerHTML;
    selectedLocationIdx = e.target.value;
    $('#location_list li button').removeClass('act');
    $(this).toggleClass('act');
  });

  $('#datepicker').datepicker({
    language: 'ko',
  });
  $('#datepicker2').datepicker({
    language: 'ko',
  });
  
    //인원수반영
  $('#person_okbtn').click(function () {
    let countAdult = $('#adult_count').text();
    let countChild = $('#child_count').text();
    $('#person_btn').text(`성인 - ${countAdult}명 / 유아 - ${countChild}명`);
  });
  
  // 검색결과 조회
  $("#search_btn").on("click", function () {
    let locationIdx = $('#travel_btn').val();

    
  });
});
