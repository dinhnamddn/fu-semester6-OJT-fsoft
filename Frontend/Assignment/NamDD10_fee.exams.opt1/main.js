var plus1st = document.getElementById('plus1st');
var plus2nd = document.getElementById('plus2nd');
var plus3rd = document.getElementById('plus3rd');

var minus1st = document.getElementById('minus1st');
var minus2nd = document.getElementById('minus2nd');
var minus3rd = document.getElementById('minus3rd');

var remove1st = document.getElementById('remove1st');
var remove2nd = document.getElementById('remove2nd');
var remove3rd = document.getElementById('remove3rd');

var quantity1st = document.getElementById('quantity1st');
var quantity2nd = document.getElementById('quantity2nd');
var quantity3rd = document.getElementById('quantity3rd');

function plus1(index) {
    if (index == 1) {
        quantity1st.value++;
    }
    if (index == 2) {
        quantity2nd.value++;
    }
    if (index == 3) {
        quantity3rd.value++;
    }
    calulate();
}

function minus1(index) {
    if (index == 1) {
        if (quantity1st.value > 1) {
            quantity1st.value--;
        }
    }
    if (index == 2) {
        if (quantity2nd.value > 1) {
            quantity2nd.value--;
        }
    }
    if (index == 3) {
        if (quantity3rd.value > 1) {
            quantity3rd.value--;
        }
    }
    calulate();
}

function remove(index) {
    if (index == 1) {
        document.getElementById('product1').remove();
    }
    if (index == 2) {
        document.getElementById('product2').remove();
    }
    if (index == 3) {
        document.getElementById('product3').remove();
    }
}

var tax1 = document.getElementById('tax1');
var tax2 = document.getElementById('tax2');
var tax3 = document.getElementById('tax3');

let price1 = document.getElementById('price1');
let price2 = document.getElementById('price2');
let price3 = document.getElementById('price3');

var total1 = document.getElementById('total1');
var total2 = document.getElementById('total2');
var total3 = document.getElementById('total3');

var totalPrice = document.getElementById('total-price');
var totalDiscount = document.getElementById('total-discount');
var totalTax = document.getElementById('total-tax');

var discount1 = document.getElementById('discount1');
var discount2 = document.getElementById('discount2');
var discount3 = document.getElementById('discount3');

function calulate() {
    tax1.value = price1.value * quantity1st.value * 0.125;
    tax2.value = price2.value * quantity2nd.value * 0.125;
    tax3.value = price3.value * quantity3rd.value * 0.125;

    total1.value = quantity1st.value * price1.value;
    total2.value = quantity2nd.value * price2.value;
    total3.value = quantity3rd.value * price3.value;

    totalPrice.value = total1.value * 1 + total2.value * 1 + total3.value * 1;
    totalDiscount.value = discount1.value * 1 + discount3.value * 1;
    totalTax.value = tax1.value * 1 + tax2.value * 1 + tax3.value * 1;
}
