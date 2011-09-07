package sigesti

class Usuario {
	AreaResponsavel area_responsavel
	String confirma_senha
	Date data_cadastro = new Date()
	String email
	String hash_senha
	Lotacao lotacao
	String matricula
	String nivel
	String nome
	String senha

	static transients = ["senha", "confirma_senha"]

	static constraints = {
		nome(blank: false, maxSize: 64, unique: true)
		email(blank: false, maxSize: 64, email: true, unique: true)
		data_cadastro(nullable: false, editable: false)
		nivel(nullable: false, inList: ["Usuario", "Operador", "Administrador"])
		matricula(blank: true, maxSize: 64, unique: true)
		area_responsavel(nullable: true)
		lotacao(nullable: false)
		// val representa, neste caso, o valor de senha que foi preenchido
		senha(blank: false, password: true, size: 6..16, validator: { val, obj ->
      if (obj.properties['confirma_senha'] == val) // se confirma_senha for idêntico a val (valor do campo senha), a validacao ocorre com sucesso
        return true
      else // do contrário é informado que as senhas não coincidem
        return "erro.senhas.diferentes"
		})
		confirma_senha(blank: false, password: true, size: 6..16)
		hash_senha(display: false)
	}

	static mapping = {
		// version false
    id column: 'id_usuario'
		id generator: 'sequence', params: [sequence: 'id_usuario_sequence']
	}

	void setSenha(String valor) {
		this.senha = valor
		if (valor != null) {
      // metodo criado dinamicamente, formado por encode (proveniente da classe PasswordCodec) e password (a classe codec da pasta utils)
			this.hash_senha = valor.encodeAsPassword()
		}
	}

	String toString() {
		nome
	}
}
