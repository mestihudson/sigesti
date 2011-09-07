window.onload = init;

function init() {
	var textarea = new Array();
	textarea = document.getElementsByTagName('textarea');
	var i=0;
 	for(i=0; i<textarea.length; i++) {
		progresso_tecla(textarea[i].id);
 	}
}

function progresso_tecla(objeto) {
	var max=1024;
	var areadetexto = document.getElementById(objeto);
	var informacao = document.getElementById(objeto+"_restantes");
	var total = areadetexto.value.length;
	var resto = max - total;

	if (total < max) {
		if (total == 0) {
			informacao.style.backgroundColor = "#F5F5F5";
			informacao.style.color = "#000000";
		}
		else {
			informacao.style.backgroundColor = "#008000";
			informacao.style.color = "#ffffff";
		}
	} else if (total == max) {
		informacao.style.backgroundColor = "#DB0000";
		informacao.style.color = "#ffffff";
	} else {
		areadetexto.value = areadetexto.value.substr(0,max);
	}
	informacao.innerHTML = "Caracteres restantes: " + resto;
}
