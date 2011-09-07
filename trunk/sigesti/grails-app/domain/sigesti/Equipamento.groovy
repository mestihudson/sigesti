package sigesti

class Equipamento {
  Categoria categoria
  Date data_cadastro = new Date()
  String descricao
  boolean disponibilidade = true
  String fabricante
  Lotacao lotacao
  String modelo
  String num_serie
  String observacao
  String patrimonio

  static constraints = {
		disponibilidade(display:false, editable:false)
    data_cadastro(nullable:false, editable:false)
    descricao(blank:false, maxSize:1024, widget:'textArea')
    fabricante(blank:false, maxSize:64)
    modelo(blank:false, maxSize:64)
    num_serie(blank:false, maxSize:64)
    observacao(blank:true, maxSize:128)
    patrimonio(blank:false, maxSize:64, unique:true)
    categoria(nullable:true)
    lotacao(nullable:true)
  }

  static mapping = {
    // version false
    id column:'id_equipamento'
    id generator:'sequence', params:[sequence:'id_equipamento_sequence']
  }

  String toString() {
    descricao
  }
}