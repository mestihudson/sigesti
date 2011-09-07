package sigesti
import sigesti.Chamado
import sigesti.Status
import sigesti.TipoStatus

class AtendimentoExternoController {

  static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

  def situacao

  def index = {
    redirect(action: "list", params: params)
  }

  def list = {
    params.max = Math.min(params.max ? params.int('max') : 10, 100)
    [atendimentoExternoInstanceList: AtendimentoExterno.list(params), atendimentoExternoInstanceTotal: AtendimentoExterno.count()]
  }

  def create = {
    def atendimentoExternoInstance = new AtendimentoExterno()
    atendimentoExternoInstance.properties = params
    return [atendimentoExternoInstance: atendimentoExternoInstance]
  }

  def save = {
    def atendimentoExternoInstance = new AtendimentoExterno(params)
    def chamadoInstance = atendimentoExternoInstance.chamado
    // antes de um chamado mudar de status, encerramos seu estado anterior setando data_final
    Status.executeUpdate("update Status s set s.version = (s.version + 1), s.data_final = ? where s.chamado = ? and s.id in (select max(s.id) from Status s group by s.chamado)", [new Date(),chamadoInstance])

    if (atendimentoExternoInstance.save(flush: true)) {
      TipoStatus tipostatus = TipoStatus.findByDescricao("Enviado à assistência técnica")
      situacao = new Status(chamado: chamadoInstance, data_inicial: new Date(), data_final: new Date(), tipo_status:tipostatus).save()
      flash.message = "${message(code: 'default.created.message', args: [message(code: 'atendimentoExterno.label', default: 'AtendimentoExterno'), atendimentoExternoInstance.id])}"
      redirect(action: "show", id: atendimentoExternoInstance.id)
    }
    else {
      render(view: "create", model: [atendimentoExternoInstance: atendimentoExternoInstance])
    }
  }

	def aguardarassistencia = {
		def atendimentoExternoInstance = AtendimentoExterno.get(params.id)
		def chamadoInstance = atendimentoExternoInstance.chamado
		// antes de um chamado mudar de status, encerramos seu estado anterior setando data_final
		Status.executeUpdate("update Status s set s.version = (s.version + 1), s.data_final = ? where s.chamado = ? and s.id in (select max(s.id) from Status s group by s.chamado)", [new Date(),chamadoInstance])

		if (chamadoInstance) {
			TipoStatus tipostatus = TipoStatus.findByDescricao("Aguardando resposta da assistência técnica")
			situacao = new Status(chamado: chamadoInstance, data_inicial: new Date(), data_final: "", tipo_status:tipostatus).save()
			flash.message = "${message(code: 'default.aguardarassistencia.message', args: [message(code: 'atendimentoExterno.label', default: 'AtendimentoExterno'), atendimentoExternoInstance.id])}"
      redirect(action: "show", id: atendimentoExternoInstance.id)
		}
		else {
			render(view: "create", model: [atendimentoExternoInstance: atendimentoExternoInstance])
		}
	}

	def retornardaassistencia = {
		def atendimentoExternoInstance = AtendimentoExterno.get(params.id)
		def chamadoInstance = atendimentoExternoInstance.chamado
		// antes de um chamado mudar de status, encerramos seu estado anterior setando data_final
		Status.executeUpdate("update Status s set s.version = (s.version + 1), s.data_final = ? where s.chamado = ? and s.id in (select max(s.id) from Status s group by s.chamado)", [new Date(),chamadoInstance])
		AtendimentoExterno.executeUpdate("update AtendimentoExterno a set a.version = (a.version + 1), a.data_retorno = ? where a.id = ?", [new Date(),atendimentoExternoInstance.id])

		if (chamadoInstance) {
			TipoStatus tipostatus = TipoStatus.findByDescricao("Retornou da assistência técnica")
			situacao = new Status(chamado: chamadoInstance, data_inicial: new Date(), data_final: new Date(), tipo_status:tipostatus).save()
			flash.message = "${message(code: 'default.retornardaassistencia.message', args: [message(code: 'atendimentoExterno.label', default: 'AtendimentoExterno'), atendimentoExternoInstance.id])}"
      redirect(action: "show", id: atendimentoExternoInstance.id)
		}
		else {
			render(view: "create", model: [atendimentoExternoInstance: atendimentoExternoInstance])
		}
	}

  def show = {
    def atendimentoExternoInstance = AtendimentoExterno.get(params.id)
    if (!atendimentoExternoInstance) {
      flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'atendimentoExterno.label', default: 'AtendimentoExterno'), params.id])}"
      redirect(action: "list")
    }
    else {
      [atendimentoExternoInstance: atendimentoExternoInstance]
    }
  }

  def edit = {
    def atendimentoExternoInstance = AtendimentoExterno.get(params.id)
    if (!atendimentoExternoInstance) {
      flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'atendimentoExterno.label', default: 'AtendimentoExterno'), params.id])}"
      redirect(action: "list")
    }
    else {
      return [atendimentoExternoInstance: atendimentoExternoInstance]
    }
  }

  def update = {
    def atendimentoExternoInstance = AtendimentoExterno.get(params.id)
    if (atendimentoExternoInstance) {
      if (params.version) {
        def version = params.version.toLong()
        if (atendimentoExternoInstance.version > version) {

          atendimentoExternoInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'atendimentoExterno.label', default: 'AtendimentoExterno')] as Object[], "Another user has updated this AtendimentoExterno while you were editing")
          render(view: "edit", model: [atendimentoExternoInstance: atendimentoExternoInstance])
          return
        }
      }
      atendimentoExternoInstance.properties = params
      if (!atendimentoExternoInstance.hasErrors() && atendimentoExternoInstance.save(flush: true)) {
        flash.message = "${message(code: 'default.updated.message', args: [message(code: 'atendimentoExterno.label', default: 'AtendimentoExterno'), atendimentoExternoInstance.id])}"
        redirect(action: "show", id: atendimentoExternoInstance.id)
      }
      else {
        render(view: "edit", model: [atendimentoExternoInstance: atendimentoExternoInstance])
      }
    }
    else {
      flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'atendimentoExterno.label', default: 'AtendimentoExterno'), params.id])}"
      redirect(action: "list")
    }
  }

  def delete = {
    def atendimentoExternoInstance = AtendimentoExterno.get(params.id)
    if (atendimentoExternoInstance) {
      try {
        atendimentoExternoInstance.delete(flush: true)
        flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'atendimentoExterno.label', default: 'AtendimentoExterno'), params.id])}"
        redirect(action: "list")
      }
      catch (org.springframework.dao.DataIntegrityViolationException e) {
        flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'atendimentoExterno.label', default: 'AtendimentoExterno'), params.id])}"
        redirect(action: "show", id: params.id)
      }
    }
    else {
      flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'atendimentoExterno.label', default: 'AtendimentoExterno'), params.id])}"
      redirect(action: "list")
    }
  }
}
