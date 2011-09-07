package sigesti

class AutenticacaoController {

    def index = { }

		def login = {

        def emailUsuario = params.email
        def senhaUsuario = params.senha

        if (emailUsuario == "") {
					flash.message = "${message(code: 'erro.login.usuario')}"
					flash.default = "<p>O campo <b>Email</b> não foi preenchido.</p>"
					redirect(controller:"autenticacao", action:'index')
        }
        else if (senhaUsuario == "") {
					flash.message = "${message(code: 'erro.login.senha')}"
					flash.default = "<p>O campo <b>Senha</b> não foi preenchido.</p>"
					redirect(controller:"autenticacao", action:'index')
        }
				else { // caso NEM usuário NEM senha estejam em branco ...
					def usuario = Usuario.findByEmailAndHash_senha(emailUsuario, senhaUsuario.encodeAsPassword())

					if (usuario) {
						session.usuario = usuario
						//flash.message = usuario
						redirect(controller:"chamado", action:'list')
					} else {
						flash.message = "${message(code: 'erro.login.incorreto')}"
						flash.default = "<b>Email</b> ou <b>Senha</b> incorretos."
						redirect(controller:"autenticacao", action:'index')
					}
        }
    }

    def logout = {
			if(session.usuario) {
				session.invalidate()
				flash.message = "${message(code: 'default.logout.session')}"
				flash.default = "Você saiu do sistema."
				redirect(controller:"autenticacao")
			} else {
				flash.message = "${message(code: 'default.logout.nosession')}"
				flash.default = "Você <b>não</b> está autenticado no sistema."
				redirect(controller:"autenticacao", action:'index')
			}
    }
}
