package sigesti

class AssentamentoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [assentamentoInstanceList: Assentamento.list(params), assentamentoInstanceTotal: Assentamento.count()]
    }

    def create = {
        def assentamentoInstance = new Assentamento()
        assentamentoInstance.properties = params
        return [assentamentoInstance: assentamentoInstance]
    }

    def save = {
        def assentamentoInstance = new Assentamento(params)
        if (assentamentoInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'assentamento.label', default: 'Assentamento'), assentamentoInstance.id])}"
            redirect(action: "show", id: assentamentoInstance.id)
        }
        else {
            render(view: "create", model: [assentamentoInstance: assentamentoInstance])
        }
    }

    def show = {
        def assentamentoInstance = Assentamento.get(params.id)
        if (!assentamentoInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'assentamento.label', default: 'Assentamento'), params.id])}"
            redirect(action: "list")
        }
        else {
            [assentamentoInstance: assentamentoInstance]
        }
    }

    def edit = {
        def assentamentoInstance = Assentamento.get(params.id)
        if (!assentamentoInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'assentamento.label', default: 'Assentamento'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [assentamentoInstance: assentamentoInstance]
        }
    }

    def update = {
        def assentamentoInstance = Assentamento.get(params.id)
        if (assentamentoInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (assentamentoInstance.version > version) {
                    
                    assentamentoInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'assentamento.label', default: 'Assentamento')] as Object[], "Another user has updated this Assentamento while you were editing")
                    render(view: "edit", model: [assentamentoInstance: assentamentoInstance])
                    return
                }
            }
            assentamentoInstance.properties = params
            if (!assentamentoInstance.hasErrors() && assentamentoInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'assentamento.label', default: 'Assentamento'), assentamentoInstance.id])}"
                redirect(action: "show", id: assentamentoInstance.id)
            }
            else {
                render(view: "edit", model: [assentamentoInstance: assentamentoInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'assentamento.label', default: 'Assentamento'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def assentamentoInstance = Assentamento.get(params.id)
        if (assentamentoInstance) {
            try {
                assentamentoInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'assentamento.label', default: 'Assentamento'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'assentamento.label', default: 'Assentamento'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'assentamento.label', default: 'Assentamento'), params.id])}"
            redirect(action: "list")
        }
    }
}
