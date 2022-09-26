$(function() {
    $('#btn_plan').click(function() {
        $('#map').css('display','none');
        $('#maplist').css('display','none');
        $('#othersPlanModal').css('display','block');
        
    })

    $(function () {
        $('addOkBtn').click(function () {
            $('#othersPlanModalWrapper').fadeIn();
        })
    })

    
    $(function () {
        $('.planClose').click(function () {
            $("#othersPlanModalWrapper").fadeOut();
        })
    })
})
