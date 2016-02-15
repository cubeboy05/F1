
$('document').ready(function(){
    //load nav data for driver
    $.getJSON( "http://karsv.com/formulaone/driver_navbar.php", function( data ) {
        $.each( data, function( key, val ) {
            $("#driver").append('<li><a href="#">' + val.driver + '</a></li>');
        });
    });

    //load nav data for race
    $.getJSON( "http://karsv.com/formulaone/race_navbar.php", function( data ) {
        $.each( data, function( key, val ) {
            $("#race").append('<li><a href="#">' + val.race + '</a></li>');
        });
    });
});