package sigesti

class GarantiaController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [garantiaInstanceList: Garantia.list(params), garantiaInstanceTotal: Garantia.count()]
    }

    def create = {
        def garantiaInstance = new Garantia()
        garantiaInstance.properties = params
        return [garantiaInstance: garantiaInstance]
    }

    def save = {
        def garantiaInstance = new Garantia(params)
        if (garantiaInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'garantia.label', default: 'Garantia'), garantiaInstance.id])}"
            redirect(action: "show", id: garantiaInstance.id)
        }
        else {
            render(view: "create", model: [garantiaInstance: garantiaInstance])
        }
    }

    def show = {
        def garantiaInstance = Garantia.get(params.id)
        if (!garantiaInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'garantia.label', default: 'Garantia'), params.id])}"
            redirect(action: "list")
        }
        else {
            [garantiaInstance: garantiaInstance]
        }
    }

    def edit = {
        def garantiaInstance = Garantia.get(params.id)
        if (!garantiaInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'garantia.label', default: 'Garantia'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [garantiaInstance: garantiaInstance]
        }
    }

    def update = {
        def garantiaInstance = Garantia.get(params.id)
        if (garantiaInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (garantiaInstance.version > version) {
                    
                    garantiaInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'garantia.label', default: 'Garantia')] as Object[], "Another user has updated this Garantia while you were editing")
                    render(view: "edit", model: [garantiaInstance: garantiaInstance])
                    return
                }
            }
            garantiaInstance.properties = params
            if (!garantiaInstance.hasErrors() && garantiaInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'garantia.label', default: 'Garantia'), garantiaInstance.id])}"
                redirect(action: "show", id: garantiaInstance.id)
            }
            else {
                render(view: "edit", model: [garantiaInstance: garantiaInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'garantia.label', default: 'Garantia'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def garantiaInstance = Garantia.get(params.id)
        if (garantiaInstance) {
            try {
                garantiaInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'garantia.label', default: 'Garantia'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'garantia.label', default: 'Garantia'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'garantia.label', default: 'Garantia'), params.id])}"
            redirect(action: "list")
        }
    }
}
