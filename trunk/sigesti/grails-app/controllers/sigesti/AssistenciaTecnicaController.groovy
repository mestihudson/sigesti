package sigesti

class AssistenciaTecnicaController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [assistenciaTecnicaInstanceList: AssistenciaTecnica.list(params), assistenciaTecnicaInstanceTotal: AssistenciaTecnica.count()]
    }

    def create = {
        def assistenciaTecnicaInstance = new AssistenciaTecnica()
        assistenciaTecnicaInstance.properties = params
        return [assistenciaTecnicaInstance: assistenciaTecnicaInstance]
    }

    def save = {
        def assistenciaTecnicaInstance = new AssistenciaTecnica(params)
        if (assistenciaTecnicaInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'assistenciaTecnica.label', default: 'AssistenciaTecnica'), assistenciaTecnicaInstance.id])}"
            redirect(action: "show", id: assistenciaTecnicaInstance.id)
        }
        else {
            render(view: "create", model: [assistenciaTecnicaInstance: assistenciaTecnicaInstance])
        }
    }

    def show = {
        def assistenciaTecnicaInstance = AssistenciaTecnica.get(params.id)
        if (!assistenciaTecnicaInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'assistenciaTecnica.label', default: 'AssistenciaTecnica'), params.id])}"
            redirect(action: "list")
        }
        else {
            [assistenciaTecnicaInstance: assistenciaTecnicaInstance]
        }
    }

    def edit = {
        def assistenciaTecnicaInstance = AssistenciaTecnica.get(params.id)
        if (!assistenciaTecnicaInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'assistenciaTecnica.label', default: 'AssistenciaTecnica'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [assistenciaTecnicaInstance: assistenciaTecnicaInstance]
        }
    }

    def update = {
        def assistenciaTecnicaInstance = AssistenciaTecnica.get(params.id)
        if (assistenciaTecnicaInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (assistenciaTecnicaInstance.version > version) {
                    
                    assistenciaTecnicaInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'assistenciaTecnica.label', default: 'AssistenciaTecnica')] as Object[], "Another user has updated this AssistenciaTecnica while you were editing")
                    render(view: "edit", model: [assistenciaTecnicaInstance: assistenciaTecnicaInstance])
                    return
                }
            }
            assistenciaTecnicaInstance.properties = params
            if (!assistenciaTecnicaInstance.hasErrors() && assistenciaTecnicaInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'assistenciaTecnica.label', default: 'AssistenciaTecnica'), assistenciaTecnicaInstance.id])}"
                redirect(action: "show", id: assistenciaTecnicaInstance.id)
            }
            else {
                render(view: "edit", model: [assistenciaTecnicaInstance: assistenciaTecnicaInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'assistenciaTecnica.label', default: 'AssistenciaTecnica'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def assistenciaTecnicaInstance = AssistenciaTecnica.get(params.id)
        if (assistenciaTecnicaInstance) {
            try {
                assistenciaTecnicaInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'assistenciaTecnica.label', default: 'AssistenciaTecnica'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'assistenciaTecnica.label', default: 'AssistenciaTecnica'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'assistenciaTecnica.label', default: 'AssistenciaTecnica'), params.id])}"
            redirect(action: "list")
        }
    }
}
