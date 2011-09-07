package sigesti

class Garantia {
	String descricao
	String detalhes

  static constraints = {
		descricao(blank:false, maxSize:64)
		detalhes(blank:true, maxSize:1024, widget:'textArea')
  }

	static mapping = {
		// version false
		id column:'id_garantia'
		id generator:'sequence', params:[sequence:'id_garantia_sequence']
  }

	String toString() {
		descricao
	}
}