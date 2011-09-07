package sigesti

class Endereco {
  String cep
  String cidade
  String logradouro
  String uf

  static constraints = {
		logradouro(blank:false, maxSize:256)
    cidade(blank:false, maxSize:64)
    uf(blank:false, maxSize:2)
    cep(blank:false, maxSize:9)
  }

  static mapping = {
    // version false
    id column:'id_endereco'
    id generator:'sequence', params:[sequence:'id_endereco_sequence']
  }

  String toString() {
    logradouro
  }
}