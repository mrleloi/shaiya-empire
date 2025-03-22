
$(document).ready(function () {
    $('[data-toggle="tooltip"]').tooltip();

    // Server time tick.
    var interval = 1000;
    var expected = Date.now();
    var dt = new Date();
    var serverTimeString = $("#server-time").text();
    let [hours, minutes, seconds] = serverTimeString.split(':');
    dt.setHours(hours);
    dt.setMinutes(minutes);
    dt.setSeconds(seconds);
    serverTimeTick();

    function serverTimeTick() {
        dt.setSeconds(dt.getSeconds() + 1);
        $("#server-time").text(dt.toLocaleTimeString("en-US"));

        var drift = Date.now() - expected; // the drift (positive for overshooting)
        expected += interval;
        setTimeout(serverTimeTick, Math.max(0, interval - drift)); // take into account drift
    }
});
