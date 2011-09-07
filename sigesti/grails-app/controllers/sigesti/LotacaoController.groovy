package sigesti

class LotacaoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [lotacaoInstanceList: Lotacao.list(params), lotacaoInstanceTotal: Lotacao.count()]
    }

    def create = {
        def lotacaoInstance = new Lotacao()
        lotacaoInstance.properties = params
        return [lotacaoInstance: lotacaoInstance]
    }

    def save = {
        def lotacaoInstance = new Lotacao(params)
        if (lotacaoInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'lotacao.label', default: 'Lotacao'), lotacaoInstance.id])}"
            redirect(action: "show", id: lotacaoInstance.id)
        }
        else {
            render(view: "create", model: [lotacaoInstance: lotacaoInstance])
        }
    }

    def show = {
        def lotacaoInstance = Lotacao.get(params.id)
        if (!lotacaoInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'lotacao.label', default: 'Lotacao'), params.id])}"
            redirect(action: "list")
        }
        else {
            [lotacaoInstance: lotacaoInstance]
        }
    }

    def edit = {
        def lotacaoInstance = Lotacao.get(params.id)
        if (!lotacaoInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'lotacao.label', default: 'Lotacao'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [lotacaoInstance: lotacaoInstance]
        }
    }

    def update = {
        def lotacaoInstance = Lotacao.get(params.id)
        if (lotacaoInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (lotacaoInstance.version > version) {
                    
                    lotacaoInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'lotacao.label', default: 'Lotacao')] as Object[], "Another user has updated this Lotacao while you were editing")
                    render(view: "edit", model: [lotacaoInstance: lotacaoInstance])
                    return
                }
            }
            lotacaoInstance.properties = params
            if (!lotacaoInstance.hasErrors() && lotacaoInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'lotacao.label', default: 'Lotacao'), lotacaoInstance.id])}"
                redirect(action: "show", id: lotacaoInstance.id)
            }
            else {
                render(view: "edit", model: [lotacaoInstance: lotacaoInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'lotacao.label', default: 'Lotacao'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def lotacaoInstance = Lotacao.get(params.id)
        if (lotacaoInstance) {
            try {
                lotacaoInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'lotacao.label', default: 'Lotacao'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'lotacao.label', default: 'Lotacao'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'lotacao.label', default: 'Lotacao'), params.id])}"
            redirect(action: "list")
        }
    }
}
