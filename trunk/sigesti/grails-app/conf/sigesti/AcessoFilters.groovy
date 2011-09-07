package sigesti

class AcessoFilters {

	def filters = {

		logar(controller:'*', action:'*') {
			before = {
				if(!session.usuario && !controllerName.equals('autenticacao')) {
					flash.message = "Você não está logado, autentique-se"
					flash.default = "Você não está logado, autentique-se"
					redirect(controller:'autenticacao', action:'index')
				}
			}

			after = { }

			afterView = { }
		}

		usuario(controller:'chamado', action:'edit|delete|atendechamado|diagnosticar|observar|devolver|encerrachamado|reabrirchamado') {
			before = {
				if(session?.usuario?.nivel?.equals('Usuario')) {
					flash.message = "Você não possui permissão para acessar esse conteúdo!"
					flash.default = "Você não possui permissão para acessar esse conteúdo!"
					redirect(controller:'chamado', action:'list')
				}
			}

			after = { }

			afterView = { }
		}

		operador(controller:'problema|solucao|atendimentoExterno|garantia|emprestimo', action:'*') {
			before = {
				if(!session?.usuario?.nivel?.equals('Operador') && !session?.usuario?.nivel?.equals('Administrador') ) {
					flash.message = "Acesso Negado! Conteudo restrito a Operadores e Administradores"
					flash.default = "Acesso Negado! Conteudo restrito a Operadores e Administradores"
					redirect(controller:'chamado', action:'list')
				}
			}

			after = { }

			afterView = { }
		}

		administrador(controller:'lotacao|areaResponsavel|categoria|equipamento|tipoStatus|SLA|endereco|assistenciaTecnica|usuario', action:'*') {
			before = {
				if(!session?.usuario?.nivel?.equals('Administrador') ) {
					flash.message = "Acesso Negado! Conteudo restrito a Administradores"
					flash.default = "Acesso Negado! Conteudo restrito a Administradores"
					redirect(controller:'chamado', action:'list')
				}
			}

			after = { }

			afterView = { }
		}
	}
}
