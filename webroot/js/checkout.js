/**
 * Created by Андрей on 28.02.2016.
 */
//var order_form = document.forms.order;


function showElement(elem){
    elem.style.display = 'block';
}

function hideElement(elem){
    elem.style.display = 'none';
}

function validate_order(){

    var name=document.forms["order"]["name"].value;
    var phone=document.forms["order"]["phone"].value;
    var email=document.forms["order"]["email"].value;
    var delivery=document.forms["order"]["delivery"].value;
    var city=document.forms["order"]["city"].value;
    var dept=document.forms["order"]["dept"].value;
    var payment=document.forms["order"]["payment"].value;


    if (name.length == 0){
        document.getElementById("namef").innerHTML="&#9650 данное поле обязательно для заполнения";
        event.preventDefault();
        var target_top= $('#checkout-target').offset().top;
        $('html, body').animate({scrollTop:target_top}, 'slow');
        return false;



    } else {
        document.getElementById("namef").innerHTML="";
    }

    if (phone.length == 0){
        document.getElementById("phonef").innerHTML="&#9650 данное поле обязательно для заполнения";
        event.preventDefault();
        var target_top= $('#checkout-target').offset().top;
        $('html, body').animate({scrollTop:target_top}, 'slow');
        return false;

    } else {
        document.getElementById("phonef").innerHTML="";
    }
    if (email.length == 0){
        document.getElementById("emailf").innerHTML="&#9650 данное поле обязательно для заполнения";
        event.preventDefault();
        var target_top= $('#checkout-target').offset().top;
        $('html, body').animate({scrollTop:target_top}, 'slow');
        return false;

    } else {
        document.getElementById("emailf").innerHTML="";
    }


    if (document.getElementById('nova_poshta_radio').checked && city.length == 0){
        document.getElementById("cityf").innerHTML="&#9650 укажите город";
        event.preventDefault();
        var target_top= $('#target-2').offset().top;
        $('html, body').animate({scrollTop:target_top}, 'slow');
        return false;

    }
    if (document.getElementById('nova_poshta_radio').checked && dept.length == 0){
        document.getElementById("deptf").innerHTML="&#9650 укажите отделение";
        event.preventDefault();
        var target_top= $('#target-2').offset().top;
        $('html, body').animate({scrollTop:target_top}, 'slow');
        return false;

    }


    at=email.indexOf("@");
    dot=email.indexOf(".");

    var re_mail = /^[\w-\.]+@[\w-]+\.[a-z]{2,3}$/i;
    var re_phone = /^\d[\d\(\)\ -]{4,14}\d$/;

    if (!re_mail.test(email)){
        document.getElementById("emailf").innerHTML="&#9650 email введен неверно";
        event.preventDefault();
        var target_top= $('#checkout-target').offset().top;
        $('html, body').animate({scrollTop:target_top}, 'slow');
        return false;

    } else {
        document.getElementById("emailf").innerHTML="";
    }

    if (!re_phone.test(phone)){
        document.getElementById("phonef").innerHTML="&#9650 номер телефона введен неверно";
        event.preventDefault();
        var target_top= $('#checkout-target').offset().top;
        $('html, body').animate({scrollTop:target_top}, 'slow');
        return false;

    } else {
        document.getElementById("phonef").innerHTML="";
    }

}




