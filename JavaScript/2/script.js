function buttonClick(){
	var x1 = parseInt(document.getElementById('x1').value);
	var x2 = parseInt(document.getElementById('x2').value);
	var elements = document.getElementsByName("radio");


	if (x1 === "" || x2 === "") {
		alert("Поля х1 и х2 должны быть заполнены!");
	}
	else if (Number.isNaN(x1) || Number.isNaN(x2)) {
		alert("В поля х1 и х2 должны быть введены числовые значения!");
	}
	else if (x1 > x2) {
		var change = x1;
		x1 = x2;
		x2 = change;
	}
	else {
		elements.forEach(el => {
            if (el.checked && el.value === "radio1") {
                var resultDiv = document.getElementById('result');
                resultDiv.innerHTML = "Сумма всех чисел от x1 до x2 = " + summ(x1, x2);
            } else if (el.checked && el.value === "radio2"){
                var resultDiv = document.getElementById('result');
                resultDiv.innerHTML = "Произведение всех чисел от x1 до x2 = " + multi(x1, x2);
            }
        });
    }
}
		
function summ(x1, x2){
    var sum=0;
    for (var i = x1; i<=x2; i++){
        sum+=i;
    }
    return sum;
}

function multi(x1, x2){
    var mult=1;
    for (var i = x1; i<=x2; i++){
        mult*=i;
    }
    return mult;
}

function Clean() {
	document.getElementById("x1").value = " ";
	document.getElementById("x2").value = " ";
}