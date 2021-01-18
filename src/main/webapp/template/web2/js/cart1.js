	
document.addEventListener("DOMContentLoaded", function() {
    var cong = document.getElementsByClassName("quantity_inc");
    var tru = document.getElementsByClassName("quantity_dec");

    for (let i = 0; i < cong.length; i++) {
        cong[i].onclick = function() {
            var id = document.getElementsByClassName("quantity_input")[i].value;
			var idd = document.getElementsByClassName("cart_item_price")[i].getAttribute("data-value");
			var temp1 = parseInt(idd);
            var temp = parseInt(id) + 1;
            document.getElementsByClassName("quantity_input")[i].value = temp;
			var result = temp*temp1;
			document.getElementsByClassName("cart_item_total")[i].innerHTML = "$"+result.toString();
			
			var size = document.getElementsByClassName("quantity_input");
			var total_value = 0;
			for(let j = 0 ; j < size.length ; j++) {
				var quantity_input = document.getElementsByClassName("quantity_input")[j].value;
				var cart_item_price = document.getElementsByClassName("cart_item_price")[j].getAttribute("data-value");
				total_value = total_value + parseInt(quantity_input)*parseInt(cart_item_price);
			}
			document.getElementById("cart_total_value").innerHTML = "$"+ total_value;
			document.getElementById("cart_total_value_1").innerHTML = "$"+total_value;
			
        };
        tru[i].onclick = function() {
            var id = document.getElementsByClassName("quantity_input")[i].value;
			var idd = document.getElementsByClassName("cart_item_price")[i].getAttribute("data-value");
            var temp = parseInt(id) - 1;
			var temp1 = parseInt(idd);
            if (temp == 0) return;
            else {
			document.getElementsByClassName("quantity_input")[i].value = temp;
			var result = temp*temp1;
			document.getElementsByClassName("cart_item_total")[i].innerHTML ="$"+result.toString();
			
			var size = document.getElementsByClassName("quantity_input");
			var total_value = 0;
			for(let j = 0 ; j < size.length ; j++) {
				var quantity_input = document.getElementsByClassName("quantity_input")[j].value;
				var cart_item_price = document.getElementsByClassName("cart_item_price")[j].getAttribute("data-value");
				total_value = total_value + parseInt(quantity_input)*parseInt(cart_item_price);
			}
			document.getElementById("cart_total_value").innerHTML ="$"+ total_value;
			document.getElementById("cart_total_value_1").innerHTML ="$"+ total_value;
				}
        }
    }

}, false);