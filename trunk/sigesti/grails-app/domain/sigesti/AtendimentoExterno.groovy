package sigesti

class AtendimentoExterno {
	AssistenciaTecnica assistencia_tecnica
  Chamado chamado
  Double custo
  Date data_retorno
  Date data_saida = new Date()
  String descricao
  Garantia garantia

  static constraints = {
		chamado(nullable:false)
		assistencia_tecnica(nullable:false)
    data_saida(nullable:false, editable:false)
    descricao(blank:false, maxSize:1024, widget:'textArea')
    custo(nullable:true, maxSize:32)
    data_retorno(nullable:true)
    garantia(nullable:true)
  }

  static mapping = {
    // version false
    id column:'id_atendimento_externo'
    id generator:'sequence', params:[sequence:'id_atendimento_externo_sequence']
  }

  String toString() {
	  descricao
  }
}