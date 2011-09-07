package sigesti

class Emprestimo {
  Date data_devolucao
  Date data_emprestimo = new Date()
  Date data_limite
  Equipamento equipamento
  String justificativa
	String observacao
	Usuario responsavel
	Usuario solicitante

	static constraints = {
		data_emprestimo(nullable:false, editable:false)
		data_limite(nullable:false)
    data_devolucao(nullable:true, editable:false)
		justificativa(blank:false, maxSize:1024, widget:'textArea')
		observacao(blank:true, maxSize:1024, widget:'textArea')
		equipamento(nullable:false)
		responsavel(nullable:false)
		solicitante(nullable:false)
	}

	static mapping = {
		// version false
		id column:'id_emprestimo'
		id generator:'sequence', params:[sequence:'id_emprestimo_sequence']
	}

	String toString() {
    equipamento
  }
}