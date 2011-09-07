package sigesti
import sigesti.Equipamento

class EmprestimoController {

  static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
  
  def equipamentoInstance

  def index = {
    redirect(action: "list", params: params)
  }

  def list = {
    params.max = Math.min(params.max ? params.int('max') : 10, 100)
    [emprestimoInstanceList: Emprestimo.list(params), emprestimoInstanceTotal: Emprestimo.count()]
  }

  def create = {
    def emprestimoInstance = new Emprestimo()
    emprestimoInstance.properties = params
    return [emprestimoInstance: emprestimoInstance]
  }

  def save = {
    def emprestimoInstance = new Emprestimo(params)
    equipamentoInstance = emprestimoInstance.equipamento
    if (emprestimoInstance.save(flush: true)) {
      Equipamento.executeUpdate("update Equipamento e set e.version = (e.version + 1), e.disponibilidade = ? where e.id = ? ", [false,equipamentoInstance.id])
      flash.message = "${message(code: 'default.created.message', args: [message(code: 'emprestimo.label', default: 'Emprestimo'), emprestimoInstance.id])}"
      redirect(action: "show", id: emprestimoInstance.id)
    }
    else {
      render(view: "create", model: [emprestimoInstance: emprestimoInstance])
    }
  }
  
  def devolveremprestimo = {
    def emprestimoInstance = Emprestimo.get(params.id)    
    equipamentoInstance = emprestimoInstance.equipamento
    Emprestimo.executeUpdate("update Emprestimo ep set ep.version = (ep.version + 1), ep.data_devolucao = ? where ep.id = ?", [new Date(),emprestimoInstance.id])
    Equipamento.executeUpdate("update Equipamento eq set eq.version = (eq.version + 1), eq.disponibilidade = ? where eq.id = ? ", [true,equipamentoInstance.id])
    flash.message = "${message(code: 'default.emprestimodevolvido.message', args: [message(code: 'emprestimo.label', default: 'Emprestimo'), emprestimoInstance.id])}"
    redirect(action: "show", id: emprestimoInstance.id)
  }

  def show = {
    def emprestimoInstance = Emprestimo.get(params.id)
    if (!emprestimoInstance) {
      flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'emprestimo.label', default: 'Emprestimo'), params.id])}"
      redirect(action: "list")
    }
    else {
      [emprestimoInstance: emprestimoInstance]
    }
  }

  def edit = {
    def emprestimoInstance = Emprestimo.get(params.id)
    if (!emprestimoInstance) {
      flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'emprestimo.label', default: 'Emprestimo'), params.id])}"
      redirect(action: "list")
    }
    else {
      return [emprestimoInstance: emprestimoInstance]
    }
  }

  def update = {
    def emprestimoInstance = Emprestimo.get(params.id)
    if (emprestimoInstance) {
      if (params.version) {
        def version = params.version.toLong()
        if (emprestimoInstance.version > version) {
                    
          emprestimoInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'emprestimo.label', default: 'Emprestimo')] as Object[], "Another user has updated this Emprestimo while you were editing")
          render(view: "edit", model: [emprestimoInstance: emprestimoInstance])
          return
        }
      }
      emprestimoInstance.properties = params
      if (!emprestimoInstance.hasErrors() && emprestimoInstance.save(flush: true)) {
        flash.message = "${message(code: 'default.updated.message', args: [message(code: 'emprestimo.label', default: 'Emprestimo'), emprestimoInstance.id])}"
        redirect(action: "show", id: emprestimoInstance.id)
      }
      else {
        render(view: "edit", model: [emprestimoInstance: emprestimoInstance])
      }
    }
    else {
      flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'emprestimo.label', default: 'Emprestimo'), params.id])}"
      redirect(action: "list")
    }
  }

  def delete = {
    def emprestimoInstance = Emprestimo.get(params.id)
    if (emprestimoInstance) {
      try {
        emprestimoInstance.delete(flush: true)
        flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'emprestimo.label', default: 'Emprestimo'), params.id])}"
        redirect(action: "list")
      }
      catch (org.springframework.dao.DataIntegrityViolationException e) {
        flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'emprestimo.label', default: 'Emprestimo'), params.id])}"
        redirect(action: "show", id: params.id)
      }
    }
    else {
      flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'emprestimo.label', default: 'Emprestimo'), params.id])}"
      redirect(action: "list")
    }
  }
}
