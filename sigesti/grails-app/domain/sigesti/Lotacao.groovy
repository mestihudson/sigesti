package sigesti

class Lotacao {
  String nome
  String sigla
  String telefone

  static constraints = {
    nome(blank:false, maxSize:64, unique:true)
    sigla(blank:false, maxSize:16, unique:true)
    telefone(blank:false, maxSize:16, unique:true)
  }

  static mapping = {
    // version false
    id column:'id_lotacao'
    id generator:'sequence', params:[sequence:'id_lotacao_sequence']
  }

  String toString() {
    nome
  }
}