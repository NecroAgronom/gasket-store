/**
 * Created by Андрей on 29.02.2016.
 */
function validate_message(){

    var name=document.forms["message"]["name"].value;
    var email=document.forms["message"]["email"].value;
    var message=document.forms["message"]["message"].value;



    if (name.length == 0){
        document.getElementById("names").innerHTML="&#9650 данное поле обязательно для заполнения";
        return false;
    } else {
        document.getElementById("names").innerHTML="";
    }

    if (email.length == 0){
        document.getElementById("emails").innerHTML="&#9650 данное поле обязательно для заполнения";
        return false;
    } else {
        document.getElementById("emails").innerHTML="";
    }
    if (message.length == 0){
        document.getElementById("messages").innerHTML="&#9650 данное поле обязательно для заполнения";
        return false;
    } else {
        document.getElementById("messages").innerHTML="";
    }


    var re_mail = /^[\w-\.]+@[\w-]+\.[a-z]{2,3}$/i;


    if (!re_mail.test(email)){
        document.getElementById("emails").innerHTML="&#9650 email введен неверно";
        return false;
    } else {
        document.getElementById("emails").innerHTML="";
    }



}