package sigesti

class ProblemaController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [problemaInstanceList: Problema.list(params), problemaInstanceTotal: Problema.count()]
    }

    def create = {
        def problemaInstance = new Problema()
        problemaInstance.properties = params
        return [problemaInstance: problemaInstance]
    }

    def save = {
        def problemaInstance = new Problema(params)
        if (problemaInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'problema.label', default: 'Problema'), problemaInstance.id])}"
            redirect(action: "show", id: problemaInstance.id)
        }
        else {
            render(view: "create", model: [problemaInstance: problemaInstance])
        }
    }

    def show = {
        def problemaInstance = Problema.get(params.id)
        if (!problemaInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'problema.label', default: 'Problema'), params.id])}"
            redirect(action: "list")
        }
        else {
            [problemaInstance: problemaInstance]
        }
    }

    def edit = {
        def problemaInstance = Problema.get(params.id)
        if (!problemaInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'problema.label', default: 'Problema'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [problemaInstance: problemaInstance]
        }
    }

    def update = {
        def problemaInstance = Problema.get(params.id)
        if (problemaInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (problemaInstance.version > version) {
                    
                    problemaInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'problema.label', default: 'Problema')] as Object[], "Another user has updated this Problema while you were editing")
                    render(view: "edit", model: [problemaInstance: problemaInstance])
                    return
                }
            }
            problemaInstance.properties = params
            if (!problemaInstance.hasErrors() && problemaInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'problema.label', default: 'Problema'), problemaInstance.id])}"
                redirect(action: "show", id: problemaInstance.id)
            }
            else {
                render(view: "edit", model: [problemaInstance: problemaInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'problema.label', default: 'Problema'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def problemaInstance = Problema.get(params.id)
        if (problemaInstance) {
            try {
                problemaInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'problema.label', default: 'Problema'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'problema.label', default: 'Problema'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'problema.label', default: 'Problema'), params.id])}"
            redirect(action: "list")
        }
    }
}
