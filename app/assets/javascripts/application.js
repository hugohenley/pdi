// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

function totalCusteio() {
    var total = 0
    total += $("#inputValorMaterialConsumo")[0].value == "" ? 0 : parseFloat($("#inputValorMaterialConsumo")[0].value.replace(",", "."));
    total += $("#inputValorDiariasPassagens")[0].value == "" ? 0 : parseFloat($("#inputValorDiariasPassagens")[0].value.replace(",", "."));
    total += $("#inputValorBolsasAlunos")[0].value == "" ? 0 : parseFloat($("#inputValorBolsasAlunos")[0].value.replace(",", "."));
    total += $("#inputValorBolsasOutros")[0].value == "" ? 0 : parseFloat($("#inputValorBolsasOutros")[0].value.replace(",", "."));
    total += $("#inputValorPJ")[0].value == "" ? 0 : parseFloat($("#inputValorPJ")[0].value.replace(",", "."));
    total += $("#inputValorPF")[0].value == "" ? 0 : parseFloat($("#inputValorPF")[0].value.replace(",", "."));
    document.getElementById('total_custeio').innerHTML = "R$ " + (total).toString()
}

function totalCapital() {
    var total = 0
    total += $("#inputValorEquipamentos")[0].value == "" ? 0 : parseFloat($("#inputValorEquipamentos")[0].value.replace(",", "."));
    total += $("#inputValorMobiliarios")[0].value == "" ? 0 : parseFloat($("#inputValorMobiliarios")[0].value.replace(",", "."));
    total += $("#inputValorObrasInstalacoes")[0].value == "" ? 0 : parseFloat($("#inputValorObrasInstalacoes")[0].value.replace(",", "."));
    document.getElementById('total_capital').innerHTML = "R$ " + (total).toString()
}


function adicionaAcao() {
    $('#acao').append('<tr><td><input class="form-control" id="inputDescricaoAcao1" name="metodologia[descricao][]" placeholder="Descrição" type="text" /></td><td><input class="form-control" id="inputPublicoAcao1" name="metodologia[publico][]" placeholder="Público" type="text" /></td><td class="warning"><input class="form-control" id="inputCronogramaQ1Acao1" name="metodologia[q1acao][]" placeholder="%" type="text" /></td><td class="warning"><input class="form-control" id="inputCronogramaQ2Acao1" name="metodologia[q2acao][]" placeholder="%" type="text" /></td><td class="warning"><input class="form-control" id="inputCronogramaQ3Acao1" name="metodologia[q3acao][]" placeholder="%" type="text" /></td></tr>')
}
function limitaTextoJustificativa(valor) {
    quantidade = 1000;
    total = valor.length;

    if (total <= quantidade) {
        resto = quantidade - total;
        document.getElementById('caracteresJustificativa').innerHTML = resto;
    } else {
        document.getElementById('inputJustificativa').value = valor.substr(0, quantidade);
    }
}

function limitaTextoObjetivos(valor) {
    quantidade = 1000;
    total = valor.length;

    if (total <= quantidade) {
        resto = quantidade - total;
        document.getElementById('caracteresObjetivos').innerHTML = resto;
    } else {
        document.getElementById('inputObjetivos').value = valor.substr(0, quantidade);
    }
}

var minuto = 30;
var segundo = 60;
var sessaoExpirada = false;

function mostraTempoSessao() {
    if (sessaoExpirada) {
        div = document.getElementById('sessao');
        div.style.color = 'red';
        div.style.textDecoration = 'blink';
        div.innerHTML = 'Sessão expirada!'

    } else {
        setTimeout('mostraTempoSessao()', 1000);
        segundo = (segundo == 0 ? 59 : segundo - 1);
        minuto = (segundo == 59 ? minuto - 1 : minuto);
        document.getElementById('sessao').innerHTML = minuto + ' min ' + ( segundo < 10 ? '0' + segundo : segundo) + ' s';
    }
}

