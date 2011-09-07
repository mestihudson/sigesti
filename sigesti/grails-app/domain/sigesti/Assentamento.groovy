package sigesti

class Assentamento {
	Chamado chamado
  String descricao

  static constraints = {
		chamado(nullable:false)
    descricao(blank:false, maxSize:1024, widget:'textArea')
  }

  static mapping = {
    // version false
    id column:'id_assentamento'
    id generator:'sequence', params:[sequence:'id_assentamento_sequence']
  }

  String toString() {
    descricao
  }
}