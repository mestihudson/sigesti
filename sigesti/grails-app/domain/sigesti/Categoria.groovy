package sigesti

class Categoria {
  String descricao

  static constraints = {
    descricao(blank:false, maxSize:64, unique:true)
  }

  static mapping = {
    // version false
    id column:'id_categoria'
    id generator:'sequence', params:[sequence:'id_categoria_sequence']
  }

  String toString() {
    descricao
  }
}