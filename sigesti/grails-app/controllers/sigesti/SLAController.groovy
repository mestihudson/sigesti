package sigesti

class SLAController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [SLAInstanceList: SLA.list(params), SLAInstanceTotal: SLA.count()]
    }

    def create = {
        def SLAInstance = new SLA()
        SLAInstance.properties = params
        return [SLAInstance: SLAInstance]
    }

    def save = {
        def SLAInstance = new SLA(params)
        if (SLAInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'SLA.label', default: 'SLA'), SLAInstance.id])}"
            redirect(action: "show", id: SLAInstance.id)
        }
        else {
            render(view: "create", model: [SLAInstance: SLAInstance])
        }
    }

    def show = {
        def SLAInstance = SLA.get(params.id)
        if (!SLAInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'SLA.label', default: 'SLA'), params.id])}"
            redirect(action: "list")
        }
        else {
            [SLAInstance: SLAInstance]
        }
    }

    def edit = {
        def SLAInstance = SLA.get(params.id)
        if (!SLAInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'SLA.label', default: 'SLA'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [SLAInstance: SLAInstance]
        }
    }

    def update = {
        def SLAInstance = SLA.get(params.id)
        if (SLAInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (SLAInstance.version > version) {
                    
                    SLAInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'SLA.label', default: 'SLA')] as Object[], "Another user has updated this SLA while you were editing")
                    render(view: "edit", model: [SLAInstance: SLAInstance])
                    return
                }
            }
            SLAInstance.properties = params
            if (!SLAInstance.hasErrors() && SLAInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'SLA.label', default: 'SLA'), SLAInstance.id])}"
                redirect(action: "show", id: SLAInstance.id)
            }
            else {
                render(view: "edit", model: [SLAInstance: SLAInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'SLA.label', default: 'SLA'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def SLAInstance = SLA.get(params.id)
        if (SLAInstance) {
            try {
                SLAInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'SLA.label', default: 'SLA'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'SLA.label', default: 'SLA'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'SLA.label', default: 'SLA'), params.id])}"
            redirect(action: "list")
        }
    }
}
