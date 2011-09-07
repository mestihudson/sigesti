package sigesti

class SolucaoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [solucaoInstanceList: Solucao.list(params), solucaoInstanceTotal: Solucao.count()]
    }

    def create = {
        def solucaoInstance = new Solucao()
        solucaoInstance.properties = params
        return [solucaoInstance: solucaoInstance]
    }

    def save = {
        def solucaoInstance = new Solucao(params)
        if (solucaoInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'solucao.label', default: 'Solucao'), solucaoInstance.id])}"
            redirect(action: "show", id: solucaoInstance.id)
        }
        else {
            render(view: "create", model: [solucaoInstance: solucaoInstance])
        }
    }

    def show = {
        def solucaoInstance = Solucao.get(params.id)
        if (!solucaoInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'solucao.label', default: 'Solucao'), params.id])}"
            redirect(action: "list")
        }
        else {
            [solucaoInstance: solucaoInstance]
        }
    }

    def edit = {
        def solucaoInstance = Solucao.get(params.id)
        if (!solucaoInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'solucao.label', default: 'Solucao'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [solucaoInstance: solucaoInstance]
        }
    }

    def update = {
        def solucaoInstance = Solucao.get(params.id)
        if (solucaoInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (solucaoInstance.version > version) {
                    
                    solucaoInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'solucao.label', default: 'Solucao')] as Object[], "Another user has updated this Solucao while you were editing")
                    render(view: "edit", model: [solucaoInstance: solucaoInstance])
                    return
                }
            }
            solucaoInstance.properties = params
            if (!solucaoInstance.hasErrors() && solucaoInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'solucao.label', default: 'Solucao'), solucaoInstance.id])}"
                redirect(action: "show", id: solucaoInstance.id)
            }
            else {
                render(view: "edit", model: [solucaoInstance: solucaoInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'solucao.label', default: 'Solucao'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def solucaoInstance = Solucao.get(params.id)
        if (solucaoInstance) {
            try {
                solucaoInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'solucao.label', default: 'Solucao'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'solucao.label', default: 'Solucao'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'solucao.label', default: 'Solucao'), params.id])}"
            redirect(action: "list")
        }
    }
}
