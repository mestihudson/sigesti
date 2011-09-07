package sigesti

class Solucao {
  String solucao

  static constraints = {
    solucao(blank:false, maxSize:1024, widget:'textArea')
  }

  static mapping = {
    // version false
    id column:'id_solucao'
    id generator:'sequence', params:[sequence:'id_solucao_sequence']
  }

  String toString() {
    solucao
  }
}