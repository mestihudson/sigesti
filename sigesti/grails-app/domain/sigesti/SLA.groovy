package sigesti

class SLA {
  String descricao
	Integer tempo

  static constraints = {
    descricao(blank:false, maxSize:64)
		tempo(blank:false, maxSize:64)
  }

	static mapping = {
		// version false
		id column:'id_sla'
		id generator:'sequence', params:[sequence:'id_sla_sequence']
	}

	String toString() {
		descricao
	}
}