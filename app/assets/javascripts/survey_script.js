var hidePassage = function() {
    console.log('hiding passage');
    $('#input').animate({ height: "15em" }, 250);
    $('#passage').animate({ height: "0" }, 250, "swing", function() {
        document.getElementById("passage").display = "none";
    });
}
$('#input').focus(function() {
    hidePassage();
});
setTimeout(hidePassage, 60 * 1000);
var editingBegan = function() {
    document.getElementById("submitButton").disabled = false;
};
document.getElementById("input").addEventListener("keypress", editingBegan);