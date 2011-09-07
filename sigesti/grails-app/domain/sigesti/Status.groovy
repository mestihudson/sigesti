package sigesti

class Status {
	Chamado chamado
	Date data_final
	Date data_inicial = new Date()
	TipoStatus tipo_status

	static constraints = {
		chamado(nullable:false)
		tipo_status(nullable:false)
		data_final(nullable:true)
		data_inicial(nullable:false, editable:false)
	}

	static mapping = {
		// version false
		id column:'id_status'
		id generator:'sequence', params:[sequence:'id_status_sequence']
	}

	String toString() {
		tipo_status
	}
}