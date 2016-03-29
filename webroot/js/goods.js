console.log('loaded');

function getXMLHttpRequest()
{
    if (window.XMLHttpRequest) {
        return new XMLHttpRequest();
    }

    return new ActiveXObject('Microsoft.XMLHTTP');
}

request = getXMLHttpRequest();
request_g = getXMLHttpRequest();

request.onreadystatechange = function() {
    if (request.readyState == 4) {
        $(document).ready(function () {
            $('#overlay').fadeIn(400,
                function () {
                    $('#modal_form')
                        .css('display', 'block')
                        .animate({opacity: 1, top: '50%'}, 200);
                });
        });

        $(' #overlay, #back').click(function () {
            $('#modal_form')
                .animate({opacity: 0, top: "45%"}, 200,
                    function () {
                        $(this).css('display', 'none');
                        $('#overlay').fadeOut(400);
                    }
                );
        });
    }
};

request_g.onreadystatechange = function() {
    if (request_g.readyState == 4) {
        $(document).ready(function () {
            $('#overlay').fadeIn(400,
                function () {
                    $('#modal_form')
                        .css('display', 'block')
                        .animate({opacity: 1, top: '50%'}, 200);
                });
        });

        $(' #overlay, #back').click(function () {
            $('#modal_form')
                .animate({opacity: 0, top: "45%"}, 200,
                    function () {
                        $(this).css('display', 'none');
                        $('#overlay').fadeOut(400);
                    }
                );
        });
    }
};




function updateCart(obj) {
    var children = obj.children;
    var params = [];
    for (var i=0; i < children.length - 1; i++) {
        params.push(children[i].name + '=' + children[i].value);
    }
    params = params.join('&');
    request_g.open('POST', '/add.php', true);
    request_g.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    request_g.send(params);
}


function updateCartG(obj) {
    var children = obj.children;
    var params = [];
    for (var i=0; i < children.length - 1; i++) {
        params.push(children[i].name + '=' + children[i].value);
    }
    params = params.join('&');
    request.open('POST', '/add_g.php', true);
    request.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    request.send(params);
}




