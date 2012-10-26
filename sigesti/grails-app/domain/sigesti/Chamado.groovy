package sigesti

class Chamado {
	AreaResponsavel area_responsavel
	Date data_abertura = new Date()
	Date data_encerramento
	String desc_chamado
	String desc_problema
	String desc_solucao
	Equipamento equipamento
	Usuario operador
	Problema problema
	Usuario usuario

	static constraints = {
		desc_problema(blank:true, maxSize:1024, widget:'textArea')
		data_abertura(nullable:false, editable:false)
		data_encerramento(nullable:true)
		desc_chamado(blank:false, maxSize:1024, widget:'textArea')
		area_responsavel(nullable:true)
		operador(nullable:true)
		usuario(nullable:false)
		problema(nullable:true)
		desc_solucao(blank:true, maxSize:1024, widget:'textArea')
		equipamento(nullable:true)
	}
//teste
	static mapping = {
		id column:'id_chamado'
		id generator:'sequence', params:[sequence:'id_chamado_sequence']
	}

	String toString() {
    id
  }
}