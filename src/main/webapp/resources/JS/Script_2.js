//User dropdown menu and playback tab view:

function dropdown() {
    document.getElementById("myDropdown").classList.toggle("show");
}

window.onclick = function(event) {
    if (!event.target.matches(".hello")) {

        var dropdowns = document.getElementsByClassName("dropdown-content");
        var i;
        for (i = 0; i < dropdowns.length; i++) {
            var openDropdown = dropdowns[i];
            if (openDropdown.classList.contains("show")) {
                openDropdown.classList.remove("show");
            }
        }
    }
}

function openGenre(evt, genreName) {

    var i, tabcontent, tablinks;

    tabcontent = document.getElementsByClassName("tabcontent");
    for (i = 0; i < tabcontent.length; i++) {
        tabcontent[i].style.display = "none";
    }
    tablinks = document.getElementsByClassName("tablinks");
    for (i = 0; i < tablinks.length; i++) {
        tablinks[i].className = tablinks[i].className.replace(" active", "");
    }
    document.getElementById(genreName).style.display = "block";
    evt.currentTarget.className += " active";

}

$('.repeat').on('click', function(){
    $(this).toggleClass('selected');
});

function toggleDescription(){
    $("textarea").each(function(){
        var elem = this;
        elem.style.visibility = elem.style.visibility == 'hidden' ? 'visible' : 'hidden';
    });}


var audios = document.getElementsByTagName('audio');
var previous = 0;

//Button finds and pauses current playing track
function masterPause() {
    for(i=0; i<audios.length; i++) audios[i].pause();
}

//Pause audio when new track played
document.addEventListener('play', function(e){
    for(i = 0; i < audios.length; i++){
        if(audios[i] != e.target){
            audios[i].pause();
        }
    }
}, true);


function random() {
    try {
        var list = audios.length;
        var randomNum = Math.ceil(Math.random() * list - 1);
        if (randomNum == previous) {
            random();
        }
        previous = randomNum;
        audios[randomNum].play();
    } catch (TypeError){
        random();
    }
}


function loop() {
    $("audio").each(function() {
        var elem = this;
        elem.loop = elem.loop == false;
    });}