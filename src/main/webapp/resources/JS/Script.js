function main(){
    $('.window_1').hide();
    $('.window_1').fadeIn(1000);
}

$(document).ready(main);

function age() {
    var $select = $(".age");
    for (i=12;i<=60;i++){
        $select.append($('<option></option>').val(i).html(i))
    }}

$(document).ready(age());

function CheckPasswordMatch() {
    var $password = $("#pass").val();
    var $confirmPassword = $("#confirm").val();

    //Prevent user from receiving mismatch notification if has not begun typing in confirm pass text box
    if ($confirmPassword !== '') {

        if ($password !== $confirmPassword){
            $("#divCheckPasswordMatch").html("Passwords do not match!");
            $("#send").prop("disabled", true);
        } else {
            $("#divCheckPasswordMatch").html("");
            $("#send").prop("disabled", false);
        }
    } else {
        $("#divCheckPasswordMatch").html("");
    }
}

$(document).ready(function () {
    $("#pass, #confirm").keyup(CheckPasswordMatch);
});

