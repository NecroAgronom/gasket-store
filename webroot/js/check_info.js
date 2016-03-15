

function open_del(){
    event.preventDefault();
    $('#overlay').fadeIn(400,
        function(){
            $('#modal_del')
                .css('display', 'block')
                .animate({opacity: 1, top: '50%'}, 200);
        });
}

function close_del(){
    $('#modal_del')
        .animate({opacity: 0, top: '45%'}, 200,
            function(){
                $(this).css('display', 'none');
                $('#overlay').fadeOut(400);
            }
        );
}

    function open_pay(){
        event.preventDefault();
        $('#overlay').fadeIn(400,
            function(){
                $('#modal_pay')
                    .css('display', 'block')
                    .animate({opacity: 1, top: '50%'}, 200);
            });
    }

    function close_pay(){
        $('#modal_pay')
            .animate({opacity: 0, top: '45%'}, 200,
                function(){
                    $(this).css('display', 'none');
                    $('#overlay').fadeOut(400);
                }
            );
    }