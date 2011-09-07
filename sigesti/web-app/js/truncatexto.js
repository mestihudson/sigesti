window.onload = init;

function init() {
	var txtParaQuebrar = new Array();
	txtParaQuebrar = document.getElementsByClassName('textoquebrado');
 	var i=0;
	for(i=0; i<txtParaQuebrar.length; i++) {
		txtParaQuebrar[i].innerHTML = truncar(txtParaQuebrar[i].innerHTML,32);
 	}
}

function truncar(texto,limite) {
	if(texto.length>limite) {
		limite--;
		last = texto.substr(limite-1,1);
		while(last != ' ' && limite > 0) {
			limite--;
			last = texto.substr(limite-1,1);
		}
		last = texto.substr(limite-2,1);
		if(last == ',' || last == ';'  || last == ':') {
			 texto = texto.substr(0,limite-2) + '...';
		} else if(last == '.' || last == '?' || last == '!') {
			 texto = texto.substr(0,limite-1);
		} else {
			 texto = texto.substr(0,limite-1) + '...';
		}
	}
	return texto;
}
