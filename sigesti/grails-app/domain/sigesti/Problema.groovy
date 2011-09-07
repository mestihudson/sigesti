package sigesti

class Problema {
	AreaResponsavel area_responsavel
  String descricao
  String possivel_causa
  SLA sla
  Solucao solucao

  static constraints = {
    descricao(blank:false, maxSize:1024, widget:'textArea')
    possivel_causa(blank:true, maxSize:1024, widget:'textArea')
    area_responsavel(nullable:false)
    sla(nullable:true)
    solucao(nullable:true)
  }

  static mapping = {
    // version false
    id column:'id_problema'
    id generator:'sequence', params:[sequence:'id_problema_sequence']
  }

  String toString() {
    descricao
  }
}