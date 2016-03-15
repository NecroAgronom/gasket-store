



request_cart = getXMLHttpRequest();

request_cart.onreadystatechange = function() {
    if (request_cart.readyState == 4) {
        window.location.reload();
    }
};

function incQuant(obj)
{
    var children = obj.children;
    var params = [];
    for (var i=0; i < children.length - 1; i++) {
        params.push(children[i].name + '=' + children[i].value);
    }
    params = params.join('&');
    request_cart.open('POST', '/inc.php', true);
    request_cart.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    request_cart.send(params);
}

function decQuant(obj)
{
    var children = obj.children;
    var params = [];
    for (var i=0; i < children.length - 1; i++) {
        params.push(children[i].name + '=' + children[i].value);
    }
    params = params.join('&');
    request_cart.open('POST', '/dec.php', true);
    request_cart.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    request_cart.send(params);
}