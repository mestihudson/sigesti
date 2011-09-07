package sigesti

class EquipamentoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [equipamentoInstanceList: Equipamento.list(params), equipamentoInstanceTotal: Equipamento.count()]
    }

    def create = {
        def equipamentoInstance = new Equipamento()
        equipamentoInstance.properties = params
        return [equipamentoInstance: equipamentoInstance]
    }

    def save = {
        def equipamentoInstance = new Equipamento(params)
        if (equipamentoInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'equipamento.label', default: 'Equipamento'), equipamentoInstance.id])}"
            redirect(action: "show", id: equipamentoInstance.id)
        }
        else {
            render(view: "create", model: [equipamentoInstance: equipamentoInstance])
        }
    }

    def show = {
        def equipamentoInstance = Equipamento.get(params.id)
        if (!equipamentoInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'equipamento.label', default: 'Equipamento'), params.id])}"
            redirect(action: "list")
        }
        else {
            [equipamentoInstance: equipamentoInstance]
        }
    }

    def edit = {
        def equipamentoInstance = Equipamento.get(params.id)
        if (!equipamentoInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'equipamento.label', default: 'Equipamento'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [equipamentoInstance: equipamentoInstance]
        }
    }

    def update = {
        def equipamentoInstance = Equipamento.get(params.id)
        if (equipamentoInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (equipamentoInstance.version > version) {
                    
                    equipamentoInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'equipamento.label', default: 'Equipamento')] as Object[], "Another user has updated this Equipamento while you were editing")
                    render(view: "edit", model: [equipamentoInstance: equipamentoInstance])
                    return
                }
            }
            equipamentoInstance.properties = params
            if (!equipamentoInstance.hasErrors() && equipamentoInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'equipamento.label', default: 'Equipamento'), equipamentoInstance.id])}"
                redirect(action: "show", id: equipamentoInstance.id)
            }
            else {
                render(view: "edit", model: [equipamentoInstance: equipamentoInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'equipamento.label', default: 'Equipamento'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def equipamentoInstance = Equipamento.get(params.id)
        if (equipamentoInstance) {
            try {
                equipamentoInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'equipamento.label', default: 'Equipamento'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'equipamento.label', default: 'Equipamento'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'equipamento.label', default: 'Equipamento'), params.id])}"
            redirect(action: "list")
        }
    }
}
