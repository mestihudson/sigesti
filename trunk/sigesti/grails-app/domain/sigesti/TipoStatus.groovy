package sigesti

class TipoStatus {
  String descricao

  static constraints = {
    descricao(blank:false, maxSize:64, unique:true)
  }

  static mapping = {
    // version false
    id column:'id_tipo_status'
    id generator:'sequence', params:[sequence:'id_tipo_status_sequence']
  }

  String toString() {
    descricao
  }
}