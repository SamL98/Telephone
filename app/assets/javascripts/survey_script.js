$(document).on("ready", function() {
    var firstEditOccurred = false;
    var start, end = Date.now();
    var hidePassage = function() {
        var input = $('#input');
        input.animate({ height: "70vh" }, 250, "swing", function() {
            input.show();
        });
        var passage = $('#passage');
        passage.animate({ height: "0vh" }, 250, "swing", function() {
            passage.hide();
        });
        var submit = $('#submit');
        submit.show();
    }
    setTimeout(hidePassage, 30 * 1000);
    var editingOccurred = function() {
        if (!firstEditOccurred) {
            start = Date.now();
            firstEditOccurred = true;
        } else {
            end = Date.now();
        }
        document.getElementById("timeIn").value = end - start;
        document.getElementById("submitButton").disabled = false;
    };
    document.getElementById("input").addEventListener("keypress", editingOccurred);
});
