package sigesti

class TipoStatusController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [tipoStatusInstanceList: TipoStatus.list(params), tipoStatusInstanceTotal: TipoStatus.count()]
    }

    def create = {
        def tipoStatusInstance = new TipoStatus()
        tipoStatusInstance.properties = params
        return [tipoStatusInstance: tipoStatusInstance]
    }

    def save = {
        def tipoStatusInstance = new TipoStatus(params)
        if (tipoStatusInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'tipoStatus.label', default: 'TipoStatus'), tipoStatusInstance.id])}"
            redirect(action: "show", id: tipoStatusInstance.id)
        }
        else {
            render(view: "create", model: [tipoStatusInstance: tipoStatusInstance])
        }
    }

    def show = {
        def tipoStatusInstance = TipoStatus.get(params.id)
        if (!tipoStatusInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'tipoStatus.label', default: 'TipoStatus'), params.id])}"
            redirect(action: "list")
        }
        else {
            [tipoStatusInstance: tipoStatusInstance]
        }
    }

    def edit = {
        def tipoStatusInstance = TipoStatus.get(params.id)
        if (!tipoStatusInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'tipoStatus.label', default: 'TipoStatus'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [tipoStatusInstance: tipoStatusInstance]
        }
    }

    def update = {
        def tipoStatusInstance = TipoStatus.get(params.id)
        if (tipoStatusInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (tipoStatusInstance.version > version) {
                    
                    tipoStatusInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'tipoStatus.label', default: 'TipoStatus')] as Object[], "Another user has updated this TipoStatus while you were editing")
                    render(view: "edit", model: [tipoStatusInstance: tipoStatusInstance])
                    return
                }
            }
            tipoStatusInstance.properties = params
            if (!tipoStatusInstance.hasErrors() && tipoStatusInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'tipoStatus.label', default: 'TipoStatus'), tipoStatusInstance.id])}"
                redirect(action: "show", id: tipoStatusInstance.id)
            }
            else {
                render(view: "edit", model: [tipoStatusInstance: tipoStatusInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'tipoStatus.label', default: 'TipoStatus'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def tipoStatusInstance = TipoStatus.get(params.id)
        if (tipoStatusInstance) {
            try {
                tipoStatusInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'tipoStatus.label', default: 'TipoStatus'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'tipoStatus.label', default: 'TipoStatus'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'tipoStatus.label', default: 'TipoStatus'), params.id])}"
            redirect(action: "list")
        }
    }
}
