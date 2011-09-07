package sigesti

class AreaResponsavel {
  String descricao

  static constraints = {
    descricao(blank:false, maxSize:64, unique:true)
  }

  static mapping = {
    // version false
    id column:'id_area_responsavel'
    id generator:'sequence', params:[sequence:'id_area_responsavel_sequence']
  }

  String toString() {
    descricao
  }
}