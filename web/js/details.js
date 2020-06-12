function num_change() {
    var num = document.getElementById("buy_num").value;
    var show_prize = document.getElementById("show_prize").innerHTML;
    var end = parseFloat(num);
    var end_p = Number(show_prize);
    document.getElementById('all_prize').innerHTML = end*end_p;
}
function num_add() {
    var num = document.getElementById("buy_num").value;
    var show_prize = document.getElementById("show_prize").innerHTML;
    var end = parseFloat(num);
    var end_p = Number(show_prize);
    document.getElementById('buy_num').value = end+1;
    document.getElementById('all_prize').innerHTML = (end+1)*end_p;
}
function num_minus() {
    var num = document.getElementById("buy_num").value;
    var show_prize = document.getElementById("show_prize").innerHTML;
    var end = parseFloat(num);
    var end_p = Number(show_prize);
    if (end<=1)
    {
        alert("At least 1");
        return ;
    }
    document.getElementById('buy_num').value = end-1;
    document.getElementById('all_prize').innerHTML = (end-1)*end_p;
}
function buy() {
    var href = "indent.jsp?product_id="+document.getElementById("product_id").innerHTML+"&buy_num="+document.getElementById("buy_num").value;
    window.location.href = href;
}