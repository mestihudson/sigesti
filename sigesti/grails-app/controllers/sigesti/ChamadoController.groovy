package sigesti
import sigesti.Equipamento
import sigesti.TipoStatus
import sigesti.Status

class ChamadoController {

	static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

	def tipostatus // variável que determina, em algumas actions qual status sera usado como parâmetro
	def situacao // variável responsavel por alterar o status do chamado a fim de manter acompanhamento suas transições
	def ultimoestado // variável que recebe o último estado de um chamado

	def index = {
		redirect(action: "list", params: params)
	}

	def list = {
		params.max = Math.min(params.max ? params.int('max') : 10, 100)
		[chamadoInstanceList: Chamado.list(params), chamadoInstanceTotal: Chamado.count()]
	}

	def listwaiting = {
		params.max = Math.min(params.max ? params.int('max') : 10, 100)

		tipostatus = TipoStatus.findByDescricao("Aguardando atendimento")
		situacao = Status.findAllByTipo_status(tipostatus)

		List<Chamado> chamados = new ArrayList<Chamado>()

		for(Status st: situacao) {
			ultimoestado = Status.executeQuery("select s.tipo_status from Status s where s.chamado = ? and s.id in" +
				"(select max(s.id) from Status s group by s.chamado)", st.chamado)[0]

			if(ultimoestado == tipostatus && !chamados.grep(st.chamado)[0] ) {
				chamados.add(st.chamado)
			}
		}

		[chamadoInstanceListWaiting: chamados, chamadoInstanceTotal: Chamado.count()]
	}

	def listmeeting = {
		params.max = Math.min(params.max ? params.int('max') : 10, 100)

		tipostatus = TipoStatus.findByDescricao("Em atendimento")
		situacao = Status.findAllByTipo_status(tipostatus)

		List<Chamado> chamados = new ArrayList<Chamado>()

		for(Status st: situacao) {
			ultimoestado = Status.executeQuery("select s.tipo_status from Status s where s.chamado = ? and s.id in" +
				"(select max(s.id) from Status s group by s.chamado)", st.chamado)[0]
			if(ultimoestado == tipostatus && !chamados.grep(st.chamado)[0] ) {
				chamados.add(st.chamado)
			}
		}

		[chamadoInstanceListMeeting: chamados, chamadoInstanceTotal: Chamado.count()]
	}

	def listfinished = {
		params.max = Math.min(params.max ? params.int('max') : 10, 100)

		tipostatus = TipoStatus.findByDescricao("Encerrado")
		situacao = Status.findAllByTipo_status(tipostatus)

		List<Chamado> chamados = new ArrayList<Chamado>()

		for(Status st: situacao) {
			ultimoestado = Status.executeQuery("select s.tipo_status from Status s where s.chamado = ? and s.id in" +
				"(select max(s.id) from Status s group by s.chamado)", st.chamado)[0]

			if(ultimoestado == tipostatus && !chamados.grep(st.chamado)[0] ) { // so adiciona a lista chamados ÚNICOS
				chamados.add(st.chamado)
			}
		}

		[chamadoInstanceListFinished: chamados, chamadoInstanceTotal: Chamado.count()]
	}

	def create = {
		def chamadoInstance = new Chamado()
		chamadoInstance.properties = params
		return [chamadoInstance: chamadoInstance]
	}

	def save = {
		def chamadoInstance = new Chamado(params)
		if (chamadoInstance.save(flush: true)) { // cria o chamado caso o objeto esteja em conformidade com o esperado
			tipostatus = TipoStatus.findByDescricao("Aguardando atendimento") // cria-se um objeto que atribuirá o estado inicial de todo chamado
			situacao = new Status(chamado: chamadoInstance, data_inicial: new Date(), data_final: "", tipo_status:tipostatus).save() // registra-se o estado inicial do chamado como um status
			flash.message = "${message(code: 'default.created.message', args: [message(code: 'chamado.label', default: 'Chamado'), chamadoInstance.id])}"
			redirect(action: "show", id: chamadoInstance.id)
		}
		else {
			render(view: "create", model: [chamadoInstance: chamadoInstance])
		}
	}

	def atendechamado = {
		def chamadoInstance = Chamado.get(params.id)
		// antes de um chamado mudar de status, encerramos seu estado anterior setando data_final
		Status.executeUpdate("update Status s set s.version = (s.version + 1), s.data_final = ? where s.chamado = ? and s.id in" +
			"(select max(s.id) from Status s group by s.chamado)", [new Date(),chamadoInstance])

		if (chamadoInstance) {
			tipostatus = TipoStatus.findByDescricao("Em atendimento")
			situacao = new Status(chamado: chamadoInstance, data_inicial: new Date(), data_final: "", tipo_status:tipostatus).save()
			flash.message = "${message(code: 'default.atendimento.message', args: [message(code: 'chamado.label', default: 'Chamado'), chamadoInstance.id])}"
			redirect(action: "show", id: chamadoInstance.id)
		}
		else {
			render(view: "create", model: [chamadoInstance: chamadoInstance])
		}
	}

	def retirarequipamento = {
		def chamadoInstance = Chamado.get(params.id)
		// verifica se já há um equipamento associado ao referido chamado para que seja possível a retirada do primeiro
		if (chamadoInstance.equipamento != null) {
			// antes de um chamado mudar de status, encerramos seu estado anterior setando data_final
			Status.executeUpdate("update Status s set s.version = (s.version + 1), s.data_final = ? where s.chamado = ? and s.id in" +
				"(select max(s.id) from Status s group by s.chamado)", [new Date(),chamadoInstance])

			if (chamadoInstance) {
				tipostatus = TipoStatus.findByDescricao("Retirado do respectivo local de origem")
				situacao = new Status(chamado: chamadoInstance, data_inicial: new Date(), data_final: new Date(), tipo_status:tipostatus).save()
				Equipamento.executeUpdate("update Equipamento eq set eq.version = (eq.version + 1), eq.disponibilidade = ? where eq.id = ? ", [false,chamadoInstance.equipamento.id])
				flash.message = "${message(code: 'default.retirar.message', args: [message(code: 'chamado.label', default: 'Chamado'), chamadoInstance.id])}"
				redirect(action: "show", id: chamadoInstance.id)
			}
			else {
				render(view: "create", model: [chamadoInstance: chamadoInstance])
			}
		}
		else {
			flash.message = "${message(code: 'default.retirar.semequipamento.message', args: [message(code: 'equipamento.label', default: 'Equipamento') ,message(code: 'chamado.label', default: 'Chamado'), chamadoInstance.id])}"
			redirect(action: "show", id: chamadoInstance.id)
		}
	}

	def diagnosticar = {
		def chamadoInstance = Chamado.get(params.id)
    // consulta qual é o atual estado de um dado chamado
    ultimoestado = Status.executeQuery("select s.tipo_status from Status s where s.chamado = ? and s.id in" +
			"(select max(s.id) from Status s group by s.chamado)", [chamadoInstance])[0]

		tipostatus = TipoStatus.findByDescricao("Retirado do respectivo local de origem")
		if ( !ultimoestado.is(tipostatus) ) {
			// antes de um chamado mudar de status, encerramos seu estado anterior setando data_final
			Status.executeUpdate("update Status s set s.version = (s.version + 1), s.data_final = ? where s.chamado = ? and s.id in" +
				"(select max(s.id) from Status s group by s.chamado)", [new Date(),chamadoInstance])
		}

		if (chamadoInstance) {
			tipostatus = TipoStatus.findByDescricao("Em diagnóstico")
			situacao = new Status(chamado: chamadoInstance, data_inicial: new Date(), data_final: "", tipo_status:tipostatus).save()
			flash.message = "${message(code: 'default.diagnosticar.message', args: [message(code: 'chamado.label', default: 'Chamado'), chamadoInstance.id])}"
			redirect(action: "show", id: chamadoInstance.id)
		}
		else {
			render(view: "create", model: [chamadoInstance: chamadoInstance])
		}
	}

	def observar = {
		def chamadoInstance = Chamado.get(params.id)
    // consulta qual é o atual estado de um dado chamado
    ultimoestado = Status.executeQuery("select s.tipo_status from Status s where s.chamado = ? and s.id in" +
			"(select max(s.id) from Status s group by s.chamado)", [chamadoInstance])[0]

		tipostatus = TipoStatus.findByDescricao("Retornou da assistência técnica")
		if ( !ultimoestado.is(tipostatus) ) {
			// antes de um chamado mudar de status, encerramos seu estado anterior setando data_final
			Status.executeUpdate("update Status s set s.version = (s.version + 1), s.data_final = ? where s.chamado = ? and s.id in" +
				"(select max(s.id) from Status s group by s.chamado)", [new Date(),chamadoInstance])
		}

		if (chamadoInstance) {
			tipostatus = TipoStatus.findByDescricao("Em observação")
			situacao = new Status(chamado: chamadoInstance, data_inicial: new Date(), data_final: "", tipo_status:tipostatus).save()
			flash.message = "${message(code: 'default.observar.message', args: [message(code: 'chamado.label', default: 'Chamado'), chamadoInstance.id])}"
			redirect(action: "show", id: chamadoInstance.id)
		}
		else {
			render(view: "create", model: [chamadoInstance: chamadoInstance])
		}
	}

	def devolver = {
		def chamadoInstance = Chamado.get(params.id)
		// antes de um chamado mudar de status, encerramos seu estado anterior setando data_final
		Status.executeUpdate("update Status s set s.version = (s.version + 1), s.data_final = ? where s.chamado = ? and s.id in" +
			"(select max(s.id) from Status s group by s.chamado)", [new Date(),chamadoInstance])

		if (chamadoInstance) {
			tipostatus = TipoStatus.findByDescricao("Devolvido ao respectivo local de origem")
			situacao = new Status(chamado: chamadoInstance, data_inicial: new Date(), data_final: new Date(), tipo_status:tipostatus).save()
			Equipamento.executeUpdate("update Equipamento eq set eq.version = (eq.version + 1), eq.disponibilidade = ? where eq.id = ? ", [true,chamadoInstance.equipamento.id])
			flash.message = "${message(code: 'default.devolver.message', args: [message(code: 'chamado.label', default: 'Chamado'), chamadoInstance.id])}"
			redirect(action: "show", id: chamadoInstance.id)
		}
		else {
			render(view: "create", model: [chamadoInstance: chamadoInstance])
		}
	}

	def encerrachamado = {
		def chamadoInstance = Chamado.get(params.id)

    // consulta qual é o atual estado de um dado chamado
    ultimoestado = Status.executeQuery("select s.tipo_status from Status s where s.chamado = ? and s.id in" +
			"(select max(s.id) from Status s group by s.chamado)", [chamadoInstance])[0]

		tipostatus = TipoStatus.findByDescricao("Devolvido ao respectivo local de origem")
		if ( !ultimoestado.is(tipostatus) ) {
			// antes de um chamado mudar de status, encerramos seu estado anterior setando data_final
			Status.executeUpdate("update Status s set s.version = (s.version + 1), s.data_final = ? where s.chamado = ? and s.id in" +
				"(select max(s.id) from Status s group by s.chamado)", [new Date(),chamadoInstance])
		}

    if (chamadoInstance) {
			tipostatus = TipoStatus.findByDescricao("Encerrado")
			situacao = new Status(chamado: chamadoInstance, data_inicial: new Date(), data_final: new Date(), tipo_status:tipostatus).save()
			Chamado.executeUpdate("update Chamado c set c.version = (c.version + 1), c.data_encerramento = ? where c.id = ?", [new Date(),chamadoInstance.id])
			flash.message = "${message(code: 'default.encerramento.message', args: [message(code: 'chamado.label', default: 'Chamado'), chamadoInstance.id])}"
			redirect(action: "show", id: chamadoInstance.id)
		}
		else {
			render(view: "create", model: [chamadoInstance: chamadoInstance])
		}
	}

	def reabrirchamado = {
		def chamadoInstance = Chamado.get(params.id)

		if (chamadoInstance) {
			tipostatus = TipoStatus.findByDescricao("Reaberto")
			situacao = new Status(chamado: chamadoInstance, data_inicial: new Date(), data_final: new Date(), tipo_status:tipostatus).save()
			Chamado.executeUpdate("update Chamado c set c.version = (c.version + 1), c.data_encerramento = null where c.id = ?", [chamadoInstance.id])
			tipostatus = TipoStatus.findByDescricao("Aguardando atendimento")
			situacao = new Status(chamado: chamadoInstance, data_inicial: new Date(), data_final: "", tipo_status:tipostatus).save()
			flash.message = "${message(code: 'default.reabrir.message', args: [message(code: 'chamado.label', default: 'Chamado'), chamadoInstance.id])}"
			redirect(action: "show", id: chamadoInstance.id)
		}
		else {
			render(view: "create", model: [chamadoInstance: chamadoInstance])
		}
	}

	def show = {
		def chamadoInstance = Chamado.get(params.id)
		if (!chamadoInstance) {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'chamado.label', default: 'Chamado'), params.id])}"
			redirect(action: "list")
		}
		else {
			[chamadoInstance: chamadoInstance]
		}
	}

	def edit = {
		def chamadoInstance = Chamado.get(params.id)
		if (!chamadoInstance) {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'chamado.label', default: 'Chamado'), params.id])}"
			redirect(action: "list")
		}
		else {
			return [chamadoInstance: chamadoInstance]
		}
	}

	def update = {
		def chamadoInstance = Chamado.get(params.id)
		if (chamadoInstance) {
			if (params.version) {
				def version = params.version.toLong()
				if (chamadoInstance.version > version) {

					chamadoInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [
              message(code: 'chamado.label', default: 'Chamado')]
            as Object[], "Another user has updated this Chamado while you were editing")
					render(view: "edit", model: [chamadoInstance: chamadoInstance])
					return
				}
			}
			chamadoInstance.properties = params
			if (!chamadoInstance.hasErrors() && chamadoInstance.save(flush: true)) {
				flash.message = "${message(code: 'default.updated.message', args: [message(code: 'chamado.label', default: 'Chamado'), chamadoInstance.id])}"
				redirect(action: "show", id: chamadoInstance.id)
			}
			else {
				render(view: "edit", model: [chamadoInstance: chamadoInstance])
			}
		}
		else {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'chamado.label', default: 'Chamado'), params.id])}"
			redirect(action: "list")
		}
	}

	def delete = {
		def chamadoInstance = Chamado.get(params.id)
		if (chamadoInstance) {
			try {
				chamadoInstance.delete(flush: true)
				flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'chamado.label', default: 'Chamado'), params.id])}"
				redirect(action: "list")
			}
			catch (org.springframework.dao.DataIntegrityViolationException e) {
				flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'chamado.label', default: 'Chamado'), params.id])}"
				redirect(action: "show", id: params.id)
			}
		}
		else {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'chamado.label', default: 'Chamado'), params.id])}"
			redirect(action: "list")
		}
	}
}
