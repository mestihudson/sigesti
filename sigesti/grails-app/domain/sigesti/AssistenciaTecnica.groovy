package sigesti

class AssistenciaTecnica {
  String cnpj
  String contato
  String email
  Endereco endereco
	String fax
  String nome_fantasia
  String razao_social
  String responsavel
  String site
  String telefone

  static constraints = {
    cnpj(blank:false, maxSize:18, unique:true)
    nome_fantasia(blank:false, maxSize:64, unique:true)
    razao_social(blank:false, maxSize:64, unique:true)
    email(blank:false, maxSize:64, email:true, unique:true)
    site(blank:false, maxSize:64, url:true, unique:true)
		contato(blank:false, maxSize:64)
		responsavel(blank:false, maxSize:64)
		fax(blank:true, maxSize:16, unique:true)
    telefone(blank:false, maxSize:16, unique:true)
		endereco(nullable:true)
  }

  static mapping = {
    // version false
    id column:'id_assistencia_tecnica'
    id generator:'sequence', params:[sequence:'id_assistencia_tecnica_sequence']
  }

  String toString() {
    nome_fantasia
  }
}